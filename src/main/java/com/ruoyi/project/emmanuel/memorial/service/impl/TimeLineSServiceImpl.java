package com.ruoyi.project.emmanuel.memorial.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineS;
import com.ruoyi.project.emmanuel.memorial.mapper.TimeLineSMapper;
import com.ruoyi.project.emmanuel.memorial.service.ITimeLineSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;

/**
 * 时间轴Service业务层处理
 *
 * @author 一粒麦子
 * @date 2023-02-25
 */
@Service
public class TimeLineSServiceImpl extends ServiceImpl<TimeLineSMapper, TimeLineS> implements ITimeLineSService {

    @Autowired
    private TimeLineSMapper timeLineSMapper;

    /**
     * 查询时间轴
     *
     * @param id 时间轴主键
     * @return 时间轴
     */
    @Override
    public TimeLineS selectTimeLineSById(Long id) {
        return timeLineSMapper.selectById(id);
    }

    /**
     * 查询时间轴列表
     *
     * @param timeLineS 时间轴
     * @return 时间轴
     */
    @Override
    public List<TimeLineS> selectTimeLineSList(TimeLineS timeLineS) {
        QueryWrapper<TimeLineS> wq = new QueryWrapper<>();
        wq.lambda().eq(TimeLineS::getMId, timeLineS.getMId()).orderByDesc(TimeLineS::getCreateTime);
        return timeLineSMapper.selectList(wq);
    }

    /**
     * 新增时间轴
     *
     * @param timeLineS 时间轴
     * @return 结果
     */
    @Override
    public int insertTimeLineS(TimeLineS timeLineS) {
        timeLineS.setCreateTime(DateUtils.getNowDate());
        return timeLineSMapper.insert(timeLineS);
    }

    /**
     * 修改时间轴
     *
     * @param timeLineS 时间轴
     * @return 结果
     */
    @Override
    public int updateTimeLineS(TimeLineS timeLineS) {
        timeLineS.setUpdateTime(DateUtils.getNowDate());
        return timeLineSMapper.updateById(timeLineS);
    }

    /**
     * 批量删除时间轴
     *
     * @param ids 需要删除的时间轴主键
     * @return 结果
     */
    @Override
    public int deleteTimeLineSByIds(String ids) {
        return timeLineSMapper.deleteBatchIds(Arrays.asList(Convert.toStrArray(ids)));
    }

    /**
     * 获取时间轴详情
     *
     * @return
     */
    @Override
    public TimeLineS detail(Long id) {
        return timeLineSMapper.selectById(id);
    }
}
