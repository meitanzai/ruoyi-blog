package com.ruoyi.project.emmanuel.memorial.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.memorial.domain.BoardNote;
import com.ruoyi.project.emmanuel.memorial.mapper.BoardNoteMapper;
import com.ruoyi.project.emmanuel.memorial.service.IBoardNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;

@Service
public class BoardNoteServiceImpl extends ServiceImpl<BoardNoteMapper, BoardNote> implements IBoardNoteService {

    @Autowired
    private BoardNoteMapper boardNoteMapper;

    /**
     * 查询随手记列表
     */
    @Override
    public TableDataInfo selectBoardNoteList(BoardNote boardNote, Integer pageNum, Integer pageSize) {
        Page<BoardNote> page = new Page<>(pageNum, pageSize);
        QueryWrapper<BoardNote> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .select(BoardNote::getId, BoardNote::getNoteTitle, BoardNote::getNoteSummary, BoardNote::getNoteType, BoardNote::getIsPublic)
                .eq(BoardNote::getIsPublic, "0")
                .or().eq(BoardNote::getIsPublic, "1").and(i->i.eq(BoardNote::getAuthorId,ShiroUtils.getUserId()))
        .last("order by create_time desc");
        Page<BoardNote> boardNotePage = boardNoteMapper.selectPage(page, queryWrapper);
        TableDataInfo dataInfo = new TableDataInfo();
        if (ToolUtils.isNotEmpty(boardNotePage)) {
            dataInfo.setRows(boardNotePage.getRecords());
            dataInfo.setTotal(boardNotePage.getTotal());
            dataInfo.setCurrentPage(boardNotePage.getCurrent());
            dataInfo.setCurrentSize(boardNotePage.getSize());
            dataInfo.setTotalPage(boardNotePage.getPages());
        }
        return dataInfo;
    }

    /**
     * 新增保存随手记
     */
    @Override
    public int insertBoardNote(BoardNote boardNote) {
        boardNote.setAuthorId(ShiroUtils.getUserId());
        boardNote.setCreateBy(ShiroUtils.getLoginName());
        boardNote.setCreateTime(DateUtils.getNowDate());
        return boardNoteMapper.insert(boardNote);
    }

    @Override
    public BoardNote selectBoardNoteById(Long id) {
        return boardNoteMapper.selectById(id);
    }

    @Override
    public int updateBoardNote(BoardNote boardNote) {
        boardNote.setUpdateBy(ShiroUtils.getLoginName());
        boardNote.setUpdateTime(DateUtils.getNowDate());
        return boardNoteMapper.updateById(boardNote);
    }

    @Override
    public int deleteBoardNoteByIds(String ids) {
        ArrayList<String> idList = new ArrayList<>(Arrays.asList(ids.split(",")));
        return boardNoteMapper.deleteBatchIds(idList);
    }
}
