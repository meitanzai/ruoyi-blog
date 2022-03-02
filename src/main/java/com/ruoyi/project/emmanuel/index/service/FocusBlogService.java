package com.ruoyi.project.emmanuel.index.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.mto.domain.WebMtoPost;
import com.ruoyi.project.emmanuel.mto.mapper.WebPostMapper;
import com.ruoyi.project.emmanuel.mto.service.IWebPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.util.concurrent.CompletableFuture;

@Service
public class FocusBlogService {


    @Autowired
    private IWebPostService postService;

    @Autowired
    private WebPostMapper postMapper;

    // @Resource
    // private ThreadPoolExecutor executor;
    private ThreadPoolTaskExecutor executor = SpringUtils.getBean("threadPoolTaskExecutor");


    /**
     * @param modelMap
     * @param currentPage 当前页
     * @param currentSize 当前页条数
     */

    public void selectIndexInfo(ModelMap modelMap, Long currentPage, Long currentSize) {
        // 时间轴获取文章内容
        this.timeArchiving(modelMap, currentPage, currentSize);
        // 获取导航
        postService.selectCategory(modelMap);
        // 获取侧边栏
        postService.publicWeb(modelMap);
    }

    /**
     * 获取时间轴文章列表
     *
     * @param modelMap
     * @param currentPage
     * @param currentSize
     */
    private void timeArchiving(ModelMap modelMap, Long currentPage, Long currentSize) {
        // 获取博客
        CompletableFuture<Void> postFuture = CompletableFuture.runAsync(() -> {
            Page<WebMtoPost> page = new Page<>(currentPage, currentSize);
            TableDataInfo dataInfo = new TableDataInfo();
            Page<WebMtoPost> mtoPostPage = postMapper.timeArchiving(page);
            if (ToolUtils.isNotEmpty(mtoPostPage)) {
                dataInfo.setRows(mtoPostPage.getRecords());
                dataInfo.setTotal(mtoPostPage.getTotal());
                dataInfo.setCurrentPage(mtoPostPage.getCurrent());
                dataInfo.setCurrentSize(mtoPostPage.getSize());
                dataInfo.setTotalPage(mtoPostPage.getPages());
            }
            modelMap.put("dataInfo", dataInfo);
        }, executor);

        try {
            CompletableFuture.allOf(postFuture).get();
        } catch (Exception e) {
            throw new RuntimeException("异步编程发生错误: " + e.getMessage());
        }

    }


}
