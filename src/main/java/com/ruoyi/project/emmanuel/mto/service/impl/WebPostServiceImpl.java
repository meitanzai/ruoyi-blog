package com.ruoyi.project.emmanuel.mto.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.*;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.index.domin.BizRepeatLog;
import com.ruoyi.project.emmanuel.index.mapper.BizRepeatLogMapper;
import com.ruoyi.project.emmanuel.memorial.service.IBoardNoteService;
import com.ruoyi.project.emmanuel.mto.domain.*;
import com.ruoyi.project.emmanuel.mto.mapper.*;
import com.ruoyi.project.emmanuel.mto.service.IWebPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Service
public class WebPostServiceImpl extends ServiceImpl<WebPostMapper, WebMtoPost> implements IWebPostService {

    @Autowired
    private WebPostMapper postMapper;

    @Autowired
    private MtoCategoryMapper categoryMapper;

    @Autowired
    private MtoLinkMapper mtoLinkMapper;

    @Autowired
    private BizRepeatLogMapper bizRepeatLogMapper;

    @Autowired
    private MtoTagMapper tagMapper;

    @Autowired
    private MtoPostTagMapper postTagMapper;

    @Autowired
    private IBoardNoteService boardNoteService;

    @Autowired
    private TemplateEngine templateEngine;

    // @Resource
    // private ThreadPoolExecutor executor;
    private ThreadPoolTaskExecutor executor = SpringUtils.getBean("threadPoolTaskExecutor");

    /**
     * 获取首页文章
     *
     * @param currentPage
     * @param currentSize
     * @return
     */
    public TableDataInfo selectIndexPostList(WebMtoPost webMtoPost, Long currentPage, Long currentSize) {

        // 搜索关键字
        String keyword = webMtoPost.getTitle();

        // 分页
        Page<WebMtoPost> postPage = new Page<>(currentPage, currentSize);
        TableDataInfo dataInfo = new TableDataInfo();
        // 根据栏目id查询
        Page<WebMtoPost> mtoPostPage = postMapper.selectPage(postPage, webMtoPost);
        if (ToolUtils.isNotEmpty(mtoPostPage)) {
            dataInfo.setRows(mtoPostPage.getRecords());
            if (StringUtils.isNotEmpty(keyword)) {
                mtoPostPage.getRecords().forEach(e -> e.setTitle(this.getHitCode(e.getTitle(), keyword)));
            }
            dataInfo.setTotal(mtoPostPage.getTotal());
            dataInfo.setCurrentPage(mtoPostPage.getCurrent());
            dataInfo.setCurrentSize(mtoPostPage.getSize());
            dataInfo.setTotalPage(mtoPostPage.getPages());
        }
        return dataInfo;
    }

    /**
     * 获取首页栏目
     *
     * @return
     */
    @Override
    public List<MtoChannel> selectIndexChannelList() {
        return postMapper.selectIndexChannelList();
    }

    @Override
    public List<WebMtoPost> selectIndexNewPostList() {
        QueryWrapper<WebMtoPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().orderByDesc(WebMtoPost::getCreateTime).last("limit 10");
        List<WebMtoPost> webMtoPostList = postMapper.selectList(queryWrapper);
        return webMtoPostList;
    }

    /**
     * 友情链接
     *
     * @return
     */
    public List<MtoLink> linkList() {
        List<MtoLink> mtoLinks = mtoLinkMapper.selectList(null);
        return mtoLinks;
    }

    /**
     * 随机查看一条名言
     *
     * @return
     */
    @Override
    public MtoGolden selectIndexGolden() {
        return postMapper.selectIndexGolden();
    }

