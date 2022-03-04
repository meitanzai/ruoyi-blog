package com.ruoyi.project.emmanuel.mto.mapper;

import java.util.List;
import com.ruoyi.project.emmanuel.mto.domain.MtoPost;
import com.ruoyi.project.emmanuel.mto.domain.MtoTag;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.cache.annotation.Cacheable;

/**
 * 文章表题Mapper接口
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
public interface MtoPostMapper
{
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
     * 删除文章表题
     *
     * @param id 文章表题主键
     * @return 结果
     */
    public int deleteMtoPostById(Long id);

    /**
     * 批量删除文章表题
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMtoPostByIds(String[] ids);

    List<MtoTag> selectMtoTagList();

    User selectUserNameByAuthorId(Long authorId);

    List<MtoPost> copyBlog();

    void addOneViews(Long id);

    List<MtoPost> selectIndexNewPostList();

    /**
     * 查询 title 标题是否存在
     * @param markdownName title
     * @return 主键id
     */
    Long isTitleExits(String markdownName);

}
