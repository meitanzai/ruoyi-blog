package com.ruoyi.project.emmanuel.account.controller;

import java.math.BigDecimal;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.account.domain.AccountAccount;
import com.ruoyi.project.emmanuel.account.domain.AccountBill;
import com.ruoyi.project.emmanuel.account.service.IAccountBillService;
import com.ruoyi.project.emmanuel.mto.domain.MtoPost;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.web.controller.BaseController;

/**
 * 账单统计Controller
 *
 * @author ruoyi
 * @date 2022-01-23
 */
@Controller
@RequestMapping("/account/bill")
public class AccountBillController extends BaseController {

    private String prefix = "emmanuel/account/bill";

    @Autowired
    private IAccountBillService accountBillService;

    @RequiresPermissions("account:bill:view")
    @GetMapping()
    public String bill(ModelMap modelMap) {
        // 返回账本
        List<AccountAccount> accountList = accountBillService.getAccount();
        modelMap.put("accountList", accountList);
        return prefix + "/bill";
    }

    /**
     * 查询账单统计列表
     */
    @RequiresPermissions("account:bill:view")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AccountBill accountBill) {
        startPage();
        List<AccountBill> list = accountBillService.countMoneyByMonth(accountBill);
        return getDataTable(list);
    }

    /**
     * 导出账单统计列表
     */
    @RequiresPermissions("account:bill:export")
    @Log(title = "导出账单统计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AccountBill accountBill) {
        List<AccountBill> list = accountBillService.countMoneyByMonth(accountBill);
        ExcelUtil<AccountBill> util = new ExcelUtil<AccountBill>(AccountBill.class);
        return util.exportExcel(list, "账单统计数据");
    }


    /**
     * 查看更多按钮（跳转到统计页面）
     *
     * @param modelMap
     * @param month
     * @return
     */
    @GetMapping("/bullCount/{id}")
    @RequiresPermissions("account:bill:count")
    public String billConuntPage(ModelMap modelMap, @PathVariable(value = "id") String month) {
        modelMap.put("month", month);
        return prefix + "/count";
    }

    /**
     * 统计页面的请求
     *
     * @param modelMap
     * @param month    月
     * @return
     */
    @GetMapping("/bullCount/month")
    @ResponseBody
    @RequiresPermissions("account:bill:count")
    @Log(title = "查询月账单图形统计")
    public HashMap<String, Object> billConunt(ModelMap modelMap, String month) {
        return accountBillService.billConunt(month);
    }

    @GetMapping("/bullCount/billConuntByMonth")
    @ResponseBody
    @RequiresPermissions("account:bill:count")
    public TableDataInfo billConuntByMonth(ModelMap modelMap, String month) {
        List<AccountBill> fullCalendarList = this.accountBillService.fullCalendarList(month);
        return getDataTable(fullCalendarList);
    }

    /**
     * 记账账户分析
     */
    @RequiresPermissions("account:account:analysis")
    @GetMapping("/accountAnalysis/{accountId}")
    @ResponseBody
    public Map<String, Object> accountAnalysis(@PathVariable("accountId") Long accountId, ModelMap modelMap) {
        Map<String, Object> map = accountBillService.accountAnalysis(accountId, modelMap);
        return map;
    }

}
