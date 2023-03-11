package com.ruoyi.project.emmanuel.memorial.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineM;

/**
 * 时间轴主表Service接口
 *
 * @author 一粒麦子
 * @date 2023-02-25
 */
public interface ITimeLineMService extends IService<TimeLineM> {
    /**
     * 查询时间轴主表
     *
     * @param id 时间轴主表主键
     * @return 时间轴主表
     */
    public TimeLineM selectTimeLineMById(Long id);

    /**
     * 查询时间轴主表列表
     *
     * @param timeLineM 时间轴主表
     * @return 时间轴主表集合
     */
    public List<TimeLineM> selectTimeLineMList(TimeLineM timeLineM);

    /**
     * 新增时间轴主表
     *
     * @param timeLineM 时间轴主表
     * @return 结果
     */
    public int insertTimeLineM(TimeLineM timeLineM);

    /**
     * 修改时间轴主表
     *
     * @param timeLineM 时间轴主表
     * @return 结果
     */
    public int updateTimeLineM(TimeLineM timeLineM);

    /**
     * 批量删除时间轴主表
     *
     * @param ids 需要删除的时间轴主表主键集合
     * @return 结果
     */
    public int deleteTimeLineMByIds(String ids);

}
