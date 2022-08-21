package com.ruoyi.project.emmanuel.cloud.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.emmanuel.cloud.domain.CloudFile;
import com.ruoyi.project.emmanuel.cloud.domain.FileDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 网盘文件Mapper接口
 *
 * @author 一粒麦子
 * @date 2022-03-04
 */
public interface CloudFileMapper extends BaseMapper<CloudFile> {

    /**
     * 根据用户id查询总空间，已使用空间，用户名，用户头像
     *
     * @param userId 用户id
     * @return
     */
    FileDTO findUserInfo(Long userId);

    Integer updateCollectByIdList(@Param("isCollect") Integer isCollect, @Param("idList") List<Long> idList);

    List<CloudFile> findAllImages(CloudFile cloudFile);

    int isShare(Long fileId);

    int updatePublicByIdList(@Param("isPublic") Integer isPublic, @Param("idList") List<Long> idList);

    int updateShareById(@Param("isShare") Integer isShare,@Param("id") Long id);

    List<CloudFile> selectCloudFileList(CloudFile cloudFile);
}
