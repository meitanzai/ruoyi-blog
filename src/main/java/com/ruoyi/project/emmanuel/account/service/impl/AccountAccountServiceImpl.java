package com.ruoyi.project.emmanuel.account.service.impl;

import java.math.BigDecimal;
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
import org.springframework.ui.ModelMap;

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

    /**
     * 账单分析
     * @param accountId 账单ID
     * @param modelMap
     */
    @Override
    public void accountAnalysisPage(Long accountId, ModelMap modelMap) {

        AccountAccount accountAccount = accountAccountMapper.selectAccountNameById(accountId);
        // 按月账单分析
        List<Map<String, Object>>accountImonthList =  accountAccountMapper.accountCountByImonth(accountId);
        // 收入支出列表
        List<Map<String, Object>> accountClassList = accountAccountMapper.accountCount(accountId);
        // 总收入，总支出
        BigDecimal totalPay = accountClassList.stream().filter(e->Objects.equals("支出",e.get("classType"))).map(e->(BigDecimal)e.get("money")).reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal totalIncome = accountClassList.stream().filter(e->Objects.equals("收入",e.get("classType"))).map(e->(BigDecimal)e.get("money")).reduce(BigDecimal.ZERO, BigDecimal::add);

        modelMap.put("accountId",accountId);
        modelMap.put("accountName", accountAccount.getAccountName());
        modelMap.put("accountImonthList",accountImonthList);
        modelMap.put("accountClassList",accountClassList);
        modelMap.put("totalPay",totalPay);
        modelMap.put("totalIncome",totalIncome);
    }
}
