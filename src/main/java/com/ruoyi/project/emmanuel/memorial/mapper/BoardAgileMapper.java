package com.ruoyi.project.emmanuel.memorial.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.memorial.domain.BoardAgile;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * 任务清单Mapper接口
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
public interface BoardAgileMapper extends BaseMapper<BoardAgile> {

    /**
     * 修改任务清单状态
     *
     * @param id          id
     * @param agileStatus 要需改的状态
     */
    @Update("update board_agile set agile_status = #{agileStatus} where id = #{id}")
    int updateAgileStatus(@Param("id") Long id, @Param("agileStatus") Integer agileStatus);
}
