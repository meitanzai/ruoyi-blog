package com.ruoyi.framework.manager.factory;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.TimerTask;

import com.ruoyi.common.utils.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.project.monitor.logininfor.domain.Logininfor;
import com.ruoyi.project.monitor.logininfor.service.LogininforServiceImpl;
import com.ruoyi.project.monitor.online.domain.OnlineSession;
import com.ruoyi.project.monitor.online.domain.UserOnline;
import com.ruoyi.project.monitor.online.service.IUserOnlineService;
import com.ruoyi.project.monitor.operlog.domain.OperLog;
import com.ruoyi.project.monitor.operlog.service.IOperLogService;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * 异步工厂（产生任务用）
 *
 * @author liuhulu
 */
public class AsyncFactory {
    private static final Logger sys_user_logger = LoggerFactory.getLogger("sys-user");

    /**
     * 同步session到数据库
     *
     * @param session 在线用户会话
     * @return 任务task
     */
    public static TimerTask syncSessionToDb(final OnlineSession session) {
        return new TimerTask() {
            @Override
            public void run() {
                UserOnline online = new UserOnline();
                online.setSessionId(String.valueOf(session.getId()));
                online.setDeptName(session.getDeptName());
                online.setLoginName(session.getLoginName());
                online.setStartTimestamp(session.getStartTimestamp());
                online.setLastAccessTime(session.getLastAccessTime());
                online.setExpireTime(session.getTimeout());
                online.setIpaddr(session.getHost());
                online.setLoginLocation(AddressUtils.getRemoteAddressByIP(session.getHost()));
                online.setBrowser(session.getBrowser());
                online.setOs(session.getOs());
                online.setStatus(session.getStatus());
                online.setSession(session);
                SpringUtils.getBean(IUserOnlineService.class).saveOnline(online);

            }
        };
    }

