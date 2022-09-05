package com.ruoyi.common.utils;

import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.project.system.mail.domain.Mail;
import com.ruoyi.project.system.mail.service.IMailService;
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
import java.util.Arrays;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class MailUtils {

    private static final Logger log = LoggerFactory.getLogger(MailUtils.class);

    private static JavaMailSender javaMailSender;

    private static IMailService mailService;

    @Autowired
    public MailUtils(JavaMailSender javaMailSender) {
        MailUtils.javaMailSender = javaMailSender;
    }

    @Autowired
    public void setMailService(IMailService mailService) {
        MailUtils.mailService = mailService;
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

    public Boolean getEnabled() {
        return enabled;
    }

    @Value("${spring.mail.enabled}")
    public void setEnabled(Boolean enabled) {
        MailUtils.enabled = enabled;
    }

    public String getHost() {
        return host;
    }

    @Value("${spring.mail.host}")
    public void setHost(String host) {
        MailUtils.host = host;
    }

    public String getPassword() {
        return password;
    }

    @Value("${spring.mail.password}")
    public void setPassword(String password) {
        MailUtils.password = password;
    }

    /**
     * 发送 html 邮件
     *
     * @param fromEmail  邮件发送者
     * @param toEmail    邮件接收者
     * @param subject    邮件标题
     * @param textHtml   邮件html内容
     * @param mailSource 邮件来源
     * @return
     */
    public static Boolean sendMailHtml(String fromEmail, String[] toEmail, String subject, String textHtml, String mailSource, String mailCreateBy) {

        fromEmail = ToolUtils.isEmpty(fromEmail) ? emailAccount : fromEmail;

        Boolean b = false;
        String message = null;

        try {
            // 校验是否发送邮件
            Boolean sendMail = MailUtils.isSendMail(fromEmail, toEmail, subject, textHtml);
            // true 发送邮件
            if (sendMail) {
                MimeMessage mimeMailMessage = javaMailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMailMessage, true, "utf-8");
                // 谁发送
                messageHelper.setFrom(fromEmail);
                // 谁接收
                messageHelper.setTo(toEmail);
                // 邮件标题
                messageHelper.setSubject(subject);
                // 邮件内容
                messageHelper.setText(textHtml, true);
                javaMailSender.send(mimeMailMessage);
                b = true;
                log.info("{} 邮件发送成功", subject);
            }
        } catch (MessagingException e) {
            e.printStackTrace();
            log.error("{} 发送HTML邮件失败: {}", subject, e.getMessage());
            message = e.getMessage();
        } catch (MailException e) {
            log.error("{} 发送HTML邮件失败: {}", subject, e.getMessage());
            message = e.getMessage();
        } catch (Exception e){
            log.error("{} 发送HTML邮件失败: {}", subject, e.getMessage());
            message = e.getMessage();
        }finally {
            MailUtils.saveMail(subject, textHtml, 1, b ? 1 : -1, fromEmail, org.apache.commons.lang3.StringUtils.join(toEmail, ","), mailSource, message, mailCreateBy);
        }
        return true;
    }


    /**
     * 发送 简单 邮件
     *
     * @param fromEmail    邮件发送者
     * @param toEmail      邮件接收者
     * @param subject      邮件标题
     * @param text         邮件内容
     * @param mailSource   邮件来源
     * @param mailCreateBy 邮件创建者
     * @return
     */
    public static Boolean sendSimpleMail(String fromEmail, String[] toEmail, String subject, String text, String mailSource, String mailCreateBy) {

        fromEmail = ToolUtils.isEmpty(fromEmail) ? emailAccount : fromEmail;

        Boolean b = false;
        String message = null;

        try {
            // 校验是否发送邮件
            Boolean sendMail = MailUtils.isSendMail(fromEmail, toEmail, subject, text);
            // true 发送邮件
            if (sendMail) {
                SimpleMailMessage smm = new SimpleMailMessage();
                // 谁发送
                smm.setFrom(fromEmail);
                // 谁接收
                smm.setTo(toEmail);
                // 邮件标题
                smm.setSubject(subject);
                // 邮件内容
                smm.setText(text);
                javaMailSender.send(smm);
                b = true;
            }
        } catch (Exception e) {
            message = e.getMessage();
            log.error("{} 发送简单邮件失败: {}", subject, e.getMessage());
        } finally {
            MailUtils.saveMail(subject, text, 0, b ? 1 : -1, fromEmail, org.apache.commons.lang3.StringUtils.join(toEmail, ","), mailSource, message, mailCreateBy);

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
    public static Boolean isSendMail(String fromEmail, String[] toEmail, String subject, String text) {
        if (!enabled) {
            throw new RuntimeException(subject+"发送失败，未开启邮件发送");
        }
        if (ToolUtils.isOneEmpty(host, password, fromEmail, toEmail)) {
            throw new RuntimeException(subject+"发送失败，请检查邮箱配置信息是否正确");
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

    /**
     * 登陆成功发送邮件
     *
     * @param fromEmail 发送者
     * @param toEmail   接受者
     * @param subject   邮件标题
     * @param text      邮件内容
     */
    public static void LoginSendMail(String fromEmail, String toEmail, String subject, String text) {

        fromEmail = ToolUtils.isEmpty(fromEmail) ? emailAccount : fromEmail;

        // 查询是否开启邮件发送
        if (!(MailUtils.isSendMail(fromEmail, new String[]{toEmail}, subject, text))) {
            return;
        }

        MailUtils.sendMailHtml(fromEmail, new String[]{toEmail}, subject, text, "登陆邮件","系统邮件");

    }

    /**
     * 保存邮件发送记录
     *
     * @param mailTitle  邮件标题
     * @param textHtml   邮件内容
     * @param mailType   邮件类型(1附件邮件，0简单邮件)
     * @param mailStatus 邮件状态(0草稿，1成功，-1失败)
     * @param fromEmail  谁发送
     * @param toEmail    谁接受
     * @param mailSource 邮件来源
     */
    public static void saveMail(String mailTitle, String textHtml, int mailType, int mailStatus, String fromEmail, String toEmail, String mailSource, String message, String mailCreateBy) {
        Mail mail = new Mail();
        mail.setMailTitle(mailTitle);
        mail.setMailContent(textHtml);
        mail.setMailType(mailType);
        mail.setMailFrom(fromEmail);
        mail.setMailTo(toEmail);
        mail.setMailStatus(mailStatus);
        mail.setMailSource(mailSource);
        mail.setDelFlag(0);
        mail.setCreateBy(mailCreateBy);
        mail.setMailMessage(message);
        mailService.insertMail(mail);
    }
}
