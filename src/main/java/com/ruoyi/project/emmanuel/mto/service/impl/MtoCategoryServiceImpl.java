package com.ruoyi.project.emmanuel.mto.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.CacheUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.framework.web.domain.Ztree;
import com.ruoyi.project.emmanuel.mto.domain.MtoCategory;
import com.ruoyi.project.emmanuel.mto.mapper.MtoCategoryMapper;
import com.ruoyi.project.emmanuel.mto.service.IMtoCategoryService;
import com.ruoyi.project.emmanuel.mto.service.IMtoPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class MtoCategoryServiceImpl extends ServiceImpl<MtoCategoryMapper, MtoCategory> implements IMtoCategoryService {

    @Autowired
    private IMtoPostService mtoPostService;

    private final MtoCategoryMapper mtoCategoryMapper;

    public MtoCategoryServiceImpl(MtoCategoryMapper mtoCategoryMapper) {
        this.mtoCategoryMapper = mtoCategoryMapper;
    }

    /**
     * 博客发布页面（导航选择）
     * @param bizCategory
     * @return
     */
    public List<MtoCategory> selectCategories(MtoCategory bizCategory) {
        QueryWrapper<MtoCategory> queryWrapper = new QueryWrapper<>();
        // 查询 status = 1, 并且type = 1
        queryWrapper.lambda()
                .eq(MtoCategory::getStatus,1)
                .eq(MtoCategory::getType,0);
        // 查询所有状态为1的导航
        List<MtoCategory> allList = mtoCategoryMapper.selectList(queryWrapper);


        // 递归
        // 第一级，过滤parentid为0的，Long用equest判断相等
        List<MtoCategory> collect = allList.stream()
                .filter(e -> {return Objects.equals(0L,e.getPid()); })
                .map(e -> {e.setChildren(getChildren(e,allList)); return e;})
                .sorted((menu1,menu2)->{return (menu1.getSort()==null?0:menu1.getSort())-(menu2.getSort()==null?0:menu2.getSort());})
                .collect(Collectors.toList());
        return collect;
    }

    private List<MtoCategory> getChildren(MtoCategory root, List<MtoCategory> allList) {
        List<MtoCategory> collect = allList.stream()
                .filter(e -> { return Objects.equals(root.getId(),e.getPid());})
                .map(e -> {e.setChildren(getChildren(e,allList)); return e;})
                .sorted((menu1,menu2)->{return (menu1.getSort()==null?0:menu1.getSort())-(menu2.getSort()==null?0:menu2.getSort());})
                .collect(Collectors.toList());
        return collect;
    }


    /**
     * 查询导航表
     *
     * @param id 导航表主键
     * @return 导航表
     */
    @Override
    public MtoCategory selectMtoCategoryById(Long id) {
        return mtoCategoryMapper.selectMtoCategoryById(id);
    }

    /**
     * 查询导航表列表
     *
     * @param mtoCategory 导航表
     * @return 导航表
     */
    @Override
    public List<MtoCategory> selectMtoCategoryList(MtoCategory mtoCategory) {
        return mtoCategoryMapper.selectCategories(mtoCategory);
    }

    /**
     * 新增导航表
     *
     * @param mtoCategory 导航表
     * @return 结果
     */
    @Override
    public int insertMtoCategory(MtoCategory mtoCategory) {
        mtoCategory.setCreateTime(DateUtils.getNowDate());
        int i = mtoCategoryMapper.insertMtoCategory(mtoCategory);
        CacheUtils.remove(Constants.WEB_CATEGORY);
        // 清空静态页面
        mtoPostService.clearHtml();
        return i;
    }

    /**
     * 修改导航表
     *
     * @param mtoCategory 导航表
     * @return 结果
     */
    @Override
    public int updateMtoCategory(MtoCategory mtoCategory) {
        mtoCategory.setUpdateTime(DateUtils.getNowDate());
        int i = mtoCategoryMapper.updateMtoCategory(mtoCategory);
        CacheUtils.remove(Constants.WEB_CATEGORY);
        // 清空静态页面
        mtoPostService.clearHtml();
        return i;
    }

    /**
     * 删除导航表信息
     *
     * @param id 导航表主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteMtoCategoryById(Long id) {
       // 删除时判断下级，存在则不允许删除
       Integer exit = mtoCategoryMapper.exitLowerLevel(id);
       if (ToolUtils.isNotEmpty(exit) && exit>0){
           throw new RuntimeException("存在下级，不允许删除");
       }
        int i = mtoCategoryMapper.deleteMtoCategoryById(id);
        CacheUtils.remove(Constants.WEB_CATEGORY);
        // 清空静态页面
        mtoPostService.clearHtml();
        return i;
    }

    /**
     * 查询导航表树列表
     *
     * @return 所有导航表信息
     */
    @Override
    public List<Ztree> selectMtoCategoryTree() {
        MtoCategory category = new MtoCategory();
        // 只查询分类，页面不可新增下级
        category.setType(0);
        // 查询启用状态
        category.setStatus(1);
        List<MtoCategory> mtoCategoryList = mtoCategoryMapper.selectMtoCategoryList(category);
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (MtoCategory mtoCategory : mtoCategoryList) {
            Ztree ztree = new Ztree();
            ztree.setId(mtoCategory.getId());
            ztree.setpId(mtoCategory.getPid());
            ztree.setName(mtoCategory.getName());
            ztree.setTitle(mtoCategory.getName());
            ztrees.add(ztree);
        }
        return ztrees;
    }

}
