package com.ruoyi.project.system.mail.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.mail.domain.Mail;
import com.ruoyi.project.system.mail.service.IMailService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 邮件记录 Controller
 *
 * @author 一粒麦子
 * @date 2022-07-22
 */
@Controller
@RequestMapping("/system/mail")
public class MailController extends BaseController {

    private String prefix = "system/mail";

    @Autowired
    private IMailService mailService;

    @Value("${spring.mail.username}")
    private String mailFrom;

    @RequiresPermissions("system:mail:view")
    @GetMapping()
    public String mail() {
        return prefix + "/mail";
    }

    /**
     * 查询邮件记录 列表
     */
    @RequiresPermissions("system:mail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Mail mail) {
        startPage();
        List<Mail> list = mailService.selectMailList(mail);
        return getDataTable(list);
    }

    /**
     * 新增邮件记录
     */
    @GetMapping("/add")
    public String add(ModelMap modelMap) {
        modelMap.put("mailFrom", mailFrom);
        return prefix + "/add";
    }

    /**
     * 新增保存邮件记录
     */
    @RequiresPermissions("system:mail:add")
    @Log(title = "邮件记录 ", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated Mail mail) {
        mail.setMailFrom(mailFrom);
        return toAjax(mailService.sendMail(mail));
    }

    /**
     * 修改邮件记录
     */
    @RequiresPermissions("system:mail:detail")
    @GetMapping("/selectById/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Mail mail = mailService.selectMailById(id);
        mmap.put("mail", mail);
        return prefix + "/detail";
    }


    /**
     * 删除邮件记录
     */
    @RequiresPermissions("system:mail:remove")
    @Log(title = "邮件记录 ", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(mailService.deleteMailByIds(ids));
    }
}
