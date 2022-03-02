package com.ruoyi.common.utils;

import com.ruoyi.framework.manager.factory.AsyncFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class MailUtils {

    private static final Logger log = LoggerFactory.getLogger(MailUtils.class);

    private static JavaMailSender javaMailSender;

    @Autowired
    public MailUtils(JavaMailSender javaMailSender) {
        MailUtils.javaMailSender = javaMailSender;
    }


    // 是否开启发送邮件
    private static Boolean enabled = false;
    // 邮件host
    private static String host;
    // 邮件username
    private static String emailAccount;
    // 邮件password
    private static String password;

    public String getEmailAccount() {
        return emailAccount;
    }

    @Value("${spring.mail.username}")
    public void setEmailAccount(String emailAccount) {
        MailUtils.emailAccount = emailAccount;
    }

    public static Boolean getEnabled() {
        return enabled;
    }

    @Value("${spring.mail.enabled}")
    public static void setEnabled(Boolean enabled) {
        MailUtils.enabled = enabled;
    }

    public static String getHost() {
        return host;
    }

    @Value("${spring.mail.host}")
    public static void setHost(String host) {
        MailUtils.host = host;
    }

    public static String getPassword() {
        return password;
    }

    @Value("${spring.mail.password}")
    public static void setPassword(String password) {
        MailUtils.password = password;
    }

    /**
     * 发送 html 邮件
     *
     * @param fromEmail 邮件发送者
     * @param toEmail   邮件接收者
     * @param subject   邮件标题
     * @param textHtml  邮件html内容
     * @return
     */
    public static Boolean sendMailHtml(String fromEmail, String toEmail, String subject, String textHtml) {

        fromEmail = ToolUtils.isEmpty(fromEmail) ? emailAccount : fromEmail;

        // 校验是否发送邮件
        Boolean sendMail = MailUtils.isSendMail(fromEmail, toEmail, subject, textHtml);
        if (!sendMail) {
            return false;
        }

        MimeMessage mimeMailMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMailMessage, true, "utf-8");
            // 谁发送
            messageHelper.setFrom(fromEmail);
            // 谁接收
            messageHelper.setTo(new String[]{toEmail});
            // 邮件标题
            messageHelper.setSubject(subject);
            // 邮件内容
            messageHelper.setText(textHtml, true);
            javaMailSender.send(mimeMailMessage);
        } catch (Exception e) {
            log.error("{} 发送HTML邮件失败: {}", subject, e.getMessage());
            return false;
        }
        log.info("{} 邮件发送成功", subject);
        return true;
    }

    /**
     * 发送 简单 邮件
     *
     * @param fromEmail 邮件发送者
     * @param toEmail   邮件接收者
     * @param subject   邮件标题
     * @param text      邮件内容
     * @return
     */
    public static Boolean sendSimpleMail(String fromEmail, String toEmail, String subject, String text) {

        fromEmail = ToolUtils.isEmpty(fromEmail) ? emailAccount : fromEmail;

        // 校验是否发送邮件
        Boolean sendMail = MailUtils.isSendMail(fromEmail, toEmail, subject, text);
        if (!sendMail) {
            return false;
        }

        try {
            SimpleMailMessage smm = new SimpleMailMessage();
            // 谁发送
            smm.setFrom(fromEmail);
            // 谁接收
            smm.setTo(new String[]{toEmail});
            // 邮件标题
            smm.setSubject(subject);
            // 邮件内容
            smm.setText(text);
            javaMailSender.send(smm);
        } catch (Exception e) {
            log.error("{} 发送简单邮件失败: {}", subject, e.getMessage());
            return false;
        }
        return true;
    }

    /**
     * 校验是否符合发送邮件
     *
     * @param fromEmail 发送者
     * @param toEmail   接受者
     * @param subject   邮件标题
     * @param text      邮件内容
     * @return
     */
    public static Boolean isSendMail(String fromEmail, String toEmail, String subject, String text) {
        if (!enabled) {
            log.info("{} 发送失败，未开启邮件发送", subject);
            return false;
        }
        if (ToolUtils.isOneEmpty(host, password, fromEmail, toEmail)) {
            return false;
        }
        return true;
    }

    /**
     * 校验邮箱
     *
     * @param email 邮箱
     * @return
     */
    public static boolean isEmail(String email) {
        if (StringUtils.isEmpty(email))
            return false;
        String rule = "[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?";
        Pattern p;
        Matcher m;
        p = Pattern.compile(rule);
        m = p.matcher(email);
        if (m.matches())
            return true;
        else
            return false;
    }
}
