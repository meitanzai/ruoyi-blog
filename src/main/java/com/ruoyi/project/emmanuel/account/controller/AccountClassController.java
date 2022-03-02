package com.ruoyi.project.emmanuel.account.controller;

import java.util.List;

import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
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
import com.ruoyi.project.emmanuel.account.domain.AccountClass;
import com.ruoyi.project.emmanuel.account.service.IAccountClassService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 账本分类Controller
 *
 * @author ruoyi
 * @date 2021-11-22
 */
@Controller
@RequestMapping("/account/classif")
public class AccountClassController extends BaseController
{
    private String prefix = "emmanuel/account/classif";

    @Autowired
    private IAccountClassService accountClassService;

    @RequiresPermissions("classif:account:view")
    @GetMapping()
    public String account()
    {
        return prefix + "/classif";
    }

    /**
     * 查询账本分类列表
     */
    @RequiresPermissions("classif:account:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AccountClass accountClass)
    {
        startPage();
        List<AccountClass> list = accountClassService.selectAccountClassList(accountClass);
        return getDataTable(list);
    }

    /**
     * 导出账本分类列表
     */
    @RequiresPermissions("classif:account:export")
    @Log(title = "导出账本分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AccountClass accountClass)
    {
        List<AccountClass> list = accountClassService.selectAccountClassList(accountClass);
        ExcelUtil<AccountClass> util = new ExcelUtil<AccountClass>(AccountClass.class);
        return util.exportExcel(list, "账本分类数据");
    }

    /**
     * 新增账本分类
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存账本分类
     */
    @RequiresPermissions("classif:account:add")
    @Log(title = "新增账本分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    @RepeatSubmit(interval = 5000,message = "请勿重复提交")
    public AjaxResult addSave(AccountClass accountClass)
    {
        return toAjax(accountClassService.insertAccountClass(accountClass));
    }

    /**
     * 修改账本分类
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        AccountClass accountClass = accountClassService.selectAccountClassById(id);
        mmap.put("accountClass", accountClass);
        return prefix + "/edit";
    }

    /**
     * 修改保存账本分类
     */
    @RequiresPermissions("classif:account:edit")
    @Log(title = "修改账本分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    @RepeatSubmit(interval = 5000,message = "请勿重复提交")
    public AjaxResult editSave(AccountClass accountClass)
    {
        return toAjax(accountClassService.updateAccountClass(accountClass));
    }

    /**
     * 删除账本分类
     */
    @RequiresPermissions("classif:account:remove")
    @Log(title = "删除账本分类", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(accountClassService.deleteAccountClassByIds(ids));
    }
}
