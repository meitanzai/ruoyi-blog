package com.ruoyi.project.emmanuel.index.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.emmanuel.index.service.AdminIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/index")
public class AdminIndexController {

    private String prefix = "/";

    @Autowired
    private AdminIndexService adminIndexService;

    @GetMapping()
    public String bill(ModelMap modelMap) {
        // 返回首页
        return prefix + "/adminIndex";
    }


    @GetMapping("/dayInfo")
    @ResponseBody
    public AjaxResult getDayInfo() {
        return AjaxResult.success(adminIndexService.getDayInfo());
    }

    @GetMapping("/oneGolden")
    @ResponseBody
    public AjaxResult getOneGolden() {
        return AjaxResult.success(adminIndexService.getOneGolden());
    }

    @GetMapping("/getWeathe")
    @ResponseBody
    public AjaxResult getWeathe(HttpServletRequest request, String ip) {
        JSONObject weathe = null;
        try {
            weathe = adminIndexService.getWeathe(request, ip);
        } catch (Exception e) {
            return AjaxResult.success("获取天气失败", e.getMessage());
        }
        return AjaxResult.success("请求成功", weathe);
    }

}
