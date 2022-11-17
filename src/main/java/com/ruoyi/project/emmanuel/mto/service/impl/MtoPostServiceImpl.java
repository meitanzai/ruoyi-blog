package com.ruoyi.project.emmanuel.mto.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.*;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.project.emmanuel.mto.domain.*;
import com.ruoyi.project.emmanuel.mto.mapper.*;
import com.ruoyi.project.emmanuel.mto.service.IMtoCategoryService;
import com.ruoyi.project.emmanuel.mto.service.IMtoChannelService;
import com.ruoyi.project.emmanuel.mto.service.IMtoPostService;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 文章表题Service业务层处理
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Service
public class MtoPostServiceImpl implements IMtoPostService {

    @Autowired
    private MtoPostMapper mtoPostMapper;

    @Autowired
    private MtoPostAttributeMapper mtoPostAttributeMapper;

    @Autowired
    private IMtoChannelService mtoChannelService;

    @Autowired
    private IMtoCategoryService mtoCategoryService;

    @Autowired
    private MtoPostTagMapper mtoPostTagMapper;

    @Autowired
    private MtoTagMapper tagMapper;

    @Autowired
    private MtoLookIpFirstMapper lookIpFirstMapper;


    /**
     * 查询文章表题
     *
     * @param id 文章表题主键
     * @return 文章表题
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public MtoPost selectMtoPostById(Long id) {

        MtoPost mtoPost = mtoPostMapper.selectMtoPostById(id);

        if (ToolUtils.isOneEmpty(mtoPost)) {
            throw new RuntimeException("当前文章不存在");
        }
        // 获取用户
        Long authorId = mtoPost.getAuthorId();
        if (ToolUtils.isEmpty(authorId)) {
            return mtoPost;
        }
        User user = mtoPostMapper.selectUserNameByAuthorId(authorId);
        if (ToolUtils.isNotEmpty(user)) {
            mtoPost.setUsername(user.getUserName());
            mtoPost.setAvatar(user.getAvatar());
        }
        // 将markdown转换为Html
        // mtoPost.setContent(MarkdownUtils.renderMarkdown(mtoPost.getContent()));
        mtoPostMapper.addOneViews(mtoPost.getId());
        return mtoPost;
    }

    /**
     * 查询文章表题列表
     *
     * @param mtoPost 文章表题
     * @return 文章表题
     */
    @Override
    public List<MtoPost> selectMtoPostList(MtoPost mtoPost) {

        // 如果是超级管理员查看所有文章
        if (!ShiroUtils.isAdmin()) {
            // 用户只能查看自己的文章
            mtoPost.setAuthorId(ShiroUtils.getUserId());
        }
        List<MtoPost> mtoPostList = mtoPostMapper.selectMtoPostList(mtoPost);
        return mtoPostList;
    }

    /**
     * 新增博客
     *
     * @param mtoPost 博客
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertMtoPost(MtoPost mtoPost) {
        // 新增 mto_post
        mtoPost.setAuthorId(ShiroUtils.getUserId());
        mtoPost.setCreateTime(DateUtils.getNowDate());
        String tagIdList = mtoPost.getTags();
        if (ToolUtils.isNotEmpty(tagIdList)) {
            QueryWrapper<MtoTag> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().select(MtoTag::getName).in(MtoTag::getId, Arrays.asList(tagIdList.split(",")));
            List<MtoTag> mtoTags = tagMapper.selectList(queryWrapper);
            List<String> tagNameList = mtoTags.stream().map(e -> e.getName()).collect(Collectors.toList());
            mtoPost.setTags(StringUtils.strip(tagNameList.toString(), "[]"));
        }
        int i = mtoPostMapper.insertMtoPost(mtoPost);
        Long postId = mtoPost.getId();
        // 新增 mto_post_attribute
        MtoPostAttribute mtoPostAttribute = new MtoPostAttribute();
        mtoPostAttribute.setId(postId);
        mtoPostAttribute.setContent(mtoPost.getContent());
        mtoPostAttribute.setEditor("markdown");
        mtoPostAttributeMapper.insertMtoPostAttribute(mtoPostAttribute);
        // 新增 mto_post_tag
        this.insertBatchPostTag(tagIdList, postId);
        // 删除缓存
        CacheUtils.remove(Constants.WEB_NEW_BLOG);
        CacheUtils.remove(Constants.WEB_RECOMMEND_BLOG);
        // 删除静态模板
        this.deleteHtml();
        return i;
    }

    /**
     * 新增mto_post_tag
     *
     * @param tags   多个字符串标签名
     * @param postId 博客id
     */
    private void insertBatchPostTag(String tags, Long postId) {
        if (ToolUtils.isNotEmpty(tags)) {
            List<String> tagIdList = Arrays.asList(tags.split(","));
            mtoPostTagMapper.insertBatch(tagIdList, postId);
        }
    }

