package com.ruoyi.project.emmanuel.account.mapper;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import com.ruoyi.project.emmanuel.account.domain.UserAccount;
import com.ruoyi.project.system.user.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 记账账户Mapper接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface AccountAccountMapper {
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
     *
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

    /**
     * 查询已分配用户账户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<User> selectAllocatedList(User user);

    /**
     * 取消授权用户账户
     *
     * @param userAccount 用户和账户关联信息
     * @return 结果
     */
    int deleteUserRoleInfo(UserAccount userAccount);

    /**
     * 批量取消授权用户账户
     *
     * @param accountId 账户ID
     * @param userIds   需要删除的用户数据ID
     * @return 结果
     */
    int deleteUserRoleInfos(@Param("accountId") Long accountId, @Param("userIds") Long[] userIds);

    /**
     * 根据条件分页查询未分配用户账户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<User> selectUnallocatedList(User user);

    /**
     * 批量新增用户账户信息
     *
     * @param userAccountList 用户账户列表
     * @return 结果
     */
    int batchUserAccount(List<UserAccount> userAccountList);

    /**
     * 新增用户账户管理
     *
     * @param userAccount
     */
    int insertUserAccount(UserAccount userAccount);

    /**
     * 获取用户账户管理
     *
     * @param userId    用户id
     * @param accountId 账户ID
     * @return
     */
    UserAccount selectUserAccount(@Param("userId") Long userId, @Param("accountId") Long accountId);
}
