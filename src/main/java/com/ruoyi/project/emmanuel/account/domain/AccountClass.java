package com.ruoyi.project.emmanuel.account.domain;

import lombok.Data;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 记账分类对象 account_class
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Data
public class AccountClass extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @Excel(name = "id")
    private Long id;

    /**
     * 分类名称
     */
    @Excel(name = "分类名称")
    @Length(max = 20,message = "名字不能大于20个字符")
    private String className;

    /**
     * 分类类型
     */
    @Excel(name = "分类类型")
    private String classType;

    /**
     * 分类介绍
     */
    @Excel(name = "分类介绍")
    @Length(max = 60,message = "名字不能大于60个字符")
    private String classIntroduce;

    /**
     * 显示顺序
     */
    @Excel(name = "显示顺序")
    private Integer orderNum;

    /**
     * 停用启用状态
     */
    private String classStatus;

    /**
     * 收支状态（1收入，2支出，3不计入）
     */
    private String status;
}
