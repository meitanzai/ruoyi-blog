package com.ruoyi.project.emmanuel.cloud.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.config.ServerConfig;
import com.ruoyi.project.emmanuel.cloud.domain.CloudFile;
import com.ruoyi.project.emmanuel.cloud.domain.FileDTO;
import com.ruoyi.project.emmanuel.cloud.mapper.CloudFileMapper;
import com.ruoyi.project.emmanuel.cloud.service.ICloudFileService;
import com.ruoyi.project.emmanuel.cloud.utils.FileTypeUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 网盘文件Service业务层处理
 *
 * @author 一粒麦子
 * @date 2022-03-04
 */
@Service
public class CloudFileServiceImpl extends ServiceImpl<CloudFileMapper, CloudFile> implements ICloudFileService {

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private CloudFileMapper cloudFileMapper;

    @Override
    public FileDTO selectCloudFileByUserId() {
        // 获取登录用户id
        Long userId = ShiroUtils.getUserId();
        QueryWrapper<CloudFile> queryWrapper = new QueryWrapper<>();
        LambdaQueryWrapper<CloudFile> eqUserId = queryWrapper.lambda().eq(CloudFile::getUserId, userId);
        // 获取用户文件总数
        Long fileTotal = cloudFileMapper.selectCount(eqUserId);
        // 查询总空间，已使用空间，用户名，用户头像
        FileDTO userInfo = cloudFileMapper.findUserInfo(userId);
        List<String> list = new LinkedList<>();
        //获取使用空间
        float usedSpace = userInfo.getUsedSpace();
        //获取总空间
        float totalSpace = userInfo.getTotalSpace();

        //得到百分比
        String percentage = String.format("%.2f", (usedSpace / (totalSpace * 1024 * 1024)) * 100) + "%";
        userInfo.setPercentage(percentage);

        //计算结果保留两位小数
        String usedSpaceToString = "0";
        if (usedSpace < 1024) {
            usedSpaceToString = usedSpace + "KB";
        } else if (usedSpace >= 1024 && usedSpace < 1048576) {
            BigDecimal b = new BigDecimal(usedSpace / 1024);
            float f1 = b.setScale(1, BigDecimal.ROUND_HALF_UP).floatValue();
            usedSpaceToString = f1 + "MB";
        } else {
            BigDecimal b = new BigDecimal(usedSpace / 1024 / 1024);
            float f2 = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
            usedSpaceToString = f2 + "GB";
        }
        userInfo.setUsedSpaceToString(usedSpaceToString);
        return userInfo;
    }

    @Override
    public void findAllFile(Model model) {
        Long userId = ShiroUtils.getUserId();
        QueryWrapper<CloudFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(CloudFile::getUserId, userId);
        List<CloudFile> allFilesList = cloudFileMapper.selectList(queryWrapper);
        // allFilesList = FileTypeUtils.IconFilesList(allFilesList);
        model.addAttribute("files", allFilesList);
        model.addAttribute("sort", "uploadtime");
        model.addAttribute("sortway", "desc");
        model.addAttribute("sorttip", "按上传时间排序");
    }

    @Override
    public void uploadFiles(List<MultipartFile> fileList) throws IOException {
        //获取userId
        Long userId = ShiroUtils.getUserId();
        //首先判断myfile表是否有数据（防止空指针异常）
        QueryWrapper<CloudFile> queryWrapper = new QueryWrapper<>();
        LambdaQueryWrapper<CloudFile> eqUserId = queryWrapper.lambda().eq(CloudFile::getUserId, userId);
        // 获取用户文件总数
        Long fileTotal = cloudFileMapper.selectCount(eqUserId);
        //准备数据
        FileDTO userInfo = new FileDTO();
        //循环遍历所有文件
        for (MultipartFile file : fileList) {

            //获取文件原始名称
            String oldfilename = file.getOriginalFilename();
            // 获取文件后缀名
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            //获取文件大小(单位kb)
            float size = (((float) file.getSize()) / 1024);
            // 获取文件类型
            String type = file.getContentType();
            // 上传文件
            userInfo = cloudFileMapper.findUserInfo(userId);
            // 上传总空间(由G划算为单位kb)
            float totalSpace = userInfo.getTotalSpace() * 1024 * 1024;
            String newfilename = "";
            if ((totalSpace - userInfo.getUsedSpace()) > size) {
                // file.transferTo(new File(path + newfilename)); //核心上传方法
                //生成新的文件访问路径
                newfilename = FileUploadUtils.upload(filePath, file);//核心上传方法
            } else {
                throw new RuntimeException("空间不足");
            }
            //将文件信息保存数据库
            CloudFile cloudFile = new CloudFile();
            cloudFile.setOldfilename(oldfilename);
            cloudFile.setFilePath(filePath);
            cloudFile.setNewfilename(StringUtils.substringAfterLast(newfilename, "/"));
            cloudFile.setExt(ext);
            cloudFile.setUrlPath(newfilename);
            cloudFile.setSize(size);
            cloudFile.setType(type);
            cloudFile.setUserId(userId);
            cloudFile.setUploadTime(DateUtils.getNowDate());
            cloudFile.setIsImg(type.startsWith("image") ? 1L : 0L);
            cloudFile.setIcon(FileTypeUtils.iconFile(type, ext));
            cloudFileMapper.insert(cloudFile);
        }
    }

    /**
     * 删除文件 / 逻辑删除
     *
     * @param idList
     * @return
     */
    @Override
    public Integer deleteCloudFileByIds(Integer[] idList) {
        return cloudFileMapper.deleteBatchIds(new ArrayList<>(Arrays.asList(idList)));
    }