    /**
     * 修改博客
     *
     * @param mtoPost 文章表题
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateMtoPost(MtoPost mtoPost) {
        // 博客id
        Long postId = mtoPost.getId();
        mtoPost.setUpdateTime(DateUtils.getNowDate());
        String tagIdList = mtoPost.getTags();
        if (ToolUtils.isNotEmpty(tagIdList)) {
            QueryWrapper<MtoTag> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().select(MtoTag::getName).in(MtoTag::getId, Arrays.asList(tagIdList.split(",")));
            List<MtoTag> mtoTags = tagMapper.selectList(queryWrapper);
            List<String> tagNameList = mtoTags.stream().map(e -> e.getName()).collect(Collectors.toList());
            mtoPost.setTags(StringUtils.strip(tagNameList.toString(), "[]"));
        }
        int i = mtoPostMapper.updateMtoPost(mtoPost);
        MtoPostAttribute mtoPostAttribute = new MtoPostAttribute();
        mtoPostAttribute.setId(postId);
        mtoPostAttribute.setContent(mtoPost.getContent());
        // 更新
        int k = mtoPostAttributeMapper.updateMtoPostAttribute(mtoPostAttribute);
        // 如果更新失败(可能不存在)，则添加
        if (k < 1) {
            mtoPostAttributeMapper.insertMtoPostAttribute(mtoPostAttribute);
        }

        // 更新 mto_post_tag (先删除后添加)
        QueryWrapper<MtoPostTag> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(MtoPostTag::getPostId, postId);
        mtoPostTagMapper.delete(wrapper);
        this.insertBatchPostTag(tagIdList, postId);
        // 如果开启静态模板删除文件
        if (RuoYiConfig.isPageStaticEnabled()) {
            File directory = new File(RuoYiConfig.getHtmlPath() + File.separator + postId + ".html");
            directory.delete();
            this.deleteHtml();
        }
        // 删除缓存
        CacheUtils.remove(Constants.WEB_HOT_BLOG);
        CacheUtils.remove(Constants.WEB_RECOMMEND_BLOG);
        return i;
    }

    /**
     * 批量删除文章
     *
     * @param ids 需要删除的文章表题主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteMtoPostByIds(String ids) {
        String[] idsArr = Convert.toStrArray(ids);
        // 删除博客文章 mto_post_attribute
        mtoPostAttributeMapper.deleteMtoPostAttributeByIds(idsArr);
        // 删除博客标签 mto_post_tag
        QueryWrapper<MtoPostTag> wrapper = new QueryWrapper<>();
        wrapper.lambda().in(MtoPostTag::getPostId, idsArr);
        mtoPostTagMapper.delete(wrapper);
        // 删除博客标题等信息 mto_post
        int i = mtoPostMapper.deleteMtoPostByIds(idsArr);
        // 查询缓存
        CacheUtils.remove(Constants.WEB_NEW_BLOG);
        CacheUtils.remove(Constants.WEB_RECOMMEND_BLOG);
        CacheUtils.remove(Constants.WEB_HOT_BLOG);
        // 删除静态模板
        this.deleteHtml();
        return i;
    }

    /**
     * 删除文章
     *
     * @param id 文章表题主键
     * @return 结果
     */
    @Override
    public int deleteMtoPostById(Long id) {
        mtoPostAttributeMapper.deleteMtoPostAttributeById(id);
        int i = mtoPostMapper.deleteMtoPostById(id);
        // 删除缓存
        CacheUtils.remove(Constants.WEB_HOT_BLOG);
        CacheUtils.remove(Constants.WEB_RECOMMEND_BLOG);
        // 删除静态模板
        this.deleteHtml();
        return i;
    }

