package com.ruoyi.project.emmanuel.mto.domain;

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
 * 友情链接 mto_link
 *
 * @author 一粒麦子
 * @date 2021-12-13
 */
@Data
public class MtoLink implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 友情链接名
     */
    @Excel(name = "友情链接名")
    private String linkName;

    /**
     * 链接logo
     */
    @Excel(name = "链接logo")
    private String linkLogo;

    /**
     * 链接url
     */
    @Excel(name = "链接url")
    private String linkUrl;

    /**
     * 链接描述
     */
    @Excel(name = "链接描述")
    private String linkDescription;
    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date updateTime;

    /**
     * 备注
     */
    private String remark;
}
