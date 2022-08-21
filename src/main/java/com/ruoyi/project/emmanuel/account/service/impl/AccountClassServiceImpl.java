package com.ruoyi.project.emmanuel.account.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.emmanuel.account.mapper.AccountClassMapper;
import com.ruoyi.project.emmanuel.account.domain.AccountClass;
import com.ruoyi.project.emmanuel.account.service.IAccountClassService;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

/**
 * 记账分类Service业务层处理
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Service
public class AccountClassServiceImpl implements IAccountClassService {
    @Autowired
    private AccountClassMapper accountClassMapper;

    /**
     * 查询记账分类
     *
     * @param id 记账分类主键
     * @return 记账分类
     */
    @Override
    public AccountClass selectAccountClassById(Long id) {
        return accountClassMapper.selectAccountClassById(id);
    }

    /**
     * 查询记账分类列表
     *
     * @param accountClass 记账分类
     * @return 记账分类
     */
    @Override
    public List<AccountClass> selectAccountClassList(AccountClass accountClass) {

        return accountClassMapper.selectAccountClassList(accountClass);
    }

    /**
     * 新增记账分类
     *
     * @param accountClass 记账分类
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertAccountClass(AccountClass accountClass) {
        // 查询是否已经存在
        Boolean exist = this.isExist(accountClass);
        if (exist){
            throw new RuntimeException(accountClass.getClassName()+"已存在，换个名称试试");
        }
        accountClass.setCreateBy(ShiroUtils.getLoginName());
        accountClass.setCreateTime(DateUtils.getNowDate());
        return accountClassMapper.insertAccountClass(accountClass);
    }


    private Boolean isExist(AccountClass accountClass) {
        System.out.println("accountClassMapper.isExist(accountClass) = " + accountClassMapper.isExist(accountClass));
        return ToolUtils.isEmpty(accountClassMapper.isExist(accountClass)) ? false : true;
    }

    /**
     * 修改记账分类
     *
     * @param accountClass 记账分类
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateAccountClass(@Validated AccountClass accountClass) {
        Boolean exist = this.isExist(accountClass);
        if (exist){
            throw new RuntimeException(accountClass.getClassName()+"已存在，换个名称试试");
        }
        accountClass.setUpdateBy(ShiroUtils.getLoginName());
        accountClass.setUpdateTime(DateUtils.getNowDate());
        return accountClassMapper.updateAccountClass(accountClass);
    }

    /**
     * 批量删除记账分类
     *
     * @param ids 需要删除的记账分类主键
     * @return 结果
     */
    @Override
    public int deleteAccountClassByIds(String ids) {
        return accountClassMapper.deleteAccountClassByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除记账分类信息
     *
     * @param id 记账分类主键
     * @return 结果
     */
    @Override
    public int deleteAccountClassById(Long id) {
        return accountClassMapper.deleteAccountClassById(id);
    }


    /**
     *  下拉框分类
     * 根据收支状态查询
     * param type 收支，收入1，支出0
     * @return
     */
    @Override
    public List<AccountClass> selectAccountClassList(String type) {
        return accountClassMapper.selectAccountClassS(type);
    }
}
