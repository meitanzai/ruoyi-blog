package com.ruoyi.project.emmanuel.index.controller;

import com.ruoyi.framework.interceptor.annotation.RepeatSubmit;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.mto.domain.MtoComment;
import com.ruoyi.project.emmanuel.mto.service.IMtoCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/blog/message")
public class MessageBoardController extends BaseController {

    private String prefix = "emmanuel/web";

    @Autowired
    private IMtoCommentService mtoCommentService;

    /**
     * 跳转到留言板页面(查询导航和侧边栏)
     *
     * @param modelMap
     * @return
     */
    @GetMapping("/messageBoard")
    public String messageBoard(ModelMap modelMap) {
        // 查询导航和侧边栏
        mtoCommentService.messageBoard(modelMap);
        return prefix + "/comment";
    }

    /**
     * 留言板提交
     *
     * @param comment
     * @return
     */
    @PostMapping("/submitMessage")
    @RepeatSubmit(interval = 5000,message = "您手速太快啦")
    public String submitMessageBoard(@Validated MtoComment comment, HttpServletRequest request) {
        try {
            mtoCommentService.insert(comment,request);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("留言失败,刷新页面后试试");
        }
        return "redirect:/blog/message/messageInfo";
    }

    /**
     * 留言区域
     *
     * @param modelMap
     * @return
     */
    @GetMapping("/messageInfo")
    public String messageInfo(ModelMap modelMap) {
        List<MtoComment> comments = mtoCommentService.selectCommentList();
        modelMap.put("comments", comments);
        return prefix + "/comment :: commentList";
    }


    /**
     * 新增评论
     * @param comment
     * @param request
     * @return
     */
    @ResponseBody
    @PostMapping("/submitBlogMessage")
    @RepeatSubmit(interval = 5000,message = "您手速太快啦")
    public AjaxResult submitMessage(@Validated MtoComment comment, HttpServletRequest request) {
        try {
            mtoCommentService.insert(comment,request);
            return AjaxResult.success("留言被精选后将公开");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("留言失败,刷新页面后试试");
        }
    }

    /**
     * 查询博客评论
     * @return
     */
    @ResponseBody
    @PostMapping("/comments")
    public TableDataInfo getBlogMessage(MtoComment comment) {
        startPage();
        List<MtoComment> list = mtoCommentService.getBlogMessage(comment);
        return getDataTableReturnPageInfo(list);
    }
}
