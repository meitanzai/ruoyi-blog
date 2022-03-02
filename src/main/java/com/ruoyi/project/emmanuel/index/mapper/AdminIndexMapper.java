package com.ruoyi.project.emmanuel.index.mapper;

import com.ruoyi.project.emmanuel.mto.domain.MtoGolden;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface AdminIndexMapper {

    @Select("select golden,author from mto_golden ORDER BY RAND() limit 1")
    MtoGolden getOneGolden();
}
