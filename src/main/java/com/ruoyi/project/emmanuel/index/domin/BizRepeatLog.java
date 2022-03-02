package com.ruoyi.project.emmanuel.index.domin;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * 需要校验重复性的业务记录日志对象 biz_repeat_log
 *
 * @author 一粒麦子
 * @date 2021-12-12
 */
@Data
public class BizRepeatLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 业务ID
     */
    @Excel(name = "业务ID")
    private Long bizId;

    /**
     * 业务类型：1.文章，2.评论
     */
    @Excel(name = "业务类型：1.文章，2.评论,3.登录后获取天气")
    private Integer bizType;

    /**
     * 已登录用户ID
     */
    @Excel(name = "已登录用户ID")
    private Integer userId;

    /**
     * 用户IP
     */
    @Excel(name = "用户IP")
    private String userIp;

    /**
     * 客户端标识
     */
    @Excel(name = "客户端标识")
    private String userAgent;

    /**
     * 请求地址
     */
    @Excel(name = "请求地址")
    private String url;

    /**
     * 状态（0正常 1失败）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=失败")
    private Integer status;

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
     * 备注
     */
    private String remark;

}
