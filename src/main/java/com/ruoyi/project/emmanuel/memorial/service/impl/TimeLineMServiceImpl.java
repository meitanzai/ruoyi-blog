package com.ruoyi.project.emmanuel.memorial.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.emmanuel.memorial.domain.TimeLineM;
import com.ruoyi.project.emmanuel.memorial.mapper.TimeLineMMapper;
import com.ruoyi.project.emmanuel.memorial.service.ITimeLineMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 时间轴主表Service业务层处理
 *
 * @author 一粒麦子
 * @date 2023-02-25
 */
@Service
public class TimeLineMServiceImpl extends ServiceImpl<TimeLineMMapper, TimeLineM> implements ITimeLineMService {

    @Autowired
    private TimeLineMMapper timeLineMMapper;

    /**
     * 查询时间轴主表
     *
     * @param id 时间轴主表主键
     * @return 时间轴主表
     */
    @Override
    public TimeLineM selectTimeLineMById(Long id) {
        return timeLineMMapper.selectById(id);
    }

    /**
     * 查询时间轴主表列表
     *
     * @param timeLineM 时间轴主表
     * @return 时间轴主表
     */
    @Override
    public List<TimeLineM> selectTimeLineMList(TimeLineM timeLineM) {
        QueryWrapper<TimeLineM> qw = new QueryWrapper<>();
        if (ToolUtils.isNotEmpty(timeLineM.getTimeTitle())) {
            qw.lambda().like(TimeLineM::getTimeTitle, timeLineM.getTimeTitle());
        }
         qw.lambda().orderByDesc(TimeLineM::getCreateTime);
        return timeLineMMapper.selectList(qw);
    }

    /**
     * 新增时间轴主表
     *
     * @param timeLineM 时间轴主表
     * @return 结果
     */
    @Override
    public int insertTimeLineM(TimeLineM timeLineM) {
        timeLineM.setCreateTime(DateUtils.getNowDate());
        timeLineM.setCreateBy(ShiroUtils.getLoginName());
        return timeLineMMapper.insert(timeLineM);
    }

    /**
     * 修改时间轴主表
     *
     * @param timeLineM 时间轴主表
     * @return 结果
     */
    @Override
    public int updateTimeLineM(TimeLineM timeLineM) {
        timeLineM.setUpdateTime(DateUtils.getNowDate());
        timeLineM.setUpdateBy(ShiroUtils.getLoginName());
        return timeLineMMapper.updateById(timeLineM);
    }

    /**
     * 批量删除时间轴主表
     *
     * @param ids 需要删除的时间轴主表主键
     * @return 结果
     */
    @Override
    public int deleteTimeLineMByIds(String ids) {
        return timeLineMMapper.deleteBatchIds(Arrays.asList(Convert.toStrArray(ids)));
    }

}
