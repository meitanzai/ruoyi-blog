package com.ruoyi.project.emmanuel.index.controller;

import com.ruoyi.project.emmanuel.index.service.FocusBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/blog/blog")
public class FocusBlogController {

    private String prefix = "emmanuel/web";

    @Autowired
    private FocusBlogService focusBlogService;

    @GetMapping("/focus")
    public String channelById(ModelMap modelMap,
                              @RequestParam(value = "currentPage", defaultValue = "1") Long currentPage,
                              @RequestParam(value = "currentSize", defaultValue = "20") Long currentSize) {
        focusBlogService.selectIndexInfo(modelMap, currentPage, currentSize);
        return prefix + "/focus";
    }
}