    /**
     * 博客查看
     *
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public WebMtoPost selectMtoPostById(Long id) {

        WebMtoPost mtoPost = postMapper.selectWebPostById(id);

        if (ToolUtils.isOneEmpty(mtoPost)) {
            throw new RuntimeException("当前文章不存在");
        }
        // 将markdown转换为Html
        String content = mtoPost.getContent();
        if (ToolUtils.isNotEmpty(content)) {
            mtoPost.setContent(MarkdownUtils.renderMarkdown(content));
        } else {
            mtoPost.setContent("<h1><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</b></h1><h1 style=\"text-align: left;\"><b>暂无文章内容</b><span style=\"font-weight: 700;\">&nbsp;&nbsp;</span><img src=\"/ajax/libs/summernote/tam-emoji/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url('/ajax/libs/summernote/tam-emoji/img/emoji_spritesheet_3.png') -75px -25px no-repeat;background-size:850px 75px;\" alt=\":rocket:\"></h1><h1><span style=\"font-weight: 700;\"> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></h1><h1><b><br></b></h1><h1><b><br></b></h1><h1><b><br></b></h1>");
        }
        postMapper.addOneViews(mtoPost.getId());
        return mtoPost;
    }

    /**
     * @param modelMap
     * @param currentPage 当前页
     * @param currentSize 当前页条数
     */
    @Override
    public void selectIndexInfo(ModelMap modelMap, Long currentPage, Long currentSize) {
        // 获取文章列表
        this.loadMainPage(modelMap, new WebMtoPost(), currentPage, currentSize);
        // 获取导航
        this.selectCategory(modelMap);
        // 获取侧边栏
        this.publicWeb(modelMap);
        // 获取轮播图
        if (Objects.equals(1L,currentPage)) {
            this.sliderList(modelMap);
        }
    }


    /**
     * @param modelMap
     * @param categoryId  导航id
     * @param currentPage 当前页
     * @param currentSize 当前大小
     */
    @Override
    public void categoryById(ModelMap modelMap, Long categoryId, Long currentPage, Long currentSize) {
        WebMtoPost webMtoPost = new WebMtoPost();
        webMtoPost.setCategoryId(categoryId);
        this.selectCategory(modelMap);
        this.loadMainPage(modelMap, webMtoPost, currentPage, currentSize);
        this.publicWeb(modelMap);

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
    @Override
    public void channelById(ModelMap modelMap, Long channelId, Long currentPage, Long currentSize) {
        WebMtoPost webMtoPost = new WebMtoPost();
        webMtoPost.setChannelId(channelId);
        this.loadMainPage(modelMap, webMtoPost, currentPage, currentSize);
        this.publicWeb(modelMap);
        this.selectCategory(modelMap);
    }

    /**
     * 获取轮播图
     *
     * @param modelMap
     */
    private void sliderList(ModelMap modelMap) {
        // 先查询缓存，如果存在，直接返回
        Object sliderObj = CacheUtils.get(Constants.WEB_SLIDER);
        if (StringUtils.isNotNull(sliderObj)) {
            modelMap.put("sliderDataInfo", StringUtils.cast(sliderObj));
            return;
        }

        // 获取博客(轮播图)
        WebMtoPost webMtoPost = new WebMtoPost();
        webMtoPost.setSlider(1);
        CompletableFuture<Void> sliderFuture = CompletableFuture.runAsync(() -> {
            TableDataInfo sliderList = this.selectIndexPostList(webMtoPost, 1L, 10L);
            modelMap.put("sliderDataInfo", sliderList);

            // 保存到缓存
            CacheUtils.put(Constants.WEB_SLIDER,sliderList);
        }, executor);

        try {
            CompletableFuture.allOf(sliderFuture).get();
        } catch (Exception e) {
            throw new RuntimeException("异步编程发生错误: " + e.getMessage());
        }
    }

    /**
     * 获取文章列表
     *
     * @param modelMap
     * @param webMtoPost
     * @param currentPage
     * @param currentSize
     */
    private void loadMainPage(ModelMap modelMap, WebMtoPost webMtoPost, Long currentPage, Long currentSize) {

        // 获取博客
        CompletableFuture<Void> postFuture = CompletableFuture.runAsync(() -> {
            TableDataInfo postList = this.selectIndexPostList(webMtoPost, currentPage, currentSize);
            modelMap.put("dataInfo", postList);
        }, executor);

        try {
            CompletableFuture.allOf(postFuture).get();
        } catch (Exception e) {
            throw new RuntimeException("异步编程发生错误: " + e.getMessage());
        }

    }

    /**
     * 获取导航懒
     *
     * @param modelMap
     */
    @Override
    public void selectCategory(ModelMap modelMap) {
        // 获取导航
        CompletableFuture<Void> categoryFuture = CompletableFuture.runAsync(() -> {

            // 先查询缓存，如果存在，直接返回
            Object categoryObj = CacheUtils.get(Constants.WEB_CATEGORY);
            if (StringUtils.isNotNull(categoryObj)) {
                modelMap.put("mtoCategoryList", StringUtils.cast(categoryObj));
                return;
            }
            // 否则查询数据库
            List<MtoCategory> mtoCategoryList = categoryMapper.selectCategories(null);
            // 过滤掉停用的(后台与前台用的同一个sql，所以不能在sql里where，会使后台导航管理列表不显示)
            List<MtoCategory> collect = mtoCategoryList.stream().filter(e -> Objects.equals(1, e.getStatus())).collect(Collectors.toList());

            // 保存到缓存
            CacheUtils.put(Constants.WEB_CATEGORY, JSONObject.toJSON(collect));

            modelMap.put("mtoCategoryList", collect);
        }, executor);

        try {
            CompletableFuture.allOf(categoryFuture).get();
        } catch (Exception e) {
            throw new RuntimeException("异步编程发生错误: " + e.getMessage());
        }

    }

    /**
     * 获取侧边栏
     *
     * @param modelMap
     */
    @Override
    public void publicWeb(ModelMap modelMap) {

        // 获取关于本站
        WebAbout webAbout = new WebAbout();
        webAbout.setAbAvatar("https://tse1-mm.cn.bing.net/th/id/OIP.Ups1Z8igjNjLuDfO38XhTgHaHa?pid=Api&rs=1");
        webAbout.setAbName("一粒麦子");
        webAbout.setAbText("90后少年，热爱写bug，热爱编程，热爱学习，分享一些个人经验，共同学习，少走弯路。Talk is cheap,show me the code!");
        modelMap.put("webAbout", webAbout);

        // 获取分类
        CompletableFuture<Void> channelFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object channelObj = CacheUtils.get(Constants.WEB_CHANNEL);
            if (StringUtils.isNotNull(channelObj)) {
                modelMap.put("channelList", StringUtils.cast(channelObj));
                return;
            }
            // 否则查询数据库
            List<MtoChannel> channelList = this.selectIndexChannelList();
            modelMap.put("channelList", channelList);
            // 保存到缓存
            CacheUtils.put(Constants.WEB_CHANNEL, JSONObject.toJSON(channelList));
        }, executor);


