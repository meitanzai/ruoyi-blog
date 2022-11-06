package com.ruoyi.project.emmanuel.mto.service;

import com.ruoyi.project.emmanuel.mto.domain.MtoLookIpFirst;
import com.ruoyi.project.emmanuel.mto.domain.MtoPost;
import com.ruoyi.project.emmanuel.mto.domain.MtoTag;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * 文章表题Service接口
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
public interface IMtoPostService {
    /**
     * 查询文章表题
     *
     * @param id 文章表题主键
     * @return 文章表题
     */
    public MtoPost selectMtoPostById(Long id);

    /**
     * 查询文章表题列表
     *
     * @param mtoPost 文章表题
     * @return 文章表题集合
     */
    public List<MtoPost> selectMtoPostList(MtoPost mtoPost);

    /**
     * 新增文章表题
     *
     * @param mtoPost 文章表题
     * @return 结果
     */
    public int insertMtoPost(MtoPost mtoPost);

    /**
     * 修改文章表题
     *
     * @param mtoPost 文章表题
     * @return 结果
     */
    public int updateMtoPost(MtoPost mtoPost);

    /**
     * 批量删除文章表题
     *
     * @param ids 需要删除的文章表题主键集合
     * @return 结果
     */
    public int deleteMtoPostByIds(String ids);

    /**
     * 删除文章表题信息
     *
     * @param id 文章表题主键
     * @return 结果
     */
    public int deleteMtoPostById(Long id);

    List<MtoTag> selectMtoTagList();


    public MtoPost selectPostById(Long id);

    /**
     * 获取最新几条博客
     *
     * @return
     */
    List<MtoPost> selectIndexNewPostList();

    /**
     * 获取新增需要的信息
     *
     * @param modelMap
     */
    void getAddInfo(ModelMap modelMap);

    /**
     * 修改博客获取博客信息
     *
     * @param id
     * @param modelMap
     */
    void getEditInfo(Long id, ModelMap modelMap);

    /**
     * 导入markdown
     *
     * @param markDownList  markdown文件
     * @param updateSupport 是否更新  (true更新/false不更新)
     * @return
     */
    String importData(List<MultipartFile> markDownList, boolean updateSupport);

    /**
     * 首次访问博客记录
     *
     * @param mtoLookIpFirst
     * @return
     */
    List<MtoLookIpFirst> selectLookIpFirstList(MtoLookIpFirst mtoLookIpFirst);

    /**
     * 删除首次访问博客记录
     *
     * @param ids
     * @return
     */
    int firstRemove(String ids);

    /**
     * 清空静态页面
     *
     * @return
     */
    int cleasrStaticPage();

    /**
     * markdown 导出博客之单文件
     *
     * @param postId   文章ID
     * @param request
     * @param response
     */
    void exportMd(Long postId, HttpServletRequest request, HttpServletResponse response);

    /**
     * markdown 导出博客之多文件
     *
     * @param postIds  文章id
     * @param request
     * @param response
     */
    void exportDataBatch(String postIds, HttpServletRequest request, HttpServletResponse response);
}
