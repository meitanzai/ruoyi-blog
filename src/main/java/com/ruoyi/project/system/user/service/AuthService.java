package com.ruoyi.project.system.user.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.shiro.auth.LoginType;
import com.ruoyi.framework.shiro.auth.UserToken;
import com.ruoyi.project.system.user.domain.AuthUser;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URLEncoder;
import java.util.Objects;

@Service
public class AuthService {

    @Autowired
    private UserMapper userMapper;

    @Value("${auth.gitee.clientId}")
    private String clientId;
    @Value("${auth.gitee.clientSecret}")
    private String clientSecret;
    @Value("${auth.gitee.callbackUrl}")
    private String callbackUrl;

    public String renderAuth(String source) {
        if (Objects.equals("gitee", source)) {
            String url = "https://gitee.com/oauth/authorize?client_id=" + clientId + "&redirect_uri=" + URLEncoder.encode(callbackUrl) + "&response_type=code";
            //重定向
            return "redirect:" + url;
        }
        return "redirect:/bind";
    }


    @Transactional(rollbackFor = Exception.class)
    public String callback(String code, String state) {

        // 根据获取用户信息
        String giteeUserInfo = getGiteeUserInfo(code);
        JSONObject jsonGiteeUserInfo = JSONObject.parseObject(giteeUserInfo);

        // 根据giteeId查询是否存在
        String giteeId = String.valueOf(jsonGiteeUserInfo.get("id"));
        User user = userMapper.selectAuthUserByUuid(giteeId, "gitee");
        // 不存在则保存,保存后判断市登录状态，跳转到首页
        if (ToolUtils.isEmpty(user)) {
            // 保存用户信息
            AuthUser authUser = new AuthUser();
            authUser.setUserId(ShiroUtils.getUserId());
            authUser.setUuid(giteeId);
            authUser.setLoginName(String.valueOf(jsonGiteeUserInfo.get("login")));
            authUser.setUserName(String.valueOf(jsonGiteeUserInfo.get("name")));
            authUser.setAvatar(String.valueOf(jsonGiteeUserInfo.get("avatar_url")));
            authUser.setSource("gitee");
            authUser.setInfo(giteeUserInfo);
            userMapper.insertAuthUser(authUser);

            // 判断登录则重定向到首页
            if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
                return "redirect:/index";
            } else {  // 没登陆状态，未绑定，
                return "redirect:/bind";
            }
        }

        // 不为空则登录，然后跳转到首页面
        if (ToolUtils.isNotEmpty(user)) {
            Subject subject = SecurityUtils.getSubject();
            UserToken token = new UserToken(user.getLoginName(), LoginType.NOPASSWD);
            subject.login(token);
            //重定向
            return "redirect:/index";
        }
        return null;
    }


    /**
     * gitee根据token获取用户信息
     *
     * @param code
     * @return
     */
    private String getGiteeUserInfo(String code) {
        // 认证
        String authorizeUrl = "https://gitee.com/oauth/token?grant_type=authorization_code&code=" + code + "&client_id=" + clientId + "&redirect_uri=" + callbackUrl + "&client_secret=" + clientSecret;
        String authorizeInfo = HttpUtils.sendPost(authorizeUrl, null);
        JSONObject jsonAuthorizeInfo = JSONObject.parseObject(authorizeInfo);
        String access_token = String.valueOf(jsonAuthorizeInfo.get("access_token"));
        // 根据token获取用户信息
        String getUsenInfourl = "https://gitee.com/api/v5/user";
        String userInfo = HttpUtils.sendGet(getUsenInfourl, "access_token=" + access_token);
        return userInfo;
    }

    // public String callback(String code, String state) {
    //     String url = "https://gitee.com/oauth/token?grant_type=authorization_code&code=" + code + "&client_id=e4d3e196ad0d42eaad0a199a830c6ea62b7ec65b35b84da879cc745b2c47e64b&redirect_uri=http://localhost:10010/oauth/gitee/callback&client_secret=541ecd786b33acaed41c517001ceea64d76ddf990a01acb6cdddaf2ca5b7e8d6";
    //     String s = HttpUtils.sendPost(url, null);
    //     System.out.println("回调函数 = " + s);
    //
    //
    //     JSONObject json = JSONObject.parseObject(obj);
    //     AuthRequest authRequest = AuthUtils.getAuthRequest(source, json.getString("clientId"), json.getString("clientSecret"), json.getString("redirectUri"), authStateCache);
    //     AuthResponse<AuthUser> response = authRequest.login(callback);
    //     if (response.ok()) {
    //         if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
    //             SysUser user = userMapper.selectAuthUserByUuid(source + response.getData().getUuid());
    //             if (StringUtils.isNotNull(user)) {
    //                 return redirect("/index");
    //             }
    //             // 若已经登录则直接绑定系统账号
    //             AuthUser authUser = new AuthUser();
    //             authUser.setAvatar(response.getData().getAvatar());
    //             authUser.setUuid(source + response.getData().getUuid());
    //             authUser.setUserId(ShiroUtils.getUserId());
    //             authUser.setUserName(response.getData().getNickname());
    //             authUser.setLoginName(response.getData().getUsername());
    //             authUser.setEmail(response.getData().getEmail());
    //             authUser.setSource(source);
    //             userMapper.insertAuthUser(authUser);
    //             return redirect("/index");
    //         }
    //         SysUser user = userMapper.selectAuthUserByUuid(source + response.getData().getUuid());
    //         if (StringUtils.isNotNull(user)) {
    //             Subject subject = SecurityUtils.getSubject();
    //             UserToken token = new UserToken(user.getLoginName(), LoginType.NOPASSWD);
    //             subject.login(token);
    //             return redirect("/index");
    //         } else {
    //             return new ModelAndView("error/bind");
    //         }
    //     }
    //
    //
    //     //重定向
    //     return "redirect:" + "http://localhost:10010/index";
    // }

    /**
     * 检查是否授权
     *
     * @param authUser
     * @return
     */
    public String checkAuthUser(AuthUser authUser) {
        Long userId = ShiroUtils.getUserId();
        authUser.setUserId(userId);
        return userMapper.checkAuthUser(authUser);
    }

    /**
     * 取消授权
     */
    public int deleteAuthUser(AuthUser authUser) {
        return userMapper.deleteAuthUser(authUser);
    }
}
