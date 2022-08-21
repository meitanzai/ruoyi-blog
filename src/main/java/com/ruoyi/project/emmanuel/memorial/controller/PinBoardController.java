package com.ruoyi.project.emmanuel.memorial.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.memorial.domain.PinBoard;
import com.ruoyi.project.emmanuel.memorial.service.IPinBoardService;
import com.ruoyi.project.emmanuel.mto.domain.MtoChannel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.web.controller.BaseController;

import java.util.ArrayList;
import java.util.List;

/**
 * 文章标题题Controller
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Controller
@RequestMapping("/memorial/pinBoard")
public class PinBoardController extends BaseController {

    @Autowired
    private IPinBoardService pinBoardService;

    private String prefix = "emmanuel/memorial";

    /**
     * 便签列表查询
     *
     * @param modelMap
     * @param currentPage 当前页
     * @param currentSize 当前也大小
     * @return
     */
    @RequiresPermissions("memorial:pin_board:view")
    @GetMapping()
    public String post(ModelMap modelMap,
                       @RequestParam(value = "currentPage", defaultValue = "1") Long currentPage,
                       @RequestParam(value = "currentSize", defaultValue = "12") Long currentSize) {
        pinBoardService.selectPinBoardList(modelMap, currentPage, currentSize);
        return prefix + "/pin_board";
    }


    /**
     * 删除便签
     */
    @RequiresPermissions("memorial:pin_board:remove")
    @Log(title = "删除便签", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(pinBoardService.deletePinBoardById(ids));
    }

    /**
     * 调整新增便签页面
     */
    @GetMapping("/add")
    @RequiresPermissions("memorial:pin_board:add")
    public String add() {
        return prefix + "/pin_board_add";
    }


    /**
     * 新增保存便签
     */
    @RequiresPermissions("memorial:pin_board:add")
    @Log(title = "添加便签", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated PinBoard pinBoard) {
        return toAjax(pinBoardService.insertPinBoard(pinBoard));
    }

    /**
     * 修改便签管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap modelMap) {
        PinBoard pinBoard = pinBoardService.selectPinBoardById(id);
        modelMap.put("pinBoard", pinBoard);
        return prefix + "/pin_board_edit";
    }

    /**
     * 修改便签
     */
    @RequiresPermissions("memorial:pin_board:edit")
    @Log(title = "修改便签", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PinBoard pinBoard) {
        return toAjax(pinBoardService.updatePinBoard(pinBoard));
    }


}
