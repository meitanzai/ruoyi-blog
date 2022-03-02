package com.ruoyi.project.emmanuel.account.service;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;

import java.util.HashMap;
import java.util.List;

/**
 * 账单统计Service接口
 *
 * @author ruoyi
 * @date 2021-11-24
 */
public interface IAccountBillService {

    List<AccountAccount> getAccount();

    List<AccountBill> countMoneyByMonth(AccountBill accountBill);

    HashMap<String, Object> billConunt(String month);

    List<AccountBill> fullCalendarList(String month);
}
