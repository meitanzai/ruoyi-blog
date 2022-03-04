package com.ruoyi.project.emmanuel.mto.service.impl;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.MarkdownUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.project.emmanuel.mto.domain.*;
import com.ruoyi.project.emmanuel.mto.mapper.*;
import com.ruoyi.project.emmanuel.mto.service.*;
import com.ruoyi.project.system.user.domain.User;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

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
    private IWebPostService postService;

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
        mtoPost.setContent(MarkdownUtils.renderMarkdown(mtoPost.getContent()));
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

        return i;
    }

    /**
     * 批量删除文章表题
     *
     * @param ids 需要删除的文章表题主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteMtoPostByIds(String ids) {
        String[] strings = Convert.toStrArray(ids);
        // 删除博客文章 mto_post_attribute
        mtoPostAttributeMapper.deleteMtoPostAttributeByIds(strings);
        // 删除博客标签 mto_post_tag
        QueryWrapper<MtoPostTag> wrapper = new QueryWrapper<>();
        wrapper.lambda().in(MtoPostTag::getPostId, strings);
        mtoPostTagMapper.delete(wrapper);
        // 删除博客标题等信息 mto_post
        return mtoPostMapper.deleteMtoPostByIds(strings);
    }

    /**
     * 删除文章表题信息
     *
     * @param id 文章表题主键
     * @return 结果
     */
    @Override
    public int deleteMtoPostById(Long id) {
        mtoPostAttributeMapper.deleteMtoPostAttributeById(id);
        return mtoPostMapper.deleteMtoPostById(id);
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
        modelMap.put("channelList" , channelList);

        // 获取标签
        List<MtoTag> tagList = this.selectMtoTagList();
        modelMap.put("tagList" , tagList);

        // 获取导航栏
        MtoCategory category = new MtoCategory();
        category.setStatus(1);
        List<MtoCategory> categoryList = mtoCategoryService.selectCategories(category);
        modelMap.put("categoryList" , categoryList);
    }

    @Override
    public void getEditInfo(Long id, ModelMap modelMap) {
        // 文章
        MtoPost mtoPost = this.selectPostById(id);
        modelMap.put("mtoPost" , mtoPost);

        // 获取分类
        MtoChannel mtoChannel = new MtoChannel();
        List<MtoChannel> channelList = mtoChannelService.selectMtoChannelList(mtoChannel);
        modelMap.put("channelList" , channelList);

        // 获取标签
        List<MtoTag> tagList = this.selectMtoTagList();
        modelMap.put("tagList" , tagList);

        // 获取导航栏
        MtoCategory category = new MtoCategory();
        category.setStatus(1);
        List<MtoCategory> categoryList = mtoCategoryService.selectCategories(category);
        modelMap.put("categoryList" , categoryList);
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
            String markdownName = fileOriginalName.substring(0, fileOriginalName.lastIndexOf(".") - 1);
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
        return i > 0 ? "导入成功" : "导入失败";
    }


}
