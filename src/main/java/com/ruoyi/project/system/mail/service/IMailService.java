package com.ruoyi.project.system.mail.service;

import java.util.List;
import com.ruoyi.project.system.mail.domain.Mail;

/**
 * 邮件记录 Service接口
 * 
 * @author 一粒麦子
 * @date 2022-07-22
 */
public interface IMailService 
{
    /**
     * 查询邮件记录 
     * 
     * @param id 邮件记录 主键
     * @return 邮件记录 
     */
    public Mail selectMailById(Long id);

    /**
     * 查询邮件记录 列表
     * 
     * @param mail 邮件记录 
     * @return 邮件记录 集合
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
     * 批量删除邮件记录 
     * 
     * @param ids 需要删除的邮件记录 主键集合
     * @return 结果
     */
    public int deleteMailByIds(String ids);

    /**
     * 删除邮件记录 信息
     * 
     * @param id 邮件记录 主键
     * @return 结果
     */
    public int deleteMailById(Long id);

    /**
     * 发送邮件
     * @param mail
     * @return
     */
    int sendMail(Mail mail);
}
