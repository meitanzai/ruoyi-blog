package com.ruoyi.project.emmanuel.account.service.impl;


import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import com.ruoyi.project.emmanuel.account.mapper.AccountBillMapper;
import com.ruoyi.project.emmanuel.account.service.IAccountBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.math.BigDecimal;
import java.util.*;
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
        List<AccountBill> accountBillList = accountBillMapper.countMoneyByMonth(accountBill,ShiroUtils.getUserId());
        accountBillList.stream().forEach(e -> {
            e.setBalance(e.getIncome().subtract(e.getPay()));
        });
        return accountBillList;
    }

    @Override
    public HashMap<String, Object> billConunt(String month) {
        Long userId = ShiroUtils.getUserId();
        HashMap<String, Object> map = new HashMap<>();
        List<AccountBill> accountBillList = accountBillMapper.billConunt(month,userId);
        if (ToolUtils.isEmpty(accountBillList)) {
            return map;
        }

        // 支出统计
        List<AccountBill> accountPayBillList = accountBillList.stream().filter(e -> Objects.equals("2", e.getStatus())).collect(Collectors.toList());
        List<String> payTypeList = accountBillList.stream().map(AccountBill::getName).collect(Collectors.toList());
        map.put("payTypeList", payTypeList);
        map.put("payData", accountPayBillList);
        BigDecimal totalPay = accountPayBillList.stream().map(AccountBill::getValue).reduce(BigDecimal.ZERO, BigDecimal::add);
        map.put("totalPay", totalPay);

        // 收入统计
        List<AccountBill> accountIncomeBillList = accountBillList.stream().filter(e -> Objects.equals("1", e.getStatus())).collect(Collectors.toList());;
        List<String> incomeTypeList = accountIncomeBillList.stream().map(AccountBill::getName).collect(Collectors.toList());
        List<BigDecimal> incomeMoneyList = accountIncomeBillList.stream().map(AccountBill::getValue).collect(Collectors.toList());
        map.put("incomeTypeList", incomeTypeList);
        map.put("incomeMoneyList", incomeMoneyList);
        return map;
    }

    /**
     * 账单详情-按月统计
     * @param month 年-月
     * @return
     */
    @Override
    public List<AccountBill> fullCalendarList(String month) {
        List<AccountMoney> accountMonies = accountBillMapper.countFullCalendarList(month,ShiroUtils.getUserId());
        List<AccountBill> accountBillList = new ArrayList<>();
        accountMonies.stream().forEach(e -> {
            // 支出
            if (ToolUtils.isNotEmpty(e.getMoneyPay()) && e.getMoneyPay().compareTo(BigDecimal.ZERO) != 0){
                AccountBill accountBill = new AccountBill();
                accountBill.setOrder(1);
                accountBill.setTitle("-"+e.getMoneyPay());
                accountBill.setStart(e.getMoneyDate());
                accountBill.setBackgroundColor("#fff");
                accountBill.setBorderColor("#f3715c");
                accountBillList.add(accountBill);
            }
            // 收入
            if (ToolUtils.isNotEmpty(e.getMoneyIncome()) && e.getMoneyIncome().compareTo(BigDecimal.ZERO) != 0){
                AccountBill accountBill = new AccountBill();
                accountBill.setOrder(2);
                accountBill.setTitle("+"+e.getMoneyIncome());
                accountBill.setStart(e.getMoneyDate());
                accountBill.setBackgroundColor("#fff");
                accountBill.setBorderColor("#b2d235");
                accountBillList.add(accountBill);
            }
            // 不计入
            if (ToolUtils.isNotEmpty(e.getMoneyIgnore()) && e.getMoneyIgnore().compareTo(BigDecimal.ZERO) != 0){
                AccountBill accountBill = new AccountBill();
                accountBill.setOrder(3);
                accountBill.setTitle(""+e.getMoneyIgnore());
                accountBill.setStart(e.getMoneyDate());
                accountBill.setBackgroundColor("#fff");
                accountBill.setBorderColor("#2c3e50");
                accountBillList.add(accountBill);
            }
        });
        return accountBillList;
    }

    /**
     * 记账账户分析
     */
    @Override
    public Map<String, Object> accountAnalysis(Long accountId, ModelMap modelMap) {

        List<Map<String, Object>> accountByClass = accountBillMapper.accountAnalysis(accountId);

        // 收入
        List<Map<String, Object>> accountClassIncome =accountByClass.stream().filter(e->Objects.equals("1",e.get("status"))).collect(Collectors.toList());
        // 支出
        List<Map<String, Object>> accountClassPay = accountByClass.stream().filter(e->Objects.equals("2",e.get("status"))).collect(Collectors.toList());

        HashMap<String, Object> map = new HashMap<>();
        map.put("accountClassPay",accountClassPay);
        map.put("accountClassIncome",accountClassIncome);
        return map;
    }
}
