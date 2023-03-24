package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoTag;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * mtoMapper接口
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
public interface MtoTagMapper extends BaseMapper<MtoTag> {

    @Select("select 1 from mto_tag where name = #{name}  limit 1")
    String tagIsExistByName(String name);

    @Select("select 1 from mto_tag where name = #{name} and  id != #{id} limit 1")
    String tagIsExistByNameAndId(String name,Long id);
}
