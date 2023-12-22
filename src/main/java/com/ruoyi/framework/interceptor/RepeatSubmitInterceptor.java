package com.ruoyi.framework.interceptor;

import java.lang.reflect.Method;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.*;
import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.emmanuel.mto.domain.MtoLookIpFirst;
import com.ruoyi.project.emmanuel.mto.mapper.MtoLookIpFirstMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.LinkedHashSet;

/**
 * 防止重复提交拦截器
 *
 * @author ruoyi
 */
@Component
public abstract class RepeatSubmitInterceptor implements HandlerInterceptor
{

    @Autowired
    private MtoLookIpFirstMapper lookIpFirstMapper;

    /*在请求处理之前进行调用(Controller方法调用之前)*/
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        if (handler instanceof HandlerMethod)
        {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            RepeatSubmit annotation = method.getAnnotation(RepeatSubmit.class);
            if (annotation != null)
            {
                if (this.isRepeatSubmit(request, annotation))
                {
                    AjaxResult ajaxResult = AjaxResult.error(annotation.message());
                    ServletUtils.renderString(response, JSONObject.toJSONString(ajaxResult));
                    return false;
                }
            }
            return true;
        }
        else
        {
            return true;
        }
    }

    /*请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）*/
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /* 整个请求结束之后被调用，也就是在DispatchServlet渲染了对应的视图之后执行（主要用于进行资源清理工作）*/
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

        if ( handler instanceof HandlerMethod && request.getRequestURI().contains("/blog")) {
            // 获取IP
            String serviceIp = IpUtils.getIpAddr(request);
            // 从缓存中获取
            Object statisticalAccountIp = CacheUtils.get(Constants.WEB_STATISTICAL_IP);
            ObjectMapper objectMapper = new ObjectMapper();
            LinkedHashSet<String> hashSet = objectMapper.convertValue(statisticalAccountIp, LinkedHashSet.class);
            if (ToolUtils.isEmpty(hashSet)) {
                hashSet = new LinkedHashSet<String>();
            }
            if (!hashSet.contains(serviceIp)) {
                // 首次访问
                MtoLookIpFirst lookIpFirst = new MtoLookIpFirst();
                lookIpFirst.setIpAddr(serviceIp);
                lookIpFirst.setIpLocation(AddressUtils.getRemoteAddressByIP(serviceIp));
                lookIpFirst.setFirstVisitDate(DateUtils.getNowDate());
                lookIpFirst.setFirstVisitUrl(request.getRequestURI());
                lookIpFirstMapper.insert(lookIpFirst);
                // 添加到缓存中
                hashSet.add(serviceIp);
                CacheUtils.put(Constants.WEB_STATISTICAL_IP, hashSet);
            }
        }

    }


    /**
     * 验证是否重复提交由子类实现具体的防重复提交的规则
     *
     * @param request 请求对象
     * @param annotation 防复注解
     * @return 结果
     */
    public abstract boolean isRepeatSubmit(HttpServletRequest request, RepeatSubmit annotation);
}
