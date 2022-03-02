package com.ruoyi.project.emmanuel.memorial.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 任务清单对象 board_agile
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
@Data
public class BoardAgile implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 任务id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 任务名称
     */
    @Excel(name = "任务名称")
    private String agileName;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Integer agileStatus;

    /**
     * 任务日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    @Excel(name = "任务日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date agileDate;

    /**
     * 用户id
     */
    private Long userId;
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
}
