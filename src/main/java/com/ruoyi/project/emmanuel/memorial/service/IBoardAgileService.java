package com.ruoyi.project.emmanuel.memorial.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.emmanuel.memorial.domain.BoardAgile;
import org.springframework.ui.ModelMap;

/**
 * 任务清单Service接口
 *
 * @author ruoyi
 * @date 2021-11-27
 */
public interface IBoardAgileService extends IService<BoardAgile> {
    /**
     * 查询任务清单
     *
     * @param id 任务清单主键
     * @return 任务清单
     */
    public BoardAgile selectBoardAgileById(Long id);

    /**
     * 查询任务清单列表
     *
     *
     * @param modelMap
     * @param boardAgile 任务清单
     * @return 任务清单集合
     */
    void selectBoardAgileList(ModelMap modelMap, BoardAgile boardAgile);

    /**
     * 新增任务清单
     *
     * @param boardAgile 任务清单
     * @return 结果
     */
    public int insertBoardAgile(BoardAgile boardAgile);

    /**
     * 修改任务清单
     *
     * @param boardAgile 任务清单
     * @return 结果
     */
    public int updateBoardAgile(BoardAgile boardAgile);

    /**
     * 批量删除任务清单
     *
     * @param ids 需要删除的任务清单主键集合
     * @return 结果
     */
    public int deleteBoardAgileByIds(String ids);

    /**
     * 删除任务清单信息
     *
     * @param id 任务清单主键
     * @return 结果
     */
    public int deleteBoardAgileById(Long id);


    /**
     * 修改任务清单状态
     */
    int editStatus(BoardAgile boardAgile);
}
