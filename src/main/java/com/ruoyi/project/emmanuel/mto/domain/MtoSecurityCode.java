package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 验证码 MTO_SECURITY_CODE
 *
 * @author 一粒麦子
 */
@Data
public class MtoSecurityCode implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * 昵称
     */
    @TableField(exist = false)
    private String nickName;

    /**
     * 验证码
     */
    private Integer codeNum;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 过期时间
     */
    private LocalDateTime expireTime;

    /**
     * 校验ID
     */
    private String uuid;

    /**
     * 状态 0初始化状态，1已使用，2无效
     */
    private Integer status;

    /**
     * 邮箱/手机号
     */
    private String target;

    /**
     * 类型  1邮箱
     */
    private Integer type;

    /**
     * 发送内容
     */
    private String content;
}