package com.ruoyi.project.emmanuel.mto.controller;

import java.util.List;

import com.ruoyi.project.emmanuel.mto.domain.MtoTag;
import com.ruoyi.project.emmanuel.mto.service.IMtoTagService;
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
 * mtoController
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
@Controller
@RequestMapping("/mto/tag")
public class MtoTagController extends BaseController {

    private String prefix = "emmanuel/mto/tag";

    @Autowired
    private IMtoTagService mtoTagService;

    @RequiresPermissions("mto:tag:view")
    @GetMapping()
    public String tag() {
        return prefix + "/tag";
    }

    /**
     * 查询博客标签列表
     */
    @RequiresPermissions("mto:tag:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MtoTag mtoTag) {
        startPage();
        List<MtoTag> list = mtoTagService.selectMtoTagList(mtoTag);
        return getDataTable(list);
    }

    /**
     * 新增博客标签
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存博客标签
     */
    @RequiresPermissions("mto:tag:add")
    @Log(title = "博客标签", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MtoTag mtoTag) {
        return toAjax(mtoTagService.insertMtoTag(mtoTag));
    }

    /**
     * 修改博客标签
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap modelMap) {
        MtoTag mtoTag = mtoTagService.selectMtoTagById(id);
        modelMap.put("mtoTag", mtoTag);
        return prefix + "/edit";
    }

    /**
     * 修改保存博客标签
     */
    @RequiresPermissions("mto:tag:edit")
    @Log(title = "博客标签", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MtoTag mtoTag) {
        return toAjax(mtoTagService.updateMtoTag(mtoTag));
    }

    /**
     * 删除博客标签
     */
    @RequiresPermissions("mto:tag:remove")
    @Log(title = "博客标签", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(mtoTagService.deleteMtoTagByIds(ids));
    }
}
