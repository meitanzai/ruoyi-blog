package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoComment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MtoCommentMapper extends BaseMapper<MtoComment> {

    @Select(" SELECT  id,p_id as pId,email,nick_name as nickName,avatar, content,parent_nick_name as parentNickName FROM  mto_comment  WHERE  find_in_set(#{id} ,ancestors )")
    List<MtoComment> selectAllLowerLevel(@Param("id") Long id);
}
