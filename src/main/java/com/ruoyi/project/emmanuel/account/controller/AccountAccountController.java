package com.ruoyi.project.emmanuel.account.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountClass;
import com.ruoyi.project.emmanuel.account.service.IAccountAccountService;
import com.ruoyi.project.emmanuel.account.service.IAccountClassService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
    private IAccountClassService accountClassService;

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
        AccountAccount account = accountAccountService.selectAccountNameById(id);
        modelMap.put("account", account);
        // 获取分类
        List<AccountClass> classList = accountClassService.selectAccountClassList(new AccountClass());
        modelMap.put("classList", classList);

        return prefix + "/money/money";
    }

    /**
     * 跳转到统计页面
     */
    @RequiresPermissions("account:account:analysis")
    @GetMapping("/accountAnalysisPage/{accountId}")
    public String accountAnalysisPage(@PathVariable("accountId") Long accountId, ModelMap modelMap) {
        AccountAccount accountAccount = accountAccountService.selectAccountNameById(accountId);
        // 收入支出列表
        List<Map<String, Object>> accountClassList = accountAccountService.accountCount(accountId);
        // 总收入，总支出
        BigDecimal totalPay = accountClassList.stream().filter(e->Objects.equals("支出",e.get("classType"))).map(e->(BigDecimal)e.get("money")).reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal totalIncome = accountClassList.stream().filter(e->Objects.equals("收入",e.get("classType"))).map(e->(BigDecimal)e.get("money")).reduce(BigDecimal.ZERO, BigDecimal::add);

        modelMap.put("accountId",accountId);
        modelMap.put("accountName", accountAccount.getAccountName());
        modelMap.put("accountClassList",accountClassList);
        modelMap.put("totalPay",totalPay);
        modelMap.put("totalIncome",totalIncome);
        return  "emmanuel/account/bill/analysis";
    }

}
