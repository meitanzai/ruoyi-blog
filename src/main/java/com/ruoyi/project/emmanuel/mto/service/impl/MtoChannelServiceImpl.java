package com.ruoyi.project.emmanuel.mto.service.impl;

import java.util.List;

import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.project.emmanuel.mto.domain.MtoCategory;
import com.ruoyi.project.emmanuel.mto.domain.MtoTag;
import com.ruoyi.project.emmanuel.mto.mapper.MtoCategoryMapper;
import com.ruoyi.project.emmanuel.mto.service.IMtoCategoryService;
import com.ruoyi.project.emmanuel.mto.service.IMtoPostService;
import javafx.scene.chart.CategoryAxis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.emmanuel.mto.mapper.MtoChannelMapper;
import com.ruoyi.project.emmanuel.mto.domain.MtoChannel;
import com.ruoyi.project.emmanuel.mto.service.IMtoChannelService;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.ui.ModelMap;

/**
 * 栏目管理Service业务层处理
 *
 * @author 一粒麦子
 * @date 2021-11-13
 */
@Service
public class MtoChannelServiceImpl implements IMtoChannelService {

    @Autowired
    private MtoChannelMapper mtoChannelMapper;

    /**
     * 查询栏目管理
     *
     * @param id 栏目管理主键
     * @return 栏目管理
     */
    @Override
    public MtoChannel selectMtoChannelById(Long id) {
        return mtoChannelMapper.selectMtoChannelById(id);
    }

    /**
     * 查询栏目管理列表
     *
     * @param mtoChannel 栏目管理
     * @return 栏目管理
     */
    @Override
    public List<MtoChannel> selectMtoChannelList(MtoChannel mtoChannel) {
        return mtoChannelMapper.selectMtoChannelList(mtoChannel);
    }

    /**
     * 新增栏目管理
     *
     * @param mtoChannel 栏目管理
     * @return 结果
     */
    @Override
    public int insertMtoChannel(MtoChannel mtoChannel) {

        this.isExist(mtoChannel);

        if (ToolUtils.isEmpty(mtoChannel.getWeight())) {
            mtoChannel.setWeight(0L);
        }
        return mtoChannelMapper.insertMtoChannel(mtoChannel);
    }

    /**
     * 根据key和name判断是否已存在
     *
     * @param mtoChannel
     */
    private void isExist(MtoChannel mtoChannel) {
        String key = mtoChannel.getKey();
        String name = mtoChannel.getName();
        Long id = mtoChannel.getId();
        String exist = mtoChannelMapper.isExist(key, name,id);
        if (ToolUtils.isNotEmpty(exist)){
            throw new RuntimeException("当前 key/名称 已存在");
        }
    }

    /**
     * 修改栏目管理
     *
     * @param mtoChannel 栏目管理
     * @return 结果
     */
    @Override
    public int updateMtoChannel(MtoChannel mtoChannel) {
        this.isExist(mtoChannel);
        return mtoChannelMapper.updateMtoChannel(mtoChannel);
    }

    /**
     * 批量删除栏目管理
     *
     * @param ids 需要删除的栏目管理主键
     * @return 结果
     */
    @Override
    public int deleteMtoChannelByIds(String ids) {
        return mtoChannelMapper.deleteMtoChannelByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除栏目管理信息
     *
     * @param id 栏目管理主键
     * @return 结果
     */
    @Override
    public int deleteMtoChannelById(Long id) {
        return mtoChannelMapper.deleteMtoChannelById(id);
    }


}
