package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.project.emmanuel.mto.domain.MtoChannel;
import com.ruoyi.project.emmanuel.mto.domain.MtoGolden;
import com.ruoyi.project.emmanuel.mto.domain.MtoPost;
import com.ruoyi.project.emmanuel.mto.domain.WebMtoPost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WebPostMapper extends BaseMapper<WebMtoPost> {

    List<MtoChannel> selectIndexChannelList();

    MtoGolden selectIndexGolden();

    WebMtoPost selectWebPostById(Long id);

    void addOneViews(Long id);

    /**
     * @param postPage   分页
     * @param categoryId 导航
     * @param channelId  栏目/分类id
     * @param slider     是否轮播
     * @return
     */
    Page<WebMtoPost> selectPage(Page<WebMtoPost> postPage,
                                @Param("categoryId") Long categoryId,
                                @Param("channelId") Long channelId,
                                @Param("slider") Integer slider);

    /**
     * 更新点赞 +1
     *
     * @param postId
     * @param favorsType
     * @return
     */
    int updateFavors(@Param("postId") Long postId, @Param("favorsType") Integer favorsType);

    /**
     * 获取时间轴文章列表
     *
     * @param page
     * @return
     */
    Page<WebMtoPost> timeArchiving(Page<WebMtoPost> page);

    /**
     * 时间归档
     *
     * @return
     * @param page
     */
    Page<MtoPost> timeArchives(Page<MtoPost> page);

}
