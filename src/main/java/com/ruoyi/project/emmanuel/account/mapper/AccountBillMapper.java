package com.ruoyi.project.emmanuel.account.mapper;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountBillMapper {

    List<AccountAccount> getAccount();

    List<AccountBill> countMoneyByMonth(AccountBill accountBill);


    List<AccountBill> billPayConunt(String month);

    List<AccountBill> billIncomeConunt(String month);

    List<AccountMoney> countFullCalendarList(@Param("month") String month);
}
