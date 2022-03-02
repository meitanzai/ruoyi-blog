package com.ruoyi.project.emmanuel.memorial.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.memorial.domain.BoardNote;

public interface IBoardNoteService extends IService<BoardNote> {

    /**
     * 查询随手记列表
     */
    TableDataInfo selectBoardNoteList(BoardNote boardNote, Integer pageNum, Integer pageSize);

    /**
     * 新增保存随手记
     */
    int insertBoardNote(BoardNote boardNote);

    /**
     * 根据id查询随手记
     * @param id 随手记id
     * @return
     */
    BoardNote selectBoardNoteById(Long id);

    /**
     * 修改随手记
     * @param boardNote
     * @return
     */
    int updateBoardNote(BoardNote boardNote);

    /**
     * 删除随手记
     * @param ids
     * @return
     */
    int deleteBoardNoteByIds(String ids);
}
