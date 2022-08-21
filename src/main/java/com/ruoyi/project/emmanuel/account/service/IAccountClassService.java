package com.ruoyi.project.emmanuel.account.service;

import java.util.List;
import com.ruoyi.project.emmanuel.account.domain.AccountClass;

/**
 * 记账分类Service接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface IAccountClassService
{
    /**
     * 查询记账分类
     *
     * @param id 记账分类主键
     * @return 记账分类
     */
    public AccountClass selectAccountClassById(Long id);

    /**
     * 查询记账分类列表
     *
     * @param accountClass 记账分类
     * @return 记账分类集合
     */
    public List<AccountClass> selectAccountClassList(AccountClass accountClass);

    /**
     * 新增记账分类
     *
     * @param accountClass 记账分类
     * @return 结果
     */
    public int insertAccountClass(AccountClass accountClass);

    /**
     * 修改记账分类
     *
     * @param accountClass 记账分类
     * @return 结果
     */
    public int updateAccountClass(AccountClass accountClass);

    /**
     * 批量删除记账分类
     *
     * @param ids 需要删除的记账分类主键集合
     * @return 结果
     */
    public int deleteAccountClassByIds(String ids);

    /**
     * 删除记账分类信息
     *
     * @param id 记账分类主键
     * @return 结果
     */
    public int deleteAccountClassById(Long id);

    /**
     * 根据收支状态查询
     * param type 收支，收入1，支出0
     * @return
     */
    List<AccountClass> selectAccountClassList(String type);

}
