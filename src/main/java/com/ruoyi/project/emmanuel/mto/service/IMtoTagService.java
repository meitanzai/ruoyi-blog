package com.ruoyi.project.emmanuel.mto.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.mto.domain.MtoTag;

/**
 * mtoService接口
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
public interface IMtoTagService extends IService<MtoTag> {
    /**
     * 查询mto
     *
     * @param id mto主键
     * @return mto
     */
    public MtoTag selectMtoTagById(Long id);

    /**
     * 查询mto列表
     *
     * @param mtoTag mto
     * @return mto集合
     */
    public  List<MtoTag> selectMtoTagList(MtoTag mtoTag);

    /**
     * 新增mto
     *
     * @param mtoTag mto
     * @return 结果
     */
    public int insertMtoTag(MtoTag mtoTag);

    /**
     * 修改mto
     *
     * @param mtoTag mto
     * @return 结果
     */
    public int updateMtoTag(MtoTag mtoTag);

    /**
     * 批量删除mto
     *
     * @param ids 需要删除的mto主键集合
     * @return 结果
     */
    public int deleteMtoTagByIds(String ids);

    /**
     * 删除mto信息
     *
     * @param id mto主键
     * @return 结果
     */
    public int deleteMtoTagById(Long id);
}
