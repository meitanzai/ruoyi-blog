package com.ruoyi.project.system.mail.mapper;

import java.util.List;
import com.ruoyi.project.system.mail.domain.Mail;

/**
 * 邮件记录Mapper接口
 * 
 * @author 一粒麦子
 * @date 2022-07-22
 */
public interface MailMapper 
{
    /**
     * 查询邮件记录
     * 
     * @param id 邮件记录主键
     * @return 邮件记录
     */
    public Mail selectMailById(Long id);

    /**
     * 查询邮件记录列表
     * 
     * @param mail 邮件记录
     * @return 邮件记录集合
     */
    public List<Mail> selectMailList(Mail mail);

    /**
     * 新增邮件记录
     * 
     * @param mail 邮件记录
     * @return 结果
     */
    public int insertMail(Mail mail);

    /**
     * 修改邮件记录
     * 
     * @param mail 邮件记录
     * @return 结果
     */
    public int updateMail(Mail mail);

    /**
     * 删除邮件记录
     * 
     * @param id 邮件记录主键
     * @return 结果
     */
    public int deleteMailById(Long id);

    /**
     * 批量删除邮件记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMailByIds(String[] ids);
}
