package com.ruoyi.project.emmanuel.mto.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoCategory;

import java.util.List;

public interface MtoCategoryMapper extends BaseMapper<MtoCategory> {

    List<MtoCategory> selectCategories(MtoCategory bizCategory);

    /**
     * 查询导航表
     *
     * @param id 导航表主键
     * @return 导航表
     */
    public MtoCategory selectMtoCategoryById(Long id);

    /**
     * 查询导航表列表
     *
     * @param mtoCategory 导航表
     * @return 导航表集合
     */
    public List<MtoCategory> selectMtoCategoryList(MtoCategory mtoCategory);

    /**
     * 新增导航表
     *
     * @param mtoCategory 导航表
     * @return 结果
     */
    public int insertMtoCategory(MtoCategory mtoCategory);

    /**
     * 修改导航表
     *
     * @param mtoCategory 导航表
     * @return 结果
     */
    public int updateMtoCategory(MtoCategory mtoCategory);

    /**
     * 删除导航表
     *
     * @param id 导航表主键
     * @return 结果
     */
    public int deleteMtoCategoryById(Long id);

    /**
     * 批量删除导航表
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMtoCategoryByIds(String[] ids);

    Integer exitLowerLevel(Long id);
}
