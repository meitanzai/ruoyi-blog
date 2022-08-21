package com.ruoyi.project.system.mail.domain;

import com.ruoyi.common.xss.Xss;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
 * 【请填写功能名称】对象 sys_mail
 *
 * @author 一粒麦子
 * @date 2022-07-22
 */
@Data
public class Mail extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /*id */
    private Long id;

    /*邮件标题 */
    @Xss(message = "标题不能包含脚本字符")
    @Length(min=1,max=30,message = "标题不能超过39个字符")
    private String mailTitle;

    /*邮件内容 */
    @NotBlank(message = "请输入内容")
    private String mailContent;

    /*邮件info */
    private String mailMessage;

    /*邮件类型：0简单邮件，1复杂邮件 */
    private Integer mailType;

    /*邮件状态(0草稿，1成功，-1失败) */
    private Integer mailStatus;

    /*删除标志（0代表存在, 1代表删除） */
    private Integer delFlag;

    /*谁发送 */
    @Email
    private String mailFrom;

    /*谁接收 */
    @Email
    private String mailTo;

    /*邮件发送来源 */
    private String mailSource;

}
