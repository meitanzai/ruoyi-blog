package com.ruoyi.project.emmanuel.memorial.controller;

import java.util.List;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineS;
import com.ruoyi.project.emmanuel.memorial.service.ITimeLineSService;
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
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 时间轴Controller
 *
 * @author 一粒麦子
 * @date 2023-02-25
 */
@Controller
@RequestMapping("/memorial/TimeLineS")
public class TimeLineSController extends BaseController {
    private String prefix = "emmanuel/memorial";

    @Autowired
    private ITimeLineSService timeLineSService;

    /**
     * 查询时间轴列表
     */
    @RequiresPermissions("timeline:s:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TimeLineS timeLineS) {
        startPage();
        List<TimeLineS> list = timeLineSService.selectTimeLineSList(timeLineS);
        return getDataTable(list);
    }

    /**
     * 新增时间轴
     */
    @GetMapping("/add/{mId}")
    public String add(@PathVariable(value = "mId") Long mId, ModelMap mmap) {
        mmap.put("mId", mId);
        return prefix + "/TimeLineS_add";
    }

    /**
     * 新增保存时间轴
     */
    @RequiresPermissions("timeline:s:add")
    @Log(title = "时间轴", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TimeLineS timeLineS) {
        return toAjax(timeLineSService.insertTimeLineS(timeLineS));
    }

    /**
     * 修改时间轴
     */
    @RequiresPermissions("timeline:s:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        TimeLineS timeLineS = timeLineSService.selectTimeLineSById(id);
        mmap.put("timeLineS", timeLineS);
        return prefix + "/TimeLineS_edit";
    }

    /**
     * 修改保存时间轴
     */
    @RequiresPermissions("timeline:s:edit")
    @Log(title = "时间轴", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TimeLineS timeLineS) {
        return toAjax(timeLineSService.updateTimeLineS(timeLineS));
    }

    /**
     * 删除时间轴
     */
    @RequiresPermissions("timeline:s:remove")
    @Log(title = "时间轴", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(timeLineSService.deleteTimeLineSByIds(ids));
    }

    /**
     * 获取时间轴详情
     */
    @RequiresPermissions("timeline:s:detail")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap) {
        TimeLineS timeLineS = timeLineSService.detail(id);
        mmap.put("timeLineS", timeLineS);
        return prefix + "/TimeLineS_detail";
    }
}
