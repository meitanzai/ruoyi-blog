package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.project.emmanuel.mto.domain.MtoPost;
import com.ruoyi.project.emmanuel.mto.domain.MtoPostTag;
import com.ruoyi.project.emmanuel.mto.domain.WebMtoPost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author 一粒麦子
 * @date 2022-01-17
 */
public interface MtoPostTagMapper extends BaseMapper<MtoPostTag> {

    void insertBatch(@Param("tagIdList") List<String> tagIdList,
                     @Param("postId") Long postId);

    Page<WebMtoPost> selectBlogByTagId(Long tagId, Page<WebMtoPost> postPage);

}
