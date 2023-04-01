package com.ruoyi.project.emmanuel.account.domain;

import lombok.Data;

@Data
public class UserAccount {

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 账户id
     */
    private Long accountId;

    /**
     * 是否管理员：1管理员，0非管理员
     */
    private String administrators;
}
