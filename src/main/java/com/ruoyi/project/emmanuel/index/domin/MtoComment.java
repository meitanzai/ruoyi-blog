package com.ruoyi.project.emmanuel.index.domin;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 * comment对象 mto_comment
 *
 * @author 一粒麦子
 * @date 2022-01-16
 */
@Data
public class MtoComment extends BaseEntity {

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
     * 博客id
     */
    private Long postId;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 评论内容
     */
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

    /** 创建时间 */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;


}
