package com.ruoyi.project.emmanuel.index.domin;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class DayInfo {
    /**
     * 一年中的总天数
     */
    private Integer totalDay;

    /**
     * 已过天数
     */
    private Integer tooDay;

    /**
     * 剩余天数
     */
    private Integer surpluDay;

    /**
     * 剩余%
     */
    private String surpluHundred;

    /**
     * 日期
     */
    @JsonFormat(pattern = "yyyy年MM月dd日 HH:mm:ss")
    private Date nowDate;

}
