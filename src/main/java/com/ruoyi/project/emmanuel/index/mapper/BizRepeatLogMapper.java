package com.ruoyi.project.emmanuel.index.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.index.domin.BizRepeatLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 需要校验重复性的业务记录日志Mapper接口
 *
 * @author 一粒麦子
 * @date 2021-12-12
 */
@Mapper
public interface BizRepeatLogMapper extends BaseMapper<BizRepeatLog> {

    @Select("SELECT 1 FROM `biz_repeat_log`  WHERE biz_id = #{bizId}   AND biz_type = #{bizType}  and user_ip = #{userIp}  and url = #{url} and status = 0  and LEFT(create_time,7) = LEFT(#{createTime}  ,7) limit 1")
    Integer checkLoveFavors(BizRepeatLog bizRepeatLog);
}
