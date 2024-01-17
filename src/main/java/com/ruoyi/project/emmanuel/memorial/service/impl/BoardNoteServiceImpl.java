package com.ruoyi.project.emmanuel.memorial.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.memorial.domain.BoardNote;
import com.ruoyi.project.emmanuel.memorial.mapper.BoardNoteMapper;
import com.ruoyi.project.emmanuel.memorial.service.IBoardNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Service
public class BoardNoteServiceImpl extends ServiceImpl<BoardNoteMapper, BoardNote> implements IBoardNoteService {

    @Autowired
    private BoardNoteMapper boardNoteMapper;

    /**
     * 查询随手记列表
     */
    @Override
    public List<BoardNote> selectBoardNoteList(BoardNote boardNote) {
        QueryWrapper<BoardNote> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .select(BoardNote::getId, BoardNote::getNoteTitle, BoardNote::getNoteSummary, BoardNote::getNoteType, BoardNote::getIsPublic)
                .or().and(k -> k.eq(BoardNote::getIsPublic, "0").or(i -> i.eq(BoardNote::getAuthorId, ShiroUtils.getUserId()).eq(BoardNote::getIsPublic, "1")))
                .last("order by create_time desc");
        // 搜索
        String noteType = boardNote.getNoteType();
        if (ToolUtils.isNotEmpty(noteType)) {
            queryWrapper.lambda().and(i -> i.eq(BoardNote::getNoteType, noteType));
        }
        String noteTitle = boardNote.getNoteTitle();
        if (ToolUtils.isNotEmpty(noteTitle)) {
            queryWrapper.lambda().like(BoardNote::getNoteTitle, noteTitle);
        }
        String isPublic = boardNote.getIsPublic();
        if (ToolUtils.isNotEmpty(isPublic)) {
            queryWrapper.lambda().and(i -> i.eq(BoardNote::getIsPublic, isPublic));
        }
        List<BoardNote> boardNoteList = boardNoteMapper.selectList( queryWrapper);

        return boardNoteList;
    }

    /**
     * 新增保存随手记
     */
    @Override
    public int insertBoardNote(BoardNote boardNote) {
        boardNote.setAuthorId(ShiroUtils.getUserId());
        boardNote.setCreateBy(ShiroUtils.getLoginName());
        boardNote.setCreateTime(DateUtils.getNowDate());
        if (Objects.equals("-1", boardNote.getNoteType())){
            this.deleteDynamicHtml();
        }
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
        // 删除静态模板
        this.deleteDynamicHtml();
        return boardNoteMapper.updateById(boardNote);
    }

    @Override
    public int deleteBoardNoteByIds(String ids) {
        ArrayList<String> idList = new ArrayList<>(Arrays.asList(ids.split(",")));
        // 删除静态模板
        this.deleteDynamicHtml();
        return boardNoteMapper.deleteBatchIds(idList);
    }

    /**
     * 获取动态
     *
     * @param pageNum  当前页
     * @param pageSize 页大小
     * @param modelMap
     * @return
     */
    @Override
    public TableDataInfo dynamicList(Long pageNum, Long pageSize, ModelMap modelMap) {
        Page<BoardNote> dynamicPage = new Page<>(pageNum, pageSize);
        TableDataInfo dataInfo = new TableDataInfo();
        QueryWrapper<BoardNote> queryWrapper = new QueryWrapper<>();
        // note_type = -1 为动态类型 and is_public = 0 为公共
        queryWrapper.lambda().eq(BoardNote::getNoteType, "-1").and(i -> i.eq(BoardNote::getIsPublic, "0")).orderByDesc(BoardNote::getCreateTime);

        // 根据栏目id查询
        Page<BoardNote> mtoDynamicPage = boardNoteMapper.selectPage(dynamicPage, queryWrapper);
        if (ToolUtils.isNotEmpty(mtoDynamicPage)) {
            dataInfo.setRows(mtoDynamicPage.getRecords());
            dataInfo.setTotal(mtoDynamicPage.getTotal());
            dataInfo.setCurrentPage(mtoDynamicPage.getCurrent());
            dataInfo.setCurrentSize(mtoDynamicPage.getSize());
            dataInfo.setTotalPage(mtoDynamicPage.getPages());
        }
        return dataInfo;
    }

    /**
     * 删除静态页面
     */
    private void deleteDynamicHtml() {
        if (RuoYiConfig.isPageStaticEnabled()) {
            File directory = new File(RuoYiConfig.getHtmlPath() + File.separator);
            List<File> fileList = FileUtils.searchLikeFiles(directory, "dynamic-", false);
            fileList.parallelStream().forEach(file -> file.delete());
        }
    }
}
