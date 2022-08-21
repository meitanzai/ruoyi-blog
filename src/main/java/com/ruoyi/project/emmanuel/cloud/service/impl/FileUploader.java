package com.ruoyi.project.emmanuel.cloud.service.impl;


import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.project.emmanuel.cloud.domain.CloudFile;
import com.ruoyi.project.emmanuel.cloud.mapper.CloudFileMapper;
import com.ruoyi.project.emmanuel.cloud.utils.FileTypeUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Iterator;
import java.util.UUID;

/**
 * 断点续传
 *
 * @author
 */
public class FileUploader {

    private Logger logger = LoggerFactory.getLogger(FileUploader.class);

    @Autowired
    public CloudFileMapper cloudFileMapper;

    /**
     * 临时文件夹
     */
    private String temporaryFolder;

    /**
     * 最大文件大小 2GB
     */
    private Integer maxFileSize = 2048000000;

    public FileUploader(String temporaryFolder, String fileParameterName) {
        this.temporaryFolder = temporaryFolder;
        File file = new File(temporaryFolder);
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    public String cleanIdentifier(String identifier) {
        return identifier.replaceAll("[^0-9A-Za-z_-]", "");
    }

    public String getChunkFilename(int chunkNumber, String identifier) {
        identifier = cleanIdentifier(identifier);
        return new File(temporaryFolder, "jwj-" + identifier + '-' + chunkNumber).getAbsolutePath();
    }

    public String validateRequest(int chunkNumber, int chunkSize, int totalSize, String identifier, String filename, Integer fileSize) {

        identifier = cleanIdentifier(identifier);

        if (chunkNumber == 0 || chunkSize == 0 || totalSize == 0 || identifier.length() == 0 || filename.length() == 0) {
            return "non_uploader_request";
        }
        int numberOfChunks = (int) Math.max(Math.floor(totalSize / (chunkSize * 1.0)), 1);
        if (chunkNumber > numberOfChunks) {
            return "invalid_uploader_request1";
        }

        if (this.maxFileSize != null && totalSize > this.maxFileSize) {
            return "invalid_uploader_request2";
        }

        if (fileSize != null) {
            if (chunkNumber < numberOfChunks && fileSize != chunkSize) {
                return "invalid_uploader_request3";
            }
            if (numberOfChunks > 1 && chunkNumber == numberOfChunks
                    && fileSize != ((totalSize % chunkSize) + chunkSize)) {
                return "invalid_uploader_request4";
            }
            if (numberOfChunks == 1 && fileSize != totalSize) {
                return "invalid_uploader_request5";
            }
        }

        return "valid";
    }

    public void getUpload(HttpServletRequest request, UploadListener listener) {
        // 获取参数
        Integer chunkNumber = Integer.parseInt(request.getParameter("chunkNumber"));
        Integer chunkSize = Integer.parseInt(request.getParameter("chunkSize"));
        Integer totalSize = Integer.parseInt(request.getParameter("totalSize"));
        String identifier = request.getParameter("identifier");
        String fileName = request.getParameter("filename");

        if (validateRequest(chunkNumber, chunkSize, totalSize, identifier, fileName, null).equals("valid")) {
            String chunkFilename = getChunkFilename(chunkNumber, identifier);
            if (new File(chunkFilename).exists()) {
                listener.callback("found", chunkFilename, fileName, identifier, null);
            } else {
                listener.callback("not_found", null, null, null, null);
            }

        } else {
            listener.callback("not_found", null, null, null, null);
        }
    }


    /**
     * 上传
     *
     * @param request
     * @param listener
     * @throws IllegalStateException
     * @throws IOException
     */
    public void postUpload(HttpServletRequest request, UploadListener listener) throws IllegalStateException, IOException {

        // 判断文件夹是否存在，不存在则创建
        File filePath = new File(temporaryFolder);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }

        // 获取参数
        Integer chunkNumber = Integer.parseInt(request.getParameter("chunkNumber"));
        Integer chunkSize = Integer.parseInt(request.getParameter("chunkSize"));
        Integer totalSize = Integer.parseInt(request.getParameter("totalSize"));
        String identifier = request.getParameter("identifier");
        String fileName = request.getParameter("filename");


        // 创建一个通用的多部分解析器.
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());

