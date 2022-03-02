package com.ruoyi.project.emmanuel.mto.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.framework.web.domain.Ztree;
import com.ruoyi.project.emmanuel.mto.domain.MtoCategory;

import java.util.List;

public interface IMtoCategoryService extends IService<MtoCategory> {

    /**
     * 博客发布页面（导航选择）
     * @param bizCategory
     * @return
     */
    public List<MtoCategory> selectCategories(MtoCategory bizCategory);

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
     * 批量删除导航表
     *
     * @param ids 需要删除的导航表主键集合
     * @return 结果
     */
    public int deleteMtoCategoryByIds(String ids);

    /**
     * 删除导航表信息
     *
     * @param id 导航表主键
     * @return 结果
     */
    public int deleteMtoCategoryById(Long id);

    /**
     * 查询导航表树列表
     *
     * @return 所有导航表信息
     */
    public List<Ztree> selectMtoCategoryTree();
}