    @Override
    public List<MtoTag> selectMtoTagList() {
        return mtoPostMapper.selectMtoTagList();
    }

    @Override
    public MtoPost selectPostById(Long id) {
        MtoPost mtoPost = mtoPostMapper.selectMtoPostById(id);

        if (ToolUtils.isOneEmpty(mtoPost)) {
            throw new RuntimeException("当前文章不存在");
        }
        return mtoPost;
    }

    /**
     * 获取最新博客
     *
     * @return
     */
    @Override
    public List<MtoPost> selectIndexNewPostList() {
        return mtoPostMapper.selectIndexNewPostList();
    }

    @Override
    public void getAddInfo(ModelMap modelMap) {
        // 获取分类
        MtoChannel mtoChannel = new MtoChannel();
        List<MtoChannel> channelList = mtoChannelService.selectMtoChannelList(mtoChannel);
        modelMap.put("channelList", channelList);

        // 获取标签
        List<MtoTag> tagList = this.selectMtoTagList();
        modelMap.put("tagList", tagList);

        // 获取导航栏
        MtoCategory category = new MtoCategory();
        category.setStatus(1);
        List<MtoCategory> categoryList = mtoCategoryService.selectCategories(category);
        modelMap.put("categoryList", categoryList);
    }

    @Override
    public void getEditInfo(Long id, ModelMap modelMap) {
        // 文章
        MtoPost mtoPost = this.selectPostById(id);
        modelMap.put("mtoPost", mtoPost);

        // 获取分类
        MtoChannel mtoChannel = new MtoChannel();
        List<MtoChannel> channelList = mtoChannelService.selectMtoChannelList(mtoChannel);
        modelMap.put("channelList", channelList);

        // 获取标签
        List<MtoTag> tagList = this.selectMtoTagList();
        modelMap.put("tagList", tagList);

        // 获取导航栏
        MtoCategory category = new MtoCategory();
        category.setStatus(1);
        List<MtoCategory> categoryList = mtoCategoryService.selectCategories(category);
        modelMap.put("categoryList", categoryList);
    }

    /**
     * 导入markdown
     *
     * @param markDownList  markdown文件
     * @param updateSupport 是否更新  (true更新/false不更新)
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public String importData(List<MultipartFile> markDownList, boolean updateSupport) {

        int i = 0;
        // 组织要保存的markdown文件
        for (MultipartFile file : markDownList) {
            String fileOriginalName = file.getOriginalFilename();
            if (!(fileOriginalName.indexOf(".md") > -1)) {
                throw new RuntimeException("目前仅支持mardown");
            }
            String content = "";
            try {
                Reader reader = new InputStreamReader(file.getInputStream(), "utf-8");
                BufferedReader br = new BufferedReader(reader);
                String line;

                while ((line = br.readLine()) != null) {
                    content += line + "\n";
                }
            } catch (Exception e) {
                throw new RuntimeException("文件解析出错：" + e.getMessage());
            }
            //保存 mto_post
            MtoPost mtoPost = new MtoPost();
            mtoPost.setAuthorId(ShiroUtils.getUserId());
            mtoPost.setCreateTime(DateUtils.getNowDate());
            // 标题 xxx.md  => xxx
            String markdownName = fileOriginalName.substring(0, fileOriginalName.lastIndexOf("."));
            mtoPost.setTitle(markdownName);
            // 设置文章内容
            mtoPost.setContent(content);
            // 导入的默认为 草稿
            mtoPost.setStatus(1L);
            mtoPost.setTags("");
            MtoPostAttribute mtoPostAttribute = new MtoPostAttribute();
            // updateSupport 是否更新  (true更新/false不更新)
            if (updateSupport) {
                // 如果存在一样的标题更新
                Long id = mtoPostMapper.isTitleExits(markdownName);
                mtoPostAttribute.setContent(content);
                mtoPostAttribute.setId(id);
                i = ToolUtils.isEmpty(id) ? this.insertMtoPost(mtoPost) : mtoPostAttributeMapper.updateMtoPostAttribute(mtoPostAttribute);
            } else {
                i = this.insertMtoPost(mtoPost);
            }

        }
        // 删除缓存
        CacheUtils.remove(Constants.WEB_NEW_BLOG);
        CacheUtils.remove(Constants.WEB_HOT_BLOG);
        // 删除静态模板
        this.deleteHtml();
        return i > 0 ? "导入成功" : "导入失败";
    }

    /**
     * 首次访问博客记录
     *
     * @param mtoLookIpFirst
     * @return
     */
    @Override
    public List<MtoLookIpFirst> selectLookIpFirstList(MtoLookIpFirst mtoLookIpFirst) {
        return mtoPostMapper.selectLookIpFirstList(mtoLookIpFirst);
    }

