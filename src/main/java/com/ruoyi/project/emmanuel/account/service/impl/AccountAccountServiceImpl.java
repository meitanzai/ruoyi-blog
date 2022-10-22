package com.ruoyi.project.emmanuel.account.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.emmanuel.account.mapper.AccountAccountMapper;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.service.IAccountAccountService;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.transaction.annotation.Transactional;

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
        accountAccount.setCreateTime(DateUtils.getNowDate());
        accountAccount.setCreateBy(ShiroUtils.getLoginName());
        return accountAccountMapper.insertAccountAccount(accountAccount);
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
        if (Objects.equals("1",accountAccount.getVisible())){
            throw new RuntimeException(accountName+"已存在,且为隐藏状态");
        }
        throw new RuntimeException(accountName+"已存在,换个名字试试");

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

    @Override
    public List<Map<String, Object>> accountCount(Long accountId) {
        return accountAccountMapper.accountCount(accountId);
    }
}
