package com.ruoyi.project.emmanuel.mto.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 博客内容对象 mto_post_attribute
 *
 * @author ruoyi
 * @date 2021-11-19
 */
public class MtoPostAttribute extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** post的id */
    private Long id;

    /** 文章 */
    @Excel(name = "")
    private String content;

    /** markdown 或 tinymce */
    @Excel(name = "")
    private String editor;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setEditor(String editor)
    {
        this.editor = editor;
    }

    public String getEditor()
    {
        return editor;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("content", getContent())
            .append("editor", getEditor())
            .toString();
    }
}
