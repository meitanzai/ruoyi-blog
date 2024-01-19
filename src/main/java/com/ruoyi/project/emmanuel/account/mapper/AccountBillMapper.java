package com.ruoyi.project.emmanuel.account.mapper;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AccountBillMapper {

    List<AccountAccount> getAccount();

    /**
     * 账单详情统计列表
     *
     * @param accountBill
     * @return
     */
    List<AccountBill> countMoneyByMonth(@Param("accountBill") AccountBill accountBill, @Param("userId") Long userId);

    /**
     * 支出统计
     *
     * @param month 年-月
     * @return
     */
    List<AccountBill> billConunt(@Param("month") String month, @Param("userId") Long userId);

    /**
     * 账单详情-按月统计
     *
     * @param month 年-月
     * @return
     */
    List<AccountMoney> countFullCalendarList(@Param("month") String month, @Param("userId") Long userId);

    /**
     * 记账账户分析
     */
    List<Map<String, Object>> accountAnalysis(@Param("accountId") Long accountId);

    /**
     * 记账账户分析 - 查询指定账户近期收支情况
     *
     * @param accountId 账户id
     * @param userId   用户id
     * @return
     */
    List<Map<String, Object>> accountAnalysisByMonth(@Param("accountId") Long accountId,@Param("userId") Long userId);

    /**
     * 账单详情 - 查询近期收支情况
     * @param month 月
     * @param userId 用户id
     * @return
     */
    List<Map<String, Object>> billCountByMonth(@Param("month") String month,@Param("userId") Long userId);
}
