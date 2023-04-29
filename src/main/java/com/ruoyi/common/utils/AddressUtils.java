package com.ruoyi.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.framework.config.RuoYiConfig;

import java.util.Objects;

/**
 * 获取地址类
 *
 * @author ruoyi
 */
public class AddressUtils {

    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

    /**
     * IP地址查询(太平洋IP地址查询)  http://whois.pconline.com.cn/ipJson.jsp?ip=xxx.xxx.xxx.xxx&json=true
     */
    public static final String WHOIS_URL = "http://whois.pconline.com.cn/ipJson.jsp";

    /**
     * https://ip.useragentinfo.com/json?ip=xxx.xxx.xxx.xxx
     */
    public static final String IP_URL = "https://ip.useragentinfo.com/json";

    // 未知地址
    public static final String UNKNOWN = "XX XX";

    /**
     * IP地址查询(太平洋IP地址查询)  http://whois.pconline.com.cn/ipJson.jsp?ip=xxx.xxx.xxx.xxx&json=true
     *
     * @param ip
     * @return
     */
    public static String getWhoisAddressByIP(String ip) {
        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        }
        if (RuoYiConfig.isAddressEnabled()) {
            try {
                String rspStr = HttpUtils.sendGet(WHOIS_URL, "ip=" + ip + "&json=true", Constants.GBK);
                if (StringUtils.isEmpty(rspStr)) {
                    log.error("获取地理位置异常 {}", ip);
                    return UNKNOWN;
                }
                JSONObject obj = JSONObject.parseObject(rspStr);
                String region = obj.getString("pro");
                String city = StringUtils.isEmpty(obj.getString("region")) ? obj.getString("city") : obj.getString("region");
                return String.format("%s %s %s", region, city, "[太平洋IP提供]");
            } catch (Exception e) {
                log.error("获取地理位置异常 {}", e);
            }
        }
        return UNKNOWN;
    }

    /**
     * https://ip.useragentinfo.com/json?ip=xxx.xxx.xxx.xxx
     *
     * @param ip
     * @return
     */
    public static String getRealAddressByIP(String ip) {
        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        }
        if (RuoYiConfig.isAddressEnabled()) {
            try {
                String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", Constants.UTF8);
                if (StringUtils.isEmpty(rspStr)) {
                    log.error("获取地理位置异常 {}", ip);
                    return UNKNOWN;
                }
                JSONObject obj = JSONObject.parseObject(rspStr);
                if (!Objects.equals(obj.getInteger("code"), 200)){
                    log.error("获取地理位置异常 {}", obj);
                    return UNKNOWN;
                }
                String province = obj.getString("province");
                String city = obj.getString("city");
                String area = obj.getString("area");
                return String.format("%s %s %s", province, city, area);
            } catch (Exception e) {
                log.error("获取地理位置异常 {}", e);
            }
        }
        return UNKNOWN;
    }

    /**
     * 以最优的方式根据IP获取地址
     *
     * @param ip
     * @return
     */
    public static String getRemoteAddressByIP(String ip) {
        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        }
        String address = null;
        if (RuoYiConfig.isAddressEnabled()) {
            address = AddressUtils.getRealAddressByIP(ip);
            address = Objects.equals(UNKNOWN, address) ? AddressUtils.getWhoisAddressByIP(ip) : address;
            address = Objects.equals(UNKNOWN, address) ? RegionUtil.getRegionFormat(ip) : address;
        }
        return address;
    }
}
