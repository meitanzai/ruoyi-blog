package com.ruoyi.common.task;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.CacheUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.project.emmanuel.mto.domain.MtoLookIp;
import com.ruoyi.project.emmanuel.mto.mapper.MtoLookIpMapper;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import javax.annotation.Resource;
import java.util.Date;

@Configuration      // 1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
public class SaticScheduleTask {

    @Resource
    private MtoLookIpMapper lookIpMapper;

    // 3.添加定时任务
    @Scheduled(cron = "59 59 23 * * ?")
    private void configureTasks() {
        try {
            // 从缓存中后期访问量
            Object statisticalAccountIp = CacheUtils.get(Constants.WEB_STATISTICAL_IP);
            if (ToolUtils.isEmpty(statisticalAccountIp)) {
                return;
            }
            // 保持到数据库
            MtoLookIp mtoLookIp = new MtoLookIp();
            mtoLookIp.setDate(DateUtils.getNowDate());
            mtoLookIp.setIpList(String.valueOf(statisticalAccountIp));
            mtoLookIp.setCreateTime(new Date());
            lookIpMapper.insert(mtoLookIp);
            // 删除缓存
            CacheUtils.remove(Constants.WEB_STATISTICAL_IP);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

