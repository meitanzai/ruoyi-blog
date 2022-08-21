package com.ruoyi.project.monitor.job.task;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.MailUtils;
import com.ruoyi.project.emmanuel.account.mapper.AccountMoneyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 定时任务调度-账单信息
 */
@Component("billTask")
public class BillTask {

    @Autowired
    private AccountMoneyMapper moneyMapper;

    /**
     * 获取当前上一周的账单
     */
    public void getPreWeekBill() {

        // 上周周一
        Date preWeekMonday = DateUtils.getPreWeekMonday(new Date());
        Map<String, Integer> weekOfYear = DateUtils.getWeekOfYear(preWeekMonday);

        DateUtils.addDays(preWeekMonday,6);
        List<Map<String, Object>> preWeekBillList = moneyMapper.getPreWeekBill(preWeekMonday);

        Map<Object, List<Map<String, Object>>> groupByAccountId = preWeekBillList.stream().collect(Collectors.groupingBy(x -> x.get("accountId").toString()));

        for (Map.Entry<Object, List<Map<String, Object>>> entry : groupByAccountId.entrySet()) {

            // 组织发送邮件内容
            String table = "";
            for (Map<String, Object> map : entry.getValue()) {
                table += "<td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">" + map.get("accountName") + "</td>" +
                        "<td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\"><span t=\"5\" times=\"\" style=\"border-bottom: 1px dashed rgb(204, 204, 204);\">" + map.get("moneyDate") + "</span><br></td>" +
                        "<td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">" + map.getOrDefault("moneyPay", 0.00) + "<br></td>" +
                        "<td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">" + map.getOrDefault("moneyIncome", 0.00) + "</td></tr>";
            }

            String billContent = "<div><br></div><div><table border=\"1\" width=\"500\" cellpadding=\"10\" cellspacing=\"0\" align=\"center\" class=\"table table-bordered\"><tbody><tr></tr><tr><td style=\"text-align: center;\" colspan=\"4\">"+weekOfYear.get("iYear")+"年第"+weekOfYear.get("week")+"周"+"</td></tr><tr><td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">账单名称</td><td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">日期</td><td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">支出</td><td style=\"font-family: &quot;lucida Grande&quot;, Verdana; font-size: 12px; -webkit-font-smoothing: subpixel-antialiased; text-align: center;\" align=\"center\">收入</td></tr><tr>" +
                    table +
                    "</tr></tbody></table></div>";

            // 获取收件人
            List<String> mailList = moneyMapper.getUserMail(entry.getKey().toString(), preWeekMonday);
            // 发送邮件
            if (mailList.size() > 0 && mailList != null) {
                MailUtils.sendMailHtml(null, mailList.toArray(new String[mailList.size()]), weekOfYear.get("iYear")+"年第"+weekOfYear.get("week")+"周账单", billContent, "消费邮件", "系统邮件");
            }
        }

    }

}
