package com.ruoyi.project.emmanuel.account.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.UserAccount;
import com.ruoyi.project.emmanuel.account.mapper.AccountAccountMapper;
import com.ruoyi.project.emmanuel.account.service.IAccountAccountService;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 记账账户Service业务层处理
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Service
public class AccountAccountServiceImpl implements IAccountAccountService {
    @Autowired
    private AccountAccountMapper accountAccountMapper;

    /**
     * 查询记账账户
     *
     * @param id 记账账户主键
     * @return 记账账户
     */
    @Override
    public AccountAccount selectAccountAccountById(Long id) {
        return accountAccountMapper.selectAccountAccountById(id);
    }

    /**
     * 查询记账账户列表
     *
     * @param accountAccount 记账账户
     * @return 记账账户
     */
    @Override
    public List<AccountAccount> selectAccountAccountList(AccountAccount accountAccount) {
        accountAccount.setUserId(ShiroUtils.getUserId());
        return accountAccountMapper.selectAccountAccountList(accountAccount);
    }

    /**
     * 新增记账账户
     *
     * @param accountAccount 记账账户
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertAccountAccount(AccountAccount accountAccount) {
        this.isExist(accountAccount);
        // 添加账户
        accountAccount.setCreateTime(DateUtils.getNowDate());
        accountAccount.setCreateBy(ShiroUtils.getLoginName());
        accountAccountMapper.insertAccountAccount(accountAccount);
        // 添加账户-用户管理
        UserAccount ua = new UserAccount();
        ua.setAccountId(accountAccount.getId());
        ua.setUserId(ShiroUtils.getUserId());
        ua.setAdministrators("1");
        return accountAccountMapper.insertUserAccount(ua);
    }

    /**
     * 判断是否已经存在
     *
     * @param accountAccount
     */
    private void isExist(AccountAccount accountAccount) {
        // 这里只返回了是否隐藏
        String accountName = accountAccount.getAccountName();
        accountAccount = accountAccountMapper.isExist(accountAccount);
        if (ToolUtils.isEmpty(accountAccount)) {
            return;
        }
        // 1为隐藏
        if (Objects.equals("1", accountAccount.getVisible())) {
            throw new RuntimeException(accountName + "已存在,且为隐藏状态");
        }
        throw new RuntimeException(accountName + "已存在,换个名字试试");

    }

    /**
     * 修改记账账户
     *
     * @param accountAccount 记账账户
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateAccountAccount(AccountAccount accountAccount) {
        this.isExist(accountAccount);
        accountAccount.setUpdateBy(ShiroUtils.getLoginName());
        accountAccount.setUpdateTime(DateUtils.getNowDate());
        return accountAccountMapper.updateAccountAccount(accountAccount);
    }

    /**
     * 批量删除记账账户
     *
     * @param ids 需要删除的记账账户主键
     * @return 结果
     */
    @Override
    public int deleteAccountAccountByIds(String ids) {
        return accountAccountMapper.deleteAccountAccountByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除记账账户信息
     *
     * @param id 记账账户主键
     * @return 结果
     */
    @Override
    public int deleteAccountAccountById(Long id) {
        return accountAccountMapper.deleteAccountAccountById(id);
    }

    @Override
    public AccountAccount selectAccountNameById(Long id) {
        return accountAccountMapper.selectAccountNameById(id);
    }

    /**
     * 账单分析
     *
     * @param accountId 账单ID
     * @param modelMap
     */
    @Override
    public void accountAnalysisPage(Long accountId, ModelMap modelMap) {

        AccountAccount accountAccount = accountAccountMapper.selectAccountNameById(accountId);
        // 按月账单分析
        List<Map<String, Object>> accountImonthList = accountAccountMapper.accountCountByImonth(accountId);
        // 按分类账单分析
        List<Map<String, Object>> accountClassList = accountAccountMapper.accountCountByClass(accountId);
        // 总收入，总支出
        BigDecimal totalPay = accountClassList.stream().filter(e -> Objects.equals("2", e.get("status"))).map(e -> (BigDecimal) e.get("money")).reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal totalIncome = accountClassList.stream().filter(e -> Objects.equals("1", e.get("status"))).map(e -> (BigDecimal) e.get("money")).reduce(BigDecimal.ZERO, BigDecimal::add);

        modelMap.put("accountId", accountId);
        modelMap.put("accountName", accountAccount.getAccountName());
        modelMap.put("accountImonthList", accountImonthList);
        modelMap.put("accountClassList", accountClassList);
        modelMap.put("totalPay", totalPay);
        modelMap.put("totalIncome", totalIncome);
    }

    /**
     * 查询已分配用户账户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    public List<User> selectAllocatedList(User user) {
        return accountAccountMapper.selectAllocatedList(user);
    }

    /**
     * 取消授权用户账户
     *
     * @param userAccount 用户和账户关联信息
     * @return 结果
     */
    @Override
    public int deleteAuthUser(UserAccount userAccount) {
        administrators(ShiroUtils.getUserId(), userAccount.getAccountId());
        return accountAccountMapper.deleteUserRoleInfo(userAccount);
    }

    /**
     * 批量取消授权用户账户
     *
     * @param accountId 账户ID
     * @param userIds   需要删除的用户数据ID
     * @return 结果
     */
    @Override
    public int deleteAuthUsers(Long accountId, String userIds) {
        administrators(ShiroUtils.getUserId(), accountId);
        return accountAccountMapper.deleteUserRoleInfos(accountId, Convert.toLongArray(userIds));
    }

    /**
     * 根据条件分页查询未分配用户账户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    public List<User> selectUnallocatedList(User user) {
        return accountAccountMapper.selectUnallocatedList(user);
    }

    /**
     * 批量选择授权用户账户
     *
     * @param accountId 账户ID
     * @param userIds   需要删除的用户数据ID
     * @return 结果
     */
    @Override
    public int insertAuthUsers(Long accountId, String userIds) {
        administrators(ShiroUtils.getUserId(), accountId);
        Long[] users = Convert.toLongArray(userIds);
        // 新增用户与账户管理
        List<UserAccount> list = new ArrayList<UserAccount>();
        for (Long userId : users) {
            UserAccount ua = new UserAccount();
            ua.setUserId(userId);
            ua.setAccountId(accountId);
            list.add(ua);
        }
        return accountAccountMapper.batchUserAccount(list);
    }

    /**
     * 校验用户账户管理员
     *
     * @param userId    用户ID
     * @param accountId 账户ID
     */
    private void administrators(Long userId, Long accountId) {
        UserAccount userAccount = accountAccountMapper.selectUserAccount(userId, accountId);
        if (!Objects.equals("1", userAccount.getAdministrators())) {
            throw new RuntimeException("非账户管理员，禁止修改");
        }
    }

    /**
     * 获取用户账户管理
     *
     * @param userId    用户id
     * @param accountId 账户ID
     * @return
     */
    @Override
    public UserAccount selectUserAccount(Long userId, Long accountId) {
        return accountAccountMapper.selectUserAccount(userId, accountId);
    }
}
