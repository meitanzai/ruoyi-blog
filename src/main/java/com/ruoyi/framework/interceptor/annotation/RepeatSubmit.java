package com.ruoyi.framework.interceptor.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义注解防止表单重复提交
 * 
 * @author ruoyi
 *
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RepeatSubmit
{
    /**
     * 间隔时间(ms)，小于此时间视为重复提交
     */
    public int interval() default 5000;

    /**
     * 提示消息
     */
    public String message() default "不允许重复提交，请稍后再试";

    /**
     * 是否校验相同数据
     *  true:校验 (eg:在间隔时间内，不同数据防止重复提交)
     *  false:不校验  (eg: 在间隔时间内，不同数据每次提交)
     * @return
     */
    public boolean repeatData() default false;
}