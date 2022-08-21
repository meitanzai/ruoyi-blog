package com.ruoyi.project.emmanuel.memorial.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.memorial.domain.PinBoard;
import com.ruoyi.project.emmanuel.memorial.mapper.PinBoardMapper;
import com.ruoyi.project.emmanuel.memorial.service.IPinBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import java.util.*;

@Service
public class PinBoardServiceImpl extends ServiceImpl<PinBoardMapper, PinBoard> implements IPinBoardService {

    @Autowired
    private PinBoardMapper pinBoardMapper;

    /**
     * 便签列表查询
     *
     * @param modelMap
     * @param currentPage
     * @param currentSize
     * @return
     */
    @Override
    public void selectPinBoardList(ModelMap modelMap, Long currentPage, Long currentSize) {

        Page<PinBoard> page = new Page<>(currentPage, currentSize);
        Page<PinBoard> pinBoardPage = this.page(page, null);

        TableDataInfo dataInfo = new TableDataInfo();
        if (ToolUtils.isNotEmpty(pinBoardPage)){
            dataInfo.setRows(pinBoardPage.getRecords());
            dataInfo.setTotal(pinBoardPage.getTotal());
            dataInfo.setCurrentPage(pinBoardPage.getCurrent());
            dataInfo.setCurrentSize(pinBoardPage.getSize());
            dataInfo.setTotalPage(pinBoardPage.getPages());

        }
        modelMap.put("pinDateInfo", dataInfo);

    }

    /**
     * 删除便签
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer deletePinBoardById(String ids) {
        if (ToolUtils.isEmpty(ids)) {
            throw new RuntimeException("至少选择一个删除");
        }
        return pinBoardMapper.deleteBatchIds(new ArrayList<>(Arrays.asList(ids.split(","))));
    }

    /**
     * 新增保存便签墙
     */
    @Override
    public int insertPinBoard(PinBoard pinBoard) {
        pinBoard.setCreateBy(ShiroUtils.getLoginName());
        pinBoard.setCreateTime(new Date());
        int insert = pinBoardMapper.insert(pinBoard);
        return insert;
    }

    private List<PinBoard> pinBoardList(PinBoard pinBoard) {
        LambdaQueryWrapper<PinBoard> queryWrapper = new QueryWrapper<PinBoard>()
                .lambda()
                .orderByAsc(PinBoard::getOrderNum);
        List<PinBoard> pinBoardList = pinBoardMapper.selectList(queryWrapper);
        return pinBoardList;
    }

    /**
     * 根据id查询便签
     *
     * @param id 便签id
     * @return
     */
    @Override
    public PinBoard selectPinBoardById(Long id) {
        return pinBoardMapper.selectById(id);
    }

    /**
     * 修改便签
     *
     * @param pinBoard 便签
     * @return
     */
    @Override
    public int updatePinBoard(PinBoard pinBoard) {
        return pinBoardMapper.updateById(pinBoard);
    }
}
