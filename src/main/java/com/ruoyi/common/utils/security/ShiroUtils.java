package com.ruoyi.common.utils.security;

import com.ruoyi.common.utils.ToolUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.project.system.user.domain.User;

/**
 * shiro 工具类
 *
 * @author ruoyi
 */
public class ShiroUtils
{
    public static Subject getSubject()
    {
        return SecurityUtils.getSubject();
    }

    public static Session getSession()
    {
        return SecurityUtils.getSubject().getSession();
    }

    public static void logout()
    {
        getSubject().logout();
    }

    public static User getSysUser()
    {
        User user = null;
        Object obj = getSubject().getPrincipal();
        if (StringUtils.isNotNull(obj))
        {
            user = new User();
            BeanUtils.copyBeanProp(user, obj);
        }
        return user;
    }

    public static void setSysUser(User user)
    {
        Subject subject = getSubject();
        PrincipalCollection principalCollection = subject.getPrincipals();
        String realmName = principalCollection.getRealmNames().iterator().next();
        PrincipalCollection newPrincipalCollection = new SimplePrincipalCollection(user, realmName);
        // 重新加载Principal
        subject.runAs(newPrincipalCollection);
    }

    public static Boolean isAdmin() {
        User currentUser = ShiroUtils.getSysUser();
        if (ToolUtils.isNotEmpty(currentUser)){
            return currentUser.isAdmin()?true:false;
        }
        return false;
    }

    public static Long getUserId()
    {
        return getSysUser().getUserId().longValue();
    }

    public static String getLoginName()
    {
        return getSysUser().getLoginName();
    }

    public static String getIp()
    {
        return getSubject().getSession().getHost();
    }

    public static String getSessionId()
    {
        return String.valueOf(getSubject().getSession().getId());
    }

    /**
     * 判断用户是否登录
     * @return true 登录，false 未登录
     */
    public static Boolean isLogin()
    {
        User currentUser = ShiroUtils.getSysUser();
        return ToolUtils.isEmpty(currentUser) ? false : true;
    }

}
