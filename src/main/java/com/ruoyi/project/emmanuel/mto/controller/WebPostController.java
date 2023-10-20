package com.ruoyi.project.emmanuel.mto.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.mto.domain.MtoPost;
import com.ruoyi.project.emmanuel.mto.domain.WebMtoPost;
import com.ruoyi.project.emmanuel.mto.service.IWebPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/blog")
public class WebPostController extends BaseController {

    private String prefix = "emmanuel/web";

    private String blogInfoPrefix = "emmanuel/mto/post";

    @Autowired
    private IWebPostService postService;

    /*登录地址*/
    @Value("${shiro.user.loginUrl}")
    private String loginUrl;

    /*首页*/
    @Value("${shiro.user.indexUrl}")
    private String indexUrl;

    /**
     * 根据id获取博客详情
     *
     * @param id       博客id
     * @param modelMap
     * @return
     */
    @GetMapping("info/{id}")
    public String selectById(@PathVariable("id") Long id, ModelMap modelMap) {
        WebMtoPost mtoPost = postService.selectMtoPostById(id);
        modelMap.put("blog", mtoPost);
        return blogInfoPrefix + "/detail";
    }

    /**
     * 获取博客首页
     *
     * @param modelMap
     * @param request
     * @param response
     * @param currentPage 当前页
     * @param currentSize 页大小
     * @return
     */
    @GetMapping({"/list", "/", "index", ""})
    public String selectIndexInfo(ModelMap modelMap, @RequestParam(value = "currentPage", defaultValue = "1") Long currentPage, @RequestParam(value = "currentSize", defaultValue = "10") Long currentSize, HttpServletRequest request, HttpServletResponse response) {
        currentSize = currentSize > 50 ? 50 : currentSize;
        String url = postService.selectIndexInfo(modelMap, request, response, currentPage, currentSize);
        return ToolUtils.isEmpty(url) ? prefix + "/index" : url;
    }

    /**
     * 根据导航栏id查询
     *
     * @param modelMap
     * @param categoryId  导航id
     * @param currentPage 当前页
     * @param currentSize 页大小
     * @return
     */
    @GetMapping("category/{categoryId}")
    public String categoryById(ModelMap modelMap,
                               @PathVariable("categoryId") Long categoryId,
                               @RequestParam(value = "currentPage", defaultValue = "1") Long currentPage,
                               @RequestParam(value = "currentSize", defaultValue = "10") Long currentSize) {
        currentSize = currentSize > 50 ? 50 : currentSize;
        postService.categoryById(modelMap, categoryId, currentPage, currentSize);
        return prefix + "/index";
    }

    /**
     * 根据分类查询
     *
     * @param modelMap
     * @param channelId   分类id
     * @param currentPage 当前页
     * @param currentSize 页大小
     * @return
     */
    @GetMapping("channel/{channelId}")
    public String channelById(ModelMap modelMap,
                              @PathVariable("channelId") Long channelId,
                              @RequestParam(value = "currentPage", defaultValue = "1") Long currentPage,
                              @RequestParam(value = "currentSize", defaultValue = "10") Long currentSize) {
        currentSize = currentSize > 50 ? 50 : currentSize;
        postService.channelById(modelMap, channelId, currentPage, currentSize);
        return prefix + "/index";
    }

    /**
     * 根据分类查询
     *
     * @param modelMap
     * @param tagId       标签id
     * @param currentPage 当前页
     * @param currentSize 页大小
     * @return
     */
    @GetMapping("tag/{tagId}")
    public String selectBlogByTagId(ModelMap modelMap,
                                    @PathVariable("tagId") Long tagId,
                                    @RequestParam(value = "currentPage", defaultValue = "1") Long currentPage,
                                    @RequestParam(value = "currentSize", defaultValue = "10") Long currentSize) {
        currentSize = currentSize > 50 ? 50 : currentSize;
        postService.selectBlogByTagId(modelMap, tagId, currentPage, currentSize);
        return prefix + "/index";
    }

