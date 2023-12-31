package com.ruoyi.project.emmanuel.account.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

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
     * 主键id
     */
    private Long id;

    /**
     * 账本id
     */
    private Long accountId;

    /**
     * 类型id
     */
    private Long classId;

    /**
     * 金额
     */
    @Excel(name = "金额")
    private BigDecimal money;

    /**
     * 收入金额
     */
    private BigDecimal moneyIncome;

    /**
     * 支出金额
     */
    private BigDecimal moneyPay;

    /**
     * 不计入金额
     */
    private BigDecimal moneyIgnore;

    /**
     * 0是正常，1是删除
     */
    private String deleted;

    /**
     * 非数据库字段，1是支出,0是收入
     */
    private String type;

    /**
     * 分类名称 非数据库字段
     */
    @Excel(name = "类型")
    private String className;

    /**
     * 消费日期（用户选择不选择默认为当天）
     */
    @Excel(name = "消费日期", width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date moneyDate;

    /**
     * 是否记入总账（0记入，默认，1不记录）
     */
    @Excel(name = "是否记入总账", readConverterExp = "0=是,1=否")
    private Integer isTotal;

    /**
     * 分类类型 非数据库字段
     */
    @Excel(name = "收支状态", readConverterExp = "0=收入,1=支出")
    private String classType;

    /**
     * 备注/金额说明
     */
    @Excel(name = "备注")
    private String moneyIntroduce;


    /**
     * 收支状态（1收入，2支出，3不计入）
     */
    private String status;


}
