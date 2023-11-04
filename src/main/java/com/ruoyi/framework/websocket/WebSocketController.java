package com.ruoyi.framework.websocket;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.ruoyi.common.utils.CookieUtils;
import com.ruoyi.common.utils.MailUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.uuid.SnowFlake;
import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.emmanuel.mto.domain.MtoSecurityCode;
import com.ruoyi.project.emmanuel.mto.mapper.MtoSecurityCodeMapper;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;


/**
 * websocket接口
 *
 * @author 一粒麦子
 */
@Controller()
@RequestMapping("/blog/websocket")
public class WebSocketController extends BaseController {

    private String prefix = "emmanuel/websocket";

    private static String webChatTokenName = "chat_token";
    ;

    @Autowired
    private MtoSecurityCodeMapper mtoSecurityCodeMapper;

    /**
     * 跳转到聊天登录界面
     */
    @GetMapping("/chatRoomAuth")
    public String chatRoomAuth(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
        modelMap.put("uuid", String.valueOf(SnowFlake.getNextId()));
        return prefix + "/loginChatRoom";
    }

    /**
     * 前台聊天界面获取验证码
     */
    @ResponseBody
    @PostMapping("/verifyCode")
    @RepeatSubmit(interval = 60000, message = "操作频繁", repeatDate = true)
    public AjaxResult verificationCode(@RequestParam(value = "mailBox") String mailBox, @RequestParam(value = "uuid") String uuid) {
        int verifyCode = (int) ((Math.random() * 9 + 1) * 100000);
        String content = "<p><b>尊敬的用户：您好！</b></p><p><b>你正在申请登录ruoyi-blog聊天室，请在输入以下验证码完成操作：</b></p><p><span style=\"background-color: rgb(239, 239, 239);\"><font color=\"#ff0000\"><b>" + verifyCode + "</b></font></span></p>";
        MailUtils.sendMailHtml(null, new String[]{mailBox}, "登录聊天室", content, "系统邮件", "前台聊天室登录");

        // 将之前获取的验证码置为无效
        UpdateWrapper<MtoSecurityCode> uw = new UpdateWrapper<>();
        uw.lambda().eq(MtoSecurityCode::getUuid, uuid).eq(MtoSecurityCode::getStatus, 0).set(MtoSecurityCode::getStatus, 2);
        mtoSecurityCodeMapper.update(new MtoSecurityCode(), uw);

        // 保存验证码
        MtoSecurityCode securityCode = new MtoSecurityCode();
        securityCode.setCodeNum(verifyCode);
        securityCode.setContent(content);
        securityCode.setTarget(mailBox);
        securityCode.setStatus(0);
        securityCode.setCreateTime(LocalDateTime.now());
        securityCode.setExpireTime(LocalDateTime.now().plusMinutes(10));
        securityCode.setUuid(uuid);
        securityCode.setType(1);
        mtoSecurityCodeMapper.insert(securityCode);

        return success("发送成功");
    }

    /**
     * 登录聊天界面
     */
    @ResponseBody
    @PostMapping("/loginChatRoom")
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult loginChatRoom(HttpServletRequest request,
                                    HttpServletResponse response,
                                    MtoSecurityCode securityCode) {

        // 校验验证码
        QueryWrapper<MtoSecurityCode> wq = new QueryWrapper<>();
        wq.lambda().eq(MtoSecurityCode::getUuid, securityCode.getUuid()).eq(MtoSecurityCode::getTarget, securityCode.getTarget()).eq(MtoSecurityCode::getStatus, 0).select(MtoSecurityCode::getCodeNum, MtoSecurityCode::getId).gt(MtoSecurityCode::getExpireTime, LocalDateTime.now());

        MtoSecurityCode mtoSecurityCode = mtoSecurityCodeMapper.selectOne(wq);

        if (ToolUtils.isEmpty(mtoSecurityCode) || !Objects.equals(mtoSecurityCode.getCodeNum(), securityCode.getCodeNum())) {
            return error("验证码错误");
        }

        // 修改验证码状态
        UpdateWrapper<MtoSecurityCode> updateWrapper = new UpdateWrapper<>();
        updateWrapper.lambda().eq(MtoSecurityCode::getId, mtoSecurityCode.getId()).set(MtoSecurityCode::getStatus, 1);
        mtoSecurityCodeMapper.update(mtoSecurityCode, updateWrapper);

        // 生成 chatToken
        String chatToke = securityCode.getNickName() + "," + SnowFlake.getNextId();
        CookieUtils.setCookie(response, webChatTokenName, Base64.encodeBase64String(chatToke.getBytes()));

        return success();
    }

    /**
     * 跳转到聊天界面
     */
    @GetMapping("/chatRoom")
    public String chatRoom(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {

        String chatToken = CookieUtils.getCookie(request, response, webChatTokenName);

        // 登录聊天室用户
        if (StringUtils.isNotBlank(chatToken)) {
            return prefix + "/chatRoom";
        }

        // 登录系统用户
        if (ShiroUtils.isLogin()) {
            // 生成 chatToken
            String chatToke = ShiroUtils.getSysUser().getUserName() + "," + SnowFlake.getNextId();
            CookieUtils.setCookie(response, webChatTokenName, Base64.encodeBase64String(chatToke.getBytes()));
            return prefix + "/chatRoom";
        }

        modelMap.put("uuid", String.valueOf(SnowFlake.getNextId()));
        return prefix + "/loginChatRoom";
    }

    /**
     * 发送群消息
     *
     * @param message   消息
     * @param toUserIds 接受方userId集合
     * @return
     * @throws IOException
     */
    @ResponseBody
    @PostMapping("/pushMsgToUsers")
    public ResponseEntity<String> pushMsgToUsers(String message, String toUserIds) {
        List<String> persons = Arrays.asList(toUserIds.split(","));
        WebSocketServer.sendToUserList(persons, message);
        return ResponseEntity.ok("服务器信息发送成功！发送目标用户id:" + toUserIds);
    }

}