package com.ruoyi.project.emmanuel.index.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.*;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.project.emmanuel.index.domin.BizRepeatLog;
import com.ruoyi.project.emmanuel.index.domin.DayInfo;
import com.ruoyi.project.emmanuel.index.mapper.AdminIndexMapper;
import com.ruoyi.project.emmanuel.index.mapper.BizRepeatLogMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoGolden;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.Date;

@Service
public class AdminIndexService {

    @Autowired
    private AdminIndexMapper adminIndexMapper;

    @Autowired
    private BizRepeatLogMapper bizRepeatLogMapper;

    /**
     * 获取年、天
     *
     * @return
     */
    public DayInfo getDayInfo() {
        DayInfo dayInfo = new DayInfo();
        // 获取今年的天数
        Integer totalDay = LocalDate.now().lengthOfYear();
        dayInfo.setTotalDay(totalDay);
        // 获取今天的日期
        Date nowDate = new Date();
        dayInfo.setNowDate(nowDate);
        // 今年已度过的天数(是在今年的第几天)
        Integer tooDay = Integer.parseInt(String.format("%tj", nowDate));
        dayInfo.setTooDay(tooDay);
        // 今年剩余天数
        Integer surpluDay = totalDay - tooDay;
        dayInfo.setSurpluDay(surpluDay);
        // 剩余百分数
        dayInfo.setSurpluHundred((String.format("%.2f", ((float) surpluDay / 365) * 100) + "%"));
        return dayInfo;
    }

    /**
     * 获取每日金句
     *
     * @return
     */
    public MtoGolden getOneGolden() {
        return adminIndexMapper.getOneGolden();
    }

    /**
     * 获取天气
     *
     * @param request
     * @param ip
     * @return
     * @throws Exception
     */
    public JSONObject getWeathe(HttpServletRequest request, String ip) throws Exception {

        // 需要查询天气的城市
        String province = null;
        String city = null;

        // 获取IP
        String serviceIp = IpUtils.getIpAddr(request);

        // 判断IP，如果是内网IP,并且前端传的IP不为空
        if (IpUtils.internalIp(serviceIp) && ToolUtils.isNotEmpty(ip)) {
            byte[] bytes = Base64Utils.decryptBASE64(ip);
            serviceIp = new String(bytes);
            // 校验前端IP是否正确,如果不正确重新获取
            if (!IpUtils.ipCheck(serviceIp) && ToolUtils.isEmpty(serviceIp)) {
                serviceIp = HttpUtils.sendGet("http://api.ipify.org?format=xml");
            }
        }

        // 根据IP获取地址(ip2region)
        String address = RegionUtil.getRegion(serviceIp);
        if (ToolUtils.isNotEmpty(address) && StringUtils.isEmpty(city)) {
            String[] obj = address.split("\\|");
            String region = obj[2];
            province = region;
            address = obj[3];
            city = address;
        }

        // 根据IP获取地址(网络获取)
        if (ToolUtils.isEmpty(city)) {
            address = AddressUtils.getRealAddressByIP(serviceIp);
            String[] array = address.split("\\s+");
            province = array[0];
            city = array[1];
        }

        // 查询天气
        String weatherStr = HttpUtils.sendGetIsGzip("http://wthrcdn.etouch.cn/weather_mini", "city="+(ToolUtils.isEmpty(city)? "北京" : city));
        JSONObject weatherJson = (JSONObject) JSONObject.parse(weatherStr);
        // weatherJson.put("ip",serviceIp);
        // weatherJson.put("comeFrom", ToolUtils.isNotEmpty(city) ? province+ "  " +city : "获取定位失败");

        // 记录日志
        BizRepeatLog bizRepeatLog = new BizRepeatLog();
        bizRepeatLog.setUserAgent(request.getHeader("User-Agent"));
        bizRepeatLog.setStatus(0);
        bizRepeatLog.setBizId(null);
        // 1.文章，2.评论,3.登录后获取天气
        bizRepeatLog.setBizType(3);
        bizRepeatLog.setUserIp(serviceIp);
        bizRepeatLog.setUrl(request.getRequestURI());
        bizRepeatLog.setCreateTime(DateUtils.getNowDate());
        bizRepeatLogMapper.insert(bizRepeatLog);
        return weatherJson;
    }

}
