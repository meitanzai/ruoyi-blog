package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.ruoyi.framework.web.domain.TreeEntity;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class MtoCategory  implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long pid;
    private String name;
    private String description;
    private Integer sort;
    private Integer type;
    private String pageUrl;
    private Integer status;
    private String icon;
    private Date createTime;
    private Date updateTime;
    @TableField(exist = false)
    private String parentName;
    @TableField(exist = false)
    private MtoCategory parent;
    @TableField(exist = false)
    private List<MtoCategory> children;

}
