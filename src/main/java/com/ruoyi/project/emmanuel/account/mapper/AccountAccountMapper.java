package com.ruoyi.project.emmanuel.account.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;

/**
 * 记账账户Mapper接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface AccountAccountMapper
{
    /**
     * 查询记账账户
     *
     * @param id 记账账户主键
     * @return 记账账户
     */
    public AccountAccount selectAccountAccountById(Long id);

    /**
     * 查询记账账户列表
     *
     * @param accountAccount 记账账户
     * @return 记账账户集合
     */
    public List<AccountAccount> selectAccountAccountList(AccountAccount accountAccount);

    /**
     * 新增记账账户
     *
     * @param accountAccount 记账账户
     * @return 结果
     */
    public int insertAccountAccount(AccountAccount accountAccount);

    /**
     * 修改记账账户
     *
     * @param accountAccount 记账账户
     * @return 结果
     */
    public int updateAccountAccount(AccountAccount accountAccount);

    /**
     * 删除记账账户
     *
     * @param id 记账账户主键
     * @return 结果
     */
    public int deleteAccountAccountById(Long id);

    /**
     * 批量删除记账账户
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAccountAccountByIds(String[] ids);

    /**
     * 判断是否已经存在
     * @param accountAccount
     * @return
     */
    AccountAccount isExist(AccountAccount accountAccount);

    AccountAccount selectAccountNameById(Long id);

    String isAccountVisible(AccountMoney accountMoney);

    List<Map<String, Object>> accountCount(Long accountId);

    /**
     * 根据账户ID查询每月的支出，收入统计
     *
     * @param accountId 账户ID
     * @return
     */
    List<Map<String, Object>> accountCountByImonth(Long accountId);
}