    /**
     * 单个文件下载
     *
     * @param fileId   文件主键id
     * @param response
     */
    @Override
    public void downloadFile(Long fileId, HttpServletResponse response) {
        try {
            //获取文件信息
            CloudFile cloudFile = cloudFileMapper.selectById(fileId);
            this.downloadFile(cloudFile.getUrlPath(), response);
            //修改文件的下载次数
            cloudFile.setDowncounts(cloudFile.getDowncounts() + 1);
            cloudFileMapper.updateById(cloudFile);
        } catch (Exception e) {
            throw new RuntimeException("文件下载失败" + e.getMessage());
        }
    }

    @Override
    public void downloadFileList(List<Long> idList, HttpServletResponse response) {

        try {
            // //生成日期对象
            Date current_date = new Date();
            //设置日期格式化样式为：yyyy-MM-dd
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String zipfilename = simpleDateFormat.format(current_date);
            //设置清除缓存
            response.reset();
            // 不同类型的文件对应不同的MIME类型
            response.setContentType("application/x-msdownload");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(zipfilename, "utf-8") + ".zip");
            //
            // ZipOutputStream类：完成文件或文件夹的压缩
            ZipOutputStream zipOutputStream = new ZipOutputStream(response.getOutputStream());
            byte[] buf = new byte[1024];
            for (Long id : idList) {
                //获取文件信息
                CloudFile cloudFile = cloudFileMapper.selectById(id);
                // 本地资源路径
                String localPath = RuoYiConfig.getProfile();
                // 数据库资源地址
                String downloadPath = localPath + StringUtils.substringAfter(cloudFile.getUrlPath(), Constants.RESOURCE_PREFIX);
                //创建文件对象
                File file = new File(downloadPath);
                //创建输入流
                FileInputStream inputStream = new FileInputStream(file);
                // 给列表中的文件单独命名
                zipOutputStream.putNextEntry(new ZipEntry(file.getName()));
                int len;
                while ((len = inputStream.read(buf)) > 0) {
                    zipOutputStream.write(buf, 0, len);
                }
                zipOutputStream.closeEntry();
                inputStream.close();
                //修改文件的下载次数
                cloudFile.setDowncounts(cloudFile.getDowncounts() + 1);
                this.cloudFileMapper.updateById(cloudFile);
            }
            // zipOutputStream.close();
        } catch (Exception e) {
            throw new RuntimeException("文件下载失败：" + e.getMessage());
        }
    }

    /**
     * @param resource 数据库文件地址
     * @param response
     * @throws Exception
     */
    private void downloadFile(String resource, HttpServletResponse response) throws Exception {
        if (StringUtils.isEmpty(resource)) {
            throw new RuntimeException("路径不能为空");
        }
        // 本地资源路径
        String localPath = RuoYiConfig.getProfile();
        // 数据库资源地址
        String downloadPath = localPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
        // 下载名称
        String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        FileUtils.setAttachmentResponseHeader(response, downloadName);
        FileUtils.writeBytes(downloadPath, response.getOutputStream());
    }

    /**
     * * @param isCollect  是否收藏 (0 正常， 1收藏)
     *
     * @param idList
     * @return
     */
    @Override
    public Integer setFavorites(Integer isCollect, List<Long> idList) {
        Integer i = cloudFileMapper.updateCollectByIdList(isCollect, idList);
        //1: "收藏成功！可前往收藏夹查看"; 2 = "取消收藏成功";
        return i > 0 && Objects.equals(isCollect, 1) ? 1 : 2;
    }

    @Override
    public void findAllImages(String sort, String sortway, HttpSession session, Model model) {
        //保存
        if (sort == null) {
            if (session.getAttribute("sortimg") == null) {
                session.setAttribute("sortimg", "uploadtime");
            }
        } else {
            session.setAttribute("sortimg", sort);
        }

        // 获取用户id
        Long userId = ShiroUtils.getUserId();
        CloudFile cloudFile = new CloudFile();
        cloudFile.setUserId(userId);
        cloudFile.setSort((String) session.getAttribute("sortimg"));
        cloudFile.setSortway(sortway);
        List<CloudFile> allImageList = cloudFileMapper.findAllImages(cloudFile);
        String sorttip = FileTypeUtils.setSortTip((String) session.getAttribute("sortimg"));
        model.addAttribute("files", allImageList);
        model.addAttribute("sort", session.getAttribute("sortimg"));
        model.addAttribute("sortway", sortway);
        model.addAttribute("sorttip", sorttip);
    }

    @Override
    public void shareDownload(Long fileId, HttpServletResponse response) {
        // 先判断是否是分享链接
        int i = cloudFileMapper.isShare(fileId);
        if (i <= 0) {
            throw new RuntimeException("分享已过期");
        }
        // 下载
        this.downloadFile(fileId, response);
    }

    @Override
    public void findFileListByKey(String keys,  Model model) {
        // 获取用户id
        Long userId = ShiroUtils.getUserId();
        // 分析关键字
        List<String> keylist = FileTypeUtils.ParsingKeys(keys);
        // 搜索
        QueryWrapper<CloudFile> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(CloudFile::getUserId,userId)
                .eq(CloudFile::getIsRecycle,0)
                .like(CloudFile::getOldfilename,keylist.get(1));
        if (StringUtils.isNotEmpty(keylist.get(0))){
            queryWrapper.lambda().like(CloudFile::getType,keylist.get(0));
        }
        List<CloudFile> files = cloudFileMapper.selectList(queryWrapper);
        model.addAttribute("files", files);
    }

    @Override
    public Integer setPublicList(Integer isPublic, List<Long> idList) {
        int i = cloudFileMapper.updatePublicByIdList(isPublic, idList);
        return i>0?1:2;
    }

    @Override
    public int updateShareById(CloudFile cloudFile) {
        return cloudFileMapper.updateShareById(cloudFile.getIsShare(),cloudFile.getId());
    }
}
