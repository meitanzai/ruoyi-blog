package com.ruoyi.project.system.user.controller;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.user.domain.AuthUser;
import com.ruoyi.project.system.user.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * 第三方认证授权处理
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/oauth")
public class AuthController extends BaseController {

    @Autowired
    private AuthService authService;


    /**
     * 认证授权
     *
     * @param source
     * @throws IOException
     */
    @GetMapping("/authorize/{source}")
    public String renderAuth(@PathVariable("source") String source) {
        return authService.renderAuth(source);
    }

    /**
     * 回调函数
     *
     * @param code
     * @param state
     * @return
     */
    @GetMapping("/gitee/callback")
    public String callback(@RequestParam(name = "code",required = false) String code, String state) {
        return authService.callback(code, state);
    }

    /**
     * 检查是否授权
     */
    @PostMapping("/checkAuthUser")
    @ResponseBody
    public AjaxResult checkAuthUser(AuthUser authUser) {
        String exit = null;
        switch (authUser.getSource()) {
            case "gitee":
                exit = authService.checkAuthUser(authUser);
                break;
            default:
                return AjaxResult.error("开发中……");
        }
        return StringUtils.isNotEmpty(exit) ? AjaxResult.error(authUser.getSource() + "平台账号已经绑定") : AjaxResult.success();
    }

    /**
     * 取消授权
     */
    @PostMapping("/unlock")
    @ResponseBody
    public AjaxResult unlockAuth(AuthUser authUser) {
        return toAjax(authService.deleteAuthUser(authUser));
    }
}
