package com.ruoyi.project.emmanuel.mto.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.io.Serializable;

/**
 * 【请填写功能名称】对象 mto_post_tag
 *
 * @author 一粒麦子
 * @date 2022-01-17
 */
@Data
public class MtoPostTag implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 文章id
     */
     private Long postId;

    /**
     * 标签名
     */
    private String tagId;

}