    /**
     * 文章详情
     *
     * @param modelMap
     * @param articleId 文章id
     * @return
     */
    @RequestMapping(value = "/article/{articleId}", method = {RequestMethod.GET, RequestMethod.POST})
    public String articleById(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, @PathVariable("articleId") Long articleId, @RequestParam(value = "articlePwd", required = false) String articlePwd) {
        String url = postService.articleById(request, response, modelMap, articleId, articlePwd);
        return ToolUtils.isEmpty(url) ? prefix + "/article" : url;
    }

    /**
     * 点赞
     *
     * @param request
     * @param postId     文章id
     * @param favorsType 类型  ，1为点赞
     * @return
     */
    @PostMapping("love")
    @ResponseBody
    @RepeatSubmit(interval = 60000, message = "本月已点赞",repeatDate = true)
    public AjaxResult loveFavors(HttpServletRequest request,
                                 Long postId,
                                 Integer favorsType) {
        return (postService.loveFavors(request, null, postId, favorsType));
    }

    /**
     * 时间-归档
     */
    @GetMapping("timeArchives")
    public String timeArchives(ModelMap modelMap,
                               @RequestParam(value = "pageNum", defaultValue = "1") Long pageNum,
                               @RequestParam(value = "pageSize", defaultValue = "10") Long pageSize) {

        Page<MtoPost> mtoPostPage = postService.timeArchives(modelMap, pageNum, pageSize);
        modelMap.put("dataInfo", getDataObjectTable(mtoPostPage));
        return prefix + "/timeArchives";
    }

    /**
     * 返回的结果是个map   (key为年份，value为这一年的post)
     *
     * @param mtoPostPage
     * @return
     */
    private TableDataInfo getDataObjectTable(Page<MtoPost> mtoPostPage) {
        TableDataInfo rspData = new TableDataInfo();
        if (ToolUtils.isNotEmpty(rspData)) {
            rspData.setCode(0);
            Map<String, List<MtoPost>> collect = mtoPostPage.getRecords()
                    .stream().collect(
                            Collectors.groupingBy(
                                    post -> String.format("%tY", post.getCreateTime())
                            ));
            rspData.setData(collect);
            rspData.setTotal(mtoPostPage.getTotal());
            rspData.setTotalPage(mtoPostPage.getPages());
            rspData.setCurrentPage(mtoPostPage.getCurrent());
        }
        return rspData;
    }

    /**
     * 标签页获取标签
     *
     * @param modelMap
     * @return
     */
    @GetMapping({"/tags"})
    public String selectTagList(ModelMap modelMap) {
        postService.selectTagList(modelMap);
        return prefix + "/tags";
    }

    /**
     * 获取动态
     *
     * @param pageNum  当前页
     * @param pageSize 页大小
     * @param modelMap
     * @return
     */
    @GetMapping(value = {"/dynamics"})
    public String dynamics(@RequestParam(value = "pageNum", defaultValue = "1") Long pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") Long pageSize,
                           ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
        String url = postService.dynamicList(pageNum, pageSize, modelMap, request, response);
        return ToolUtils.isEmpty(url) ? prefix + "/dynamic" : url;
    }

    /**
     * 新闻
     */
    @GetMapping("/news")
    public String news(ModelMap modelMap) {
        // 获取导航
        postService.selectCategory(modelMap);
        // 获取侧边栏
        postService.publicWeb(modelMap);
        return prefix + "/news";
    }

    @GetMapping("/search")
    public String search(ModelMap modelMap,
                         @RequestParam(value = "keyword", required = true) String keyword,
                         @RequestParam(value = "currentPage", defaultValue = "1") Long pageNum,
                         @RequestParam(value = "currentSize", defaultValue = "10") Long pageSize) {
        pageSize = pageSize > 50 ? 50 : pageSize;
        postService.searchByKeyword(modelMap, keyword, pageNum, pageSize);
        return prefix + "/search";
    }

    /**
     * 博客主页
     *
     * @param modelMap
     * @return
     */
    @GetMapping("/homepage")
    public String homepage(ModelMap modelMap) {
        return prefix + "/homepage";
    }

    /**
     * 登录页面
     */
    @GetMapping("/blogToAdmin")
    public String blogq(ModelMap modelMap) {
        Boolean b = ShiroUtils.isLogin();
        return b ? "redirect:" + indexUrl : "redirect:" + loginUrl;
    }
}

