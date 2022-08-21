package com.ruoyi.project.emmanuel.cloud.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.emmanuel.cloud.domain.CloudFile;
import com.ruoyi.project.emmanuel.cloud.domain.FileDTO;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 网盘文件Service接口
 *
 * @author 一粒麦子
 * @date 2022-03-04
 */
public interface ICloudFileService extends IService<CloudFile> {

    FileDTO selectCloudFileByUserId();

    void findAllFile(Model model);

    void uploadFiles(List<MultipartFile> fileList) throws IOException;

    /**
     * 删除文件
     *
     * @param idList
     * @return
     */
    Integer deleteCloudFileByIds(Integer[] idList);

    /**
     * 单个文件下载
     *
     * @param fileId   文件主键id
     * @param response
     */
    void downloadFile(Long fileId, HttpServletResponse response);

    void downloadFileList(List<Long> idList, HttpServletResponse response);

    /**
     * * @param isCollect  是否收藏 (0 正常， 1收藏)
     *
     * @param idList
     * @return
     */
    Integer setFavorites(Integer isCollect, List<Long> idList);

    void findAllImages(String sort, String sortway, HttpSession session, Model model);

    void shareDownload(Long fileId, HttpServletResponse response);

    void findFileListByKey(String keys, Model model);

    Integer setPublicList(Integer ispublic, List<Long> idList);

    int updateShareById(CloudFile cloudFile);

    List<CloudFile> selectCloudFileList(CloudFile cloudFile);
}