    /**
     * 操作日志记录
     *
     * @param operLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOper(final OperLog operLog) {
        return new TimerTask() {
            @Override
            public void run() {
                // 远程查询操作地点
                operLog.setOperLocation(AddressUtils.getRemoteAddressByIP(operLog.getOperIp()));
                SpringUtils.getBean(IOperLogService.class).insertOperlog(operLog);
            }
        };
    }

    /**
     * 记录登录信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息
     * @param args     列表
     * @return 任务task
     */
    public static TimerTask recordLogininfor(final String username, final String status, final String message, final Object... args) {
        final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        final String ip = ShiroUtils.getIp();
        return new TimerTask() {
            @Override
            public void run() {
                String address = AddressUtils.getRemoteAddressByIP(ip);
                StringBuilder s = new StringBuilder();
                s.append(LogUtils.getBlock(ip));
                s.append(address);
                s.append(LogUtils.getBlock(username));
                s.append(LogUtils.getBlock(status));
                s.append(LogUtils.getBlock(message));
                // 打印信息到日志
                sys_user_logger.info(s.toString(), args);
                // 获取客户端操作系统
                String os = userAgent.getOperatingSystem().getName();
                // 获取客户端浏览器
                String browser = userAgent.getBrowser().getName();
                // 封装对象
                Logininfor logininfor = new Logininfor();
                logininfor.setLoginName(username);
                logininfor.setIpaddr(ip);
                logininfor.setLoginLocation(address);
                logininfor.setBrowser(browser);
                logininfor.setOs(os);
                logininfor.setMsg(message);
                // 日志状态
                if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
                    logininfor.setStatus(Constants.SUCCESS);
                } else if (Constants.LOGIN_FAIL.equals(status)) {
                    logininfor.setStatus(Constants.FAIL);
                }
                // 插入数据
                SpringUtils.getBean(LogininforServiceImpl.class).insertLogininfor(logininfor);
            }
        };
    }

    /**
     * 记录登录信息并发送登录成功短信
     *
     * @param username 用户名
     * @param status   状态
     * @param email    用户邮箱
     * @param message  消息
     * @param args     列表
     * @return 任务task
     */
    public static TimerTask recordLogininfor(final String username, final String email, final String status, final String ipAddr, final String message, final Object... args) {
        final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        final String ip = ShiroUtils.getIp();
        return new TimerTask() {
            @Override
            public void run() {
                String address = AddressUtils.getRemoteAddressByIP((IpUtils.internalIp(ip) && IpUtils.ipCheck(ipAddr)) ? ipAddr : ip);
                StringBuilder s = new StringBuilder();
                s.append(LogUtils.getBlock((IpUtils.internalIp(ip) && IpUtils.ipCheck(ipAddr)) ? (ip + "(" + ipAddr + ")") : ip));
                s.append(address);
                s.append(LogUtils.getBlock(username));
                s.append(LogUtils.getBlock(status));
                s.append(LogUtils.getBlock(message));
                // 打印信息到日志
                sys_user_logger.info(s.toString(), args);
                // 获取客户端操作系统
                String os = userAgent.getOperatingSystem().getName();
                // 获取客户端浏览器
                String browser = userAgent.getBrowser().getName();
                // 封装对象
                Logininfor logininfor = new Logininfor();
                logininfor.setLoginName(username);
                logininfor.setIpaddr((IpUtils.internalIp(ip) && IpUtils.ipCheck(ipAddr)) ? (ip + "(" + ipAddr + ")") : ip);
                logininfor.setLoginLocation(address);
                logininfor.setBrowser(browser);
                logininfor.setOs(os);
                logininfor.setMsg(message);
                // 日志状态
                if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
                    logininfor.setStatus(Constants.SUCCESS);
                } else if (Constants.LOGIN_FAIL.equals(status)) {
                    logininfor.setStatus(Constants.FAIL);
                }
                // 插入数据
                SpringUtils.getBean(LogininforServiceImpl.class).insertLogininfor(logininfor);

                // 发送登录邮件
                if (Objects.equals(status, Constants.LOGIN_SUCCESS) && ToolUtils.isNotEmpty(email)) {
//                    String text = "<p><strong class=\"ql-size-large\">登录通知</strong></p><p><strong>您的账号：fastBlog( " + username + " )已登陆</strong></p><p><br></p><p><strong>登录时间：" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) + "</strong></p><p><strong>登录设备：" + os + "</strong></p><p><strong>登录IP：    " + ((IpUtils.internalIp(ip) && IpUtils.ipCheck(ipAddr))?(ip + "("+ipAddr+")"):ip)+"  "+address+ "</strong></p><p><strong>备注：如非本人操作，请立即访问网页版修改密码</strong></p>";
                    String text = "<div><b>登陆通知</b></div><div><br></div><div>您的账号fastBlog：(" + username + ") 已登录</div><div>登录时间：" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) + "</div><div>登录设备：" + os + "</div><div>登录iP：" + ((IpUtils.internalIp(ip) && IpUtils.ipCheck(ipAddr)) ? (ip + "(" + ipAddr + ")") : ip) + "  " + address + "</div><div><font __editorwarp__=\"1\" style=\"display: inline; font-size: 14px; font-family: Verdana; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0); font-weight: 400; font-style: normal;\">如非本人操作，请立即访问网页版修改密码</font></div>";
                    MailUtils.LoginSendMail(null, email, "Ry-blog 登录成功", text);
                }
            }
        };
    }

    /**
     * 发送HTML邮件
     *
     * @param fromEmail    邮件发送者
     * @param toEmail      邮件接收者
     * @param subject      邮件标题
     * @param textHtml     邮件html内容
     * @param mailSource   邮件来源
     * @param mailCreateBy 发送邮件者
     */
    public static TimerTask sendMailHtml(final String fromEmail, final String[] toEmail, final String subject, final String textHtml, final String mailSource, final String mailCreateBy) {
        return new TimerTask() {
            @Override
            public void run() {
                MailUtils.sendMailHtml(fromEmail, toEmail, subject, textHtml, "消费邮件", "系统邮件");

            }
        };
    }
}
