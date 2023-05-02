package com.ruoyi.project.emmanuel.mto.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.AddressUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.IpUtils;
import com.ruoyi.common.utils.ToolUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.emmanuel.mto.domain.MtoComment;
import com.ruoyi.project.emmanuel.mto.mapper.MtoCommentMapper;
import com.ruoyi.project.emmanuel.mto.service.IMtoCommentService;
import com.ruoyi.project.emmanuel.mto.service.IWebPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class MtoCommentServiceImpl extends ServiceImpl<MtoCommentMapper, MtoComment> implements IMtoCommentService {

    @Autowired
    private MtoCommentMapper commentMapper;

    @Autowired
    private IWebPostService postService;

    @Override
    public void messageBoard(ModelMap modelMap) {
        // 获取导航
        postService.selectCategory(modelMap);
        // 获取侧边栏
        postService.publicWeb(modelMap);
    }

    /**
     * 留言板新增留言，博客新增评论
     *
     * @param comment
     * @param request
     * @return
     */
    @Override
    public int insert(MtoComment comment, HttpServletRequest request) {
        if (comment.getPId() == null || Objects.equals(0L, comment.getPId())) {
            comment.setAncestors("0");
            comment.setPId(0L);
        } else {
            // 查询上级信息
            MtoComment pInfo = commentMapper.selectById(comment.getPId());
            comment.setAncestors(pInfo.getAncestors() + "," + comment.getPId());
            comment.setParentNickName(pInfo.getNickName());
        }
        comment.setStatus("0");
        String ipAddr = IpUtils.getIpAddr(request);
        comment.setIp(ToolUtils.isEmpty(IpUtils.inetAton(ipAddr)) ? null : String.valueOf(IpUtils.inetAton(ipAddr)));
        try {
            comment.setIpAddr(AddressUtils.getRemoteAddressByIP(ipAddr));
        } catch (Exception e) {
            e.printStackTrace();
        }
        comment.setCreateTime(DateUtils.getNowDate());
        return commentMapper.insert(comment);
    }

    /**
     * 查询留言
     *
     * @return
     */
    @Override
    public void selectCommentList(ModelMap modelMap, Integer pageNum, Integer pageSize) {
        // 只查询一级
        QueryWrapper<MtoComment> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(MtoComment::getPId, 0L)
                .eq(MtoComment::getPostId, 0L)
                .eq(MtoComment::getStatus, "1")
                .orderByDesc(MtoComment::getCreateTime);
        Page<MtoComment> commentPage = commentMapper.selectPage(new Page<>(pageNum, pageSize), wrapper);
        List<MtoComment> allComment =commentPage.getRecords();
                allComment.stream().forEach(e -> {
                    e.setCreateTimeFormt(DateUtils.getShortTime(e.getCreateTime()));
                    List<MtoComment> sonCommentList = commentMapper.selectAllLowerLevel(e.getId());
                    sonCommentList.forEach(k->k.setCreateTimeFormt(DateUtils.getShortTime(k.getCreateTime())));
                    e.setReplyComments(sonCommentList);
                }
        );
        modelMap.put("comments", allComment);
        modelMap.put("pageNum", commentPage.getCurrent());
        modelMap.put("pageSize", commentPage.getSize());
        modelMap.put("totalPage", commentPage.getPages());
        modelMap.put("total", commentPage.getTotal());
    }

    /**
     * 查看博客评论
     *
     * @param comment
     * @return
     */
    @Override
    public List<MtoComment> getBlogMessage(MtoComment comment) {
        Long postId = comment.getPostId();
        List<MtoComment> commentList = new ArrayList<>();
        if (null != postId) {
            commentList = commentMapper.selectByPostId(postId);
            commentList.stream().forEach(e -> {
                if (Objects.equals("1",e.getBelow())) {
                    e.setReplyComments(commentMapper.selectByPid(e.getId()));
                }
            });
        }
        return commentList;
    }

    /**
     * 查询评论管理列表
     *
     * @param mtoComment
     * @return
     */
    @Override
    public List<MtoComment> selectMtoCommentList(MtoComment mtoComment) {
        return commentMapper.selectMtoCommentList(mtoComment);
    }

    /**
     * 批量删除留言
     *
     * @param ids 需要删除的留言主键
     * @return 结果
     */
    @Override
    public int deleteMtoCommentByIds(String ids) {
        String[] idArr = Convert.toStrArray(ids);
        int i = 0;
        for (String id : idArr) {
           i = i+ commentMapper.deleteMtoCommentRecursion(id);
        }
        return i;
    }

    /**
     * 批量审核评论管理
     *
     * @param ids
     * @return
     */
    @Override
    public int examineMtoCommentByIds(String ids) {
        return commentMapper.examineMtoCommentByIds(Convert.toStrArray(ids), ShiroUtils.getLoginName(),DateUtils.getNowDate());
    }
}
