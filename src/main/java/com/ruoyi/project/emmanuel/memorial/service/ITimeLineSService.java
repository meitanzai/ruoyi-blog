package com.ruoyi.project.emmanuel.memorial.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineS;

import java.util.List;

/**
 * 时间轴Service接口
 *
 * @author 一粒麦子
 * @date 2023-02-25
 */
public interface ITimeLineSService extends IService<TimeLineS> {
    /**
     * 查询时间轴
     *
     * @param id 时间轴主键
     * @return 时间轴
     */
    public TimeLineS selectTimeLineSById(Long id);

    /**
     * 查询时间轴列表
     *
     * @param timeLineS 时间轴
     * @return 时间轴集合
     */
    public List<TimeLineS> selectTimeLineSList(TimeLineS timeLineS);

    /**
     * 新增时间轴
     *
     * @param timeLineS 时间轴
     * @return 结果
     */
    public int insertTimeLineS(TimeLineS timeLineS);

    /**
     * 修改时间轴
     *
     * @param timeLineS 时间轴
     * @return 结果
     */
    public int updateTimeLineS(TimeLineS timeLineS);

    /**
     * 批量删除时间轴
     *
     * @param ids 需要删除的时间轴主键集合
     * @return 结果
     */
    public int deleteTimeLineSByIds(String ids);

    /**
     * 获取时间轴详情
     * @param id 时间轴主键
     * @return
     */
    TimeLineS detail(Long id);
}
