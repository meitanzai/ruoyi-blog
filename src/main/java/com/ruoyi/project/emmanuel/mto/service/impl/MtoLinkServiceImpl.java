package com.ruoyi.project.emmanuel.mto.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.mto.domain.MtoLink;
import com.ruoyi.project.emmanuel.mto.mapper.MtoLinkMapper;
import com.ruoyi.project.emmanuel.mto.service.IMtoLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 友情链接 业务层处理
 *
 * @author 一粒麦子
 * @date 2021-12-13
 */
@Service
public class MtoLinkServiceImpl extends ServiceImpl<MtoLinkMapper, MtoLink> implements IMtoLinkService {

    @Autowired
    private MtoLinkMapper mtoLinkMapper;

    /**
     * 查询mto
     *
     * @param id mto主键
     * @return mto
     */
    @Override
    public MtoLink selectMtoLinkById(Long id) {
        return mtoLinkMapper.selectById(id);
    }

    /**
     * 查询mto列表
     *
     * @param mtoLink mto
     * @return mto
     */
    @Override
    public List<MtoLink> selectMtoLinkList(MtoLink mtoLink) {

        QueryWrapper<MtoLink> queryWrapper = new QueryWrapper<>();
        if (ToolUtils.isNotEmpty(mtoLink.getLinkName())) {
            queryWrapper.lambda().eq(MtoLink::getLinkName, mtoLink.getLinkName());
        }
        if (ToolUtils.isNotEmpty(mtoLink.getLinkUrl())) {
            queryWrapper.lambda().like(MtoLink::getLinkUrl, mtoLink.getLinkUrl());
        }
        List<MtoLink> mtoLinks = mtoLinkMapper.selectList(queryWrapper);
        return mtoLinks;
    }

    /**
     * 新增mto
     *
     * @param mtoLink mto
     * @return 结果
     */
    @Override
    public int insertMtoLink(MtoLink mtoLink) {
        mtoLink.setCreateBy(ShiroUtils.getLoginName());
        mtoLink.setCreateTime(DateUtils.getNowDate());
        return mtoLinkMapper.insert(mtoLink);
    }

    /**
     * 修改mto
     *
     * @param mtoLink mto
     * @return 结果
     */
    @Override
    public int updateMtoLink(MtoLink mtoLink) {
        mtoLink.setUpdateBy(ShiroUtils.getLoginName());
        mtoLink.setUpdateTime(DateUtils.getNowDate());
        return mtoLinkMapper.updateById(mtoLink);
    }

    /**
     * 批量删除mto
     *
     * @param ids 需要删除的mto主键
     * @return 结果
     */
    @Override
    public int deleteMtoLinkByIds(String ids) {
        return mtoLinkMapper.deleteBatchIds(new ArrayList<>(Arrays.asList(ids.split(","))));
    }

    /**
     * 删除mto信息
     *
     * @param id mto主键
     * @return 结果
     */
    @Override
    public int deleteMtoLinkById(Long id) {
        return mtoLinkMapper.deleteById(id);
    }
}
