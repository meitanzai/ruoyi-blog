package com.ruoyi.project.emmanuel.cloud.service.impl;
 

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.Seq;
import com.ruoyi.framework.config.RuoYiConfig;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;

@Service
public class FileUploadService extends FileUploader {

    public FileUploadService(){
        // 上传文件博客路径
        super(StringUtils.format("{}/{}",RuoYiConfig.getUploadPath(), DateUtils.datePath()),"file");
    }


}