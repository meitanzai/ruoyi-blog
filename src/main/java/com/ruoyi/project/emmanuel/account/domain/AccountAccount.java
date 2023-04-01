package com.ruoyi.project.emmanuel.account.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 记账账户对象 account_account
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public class AccountAccount extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 账户封面/图片 */
    @Excel(name = "账户封面/图片")
    private String cover;

    /** 账户分类 */
    @Excel(name = "账户分类")
    private String accountName;

    /** 账本介绍 */
    @Excel(name = "账本介绍")
    private String accountIntroduce;

    /** 账本状态（0显示 1隐藏） */
    @Excel(name = "账本状态", readConverterExp = "0=显示,1=隐藏")
    private String visible;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Integer orderNum;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCover(String cover)
    {
        this.cover = cover;
    }

    public String getCover()
    {
        return cover;
    }
    public void setAccountName(String accountName)
    {
        this.accountName = accountName;
    }

    public String getAccountName()
    {
        return accountName;
    }
    public void setAccountIntroduce(String accountIntroduce)
    {
        this.accountIntroduce = accountIntroduce;
    }

    public String getAccountIntroduce()
    {
        return accountIntroduce;
    }
    public void setVisible(String visible)
    {
        this.visible = visible;
    }

    public String getVisible()
    {
        return visible;
    }
    public void setOrderNum(Integer orderNum)
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum()
    {
        return orderNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("cover", getCover())
            .append("accountName", getAccountName())
            .append("accountIntroduce", getAccountIntroduce())
            .append("visible", getVisible())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }

    /**
     * 非数据库字段 用户ID
     */
    private Long userId;

    /**
     * 非数据库字段 账户管理员：0非管理员，1管理员
     */
    private String administrators;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAdministrators() {
        return administrators;
    }

    public void setAdministrators(String administrators) {
        this.administrators = administrators;
    }
}
