package com.ruoyi.project.emmanuel.account.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 记账详情对象 account_money
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Data
public class AccountMoney extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 分类类型 非数据库字段
     */
    private String classType;
    /**
     * 分类名称 非数据库字段
     */
    private String className;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 账本id
     */
    @Excel(name = "账本id")
    private Long accountId;

    /**
     * 类型id
     */
    @Excel(name = "类型id")
    private Long classId;

    /**
     * 金额
     */
    @Excel(name = "收入金额")
    private BigDecimal moneyIncome;

    /**
     * 金额
     */
    @Excel(name = "支出金额")
    private BigDecimal moneyPay;

    /**
     * 备注/金额说明
     */
    @Excel(name = "备注/金额说明")
    private String moneyIntroduce;

    /**
     * 是否记入总账（0记入，默认，1不记录）
     */
    @Excel(name = "是否记入总账", readConverterExp = "0=记入，默认，1不记录")
    private Integer isTotal;

    /**
     * 0是正常，1是删除
     */
    private String deleted;

    /**
     * 消费日期（用户选择不选择默认为当天）
     */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date moneyDate;

    /**
     * 非数据库字段，1是支出,0是收入
     */
    private String type;

    /**
     * 非数据库字段，用于页面显示金额
     */
    @Excel(name = "金额")
    private BigDecimal money;


}
