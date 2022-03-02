package com.ruoyi.project.emmanuel.memorial.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * 随手记对象 board_note
 *
 * @author 一粒麦子
 * @date 2021-12-18
 */
@Data
public class BoardNote implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 标题
     */
    @Excel(name = "标题")
    private String noteTitle;

    /**
     * 作者id
     */
    @Excel(name = "作者id")
    private Long authorId;

    /**
     * 图片（预留字段，暂时不考虑）
     */
    @Excel(name = "图片", readConverterExp = "预留字段，暂时不考虑")
    private String noteImage;

    /**
     * 内容
     */
    @Excel(name = "内容")
    private String noteContent;

    /**
     * 摘要
     */
    @Excel(name = "摘要")
    private String noteSummary;

    /**
     * 类型（数据字典，不写死）
     */
    @Excel(name = "类型", readConverterExp = "数据字典，不写死")
    private String noteType;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String noteStatus;

    /**
     * 是否公共，0公共，  1 私有
     */
    private String isPublic;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;

    /**
     * 备注
     */
    private String remark;

}
