package com.ruoyi.project.emmanuel.account.service;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;

import java.util.List;
import java.util.Map;


/**
 * 记账账户Service接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface IAccountAccountService
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
     * 批量删除记账账户
     *
     * @param ids 需要删除的记账账户主键集合
     * @return 结果
     */
    public int deleteAccountAccountByIds(String ids);

    /**
     * 删除记账账户信息
     *
     * @param id 记账账户主键
     * @return 结果
     */
    public int deleteAccountAccountById(Long id);

    AccountAccount selectAccountNameById(Long id);

    List<Map<String, Object>> accountCount(Long accountId);
}
