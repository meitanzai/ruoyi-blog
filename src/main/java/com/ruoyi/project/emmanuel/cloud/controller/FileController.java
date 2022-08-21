package com.ruoyi.project.emmanuel.cloud.controller;


import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.emmanuel.cloud.domain.CloudFile;
import com.ruoyi.project.emmanuel.cloud.service.ICloudFileService;
import com.ruoyi.project.emmanuel.cloud.service.impl.FileUploadService;
import com.ruoyi.project.emmanuel.cloud.service.impl.FileUploader;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/upload")
public class FileController extends BaseController {

    private String prefix = "emmanuel/cloud";

    @Resource
    private FileUploadService uploadService;

    /**
     * 跳转到上传页面
     *
     * @return
     */
    @GetMapping("/uploader")
    public String cloudFile(Model model) {
        return prefix + "/fileUpload";
    }


    /**
     * 分片上传
     *
     * @param request  前台发送过来的文件内容
     * @param response 响应给前台文件路径
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/upload/uploadChunk", method = RequestMethod.POST)
    public void uploadChunk(HttpServletRequest request, HttpServletResponse response) {
        final String[] filepath = {""};
        final String[] or_filename = {""};
        try {
            uploadService.postUpload(request, new FileUploader.UploadListener() {
                @Override
                public void callback(String status, String filename, String original_filename, String identifier, String fileType) {
                    if (status != null) {
                        logger.info("分片上传：{}", filename);
                    }
                    filepath[0] = filename;//文件上传的路径带走
                    or_filename[0] = original_filename;//源文件名称
                }
            });

            //这句话的意思，是让浏览器用utf8来解析返回的数据
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            //这句话的意思，是告诉servlet用UTF-8转码，而不是用默认的ISO8859
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println("上传成功");

//            response.getWriter().append(filepath[0]);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * 校验秒传
     *
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upload/uploadChunk", method = RequestMethod.GET)
    public Boolean get(HttpServletRequest request, HttpServletResponse response) {
        String identifier = request.getParameter("identifier");
        return false;
    }

}