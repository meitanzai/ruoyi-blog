package com.ruoyi.project.emmanuel.account.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import org.apache.ibatis.annotations.Param;

/**
 * 记账详情Mapper接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface AccountMoneyMapper
{
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
    public List<AccountMoney> selectAccountMoneyList(AccountMoney accountMoney);

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
     * 删除记账详情
     *
     * @param id 记账详情主键
     * @return 结果
     */
    public int deleteAccountMoneyById(Long id);

    /**
     * 批量删除记账详情
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAccountMoneyByIds(String[] ids);

    /**
     * 获取上周数据
     * @param preWeekMonday 上周一
     * @return
     */
    List<Map<String, Object>> getPreWeekBill(@Param("preWeekMonday") Date preWeekMonday);

    List<String> getUserMail(@Param("accountId") String accountId,@Param("preWeekMonday") Date preWeekMonday);
}
