package com.ruoyi.project.emmanuel.mto.domain;

import lombok.Data;

@Data
public class WebAbout {


    private String id;
    /**
     * 侧边栏关于本周 头像
     */
    private String abAvatar;
    /**
     * 侧边栏关于本周 name
     */
    private String abName;
    /**
     * 侧边栏关于本周 描述
     */
    private String abText;

}
