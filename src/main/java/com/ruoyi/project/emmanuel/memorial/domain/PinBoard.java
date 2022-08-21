package com.ruoyi.project.emmanuel.memorial.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 便签墙对象 pin_board
 *
 * @author ruoyi
 * @date 2021-11-27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PinBoard implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 便签头
     */
    @Excel(name = "便签头")
    @Length(max = 10,message = "标题不要超过10个字哟")
    private String boardTitle;

    /**
     * 便签内容
     */
    @Excel(name = "便签内容")
    @Length(max = 100,message = "内容不可以超过100个字符哈")
    private String boardContent;

    /**
     * 显示顺序
     */
    @Excel(name = "显示顺序")
    private Integer orderNum;
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
