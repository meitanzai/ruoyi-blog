package com.ruoyi.project.emmanuel.account.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 账单统计对象 account_bill
 *
 * @author ruoyi
 * @date 2021-11-24
 */
@Data
public class AccountBill {

    private static final long serialVersionUID = 1L;

    /**
     * 年月
     */
    @Excel(name = "年月")
    private String month;

    /**
     * 支出
     */
    @Excel(name = "支出")
    private BigDecimal pay;

    /**
     * 收入
     */
    @Excel(name = "收入")
    private BigDecimal income;

    /**
     * 结余
     */
    @Excel(name = "结余")
    private BigDecimal balance;

    /**
     * 账本id
     */
    @Excel(name = "账本id")
    private Long accountId;

    /**
     * 消费类型
     */
    private String name;

    /**
     * 消费总额
     */
    private BigDecimal value;


    /**
     * 以下是 fullCalendar 组件 统计每月
     */
    private BigDecimal title;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date start;
    private String backgroundColor;
    private String borderColor;
}
