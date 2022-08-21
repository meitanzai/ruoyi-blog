package com.ruoyi.project.emmanuel.cloud.domain;

import lombok.Data;

@Data
public class FileDTO {

    /**
     * 已使用空间
     */
    private float usedSpace;

    /**
     * 拼接单位后的 已使用空间
     */
    private String usedSpaceToString;

    /**
     * 总空间
     */
    private float totalSpace;

    /**
     * 百分比
     */
    private String percentage;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 用户名称
     */
    private String userName;


}
