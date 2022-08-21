package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 首次访问博客记录对象 mto_look_ip_first
 *
 * @author 一粒麦子
 * @date 2022-05-28
 */
@Data
public class MtoLookIpFirst implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 当前访问IP
     */
    @Excel(name = "当前访问IP")
    private String ipAddr;

    /**
     * ip地址
     */
    @Excel(name = "ip地址")
    private String ipLocation;

    /**
     * 首次访问URL
     */
    @Excel(name = "首次访问URL")
    private String firstVisitUrl;

    /**
     * 首次访问时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Excel(name = "首次访问时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date firstVisitDate;

    /**
     * 备注
     */
    private String remark;
}
