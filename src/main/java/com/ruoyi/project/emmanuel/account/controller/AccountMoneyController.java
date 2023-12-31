package com.ruoyi.project.emmanuel.account.controller;

import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountClass;
import com.ruoyi.project.emmanuel.account.domain.AccountMoney;
import com.ruoyi.project.emmanuel.account.mapper.AccountAccountMapper;
import com.ruoyi.project.emmanuel.account.service.IAccountClassService;
import com.ruoyi.project.emmanuel.account.service.IAccountMoneyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 记账详情Controller
 *
 * @author ruoyi
 * @date 2022-01-21
 */
@Controller
@RequestMapping("/account/money")
public class AccountMoneyController extends BaseController {
    private String prefix = "emmanuel/account/account/money";

    @Autowired
    private IAccountMoneyService accountMoneyService;

    @Autowired
    private IAccountClassService accountClassService;

    @Autowired
    private AccountAccountMapper accountAccountMapper;

    @RequiresPermissions("account:money:view")
    @GetMapping()
    public String money() {
        return prefix + "/account/money";
    }

    /**
     * 查询记账详情列表
     */
    @RequiresPermissions("account:money:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AccountMoney accountMoney) {
        startPage();
        List<AccountMoney> list = accountMoneyService.selectAccountMoneyList(accountMoney);
        return getDataTable(list);
    }

    /**
     * 导出记账详情列表
     */
    @RequiresPermissions("account:money:export")
    @Log(title = "记账详情导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AccountMoney accountMoney) {
        List<AccountMoney> list = accountMoneyService.selectAccountMoneyList(accountMoney);
        ExcelUtil<AccountMoney> util = new ExcelUtil<AccountMoney>(AccountMoney.class);
        return util.exportExcel(list, "记账详情数据");
    }

    /**
     * 跳转到新增页面
     *
     * @param accountId 账本id
     * @param type      收支，收入1，支出0
     * @param modelMap
     * @return
     */
    @GetMapping("/add/{accountId}/{type}")
    public String add(@PathVariable("accountId") String accountId, @PathVariable("type") String type, ModelMap modelMap) {
        if (ToolUtils.isOneEmpty(accountId, type)) {
            throw new RuntimeException("暂不支持添加，请联系管理员");
        }
        modelMap.put("type", type);
        // 直接放对象里，方便后期扩展
        AccountAccount account = new AccountAccount();
        account = accountAccountMapper.selectAccountNameById(Long.valueOf(accountId));
        modelMap.put("account", account);

        // 分类
        List<AccountClass> accountClasseList = accountClassService.selectAccountClassList(type);
        modelMap.put("accountClasseList", accountClasseList);

        return prefix + "/add";
    }

    @GetMapping("/add/{accountId}")
    public String add(@PathVariable("accountId") String accountId,ModelMap modelMap) {
        if (ToolUtils.isOneEmpty(accountId)) {
            throw new RuntimeException("请选择记账账户");
        }

        // 直接放对象里，方便后期扩展
        AccountAccount account = new AccountAccount();
        account = accountAccountMapper.selectAccountNameById(Long.valueOf(accountId));
        modelMap.put("account", account);

        return prefix + "/add";
    }

    /**
     * 查询记账分类列表
     */
    @GetMapping("/accountClass")
    @ResponseBody
    public TableDataInfo list(@RequestParam(name = "classType") String classType) {
        List<AccountClass> accountClasseList = accountClassService.selectAccountClassList(classType);
        return getDataTable(accountClasseList);
    }

    /**
     * 新增保存记账详情
     */
    @RequiresPermissions("account:money:add")
    @Log(title = "记账详情", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    @RepeatSubmit(interval = 5000, message = "请勿重复提交")
    public AjaxResult addSave(AccountMoney accountMoney) {
        return toAjax(accountMoneyService.insertAccountMoney(accountMoney));
    }

    /**
     * 修改记账详情
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap modelMap) {
        AccountMoney accountMoney = accountMoneyService.selectAccountMoneyById(id);
        if (ToolUtils.isEmpty(accountMoney)) {
            return null;
        }
        modelMap.put("accountMoney", accountMoney);
        // 分类
        List<AccountClass> accountClasseList = accountClassService.selectAccountClassList(accountMoney.getClassType());
        modelMap.put("accountClasseList", accountClasseList);
        return prefix + "/edit";
    }

    /**
     * 修改保存记账详情
     */
    @RequiresPermissions("account:money:edit")
    @Log(title = "记账详情", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    @RepeatSubmit(interval = 5000, message = "请勿重复提交")
    public AjaxResult editSave(AccountMoney accountMoney) {
        return toAjax(accountMoneyService.updateAccountMoney(accountMoney));
    }

    /**
     * 删除记账详情
     */
    @RequiresPermissions("account:money:remove")
    @Log(title = "记账详情", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(accountMoneyService.deleteAccountMoneyByIds(ids));
    }

    private AccountAccount getAccountById(Long accountId) {
        AccountAccount accountAccount = accountAccountMapper.selectAccountAccountById(accountId);
        return accountAccount;
    }





}
