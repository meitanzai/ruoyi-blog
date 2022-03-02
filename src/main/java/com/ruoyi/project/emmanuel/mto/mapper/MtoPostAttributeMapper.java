package com.ruoyi.project.emmanuel.mto.mapper;

import com.ruoyi.project.emmanuel.mto.domain.MtoPostAttribute;
import java.util.List;


/**
 * 博客内容Mapper接口
 *
 * @author ruoyi
 * @date 2021-11-19
 */
public interface MtoPostAttributeMapper
{
    /**
     * 查询博客内容
     *
     * @param id 博客内容主键
     * @return 博客内容
     */
    public MtoPostAttribute selectMtoPostAttributeById(Long id);

    /**
     * 查询博客内容列表
     *
     * @param mtoPostAttribute 博客内容
     * @return 博客内容集合
     */
    public List<MtoPostAttribute> selectMtoPostAttributeList(MtoPostAttribute mtoPostAttribute);

    /**
     * 新增博客内容
     *
     * @param mtoPostAttribute 博客内容
     * @return 结果
     */
    public int insertMtoPostAttribute(MtoPostAttribute mtoPostAttribute);

    /**
     * 修改博客内容
     *
     * @param mtoPostAttribute 博客内容
     * @return 结果
     */
    public int updateMtoPostAttribute(MtoPostAttribute mtoPostAttribute);

    /**
     * 删除博客内容
     *
     * @param id 博客内容主键
     * @return 结果
     */
    public int deleteMtoPostAttributeById(Long id);

    /**
     * 批量删除博客内容
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMtoPostAttributeByIds(String[] ids);
}