        // 获取标签
        CompletableFuture<Void> tagFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object tagObj = CacheUtils.get(Constants.WEB_TAG);
            if (StringUtils.isNotNull(tagObj)) {
                modelMap.put("mtoTagList", StringUtils.cast(tagObj));
                return;
            }
            // 否则查询数据库
            List<MtoTag> mtoTagList = this.selectIndexTagList();
            modelMap.put("mtoTagList", mtoTagList);
            // 保存到缓存
            CacheUtils.put(Constants.WEB_TAG, JSONObject.toJSON(mtoTagList));
        }, executor);

        // 获取最新文章
        CompletableFuture<Void> newPostFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object newBlogObj = CacheUtils.get(Constants.WEB_NEW_BLOG);
            if (StringUtils.isNotNull(newBlogObj)) {
                modelMap.put("newPostList", StringUtils.cast(newBlogObj));
                return;
            }
            // 否则查询数据库
            List<WebMtoPost> newPostList = this.selectIndexNewPostList();
            modelMap.put("newPostList", newPostList);
            // 保存到缓存
            CacheUtils.put(Constants.WEB_NEW_BLOG, JSONObject.toJSON(newPostList));

        }, executor);

        // 获取最热文章
        CompletableFuture<Void> hotPostFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object hotBlogObj = CacheUtils.get(Constants.WEB_HOT_BLOG);
            if (StringUtils.isNotNull(hotBlogObj)) {
                modelMap.put("hotPostList", StringUtils.cast(hotBlogObj));
                return;
            }
            // 否则查询数据库
            List<WebMtoPost> hotPostList = this.selectIndexHotPostList();
            modelMap.put("hotPostList", hotPostList);
            // 保存到缓存
            CacheUtils.put(Constants.WEB_HOT_BLOG, JSONObject.toJSON(hotPostList));
        }, executor);

        // 获取推荐文章
        CompletableFuture<Void> recommendPostFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object recommendBlogObj = CacheUtils.get(Constants.WEB_RECOMMEND_BLOG);
            if (StringUtils.isNotNull(recommendBlogObj)) {
                modelMap.put("recommendPostList", StringUtils.cast(recommendBlogObj));
                return;
            }
            // 否则查询数据库
            List<WebMtoPost> recommendPostList = this.selectIndexRecommendPostList();
            modelMap.put("recommendPostList", recommendPostList);
            // 保存到缓存
            CacheUtils.put(Constants.WEB_RECOMMEND_BLOG, JSONObject.toJSON(recommendPostList));
        }, executor);

        // 获取友情链接
        CompletableFuture<Void> linkFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object linkObj = CacheUtils.get(Constants.WEB_LINK);
            if (StringUtils.isNotNull(linkObj)) {
                modelMap.put("linkList", StringUtils.cast(linkObj));
                return;
            }
            List<MtoLink> linkList = this.linkList();
            modelMap.put("linkList", linkList);
            // 保存到缓存
            CacheUtils.put(Constants.WEB_LINK, JSONObject.toJSON(linkList));
        }, executor);

        try {
            CompletableFuture.allOf(channelFuture,tagFuture, newPostFuture, recommendPostFuture, hotPostFuture, linkFuture).get();
        } catch (Exception e) {
            throw new RuntimeException("异步编程发生错误: " + e.getMessage());
        }

    }

    /**
     * 获取标签
     *
     * @return
     */
    private List<MtoTag> selectIndexTagList() {
        QueryWrapper<MtoTag> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(MtoTag::getStatus, "0");
        return tagMapper.selectList(queryWrapper);
    }

    /**
     * 获取推荐文章
     *
     * @return
     */
    private List<WebMtoPost> selectIndexRecommendPostList() {
        QueryWrapper<WebMtoPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(WebMtoPost::getFeatured, "1").last("limit 10");
        List<WebMtoPost> recommendPostList = postMapper.selectList(queryWrapper);
        return recommendPostList;
    }


    /**
     * 获取最热(点击最多文章)
     *
     * @return
     */
    private List<WebMtoPost> selectIndexHotPostList() {
        QueryWrapper<WebMtoPost> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().orderByDesc(WebMtoPost::getViews).last("limit 10");
        List<WebMtoPost> hotMtoPostList = postMapper.selectList(queryWrapper);
        return hotMtoPostList;
    }

    /**
     * 生成文章静态页面
     *
     * @param request
     * @param response
     * @param modelMap  页面内容
     * @param articleId 文章ID
     */
    private void createArticleHtml(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, Long articleId) {
        Map<String, Object> paramMap = new LinkedHashMap<>();
        // 生成静态页面的导航
        paramMap.put("mtoCategoryList", modelMap.get("mtoCategoryList"));
        // 生成静态页面的文章
        paramMap.put("mtoPost", modelMap.get("mtoPost"));
        // 创建静态页面
        createHtml(request, response, true, paramMap, "emmanuel/web/article", String.valueOf(articleId));
    }

    /**
     * 根据文章获取id
     *
     * @param modelMap
     * @param articleId postId,博客的id
     */
    @Override
    public String articleById(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, Long articleId) {
        // 如果开启静态模板
        if (RuoYiConfig.isPageStaticEnabled()) {
            // 判断文件是否存在
            File directory = new File(RuoYiConfig.getHtmlPath() + File.separator + articleId + ".html");
            if (directory.exists()) {
                // 静态页面存在的路径
                String currentHtmlDir = RuoYiConfig.getHtmlPath().substring(RuoYiConfig.getHtmlPath().lastIndexOf("/") + 1);
                // 当前静态页面访问地址
                String currentDir = Constants.RESOURCE_PREFIX + "/" + currentHtmlDir + "/" + articleId + ".html";
                return "forward:" + currentDir;
            }
        }
        // 获取导航
        this.selectCategory(modelMap);
        // 文章详情
        WebMtoPost webMtoPost = this.selectMtoPostById(articleId);
        modelMap.put("mtoPost", webMtoPost);

        // 是否开启文章页面静态化(true开启)
        if (RuoYiConfig.isPageStaticEnabled()) {
            createArticleHtml(request, response, modelMap, articleId);
        }
        return null;
    }

    /**
     * 点赞
     *
     * @param request
     * @param postId     文章id
     * @param favorsType 类型  1为文章点赞
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult loveFavors(HttpServletRequest request, String ip, Long postId, Integer favorsType) {

        // 根据ip校验是否已经点赞
        String ipAddr = StringUtils.isEmpty(ip) ? IpUtils.getIpAddr(request) : ip;
        BizRepeatLog bizRepeatLog = new BizRepeatLog();
        bizRepeatLog.setBizId(postId);
        // 1.文章，2.评论,3.登录后获取天气
        bizRepeatLog.setBizType(favorsType);
        bizRepeatLog.setUserIp(ipAddr);
        bizRepeatLog.setUrl(request.getRequestURI());
        bizRepeatLog.setCreateTime(DateUtils.getNowDate());

        Integer exit = bizRepeatLogMapper.checkLoveFavors(bizRepeatLog);
        if (ToolUtils.isNotEmpty(exit)) {
            return AjaxResult.error("本月已点赞", 0);
        }
        // 点赞+1
        int i = postMapper.updateFavors(postId, favorsType);

        // 记录点赞日志
        bizRepeatLog.setUserAgent(request.getHeader("User-Agent"));
        bizRepeatLog.setStatus(0);
        bizRepeatLogMapper.insert(bizRepeatLog);
        return AjaxResult.success("点赞成功", i);
    }

    /**
     * 留言
     *
     * @param modelMap
     */
    @Override
    public void leaveMessage(ModelMap modelMap) {
        this.publicWeb(modelMap);
    }

    /**
     * 时间-归档
     *
     * @param modelMap
     * @param currentPage
     * @param currentSize
     */
    @Override
    public Page<MtoPost> timeArchives(ModelMap modelMap, Long currentPage, Long currentSize) {
        // 获取导航
        this.selectCategory(modelMap);
        // 获取侧边栏
        this.publicWeb(modelMap);
        // 获取文章
        Page<MtoPost> postListPage = postMapper.timeArchives(new Page<>(currentPage, currentSize));

        return postListPage;
    }

    /**
     * 根据分类查询
     *
     * @param tagId       标签名称
     * @param modelMap
     * @param currentPage 当前页
     * @param currentSize 当页大小
     * @return
     */
    @Override
    public void selectBlogByTagId(ModelMap modelMap, Long tagId, Long currentPage, Long currentSize) {
        Page<WebMtoPost> postPage = new Page<>(currentPage, currentSize);
        Page<WebMtoPost> postListPage = postTagMapper.selectBlogByTagId(tagId, postPage);
        TableDataInfo dataInfo = new TableDataInfo();
        if (ToolUtils.isNotEmpty(postListPage)) {
            dataInfo.setRows(postListPage.getRecords());
            dataInfo.setTotal(postListPage.getTotal());
            dataInfo.setCurrentPage(postListPage.getCurrent());
            dataInfo.setCurrentSize(postListPage.getSize());
            dataInfo.setTotalPage(postListPage.getPages());
        }
        modelMap.put("dataInfo", dataInfo);
        this.publicWeb(modelMap);
        this.selectCategory(modelMap);
    }

    /**
     * 标签页获取标签
     *
     * @param modelMap
     */
    @Override
    public void selectTagList(ModelMap modelMap) {
        // 获取导航
        this.selectCategory(modelMap);
        // 获取侧边栏
        this.publicWeb(modelMap);

        // 获取所有标签
        CompletableFuture<Void> categoryFuture = CompletableFuture.runAsync(() -> {
            // 先查询缓存，如果存在，直接返回
            Object tagObj = CacheUtils.get(Constants.WEB_TAG);
            if (StringUtils.isNotNull(tagObj)) {
                modelMap.put("tagList", StringUtils.cast(tagObj));
                return;
            }
            // 否则查询数据库
            List<MtoTag> tagList = tagMapper.selectList(null);
            modelMap.put("tagList", tagList);
        }, executor);
        try {
            CompletableFuture.allOf(categoryFuture).get();
        } catch (Exception e) {
            throw new RuntimeException("异步编程发生错误: " + e.getMessage());
        }

    }

    /**
     * 获取动态
     *
     * @param pageNum  当前页
     * @param pageSize 页大小
     * @param modelMap
     */
    @Override
    public void dynamicList(Long pageNum, Long pageSize, ModelMap modelMap) {
        // 获取导航
        this.selectCategory(modelMap);
        // 获取侧边栏
        this.publicWeb(modelMap);
        // 获取动态列表
        TableDataInfo tableDataInfo = boardNoteService.dynamicList(pageNum, pageSize, modelMap);
        modelMap.put("pageInfo", tableDataInfo);
    }

    /**
     * 根据关键字搜索
     *
     * @param keyword  关键字
     * @param pageNum  页码
     * @param pageSize 多少条数据
     */
    @Override
    public void searchByKeyword(ModelMap modelMap,String keyword, Long pageNum, Long pageSize) {
        // 获取导航
        this.selectCategory(modelMap);
        // 获取侧边栏
        this.publicWeb(modelMap);
        // 获取博客
        WebMtoPost webMtoPost = new WebMtoPost();
        webMtoPost.setTitle(keyword);
        this.loadMainPage(modelMap,webMtoPost, pageNum, pageSize);
        // 关键字
        modelMap.put("keyword",keyword);

    }

    /**
     * 添加高亮
     *
     * @param title   标题
     * @param keyword 搜索关键字
     * @return
     */
    private String getHitCode(String title, String keyword) {
        if (StringUtils.isEmpty(keyword) || StringUtils.isEmpty(title)) {
            return title;
        }
        String startStr = "<span style = 'color:red'>";
        String endStr = "</span>";
        // 判断关键字是否直接是搜索的内容，否者直接返回
        if (title.equals(keyword)) {
            return startStr + title + endStr;
        }
        String lowerCaseStr = title.toLowerCase();
        String lowerKeyword = keyword.toLowerCase();
        String[] lowerCaseArray = lowerCaseStr.split(lowerKeyword);
        Boolean isEndWith = lowerCaseStr.endsWith(lowerKeyword);

        // 计算分割后的字符串位置
        Integer count = 0;
        List<Map<String, Integer>> list = new ArrayList<>();
        List<Map<String, Integer>> keyList = new ArrayList<>();
        for (int a = 0; a < lowerCaseArray.length; a++) {
            // 将切割出来的存储map
            Map<String, Integer> map = new HashMap<>();
            Map<String, Integer> keyMap = new HashMap<>();
            map.put("startIndex", count);
            Integer len = lowerCaseArray[a].length();
            count += len;
            map.put("endIndex", count);
            list.add(map);
            if (a < lowerCaseArray.length - 1 || isEndWith) {
                // 将keyword存储map
                keyMap.put("startIndex", count);
                count += keyword.length();
                keyMap.put("endIndex", count);
                keyList.add(keyMap);
            }
        }
        // 截取切割对象
        List<String> arrayList = new ArrayList<>();
        for (Map<String, Integer> item : list) {
            Integer start = item.get("startIndex");
            Integer end = item.get("endIndex");
            String itemStr = title.substring(start, end);
            arrayList.add(itemStr);
        }
        // 截取关键字
        List<String> keyArrayList = new ArrayList<>();
        for (Map<String, Integer> item : keyList) {
            Integer start = item.get("startIndex");
            Integer end = item.get("endIndex");
            String itemStr = title.substring(start, end);
            keyArrayList.add(itemStr);
        }

        StringBuffer sb = new StringBuffer();
        for (int a = 0; a < arrayList.size(); a++) {
            sb.append(arrayList.get(a));
            if (a < arrayList.size() - 1 || isEndWith) {
                sb.append(startStr);
                sb.append(keyArrayList.get(a));
                sb.append(endStr);
            }
        }
        return sb.toString();
    }

    /**
     * 生成静态页面
     *
     * @param request
     * @param response
     * @param force       文件存在是否进行覆盖(true覆盖，false不进行覆盖)
     * @param paramMap    页面数据
     * @param templateUrl 要生成的HTML在项目中的路径
     * @param fileName    文件名
     */
    public void createHtml(HttpServletRequest request, HttpServletResponse response, Boolean force, Map<String, Object> paramMap, String templateUrl, String fileName) {

        PrintWriter printWriter = null;
        try {
            // 创建thymeleaf上下文对象
            WebContext context = new WebContext(request, response, request.getServletContext());
            // 把数据放入上下文对象
            context.setVariables(paramMap);
            // 文件生成路径
            String fileUrl = StringUtils.appendIfMissing(RuoYiConfig.getHtmlPath(), File.separator) + fileName + ".html";
            // 创建文件夹
            File directory = new File(StringUtils.substringBeforeLast(fileUrl, File.separator));
            if (!directory.exists()) {
                directory.mkdirs();
            }
            // 创建输出流
            File file = new File(fileUrl);
            // force为false不强制覆盖现有文件
            if (Boolean.FALSE.equals(force) && file.exists()) {
                return;
            }
            printWriter = new PrintWriter(file);
            // 执行页面静态化方法 (项目中生成模板的页面，上下文，流)
            templateEngine.process(templateUrl, context, printWriter);
        } catch (Exception e) {
            e.getMessage();
        } finally {
            if (printWriter != null) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }

}
