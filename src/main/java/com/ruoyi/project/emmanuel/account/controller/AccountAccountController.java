package com.ruoyi.project.emmanuel.account.controller;

import java.util.List;

import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import com.ruoyi.project.emmanuel.account.service.IAccountMoneyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.service.IAccountAccountService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 记账账户Controller
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Controller
@RequestMapping("/account/account")
public class AccountAccountController extends BaseController {

    private String prefix = "emmanuel/account/account";

    @Autowired
    private IAccountAccountService accountAccountService;

    @Autowired
    private IAccountMoneyService accountMoneyService;

    @RequiresPermissions("account:account:view")
    @GetMapping()
    public String account() {
        return prefix + "/account";
    }

    /**
     * 查询记账账户列表
     */
    @RequiresPermissions("account:account:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AccountAccount accountAccount) {
        startPage();

        List<AccountAccount> list = accountAccountService.selectAccountAccountList(accountAccount);
        return getDataTable(list);
    }

    /**
     * 导出记账账户列表
     */
    @RequiresPermissions("account:account:export")
    @Log(title = "导出记账账户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AccountAccount accountAccount) {
        List<AccountAccount> list = accountAccountService.selectAccountAccountList(accountAccount);
        ExcelUtil<AccountAccount> util = new ExcelUtil<AccountAccount>(AccountAccount.class);
        return util.exportExcel(list, "记账账户数据");
    }

    /**
     * 新增记账账户
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存记账账户
     */
    @RequiresPermissions("account:account:add")
    @Log(title = "新增记账账户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    @RepeatSubmit(interval = 5000, message = "请勿重复提交")
    public AjaxResult addSave(AccountAccount accountAccount) {
        String cover = accountAccount.getCover();
        System.out.println("cover = " + cover);
        return toAjax(accountAccountService.insertAccountAccount(accountAccount));
    }

    /**
     * 修改记账账户
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        AccountAccount accountAccount = accountAccountService.selectAccountAccountById(id);
        mmap.put("accountAccount", accountAccount);
        return prefix + "/edit";
    }

    /**
     * 修改保存记账账户
     */
    @RequiresPermissions("account:account:edit")
    @Log(title = "修改记账账户", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    @RepeatSubmit(interval = 5000, message = "请勿重复提交")
    public AjaxResult editSave(AccountAccount accountAccount) {
        return toAjax(accountAccountService.updateAccountAccount(accountAccount));
    }

    /**
     * 删除记账账户
     */
    @RequiresPermissions("account:account:remove")
    @Log(title = "删除记账账户", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(accountAccountService.deleteAccountAccountByIds(ids));
    }

    /**
     * 新增记账账户
     */
    @RequiresPermissions("account:account:detail")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap modelMap) {
        // 获取账本
        AccountAccount account = new AccountAccount();
        account = accountAccountService.selectAccountNameById(id);
        modelMap.put("account", account);
        AccountMoney accountMoney = new AccountMoney();
        accountMoney.setAccountId(id);
        List<AccountMoney> accountMonies = accountMoneyService.selectAccountMoneyList(accountMoney);
        modelMap.put("accountMoney", accountMonies);
        return prefix + "/money/money";
    }


}
