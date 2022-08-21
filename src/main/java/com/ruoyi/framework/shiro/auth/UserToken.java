package com.ruoyi.framework.shiro.auth;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 自定义登录Token
 * 
 * @author ruoyi
 */
public class UserToken extends UsernamePasswordToken
{
    private static final long serialVersionUID = 1L;

    private LoginType type;

    private String ipAddr;

    public UserToken()
    {
    }

    public UserToken(String username, String password, LoginType type, boolean rememberMe,String ipAddr)
    {
        super(username, password, rememberMe,ipAddr);
        this.type = type;
        this.ipAddr = ipAddr;
    }

    public UserToken(String username, String password, LoginType type, boolean rememberMe)
    {
        super(username, password, rememberMe);
        this.type = type;
    }

    public UserToken(String username, LoginType type)
    {
        super(username, "", false, null);
        this.type = type;
    }

    public UserToken(String username, String password, LoginType type)
    {
        super(username, password, false, null);
        this.type = type;
    }

    public LoginType getType()
    {
        return type;
    }

    public void setType(LoginType type)
    {
        this.type = type;
    }

    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }
}