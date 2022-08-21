package com.ruoyi.project.emmanuel.mto.controller;

import java.util.List;

import com.ruoyi.framework.web.page.PageDomain;
import com.ruoyi.framework.web.page.TableSupport;
import com.ruoyi.project.emmanuel.mto.domain.MtoLink;
import com.ruoyi.project.emmanuel.mto.service.IMtoLinkService;
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
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 友情链接
 *
 * @author 一粒麦子
 * @date 2021-12-13
 */
@Controller
@RequestMapping("/mto/link")
public class MtoLinkController extends BaseController {

    private String prefix = "emmanuel/mto/link";

    @Autowired
    private IMtoLinkService mtoLinkService;

    @RequiresPermissions("mto:link:view")
    @GetMapping()
    public String link() {
        return prefix + "/link";
    }

    /**
     * 查询好友链接列表
     */
    @RequiresPermissions("mto:link:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MtoLink mtoLink) {
        startPage();
        return getDataTable(mtoLinkService.selectMtoLinkList(mtoLink));
    }

    /**
     * 新增好友链接
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存好友链接
     */
    @RequiresPermissions("mto:link:add")
    @Log(title = "好友链接", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MtoLink mtoLink) {
        return toAjax(mtoLinkService.insertMtoLink(mtoLink));
    }

    /**
     * 修改好友链接
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        MtoLink mtoLink = mtoLinkService.selectMtoLinkById(id);
        mmap.put("mtoLink", mtoLink);
        return prefix + "/edit";
    }

    /**
     * 修改保存好友链接
     */
    @RequiresPermissions("mto:link:edit")
    @Log(title = "好友链接", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MtoLink mtoLink) {
        return toAjax(mtoLinkService.updateMtoLink(mtoLink));
    }

    /**
     * 删除好友链接
     */
    @RequiresPermissions("mto:link:remove")
    @Log(title = "好友链接", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(mtoLinkService.deleteMtoLinkByIds(ids));
    }
}
