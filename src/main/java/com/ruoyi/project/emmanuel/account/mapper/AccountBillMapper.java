package com.ruoyi.project.emmanuel.account.mapper;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AccountBillMapper {

    List<AccountAccount> getAccount();

    List<AccountBill> countMoneyByMonth(AccountBill accountBill);


    List<AccountBill> billPayConunt(String month);

    List<AccountBill> billIncomeConunt(String month);

    List<AccountMoney> countFullCalendarList(@Param("month") String month);

    /**
     * 记账账户分析
     */
    List<Map<String, Object>> accountAnalysis(@Param("accountId") Long accountId,@Param("classType")String classType);

}
