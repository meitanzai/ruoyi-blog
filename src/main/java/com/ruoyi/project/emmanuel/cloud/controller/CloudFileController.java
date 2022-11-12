package com.ruoyi.project.emmanuel.cloud.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.cloud.domain.CloudFile;
import com.ruoyi.project.emmanuel.cloud.domain.FileDTO;
import com.ruoyi.project.emmanuel.cloud.service.ICloudFileService;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * 网盘文件Controller
 *
 * @author 一粒麦子
 * @date 2022-03-04
 */
@Controller
@RequestMapping("/cloud/file")
public class CloudFileController extends BaseController {

    private String prefix = "emmanuel/cloud";

    @Autowired
    private ICloudFileService cloudFileService;


    /**
     * 跳转到网盘页面
     *
     * @return
     */
    @GetMapping()
    public String cloudFile(Model model) {
        return prefix + "/index";
    }

    /**
     * 查询网盘文件列表
     */
    @GetMapping("/userInfo")
    @ResponseBody
    public FileDTO list(Model model) {
        FileDTO userInfo = cloudFileService.selectCloudFileByUserId();
        return userInfo;
    }

    /**
     * 文件/获取所有的文件
     *
     * @param model
     * @return
     */
    @GetMapping("/findAllFile")
    public String findAllFile(Model model) {
        cloudFileService.findAllFile(model);
        return prefix + "/file";
    }

    /**
     * 文件上传
     *
     * @param fileList
     * @return
     */
    @PostMapping("/uploadFiles")
    @ResponseBody
    public AjaxResult uploadFiles(@RequestParam("files") List<MultipartFile> fileList) {
        try {
            cloudFileService.uploadFiles(fileList);
        } catch (IOException e) {
            e.printStackTrace();
            return AjaxResult.error("文件上传失败:" + e.getMessage());
        }
        return AjaxResult.success("文件上传成功");
    }

    @PostMapping("/deleteRecycle")
    @ResponseBody
    public Integer deleteRecycle(@RequestParam("ids") Integer[] ids) {
        Integer integer = cloudFileService.deleteCloudFileByIds(ids);
        System.out.println("integer = " + integer);
        return integer;
    }

    /**
     * 单个文件 下载
     *
     * @param fileId   文件id
     * @param response
     * @throws IOException
     */
    @GetMapping("/downloadFile")
    public void downloadFile(Long fileId, HttpServletResponse response) {
        cloudFileService.downloadFile(fileId, response);
    }

    /**
     * 多文件下载
     *
     * @param idList
     * @param response
     * @throws IOException
     */
    @GetMapping("/downloadFileList")
    public void downloadFileList(@RequestParam("ids") List<Long> idList, HttpServletResponse response) throws IOException {
        cloudFileService.downloadFileList(idList, response);
    }

    /**
     * 单个文件收藏
     *
     * @param cloudFile
     * @return
     */
    @PostMapping("/setFavorite")
    @ResponseBody
    public Integer setFavorite(CloudFile cloudFile) {
        boolean b = cloudFileService.updateById(cloudFile);
        Integer status = 0;
        // status = 1 收藏成功,  status = 1 取消收藏,
        return status = b && Objects.equals(cloudFile.getIsCollect(), 1) ? 1 : 2;
    }

    /**
     * 批量收藏
     *
     * @param isCollect 是否收藏 (0 正常， 1收藏)
     * @param idList
     * @return
     */
    @PostMapping("/setFavorites")
    @ResponseBody
    public Integer setFavorites(Integer isCollect, @RequestParam("ids") List<Long> idList) {
        return cloudFileService.setFavorites(isCollect, idList);
    }

    /**
     * 加载图片页面
     *
     * @param sort
     * @param sortway
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/findAllImg")
    public String findAllImg(String sort,
                             @RequestParam(required = false, defaultValue = "desc") String sortway,
                             HttpSession session,
                             Model model) {
        cloudFileService.findAllImages(sort, sortway, session, model);
        return prefix + "/album";
    }

    /**
     * 设置分享 在关闭弹框的时候发送请求
     *
     * @param cloudFile
     * @return
     */
    @PostMapping("/setShare")
    @ResponseBody
    public Integer setShare(CloudFile cloudFile) {
        return cloudFileService.updateShareById(cloudFile);
    }

    /**
     * 分享链接下载
     */
    @GetMapping("/shareDownload")
    public void shareDownload(Long fileId, HttpServletResponse response) {
        cloudFileService.shareDownload(fileId, response);
    }

    /**
     * 条件模糊查询
     *
     * @param keys  模糊搜索
     * @param model
     * @return
     */
    @GetMapping("/findFilesByKey")
    public String findFileListByKey(String keys, String sort,
                                    @RequestParam(required = false, defaultValue = "asc") String sortway,
                                    Model model) {
        cloudFileService.findFileListByKey(keys, model);
        return prefix + "/file";
    }

    /**
     * 文件公开
     *
     * @param isPublic
     * @param idList
     * @return
     */
    @PostMapping("/setPublics")
    @ResponseBody
    public Integer setPublicList(Integer isPublic, @RequestParam("ids") List<Long> idList) {
        return cloudFileService.setPublicList(isPublic, idList);
    }

    @RequiresPermissions("file:Management:view")
    @GetMapping("/fileManagementHtml")
    public String file() {
        return prefix + "/fileManagement";
    }

    /**
     * 查询网盘文件列表
     */
    @RequiresPermissions("file:Management:view")
    @PostMapping("/fileManagement/list")
    @ResponseBody
    public TableDataInfo list(CloudFile cloudFile) {
        startPage();
        List<CloudFile> list = cloudFileService.selectCloudFileList(cloudFile);
        return getDataTable(list);
    }

    /**
     * 删除网盘文件
     */
    @RequiresPermissions("system:file:remove")
    @Log(title = "网盘文件", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        Integer[] idList = (Integer[]) ConvertUtils.convert(ids.split(","), Integer.class);
        return toAjax(cloudFileService.deleteCloudFileByIds(idList));
    }

    /**
     * 文件管理 - 单文件下载
     *
     * @param request
     * @param response
     */
    @RequiresPermissions("system:file:download")
    @Log(title = "文件下载", businessType = BusinessType.OTHER)
    @PostMapping("/downLoadOneFile")
    public void downLoadFile(@RequestParam("id") Long id, HttpServletRequest request, HttpServletResponse response) {
        cloudFileService.downLoadFile(id, request, response);
    }

    /**
     * 文件管理- 多文件批量ZIP下载
     *
     * @param idListStr
     * @param request
     * @param response
     */
    @RequiresPermissions("system:file:downloadBatch")
    @Log(title = "文件批量下载", businessType = BusinessType.OTHER)
    @PostMapping("/downloadBatch")
    public void downloadBatch(@RequestParam("idListStr") String idListStr, HttpServletRequest request, HttpServletResponse response) {
        cloudFileService.downloadBatch(idListStr, request, response);
    }
}
