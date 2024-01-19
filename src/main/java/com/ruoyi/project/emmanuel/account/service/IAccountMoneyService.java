package com.ruoyi.project.emmanuel.account.service;

import com.ruoyi.project.emmanuel.account.domain.AccountMoney;

import java.util.List;

/**
 * 记账详情Service接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface IAccountMoneyService {
    /**
     * 查询记账详情
     *
     * @param id 记账详情主键
     * @return 记账详情
     */
    public AccountMoney selectAccountMoneyById(Long id);

    /**
     * 查询记账详情列表
     *
     * @param accountMoney 记账详情
     * @return 记账详情集合
     */
    public List<AccountMoney> selectAccountMoneyList(AccountMoney accountMoney,String classIds);

    /**
     * 新增记账详情
     *
     * @param accountMoney 记账详情
     * @return 结果
     */
    public int insertAccountMoney(AccountMoney accountMoney);

    /**
     * 修改记账详情
     *
     * @param accountMoney 记账详情
     * @return 结果
     */
    public int updateAccountMoney(AccountMoney accountMoney);

    /**
     * 批量删除记账详情
     *
     * @param ids 需要删除的记账详情主键集合
     * @return 结果
     */
    public int deleteAccountMoneyByIds(String ids);

    /**
     * 删除记账详情信息
     *
     * @param id 记账详情主键
     * @return 结果
     */
    public int deleteAccountMoneyById(Long id);
}
