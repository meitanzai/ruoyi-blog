package com.ruoyi.project.emmanuel.mto.controller;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.domain.Ztree;
import com.ruoyi.project.emmanuel.mto.domain.MtoCategory;
import com.ruoyi.project.emmanuel.mto.service.IMtoCategoryService;
import lombok.AllArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.ListUtils;

import java.util.Date;
import java.util.List;

/**
 * 后台类目管理
 *
 * @author 一粒麦子
 * @version V1.0
 * @date 2022年01月15日
 */
@Controller
@RequestMapping("/mto/category")
public class MtoCategoryController extends BaseController {

    private String prefix = "emmanuel/mto/category";

    @Autowired
    private IMtoCategoryService mtoCategoryService;

    @RequiresPermissions("system:category:view")
    @GetMapping()
    public String category() {
        return prefix + "/category";
    }

    /**
     * 查询前台博客导航树列表
     */
    @RequiresPermissions("system:category:list")
    @PostMapping("/list")
    @ResponseBody
    public List<MtoCategory> list(MtoCategory mtoCategory) {
        List<MtoCategory> list = mtoCategoryService.selectMtoCategoryList(mtoCategory);
        return list;
    }

    /**
     * 导出博客导航列表
     */
    @RequiresPermissions("system:category:export")
    @Log(title = "博客导航", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MtoCategory mtoCategory) {
        List<MtoCategory> list = mtoCategoryService.selectMtoCategoryList(mtoCategory);
        ExcelUtil<MtoCategory> util = new ExcelUtil<MtoCategory>(MtoCategory.class);
        return util.exportExcel(list, "博客导航数据");
    }

    /**
     * 新增博客导航
     */
    @GetMapping(value = {"/add/{id}", "/add/"})
    public String add(@PathVariable(value = "id", required = false) Long id, ModelMap modelMap) {
        if (StringUtils.isNotNull(id)) {
            modelMap.put("mtoCategory", mtoCategoryService.selectMtoCategoryById(id));
        }
        return prefix + "/add";
    }

    /**
     * 新增保存博客导航
     */
    @RequiresPermissions("system:category:add")
    @Log(title = "博客导航", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MtoCategory mtoCategory) {
        return toAjax(mtoCategoryService.insertMtoCategory(mtoCategory));
    }

    /**
     * 修改博客导航
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap modelMap) {
        MtoCategory mtoCategory = mtoCategoryService.selectMtoCategoryById(id);
        modelMap.put("mtoCategory", mtoCategory);
        return prefix + "/edit";
    }

    /**
     * 修改保存博客导航
     */
    @RequiresPermissions("system:category:edit")
    @Log(title = "修改博客导航", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MtoCategory mtoCategory) {
        return toAjax(mtoCategoryService.updateMtoCategory(mtoCategory));
    }

    /**
     * 删除
     */
    @RequiresPermissions("system:category:remove")
    @Log(title = "博客导航", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{id}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("id") Long id) {
        return toAjax(mtoCategoryService.deleteMtoCategoryById(id));
    }

    /**
     * 选择博客导航树
     */
    @GetMapping(value = {"/selectCategoryTree/{id}", "/selectCategoryTree/"})
    public String selectCategoryTree(@PathVariable(value = "id", required = false) Long id, ModelMap modelMap) {
        if (StringUtils.isNotNull(id)) {
            modelMap.put("mtoCategory", mtoCategoryService.selectMtoCategoryById(id));
        }
        return prefix + "/tree";
    }

    /**
     * 加载博客导航树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData() {
        List<Ztree> ztrees = mtoCategoryService.selectMtoCategoryTree();
        return ztrees;
    }
}
