package com.ruoyi.project.emmanuel.account.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import com.ruoyi.project.emmanuel.account.mapper.AccountAccountMapper;
import com.ruoyi.project.emmanuel.account.mapper.AccountMoneyMapper;
import com.ruoyi.project.emmanuel.account.service.IAccountMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * 记账详情Service业务层处理
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Service
public class AccountMoneyServiceImpl implements IAccountMoneyService {

    @Autowired
    private AccountMoneyMapper accountMoneyMapper;

    @Autowired
    private AccountAccountMapper accountAccountMapper;

    /**
     * 查询记账详情
     *
     * @param id 记账详情主键
     * @return 记账详情
     */
    @Override
    public AccountMoney selectAccountMoneyById(Long id) {
        AccountMoney accountMoney = accountMoneyMapper.selectAccountMoneyById(id);
        return accountMoney;
    }

    /**
     * 查询记账详情列表
     *
     * @param accountMoney 记账详情
     * @return 记账详情
     */
    @Override
    public List<AccountMoney> selectAccountMoneyList(AccountMoney accountMoney,String classIds) {
        String[] classIdList = null;
        if (StringUtils.isNotEmpty(classIds)){
            classIdList = Convert.toStrArray(classIds);
        }
        return accountMoneyMapper.selectAccountMoneyList(accountMoney, classIdList);
    }

    /**
     * 新增记账详情
     *
     * @param accountMoney 记账详情
     * @return 结果
     */
    @Override
    public int insertAccountMoney(AccountMoney accountMoney) {
        // 先查询账单是否停用
        this.isAccountVisible(accountMoney);
        // type非数据库字段，1是支出,0是收入
        String type = accountMoney.getType();
        // 如果不选择默认当天
        if (ToolUtils.isEmpty(accountMoney.getMoneyDate())) {
            accountMoney.setMoneyDate(DateUtils.getNowDate());
        }

        accountMoney.setCreateTime(DateUtils.getNowDate());
        accountMoney.setCreateBy(ShiroUtils.getLoginName());
        return accountMoneyMapper.insertAccountMoney(accountMoney);
    }

    /**
     * 修改记账详情
     *
     * @param accountMoney 记账详情
     * @return 结果
     */
    @Override
    public int updateAccountMoney(AccountMoney accountMoney) {
        // 先查询账单是否停用
        this.isAccountVisible(accountMoney);
        // type非数据库字段，1是支出,0是收入
        String type = accountMoney.getType();
        accountMoney.setUpdateTime(DateUtils.getNowDate());
        accountMoney.setUpdateBy(ShiroUtils.getLoginName());
        return accountMoneyMapper.updateAccountMoney(accountMoney);
    }

    /**
     * 查询account的状态
     *
     * @param accountMoney
     */
    private void isAccountVisible(AccountMoney accountMoney) {
        String isVisible = accountAccountMapper.isAccountVisible(accountMoney);
        if (ToolUtils.isNotEmpty(isVisible) && !Objects.equals("0",isVisible)){
            throw new RuntimeException("当前账单已停用，不可变更");

        }
    }

    /**
     * 批量删除记账详情
     *
     * @param ids 需要删除的记账详情主键
     * @return 结果
     */
    @Override
    public int deleteAccountMoneyByIds(String ids) {
        return accountMoneyMapper.deleteAccountMoneyByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除记账详情信息
     *
     * @param id 记账详情主键
     * @return 结果
     */
    @Override
    public int deleteAccountMoneyById(Long id) {
        return accountMoneyMapper.deleteAccountMoneyById(id);
    }
}
