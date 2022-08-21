package com.ruoyi.project.emmanuel.memorial.controller;

import java.util.List;

import com.ruoyi.framework.web.page.PageDomain;
import com.ruoyi.framework.web.page.TableSupport;
import com.ruoyi.project.emmanuel.memorial.domain.BoardNote;
import com.ruoyi.project.emmanuel.memorial.service.IBoardNoteService;
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
 * 随手记Controller
 *
 * @author 一粒麦子
 * @date 2021-12-18
 */
@Controller
@RequestMapping("/emmanuel/noteBoard")
public class BoardNoteController extends BaseController {

    private String prefix = "emmanuel/memorial" ;

    @Autowired
    private IBoardNoteService boardNoteService;

    @RequiresPermissions("memorial:note_board:view")
    @GetMapping()
    public String note() {
        return prefix + "/note_board" ;
    }

    /**
     * 查询随手记列表
     */
    @RequiresPermissions("memorial:note_board:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BoardNote boardNote) {
        startPage();
        List<BoardNote> list = boardNoteService.selectBoardNoteList(boardNote);
        return getDataTable(list);
    }


    /**
     * 新增随手记
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/note_board_add" ;
    }

    /**
     * 新增保存随手记
     */
    @RequiresPermissions("memorial:note_board:add")
    @Log(title = "新增随手记", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BoardNote boardNote) {
        return toAjax(boardNoteService.insertBoardNote(boardNote));
    }

    /**
     * 跳转修改页面，并根据id查询随手记
     */
    @RequiresPermissions("memorial:note_board:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        BoardNote boardNote = boardNoteService.selectBoardNoteById(id);
        mmap.put("boardNote", boardNote);
        return prefix + "/note_board_edit" ;
    }

    /**
     * 修改保存随手记
     */
    @RequiresPermissions("memorial:note_board:edit")
    @Log(title = "随手记", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BoardNote boardNote) {
        return toAjax(boardNoteService.updateBoardNote(boardNote));
    }

    /**
     * 删除随手记
     */
    @RequiresPermissions("memorial:note_board:remove")
    @Log(title = "随手记", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(boardNoteService.deleteBoardNoteByIds(ids));
    }


    @RequiresPermissions("memorial:note_board:datail")
    @GetMapping("selectById/{id}")
    public String selectById(@PathVariable("id") Long id, ModelMap mmap) {
        BoardNote boardNote = boardNoteService.selectBoardNoteById(id);
        mmap.put("boardNote", boardNote);
        return prefix + "/node_board_detail" ;
    }
}
