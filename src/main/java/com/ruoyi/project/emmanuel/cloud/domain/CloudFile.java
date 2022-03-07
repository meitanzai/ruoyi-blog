package com.ruoyi.project.emmanuel.cloud.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 网盘文件对象 cloud_file
 *
 * @author 一粒麦子
 * @date 2022-03-04
 */
@Data
public class CloudFile implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 文件所属用户
     */
    private Long userId;

    /**
     * 原文件名
     */
    private String oldfilename;

    /**
     * 新文件名
     */
    private String newfilename;

    /**
     * 文件后缀
     */
    private String ext;

    /**
     * 存放文件路径
     */
    private String urlPath;

    /**
     * 存放文件路径
     */
    private String filePath;

    /**
     * 文件大小
     */
    private float size;

    /**
     * 文件类型
     */
    private String type;

    /**
     * 是否是图片（0是，1否）
     */
    private Long isImg;

    /**
     * 下载次数
     */
    private Long downcounts;

    /**
     * 上传时间
     */
    @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date uploadTime;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;

    /**
     * 是否共享（（0正常，1共享）
     */
    private Integer isPublic;

    /**
     * 是否收藏（0正常，1收藏）
     */
    private Integer isCollect;

    /**
     * 是否分享（0正常，1分享）
     */
    private Integer isShare;

    private String icon;

    /**
     * 是否在回收箱（0正常，1删除）
     */
    @TableLogic(delval = "1")
    private Integer isRecycle;



    @TableField(exist = false)
    private int ids;

    @TableField(exist = false)
    private String sort;

    @TableField(exist = false)
    private String sortway;

}
