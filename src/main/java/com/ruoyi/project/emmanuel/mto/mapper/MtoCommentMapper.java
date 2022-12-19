package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoComment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MtoCommentMapper extends BaseMapper<MtoComment> {

    @Select(" SELECT  id,p_id as pId,email,nick_name as nickName,avatar, content,parent_nick_name as parentNickName FROM  mto_comment  WHERE status = 1 and  find_in_set(#{id} ,ancestors ) ORDER BY ifnull(examine_time, create_time) desc")
    List<MtoComment> selectAllLowerLevel(@Param("id") Long id);

    @Select("SELECT  id,p_id as pId,nick_name as nickName,avatar, content,parent_nick_name as parentNickName,create_time as createTime FROM  mto_comment  WHERE post_id = #{postId} and p_id=0 and status = 1  ORDER BY ifnull(examine_time, create_time) desc")
    List<MtoComment> selectByPostId(Long postId);

    @Select("SELECT  id,p_id as pId,nick_name as nickName,avatar, content,parent_nick_name as parentNickName,create_time as createTime FROM  mto_comment  WHERE p_id = #{idList} and status = 1 ORDER BY ifnull(examine_time, create_time) desc limit 10")
    List<MtoComment> selectByPid(Long pid);
}
