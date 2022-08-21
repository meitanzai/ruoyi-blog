package com.ruoyi.project.emmanuel.mto.service;

import java.util.List;

import com.ruoyi.project.emmanuel.mto.domain.MtoChannel;
import org.springframework.ui.ModelMap;

/**
 * 栏目管理Service接口
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
public interface IMtoChannelService {
    /**
     * 查询栏目管理
     *
     * @param id 栏目管理主键
     * @return 栏目管理
     */
    public MtoChannel selectMtoChannelById(Long id);

    /**
     * 查询栏目管理列表
     *
     * @param mtoChannel 栏目管理
     * @return 栏目管理集合
     */
    public List<MtoChannel> selectMtoChannelList(MtoChannel mtoChannel);

    /**
     * 新增栏目管理
     *
     * @param mtoChannel 栏目管理
     * @return 结果
     */
    public int insertMtoChannel(MtoChannel mtoChannel);

    /**
     * 修改栏目管理
     *
     * @param mtoChannel 栏目管理
     * @return 结果
     */
    public int updateMtoChannel(MtoChannel mtoChannel);

    /**
     * 批量删除栏目管理
     *
     * @param ids 需要删除的栏目管理主键集合
     * @return 结果
     */
    public int deleteMtoChannelByIds(String ids);

    /**
     * 删除栏目管理信息
     *
     * @param id 栏目管理主键
     * @return 结果
     */
    public int deleteMtoChannelById(Long id);

}
