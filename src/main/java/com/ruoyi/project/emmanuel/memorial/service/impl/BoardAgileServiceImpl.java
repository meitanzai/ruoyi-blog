package com.ruoyi.project.emmanuel.memorial.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.emmanuel.memorial.domain.BoardAgile;
import com.ruoyi.project.emmanuel.memorial.mapper.BoardAgileMapper;
import com.ruoyi.project.emmanuel.memorial.service.IBoardAgileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

/**
 * 任务清单Service业务层处理
 *
 * @author ruoyi
 * @date 2021-11-27
 */
@Service
public class BoardAgileServiceImpl extends ServiceImpl<BoardAgileMapper, BoardAgile> implements IBoardAgileService {
    @Autowired
    private BoardAgileMapper boardAgileMapper;

    /**
     * 查询任务清单
     *
     * @param id 任务清单主键
     * @return 任务清单
     */
    @Override
    public BoardAgile selectBoardAgileById(Long id) {
        return null;
    }

    /**
     * 查询任务清单列表
     *
     * @param modelMap
     * @param boardAgile 任务清单
     * @return 任务清单
     */
    @Override
    public void selectBoardAgileList(ModelMap modelMap, BoardAgile boardAgile) {
        QueryWrapper<BoardAgile> queryWrapper = new QueryWrapper<>();
        LambdaQueryWrapper<BoardAgile> wrapper = queryWrapper.lambda().ge(BoardAgile::getAgileStatus, 0).orderByDesc(BoardAgile::getAgileDate);
        List<BoardAgile> boardAgileList = boardAgileMapper.selectList(wrapper);

        ArrayList<BoardAgile> noTaskList = new ArrayList<>();
        ArrayList<BoardAgile> taskIngList = new ArrayList<>();
        ArrayList<BoardAgile> taskOkList = new ArrayList<>();
        boardAgileList.stream().forEach(e -> {
            if (Objects.equals(0, e.getAgileStatus())) {
                noTaskList.add(e);
            }
            if (Objects.equals(1, e.getAgileStatus())) {
                taskIngList.add(e);
            }
            if (Objects.equals(2, e.getAgileStatus())) {
                taskOkList.add(e);
            }
        });
        modelMap.put("noTaskList", noTaskList);
        modelMap.put("taskIngList", taskIngList);
        modelMap.put("taskOkList", taskOkList);
    }

    /**
     * 新增任务清单
     *
     * @param boardAgile 任务清单
     * @return 结果
     */
    @Override
    public int insertBoardAgile(BoardAgile boardAgile) {
        boardAgile.setCreateTime(DateUtils.getNowDate());
        boardAgile.setCreateBy(ShiroUtils.getLoginName());
        boardAgile.setUserId(ShiroUtils.getUserId());
        return boardAgileMapper.insert(boardAgile);
    }

    /**
     * 修改任务清单
     *
     * @param boardAgile 任务清单
     * @return 结果
     */
    @Override
    public int updateBoardAgile(BoardAgile boardAgile) {
        boardAgile.setUpdateTime(DateUtils.getNowDate());
        return 0;
    }

    /**
     * 批量删除任务清单
     *
     * @param ids 需要删除的任务清单主键
     * @return 结果
     */
    @Override
    public int deleteBoardAgileByIds(String ids) {
        ArrayList<String> idList = new ArrayList<>(Arrays.asList(ids.split(",")));
        return boardAgileMapper.deleteBatchIds(idList);
    }

    /**
     * 删除任务清单信息
     *
     * @param id 任务清单主键
     * @return 结果
     */
    @Override
    public int deleteBoardAgileById(Long id) {
        return boardAgileMapper.deleteById(id);
    }

    /**
     * 修改任务清单状态
     *
     * @param id          id
     * @param agileStatus 要需改的状态
     */
    @Override
    public int editStatus(BoardAgile boardAgile) {
        return boardAgileMapper.updateAgileStatus(boardAgile.getId(), boardAgile.getAgileStatus());
    }
}
