package com.ruoyi.project.emmanuel.account.service;

import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.UserAccount;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.ui.ModelMap;

import java.util.List;


/**
 * 记账账户Service接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface IAccountAccountService {
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

    /**
     * 账单分析
     *
     * @param accountId 账单ID
     * @param modelMap
     */
    void accountAnalysisPage(Long accountId, ModelMap modelMap);

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
    public int deleteAuthUser(UserAccount userAccount);

    /**
     * 批量取消授权用户账户
     *
     * @param accountId 账户ID
     * @param userIds   需要删除的用户数据ID
     * @return 结果
     */
    public int deleteAuthUsers(Long accountId, String userIds);

    /**
     * 根据条件分页查询未分配用户账户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<User> selectUnallocatedList(User user);

    /**
     * 批量选择授权用户账户
     *
     * @param accountId 账户ID
     * @param userIds   需要删除的用户数据ID
     * @return 结果
     */
    int insertAuthUsers(Long accountId, String userIds);


    /**
     * 获取用户账户管理
     *
     * @param userId    用户id
     * @param accountId 账户ID
     * @return
     */
    public UserAccount selectUserAccount(Long userId, Long accountId);
}
