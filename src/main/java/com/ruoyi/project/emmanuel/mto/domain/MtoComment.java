package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class MtoComment {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 父id
     */
    private Long pId;

    /**
     * 祖级列表
     */
    private String ancestors;

    /**
     * 博客id
     */
    private Long postId;

    /**
     * 邮箱
     */
    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    private String email;

    /**
     * 昵称
     */
    @Length(min=2, max=15,message = "昵称长度为2到15个字符")
    private String nickName;

    /**
     * 评论内容
     */
    @Length(min=1, max=2000,message = "评论内容不可以超过2000个字符")
    private String content;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 点赞
     */
    private String love;

    /**
     * 状态
     */
    private String status;

    /**
     * ip
     */
    private String ip;

    /**
     * 父级名称
     */
    private String parentNickName;

    /**
     * 创建时间
     */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    /**
     * 审核人
     */
    private String examineBy;

    /**
     * 审核时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date examineTime;

    @TableField(exist = false)
    private String adminComment;

    /**
     * 一个父评论包含多个子评论
     */
    @TableField(exist = false)
    private List<MtoComment> replyComments = new ArrayList<>();

    /**
     * 评论文章标题
     */
    @TableField(exist = false)
    private String title;

    /**
     * 回复评论内容
     */
    @TableField(exist = false)
    private String parentContent;

}
