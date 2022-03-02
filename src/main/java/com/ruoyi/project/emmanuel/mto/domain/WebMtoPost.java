package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章表题对象 mto_post
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Data
@TableName("mto_post")
public class WebMtoPost implements Serializable {

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
     * 栏目/分类id
     */
    @Excel(name = "")
    private Long channelId;

    /**
     * 栏目/分类名称
     */
    @TableField(exist = false)
    private String channelName;

    /**
     * 评论数
     */
    private Long comments;

    /**
     * 创建时间
     */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    /**
     * 点赞
     */
    private Long favors;

    /**
     * 轮播状态
     */
    private Integer slider;

    /**
     * 推荐状态
     */
    private Long featured;

    /**
     * 文章状态
     */
    private Long status;

    /**
     * 摘要
     */
    private String summary;

    /**
     *
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
