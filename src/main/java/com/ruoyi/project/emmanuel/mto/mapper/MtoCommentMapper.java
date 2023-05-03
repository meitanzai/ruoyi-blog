package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoComment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface MtoCommentMapper extends BaseMapper<MtoComment> {

    @Select(" SELECT  id,p_id as pId,email,nick_name as nickName,avatar, content,parent_nick_name as parentNickName,create_time as createTime,ip_addr as ipAddr FROM  mto_comment  WHERE status = 1 and  find_in_set(#{id} ,ancestors ) ORDER BY ifnull(examine_time, create_time) desc")
    List<MtoComment> selectAllLowerLevel(@Param("id") Long id);

    @Select("SELECT  id,p_id as pId,nick_name as nickName,avatar, content,parent_nick_name as parentNickName,create_time as createTime,ip_addr as ipAddr,(select 1 from mto_comment c where c.p_id = mto_comment.id limit 1) as below FROM  mto_comment  WHERE post_id = #{postId} and p_id=0 and status = 1  ORDER BY ifnull(examine_time, create_time) desc")
    List<MtoComment> selectByPostId(Long postId);

    @Select("SELECT  id,p_id as pId,nick_name as nickName,avatar, content,parent_nick_name as parentNickName,create_time as createTime,ip_addr as ipAddr FROM mto_comment  WHERE p_id = #{idList} and status = 1 ORDER BY ifnull(examine_time, create_time) desc limit 10")
    List<MtoComment> selectByPid(Long pid);

    /**
     * 查询留言列表
     *
     * @param mtoComment 留言
     * @return 留言集合
     */
    public List<MtoComment> selectMtoCommentList(MtoComment mtoComment);

    /**
     * 批量删除留言
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMtoCommentByIds(String[] ids);

    /**
     * 批量审核留言
     *
     * @param ids
     * @param loginName
     * @param nowDate
     * @return
     */
    int examineMtoCommentByIds(@Param("ids") String[] ids, @Param("loginName") String loginName, @Param("nowDate") Date nowDate);

    /**
     * 递归删除
     *
     * @param id id
     * @return
     * @InterceptorIgnore(blockAttack = "true") Prohibition of full table deletion 禁止完整表删除
     */
    @InterceptorIgnore(blockAttack = "true")
    int deleteMtoCommentRecursion(String id);

    /**
     * 根据评论ID获取所属文章ID
     * @param idArr
     * @return
     */
    List<Long> selectCommentPostId(String[] idArr);

    /**
     * 更新博客评论数
     * @param postIdList 文章id集合
     */
    void updatePostCommentsByPostId(@Param("postIdList") List<Long> postIdList);

    /**
     * 更新博客评论数
     *
     * @param ids 评论id集合
     * @return
     */
    int updatePostCommentsByCommentId(@Param("ids") String[] ids);

}
