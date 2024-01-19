package com.ruoyi.project.emmanuel.account.service;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import org.springframework.ui.ModelMap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    Map<String, Object> accountAnalysis(Long accountId, ModelMap modelMap);

    Map<String, Object> accountAnalysisByMonth(Long accountId, ModelMap modelMap);

    Map<String, Object> billCountByMonth(String month);
}
