package com.ruoyi.project.emmanuel.mto.domain;

import lombok.Data;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 栏目管理对象 mto_channel
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Data
public class MtoChannel extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String key;

    private String name;

    /**
     * 类型 1分类，2专题
     */
    private int type;

    /**
     * 状态
     */
    private String status;

    /**
     * 图片
     */
    private String thumbnail;

    /**
     * 总数量
     */
    private Long weight;


}
