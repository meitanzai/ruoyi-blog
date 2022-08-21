package com.ruoyi.project.emmanuel.mto.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 访问日志统计 mto_look_ip
 *
 * @author 一粒麦子
 * @date 2022-05-28
 */
@Data
public class MtoLookIp implements Serializable {

    private static final long serialVersionUID = 1L;

    /* 日期 */
    private Date date;

    /* 当前访问IP */
    private String ipList;

    /* 类型 */
    private Integer type;

    private Date createTime;

}
