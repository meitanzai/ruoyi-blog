package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 * mto对象 mto_tag
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
@Data
public class MtoTag {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一id
     */
    @TableId(type =IdType.AUTO)
    private Long id;

    /**
     * 描述
     */
    @Excel(name = "描述")
    private String description;

    /**
     * 标签名
     */
    @Excel(name = "标签名")
    private String name;

    /**
     * 图片
     */
    @Excel(name = "图片")
    private String thumbnail;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Integer status;

    /**
     * 显示顺序
     */
    @Excel(name = "显示顺序")
    private Integer orderNum;

    /** 创建时间 */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    /** 更新时间 */
     @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;

}
