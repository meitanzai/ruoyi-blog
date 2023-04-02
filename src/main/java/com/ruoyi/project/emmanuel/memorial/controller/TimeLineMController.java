package com.ruoyi.project.emmanuel.memorial.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineM;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineS;
import com.ruoyi.project.emmanuel.memorial.service.ITimeLineMService;
import com.ruoyi.project.emmanuel.memorial.service.ITimeLineSService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 时间轴主表Controller
 *
 * @author 一粒麦子
 * @date 2023-02-25
 */
@Controller
@RequestMapping("/memorial/TimeLineM")
public class TimeLineMController extends BaseController {

    private String prefix = "emmanuel/memorial";

    @Autowired
    private ITimeLineMService timeLineMService;

    @Autowired
    private ITimeLineSService timeLineSService;

    @RequiresPermissions("timeline:m:view")
    @GetMapping()
    public String timeline() {
        return prefix + "/TimeLineM";
    }

    /**
     * 查询时间轴主表列表
     */
    @RequiresPermissions("timeline:m:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TimeLineM timeLineM) {
        startPage();
        List<TimeLineM> list = timeLineMService.selectTimeLineMList(timeLineM);
        return getDataTable(list);
    }

    /**
     * 新增时间轴主表
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/TimeLineM_add";
    }

    /**
     * 新增保存时间轴主表
     */
    @RequiresPermissions("timeline:m:add")
    @Log(title = "时间轴主表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TimeLineM timeLineM) {
        return toAjax(timeLineMService.insertTimeLineM(timeLineM));
    }

    /**
     * 修改时间轴主表
     */
    @RequiresPermissions("timeline:m:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        TimeLineM timeLineM = timeLineMService.selectTimeLineMById(id);
        mmap.put("timeLineM", timeLineM);
        return prefix + "/TimeLineM_edit";
    }

    /**
     * 修改保存时间轴主表
     */
    @RequiresPermissions("timeline:m:edit")
    @Log(title = "时间轴主表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TimeLineM timeLineM) {
        return toAjax(timeLineMService.updateTimeLineM(timeLineM));
    }

    /**
     * 删除时间轴主表
     */
    @RequiresPermissions("timeline:m:remove")
    @Log(title = "时间轴主表", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(timeLineMService.deleteTimeLineMByIds(ids));
    }

    /**
     * 查看时间轴详情
     */
    @RequiresPermissions("timeline:m:detail")
    @GetMapping("detail/{id}")
    public String timeline(@PathVariable("id") Long id, ModelMap mmap) {
        TimeLineS timeLineS = new TimeLineS();
        timeLineS.setMId(id);
        List<TimeLineS> list = timeLineSService.selectTimeLineSList(timeLineS);
        mmap.put("timelineSList", list);
        mmap.put("timelineMName", "我来测试啦");
        mmap.put("mId", id);
        return prefix + "/TimeLineS";
    }
}
