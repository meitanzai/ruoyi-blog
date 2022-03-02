package com.ruoyi.project.emmanuel.mto.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.*;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.index.domin.BizRepeatLog;
import com.ruoyi.project.emmanuel.index.mapper.BizRepeatLogMapper;
import com.ruoyi.project.emmanuel.mto.domain.*;
import com.ruoyi.project.emmanuel.mto.mapper.*;
import com.ruoyi.project.emmanuel.mto.service.IWebPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
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
        Page<WebMtoPost> postPage = new Page<>(currentPage, currentSize);
        TableDataInfo dataInfo = new TableDataInfo();
        // 根据栏目id查询
        Page<WebMtoPost> mtoPostPage = postMapper.selectPage(postPage, webMtoPost.getCategoryId(), webMtoPost.getChannelId(), webMtoPost.getSlider());
        if (ToolUtils.isNotEmpty(mtoPostPage)) {
            dataInfo.setRows(mtoPostPage.getRecords());
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
        // 获取文章内容
        this.loadMainPage(modelMap, new WebMtoPost(), currentPage, currentSize);
        // 获取导航
        this.selectCategory(modelMap);
        // 获取侧边栏
        this.publicWeb(modelMap);
        // 获取轮播图
        this.sliderList(modelMap);
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
        // 获取博客(轮播图)
        WebMtoPost webMtoPost = new WebMtoPost();
        webMtoPost.setSlider(1);
        CompletableFuture<Void> sliderFuture = CompletableFuture.runAsync(() -> {
            TableDataInfo sliderList = this.selectIndexPostList(webMtoPost, 1L, 10L);
            modelMap.put("sliderDataInfo", sliderList);
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
            List<MtoCategory> mtoCategoryList = categoryMapper.selectCategories(null);
            // 过滤掉停用的(后台与前台用的同一个sql，所以不能在sql里where，会使后台导航管理列表不显示)
            List<MtoCategory> collect = mtoCategoryList.stream().filter(e -> Objects.equals(1, e.getStatus())).collect(Collectors.toList());
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

        // 获取分类
        // CompletableFuture<Void> channelFuture = CompletableFuture.runAsync(() -> {
        //     List<MtoChannel> mtoChannelList = this.selectIndexChannelList();
        //     modelMap.put("mtoChannelList", mtoChannelList);
        // }, executor);

        // 获取标签
        CompletableFuture<Void> channelFuture = CompletableFuture.runAsync(() -> {
            List<MtoTag> mtoTagList = this.selectIndexTagList();
            modelMap.put("mtoTagList", mtoTagList);
        }, executor);

        // 获取关于本站
        WebAbout webAbout = new WebAbout();
        webAbout.setAbAvatar("https://tse1-mm.cn.bing.net/th/id/OIP.Ups1Z8igjNjLuDfO38XhTgHaHa?pid=Api&rs=1");
        webAbout.setAbName("一粒麦子");
        webAbout.setAbText("90后少年，热爱写bug，热爱编程，热爱学习，分享一些个人经验，共同学习，少走弯路。Talk is cheap,show me the code!");
        modelMap.put("webAbout", webAbout);

        // 获取最新文章
        CompletableFuture<Void> newPostFuture = CompletableFuture.runAsync(() -> {
            List<WebMtoPost> newPostList = this.selectIndexNewPostList();
            modelMap.put("newPostList", newPostList);
        }, executor);

        // 获取最热文章
        CompletableFuture<Void> hotPostFuture = CompletableFuture.runAsync(() -> {
            List<WebMtoPost> hotPostList = this.selectIndexHotPostList();
            modelMap.put("hotPostList", hotPostList);
        }, executor);

        // 获取推荐文章
        CompletableFuture<Void> recommendPostFuture = CompletableFuture.runAsync(() -> {
            List<WebMtoPost> recommendPostList = this.selectIndexRecommendPostList();
            modelMap.put("recommendPostList", recommendPostList);
        }, executor);

        // 获取友情链接
        CompletableFuture<Void> linkFuture = CompletableFuture.runAsync(() -> {
            List<MtoLink> linkList = this.linkList();
            modelMap.put("linkList", linkList);
        }, executor);

        try {
            CompletableFuture.allOf(channelFuture, newPostFuture, recommendPostFuture, hotPostFuture, linkFuture).get();
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
     * 根据文章获取id
     *
     * @param modelMap
     * @param articleId postId,博客的id
     */
    // @Override
    public void articleById(ModelMap modelMap, Long articleId) {
        // 获取导航
        this.selectCategory(modelMap);
        // 文章详情
        WebMtoPost webMtoPost = this.selectMtoPostById(articleId);
        modelMap.put("mtoPost", webMtoPost);

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
     * @param id
     * @param currentPage
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
}
