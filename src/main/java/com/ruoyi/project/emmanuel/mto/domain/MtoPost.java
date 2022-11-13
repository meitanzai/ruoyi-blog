package com.ruoyi.project.emmanuel.mto.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;

/**
 * 文章表题对象 mto_post
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Data
public class MtoPost implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 作者id
     */
    private Long authorId;

    /**
     * 栏目id
     */
    @Excel(name = "")
    private Long channelId;

    /**
     * 评论数
     */
    private Long comments;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

    /**
     * 点赞
     */
    private Long favors;

    /**
     * 是否轮播   0否， 1是
     */
    private Long slider;

    /**
     * 推荐状态  0否， 1是
     */
    private Long featured;

    /**
     * 文章状态  0发布， 1草稿
     */
    private Long status;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 标签
     */
    private String tags;

    /**
     * 图片
     */
    private String thumbnail;

    /**
     * 标题
     */
    private String title;

    /**
     * 博客密码
     */
    private String pwd;

    /**
     * 查看次数
     */
    private Long views;

    /**
     * 总数量
     */
    private Long weight;

    /**
     * 导航id
     */
    private Long categoryId;

    /**
     * 作者
     */
    @TableField(exist = false)
    private String username;

    /**
     * 文章
     */
    @TableField(exist = false)
    private String content;


    /**
     * 更新时间
     */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;

    /**
     * 作者头像
     */
    @TableField(exist = false)
    private String avatar;


}
