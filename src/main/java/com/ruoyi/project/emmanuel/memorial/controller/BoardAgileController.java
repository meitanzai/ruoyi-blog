package com.ruoyi.project.emmanuel.memorial.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.emmanuel.memorial.domain.BoardAgile;
import com.ruoyi.project.emmanuel.memorial.domain.PinBoard;
import com.ruoyi.project.emmanuel.memorial.service.IBoardAgileService;
import com.ruoyi.project.emmanuel.memorial.service.IPinBoardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 文章标题题Controller
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Controller
@RequestMapping("/memorial/agileBoard")
public class BoardAgileController extends BaseController {

    private String prefix = "emmanuel/memorial";

    @Autowired
    private IBoardAgileService boardAgileService;

    /**
     * 跳转到任务列表并查看数据
     *
     * @param modelMap
     * @return
     */
    @RequiresPermissions("memorial:agile_board:view")
    @GetMapping()
    public String selectBoardAgileList(ModelMap modelMap, BoardAgile boardAgile) {
        boardAgileService.selectBoardAgileList(modelMap,boardAgile);
        return prefix + "/agile_board";
    }

    /**
     * 新增任务清单
     */
    @GetMapping("/add")
    @RequiresPermissions("memorial:agile_board:add")
    public String add() {
        return prefix + "/agile_board_add";
    }


    /**
     * 新增保存任务清单
     */
    @RequiresPermissions("memorial:agile_board:add")
    @Log(title = "新增任务清单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BoardAgile boardAgile, ModelMap modelMap) {
        return toAjax(boardAgileService.insertBoardAgile(boardAgile));
    }

    /**
     * 删除任务清单
     */
    @RequiresPermissions("memorial:agile_board:remove")
    @Log(title = "删除任务清单", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(boardAgileService.deleteBoardAgileByIds(ids));
    }

    /**
     * 修改状态
     *
     * @param boardAgile
     * @return
     */
    @RequiresPermissions("memorial:agile_board:editStatus")
    @Log(title = "修改任务清单状态", businessType = BusinessType.DELETE)
    @PutMapping("/editStatus")
    @ResponseBody
    public AjaxResult editStatus(BoardAgile boardAgile) {
        return toAjax(boardAgileService.editStatus(boardAgile));
    }

}
