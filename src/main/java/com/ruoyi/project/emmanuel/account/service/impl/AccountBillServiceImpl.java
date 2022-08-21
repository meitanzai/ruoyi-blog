package com.ruoyi.project.emmanuel.account.service.impl;


import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import com.ruoyi.project.emmanuel.account.mapper.AccountBillMapper;
import com.ruoyi.project.emmanuel.account.service.IAccountBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 账单统计Service业务层处理
 *
 * @author ruoyi
 * @date 2021-11-24
 */
@Service
public class AccountBillServiceImpl implements IAccountBillService {

    @Autowired
    private AccountBillMapper accountBillMapper;

    @Override
    public List<AccountAccount> getAccount() {
        return accountBillMapper.getAccount();
    }

    @Override
    public List<AccountBill> countMoneyByMonth(AccountBill accountBill) {
        List<AccountBill> accountBillList = accountBillMapper.countMoneyByMonth(accountBill);
        accountBillList.stream().forEach(e -> {
            e.setBalance(e.getIncome().subtract(e.getPay()));
        });
        return accountBillList;
    }

    @Override
    public HashMap<String, Object> billConunt(String month) {
        HashMap<String, Object> map = new HashMap<>();
        // 支出统计
        List<AccountBill> accountPayBillList = accountBillMapper.billPayConunt(month);
        if (ToolUtils.isNotEmpty(accountPayBillList)) {
            List<String> payTypeList = accountPayBillList.stream().map(AccountBill::getName).collect(Collectors.toList());
            map.put("payTypeList", payTypeList);
            map.put("payData", accountPayBillList);
            BigDecimal totalPay = accountPayBillList.stream().map(AccountBill::getValue).reduce(BigDecimal.ZERO, BigDecimal::add);
            map.put("totalPay", totalPay);
        }

        // 收入统计
        List<AccountBill> accountIncomeBillList = accountBillMapper.billIncomeConunt(month);
        List<String> incomeTypeList = accountIncomeBillList.stream().map(AccountBill::getName).collect(Collectors.toList());
        List<BigDecimal> incomeMoneyList = accountIncomeBillList.stream().map(AccountBill::getIncome).collect(Collectors.toList());
        map.put("incomeTypeList", incomeTypeList);
        map.put("incomeMoneyList", incomeMoneyList);
        return map;
    }

    @Override
    public List<AccountBill> fullCalendarList(String month) {
        List<AccountMoney> accountMonies = accountBillMapper.countFullCalendarList(month);
        List<AccountBill> accountBillList = new ArrayList<>();
        accountMonies.stream().forEach(e -> {
            // 支出
            if (ToolUtils.isNotEmpty(e.getMoneyPay())){
                AccountBill accountBill = new AccountBill();
                accountBill.setTitle(e.getMoneyPay());
                accountBill.setStart(e.getMoneyDate());
                accountBill.setBackgroundColor("#f3715c");
                accountBill.setBorderColor("#f3715c");
                accountBillList.add(accountBill);
            }
            // 收入
            if (ToolUtils.isNotEmpty(e.getMoneyIncome())){
                AccountBill accountBill = new AccountBill();
                accountBill.setTitle(e.getMoneyIncome());
                accountBill.setStart(e.getMoneyDate());
                accountBill.setBackgroundColor("#b2d235");
                accountBill.setBorderColor("#b2d235");
                accountBillList.add(accountBill);
            }

        });
        return accountBillList;
    }
}
