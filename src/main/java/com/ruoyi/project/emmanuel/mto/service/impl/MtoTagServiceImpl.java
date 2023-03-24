package com.ruoyi.project.emmanuel.mto.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.CacheUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.framework.web.page.PageDomain;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.page.TableSupport;
import com.ruoyi.project.emmanuel.mto.domain.MtoTag;
import com.ruoyi.project.emmanuel.mto.mapper.MtoTagMapper;
import com.ruoyi.project.emmanuel.mto.service.IMtoPostService;
import com.ruoyi.project.emmanuel.mto.service.IMtoTagService;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.text.Convert;

/**
 * mtoService业务层处理
 *
 * @author 一粒麦子
 * @date 2021-11-27
 */
@Service
public class MtoTagServiceImpl extends ServiceImpl<MtoTagMapper, MtoTag> implements IMtoTagService {

    @Autowired
    private MtoTagMapper mtoTagMapper;

    @Autowired
    private IMtoPostService mtoPostService;

    /**
     * 查询mto
     *
     * @param id mto主键
     * @return mto
     */
    @Override
    public MtoTag selectMtoTagById(Long id) {
        return mtoTagMapper.selectById(id);
    }

    /**
     * 查询mto列表
     *
     * @param mtoTag mto
     * @return mto
     */
    @Override
    public  List<MtoTag> selectMtoTagList(MtoTag mtoTag) {
        LambdaQueryWrapper<MtoTag> query = new QueryWrapper<MtoTag>()
                .lambda()
                .like(MtoTag::getName, mtoTag.getName())
                .orderByAsc(MtoTag::getOrderNum, MtoTag::getCreateTime);
        List<MtoTag> list = mtoTagMapper.selectList(query);
        return list;
    }

    /**
     * 新增mto
     *
     * @param mtoTag mto
     * @return 结果
     */
    @Override
    public int insertMtoTag(MtoTag mtoTag) {

        // 查询改标签是否已存在，已存在则不允许添加
        String e = mtoTagMapper.tagIsExistByName(mtoTag.getName());
        if (ToolUtils.isNotEmpty(e)) {
            throw new RuntimeException("当前标签名已存在");
        }

        mtoTag.setCreateTime(DateUtils.getNowDate());
        int insert = mtoTagMapper.insert(mtoTag);
        CacheUtils.remove(Constants.WEB_TAG);
        // 清空静态页面
        mtoPostService.clearHtml();
        return insert;
    }

    /**
     * 修改mto
     *
     * @param mtoTag mto
     * @return 结果
     */
    @Override
    public int updateMtoTag(MtoTag mtoTag) {

        // 查询改标签是否已存在，已存在则不允许添加
        String e = mtoTagMapper.tagIsExistByNameAndId(mtoTag.getName(),mtoTag.getId());
        if (ToolUtils.isNotEmpty(e)) {
            throw new RuntimeException("当前标签名已存在");
        }

        mtoTag.setUpdateTime(DateUtils.getNowDate());
        int i = mtoTagMapper.updateById(mtoTag);
        CacheUtils.remove(Constants.WEB_TAG);
        // 清空静态页面
        mtoPostService.clearHtml();
        return i;
    }

    /**
     * 批量删除mto
     *
     * @param ids 需要删除的mto主键
     * @return 结果
     */
    @Override
    public int deleteMtoTagByIds(String ids) {
        if (ToolUtils.isEmpty(ids)){
            throw new RuntimeException("至少选择一个删除");
        }
        ArrayList<String> idList = new ArrayList<>(Arrays.asList(ids.split(",")));
        int i = mtoTagMapper.deleteBatchIds(idList);
        CacheUtils.remove(Constants.WEB_TAG);
        // 清空静态页面
        mtoPostService.clearHtml();
        return i;
    }


}