        if (multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 获取multiRequest 中所有的文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                String name = iter.next();
                MultipartFile file = multiRequest.getFile(name);
                if (file != null && file.getSize() > 0) {
                    String oldFileName = file.getOriginalFilename();
                    String validation = validateRequest(chunkNumber, chunkSize, totalSize, identifier, fileName,(int) file.getSize());

                    if ("valid".equals(validation)) {
                        String chunkFilename = getChunkFilename(chunkNumber, identifier);

                        File f = new File(chunkFilename);
                        if (!f.exists()) {
                            file.transferTo(f);
                        }

                        int currentTestChunk = 1;
                        int numberOfChunks = (int) Math.max(Math.floor(totalSize / (chunkSize * 1.0)), 1);
                        currentTestChunk = this.mergeChunks(request,currentTestChunk, chunkNumber, numberOfChunks, chunkFilename, oldFileName, identifier, listener, "file",totalSize);

                    } else {
                        listener.callback(validation, fileName, oldFileName, identifier, "file");
                    }
                } else {
                    listener.callback("invalid_uploader_request", null, null, null, null);
                }
            }
        }

    }

    private void pipeChunk(int number, String identifier, UploadOptions options, OutputStream writableStream) throws IOException {
        String chunkFilename = getChunkFilename(number, identifier);
        if (new File(chunkFilename).exists()) {
            FileInputStream inputStream = new FileInputStream(new File(chunkFilename));
            int maxlen = 1024;
            int len = 0;
            try {
                byte[] buff = new byte[maxlen];
                while ((len = inputStream.read(buff, 0, maxlen)) > 0) {
                    writableStream.write(buff, 0, len);
                }
            } finally {
                inputStream.close();
            }
            pipeChunk(number + 1, identifier, options, writableStream);
        } else {
            if (options.end)
                writableStream.close();
            if (options.listener != null)
                options.listener.onDone();
        }
    }

    public void write(String identifier, OutputStream writableStream, UploadOptions options) throws IOException {
        if (options == null) {
            options = new UploadOptions();
        }
        if (options.end == null) {
            options.end = true;
        }
        pipeChunk(1, identifier, options, writableStream);
    }

    /**
     * 合并分片
     *
     * @param currentTestChunk
     * @param chunkNumber      当前上传块
     * @param numberOfChunks   总块数
     * @param filename         文件名称
     * @param oldFileName      源文件名称
     * @param identifier       文件
     * @param listener         监听
     * @param fileType
     * @return
     */
    private int mergeChunks(HttpServletRequest request,int currentTestChunk, int chunkNumber, int numberOfChunks, String filename, String oldFileName, String identifier, UploadListener listener, String fileType,Integer totalSize) {
        String cfile = getChunkFilename(currentTestChunk, identifier);
        if (new File(cfile).exists()) {
            currentTestChunk++;
            if (currentTestChunk >= chunkNumber) {

                if (chunkNumber == numberOfChunks) {
                    try {
                        logger.info("文件上传完成，开始合并……");
                        // 文件合并
                        UploadOptions options = new UploadOptions();
                        String newFileName = oldFileName.substring(0, oldFileName.lastIndexOf(".")) + "-" + UUID.randomUUID() + "." + FilenameUtils.getExtension(oldFileName);
                        File f = new File(this.temporaryFolder, newFileName);
                        options.listener = new UploadDoneListener() {
                            @Override
                            public void onError(Exception err) {
                                listener.callback("invalid_uploader_request", f.getAbsolutePath(), oldFileName, identifier, fileType);
                                clean(identifier, null);
                            }

                            @Override
                            public void onDone() {
                                listener.callback("done", f.getAbsolutePath(), oldFileName, identifier, fileType);
                                clean(identifier, null);
                            }
                        };
                        this.write(identifier, new FileOutputStream(f), options);
                        logger.info("文件合并完成……");
                        this.saveFile(request,oldFileName, temporaryFolder, newFileName, identifier,totalSize,fileType);
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                        listener.callback("invalid_uploader_request", filename, oldFileName, identifier, fileType);
                    } catch (IOException e) {
                        e.printStackTrace();
                        listener.callback("invalid_uploader_request", filename, oldFileName, identifier, fileType);
                    }
                } else {
                    listener.callback("partly_done", filename, oldFileName, identifier, fileType);
                }
            } else {
                return mergeChunks(request,currentTestChunk, chunkNumber, numberOfChunks, filename, oldFileName,identifier, listener, fileType,totalSize);
            }
        } else {
            listener.callback("partly_done", filename, oldFileName, identifier, fileType);
        }
        return currentTestChunk;
    }


    public void clean(String identifier, UploadOptions options) {
        if (options == null) {
            options = new UploadOptions();
        }
        pipeChunkRm(1, identifier, options);
    }

    private void pipeChunkRm(int number, String identifier, UploadOptions options) {

        String chunkFilename = getChunkFilename(number, identifier);
        File file = new File(chunkFilename);
        if (file.exists()) {
            try {
                file.delete();
            } catch (Exception e) {
                if (options.listener != null) {
                    options.listener.onError(e);
                }
            }
            pipeChunkRm(number + 1, identifier, options);

        } else {
            if (options.listener != null)
                options.listener.onDone();
        }
    }

    public static interface UploadListener {
        public void callback(String status, String filename, String oldFileName, String identifier,
                             String fileType);
    }

    public static interface UploadDoneListener {
        public void onDone();

        public void onError(Exception err);
    }

    public static class UploadOptions {
        public Boolean end;
        public UploadDoneListener listener;
    }

    /**
     * 保存
     */
    private void saveFile(HttpServletRequest request,String oldFileName, String filePath, String newfilename, String identifier,Integer totalSize,String fileType) {

        CloudFile cloudFile = new CloudFile();
        cloudFile.setOldfilename(oldFileName);
        cloudFile.setUrlPath((Constants.RESOURCE_PREFIX + (filePath + "/" + newfilename).substring((RuoYiConfig.getProfile().length()))));
        cloudFile.setNewfilename(newfilename);
        cloudFile.setExt(FilenameUtils.getExtension(oldFileName));
        cloudFile.setFilePath(filePath);
        cloudFile.setSize((((float) totalSize) / 1024));
        String fileEnd = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
        cloudFile.setType(fileEnd);
        cloudFile.setUserId(ShiroUtils.getUserId());
        cloudFile.setUploadTime(DateUtils.getNowDate());
        cloudFile.setIsImg( ArrayUtils.contains(MimeTypeUtils.IMAGE_EXTENSION, fileEnd) ? 1L : 0L);
        cloudFile.setIcon(FileTypeUtils.iconFile(fileEnd, FilenameUtils.getExtension(oldFileName)));
        cloudFileMapper.insert(cloudFile);
    }

}