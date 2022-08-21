package com.ruoyi.project.system.mail.service.impl;

import java.util.List;
import java.util.Objects;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.MailUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.apache.poi.xdgf.usermodel.shape.ShapeRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mail.mapper.MailMapper;
import com.ruoyi.project.system.mail.domain.Mail;
import com.ruoyi.project.system.mail.service.IMailService;
import com.ruoyi.common.utils.text.Convert;

import javax.mail.MessagingException;

/**
 * 邮件记录 Service业务层处理
 *
 * @author 一粒麦子
 * @date 2022-07-22
 */
@Service
public class MailServiceImpl implements IMailService {

    @Autowired
    private MailMapper mailMapper;

    /**
     * 查询邮件记录
     *
     * @param id 邮件记录 主键
     * @return 邮件记录
     */
    @Override
    public Mail selectMailById(Long id) {
        return mailMapper.selectMailById(id);
    }

    /**
     * 查询邮件记录 列表
     *
     * @param mail 邮件记录
     * @return 邮件记录
     */
    @Override
    public List<Mail> selectMailList(Mail mail) {
        return mailMapper.selectMailList(mail);
    }

    /**
     * 新增邮件记录
     *
     * @param mail 邮件记录
     * @return 结果
     */
    @Override
    public int insertMail(Mail mail) {
        mail.setDelFlag(0);
        mail.setCreateTime(DateUtils.getNowDate());
        mail.setCreateBy(StringUtils.isNotBlank(mail.getCreateBy()) ? mail.getCreateBy() : ShiroUtils.getLoginName());
        return mailMapper.insertMail(mail);
    }

    /**
     * 修改邮件记录
     *
     * @param mail 邮件记录
     * @return 结果
     */
    @Override
    public int updateMail(Mail mail) {
        mail.setUpdateTime(DateUtils.getNowDate());
        return mailMapper.updateMail(mail);
    }

    /**
     * 批量删除邮件记录
     *
     * @param ids 需要删除的邮件记录 主键
     * @return 结果
     */
    @Override
    public int deleteMailByIds(String ids) {
        return mailMapper.deleteMailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邮件记录 信息
     *
     * @param id 邮件记录 主键
     * @return 结果
     */
    @Override
    public int deleteMailById(Long id) {
        return mailMapper.deleteMailById(id);
    }

    /**
     * 发送邮件
     *
     * @param mail
     * @return
     */
    @Override
    public int sendMail(Mail mail) {

        if (StringUtils.isBlank(mail.getMailFrom()))
            throw new RuntimeException("发送者为空，请先配置邮件");
        if (!MailUtils.isSendMail(mail.getMailFrom(), new String[]{mail.getMailTo()}, mail.getMailTitle(), mail.getMailContent()))
            throw new RuntimeException("邮件未配置，请先配置邮件");
        Boolean b = MailUtils.sendMailHtml(mail.getMailFrom(), new String[]{mail.getMailTo()}, mail.getMailTitle(), mail.getMailContent(), "发送邮件", ShiroUtils.getLoginName());
        return b ? 1 : 0;
    }
}