    @Override
    public int firstRemove(String ids) {
        List<String> idList = new ArrayList<>(Arrays.asList(ids.split(",")));
        return lookIpFirstMapper.deleteBatchIds(idList);
    }

    /**
     * 在启动时将当日访问ip放到缓存中
     */
    @PostConstruct
    private void getStatisticalAccountIpByDay() {
        List<String> list = mtoPostMapper.getStatisticalAccountIpByDay(DateUtils.getNowDate());
        if (ToolUtils.isNotEmpty(list)) {
            CacheUtils.put(Constants.WEB_STATISTICAL_IP, list);
        }
    }

    /**
     * 清空静态页面
     *
     * @return
     */
    @Override
    public int cleasrStaticPage() {
        File directory = new File(RuoYiConfig.getHtmlPath());
        boolean exists = directory.exists();
        if (exists) {
            FileUtils.deleteAllFile(directory);
        }
        return 1;
    }

    /**
     * markdown 导出博客之单文件
     *
     * @param postId   博客id
     * @param request
     * @param response
     */
    @Override
    public void exportMd(Long postId, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 查询文章
            MtoPost post = mtoPostMapper.selectMtoPostById(postId);
            response.setContentType("text/plain; charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            //解决response中writer乱码方案
            response.setHeader("Content-Type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            // 获取下载文件类型
            response.setContentType("markdown");
            PrintWriter writer = response.getWriter();
            writer.write(post.getContent());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("下载文章失败");
        }
    }

    /**
     * markdown 导出博客之多文件
     *
     * @param postIds  文章id
     * @param request
     * @param response
     */
    @Override
    public void exportDataBatch(String postIds, HttpServletRequest request, HttpServletResponse response) {
        if (StringUtils.isEmpty(postIds)) {
            throw new RuntimeException("请选择需要导出的文章");
        }

        // 获取文章
        List<MtoPost> postList = mtoPostMapper.selectMtoPostByIds(postIds.split(","));

        // 下载
        ZipOutputStream zipOutputStream = null;
        try {
            zipOutputStream = new ZipOutputStream(response.getOutputStream());
            for (MtoPost post : postList) {
                ZipEntry zipEntry = new ZipEntry(post.getTitle() + ".md");
                zipOutputStream.putNextEntry(zipEntry);
                zipOutputStream.write(post.getContent().getBytes());
                zipOutputStream.closeEntry();
                zipEntry.clone();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("导出失败");
        } finally {
            if (zipOutputStream != null) {
                try {
                    zipOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 删除静态页面
     */
    private void deleteHtml() {
        if (RuoYiConfig.isPageStaticEnabled()) {
            File directory = new File(RuoYiConfig.getHtmlPath() + File.separator);
            List<File> fileList = FileUtils.searchLikeFiles(directory, "blog-", false);
            for (File file : fileList) {
                file.delete();
            }
        }
    }

}
