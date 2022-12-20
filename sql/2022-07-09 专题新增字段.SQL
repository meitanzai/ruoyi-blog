ALTER TABLE mto_LINK ADD COLUMN  `status` INT DEFAULT 0 COMMENT '状态：0正常，1隐藏' ;
ALTER TABLE mto_CHANNEL ADD COLUMN  `type` INT DEFAULT 1 COMMENT '类型：1分类，2专题' ;

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '文件管理', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-map', 'admin', '2022-06-19 08:38:03', 'admin', '2022-06-19 08:38:11', '');
INSERT INTO `sys_menu` (`menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES ('上传文件', 8, 0, '/upload/uploader', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2022-06-19 08:39:22', 'admin', '2022-06-19 08:41:14', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1145, '博客清空静态页面', 1078, 7, '#', 'menuItem', 'F', '0', '1', 'mto:post:cleasrStaticPage', '#', 'admin', '2022-07-10 12:52:28', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1146, '文件管理', 8, 1, '/cloud/file/fileManagementHtml', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-07-16 07:45:58', '', NULL, '');

-- 邮件菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1145, '邮件管理', 1, 9, '/system/mail', 'menuItem', 'C', '0', '1', 'system:mail:view', '#', 'admin', '2022-07-22 14:18:46', '一粒麦子', '2022-07-23 11:13:22', '【请填写功能名称】菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1146, '【邮件】查询', 1145, 1, '#', '', 'F', '0', '1', 'system:mail:list', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1147, '【邮件】发送', 1145, 2, '#', '', 'F', '0', '1', 'system:mail:add', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1148, '【邮件】查看', 1145, 3, '#', '', 'F', '0', '1', 'system:mail:detail', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1149, '【邮件】删除', 1145, 4, '#', '', 'F', '0', '1', 'system:mail:remove', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');

-- 邮件表
DROP TABLE IF EXISTS `sys_mail`;
CREATE TABLE `sys_mail` (
                            `id` int(20) NOT NULL AUTO_INCREMENT,
                            `mail_title` varchar(255) NOT NULL COMMENT '邮件标题',
                            `mail_content` varchar(15000) DEFAULT NULL COMMENT '邮件内容',
                            `mail_message` varchar(255) DEFAULT NULL COMMENT '邮件info',
                            `mail_type` int(1) DEFAULT NULL COMMENT '邮件类型：0简单邮件，1复杂邮件',
                            `mail_status` int(1) DEFAULT NULL COMMENT '邮件状态(0草稿，1成功，-1失败)',
                            `mail_from` varchar(50) DEFAULT NULL COMMENT '谁发送',
                            `mail_to` varchar(50) DEFAULT NULL COMMENT '谁接收',
                            `mail_source` varchar(30) DEFAULT NULL COMMENT '邮件发送来源',
                            `del_flag` int(1) DEFAULT NULL COMMENT '删除标志（0代表存在, 1代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

-- 2022年8月21日修复权限
UPDATE `sys_menu` SET `menu_name` = '导航管理', `parent_id` = 5, `order_num` = 0, `url` = '/mto/category', `target` = 'menuItem', `menu_type` = 'C', `visible` = '0', `is_refresh` = '1', `perms` = 'system:category:view', `icon` = '#', `create_by` = 'admin', `create_time` = '2021-12-11 17:45:54', `update_by` = '', `update_time` = NULL, `remark` = '' WHERE `menu_id` = 1116;
UPDATE `sys_menu` SET `menu_name` = '文件管理', `parent_id` = 8, `order_num` = 1, `url` = '/cloud/file/fileManagementHtml', `target` = 'menuItem', `menu_type` = 'C', `visible` = '0', `is_refresh` = '1', `perms` = 'file:Management:view', `icon` = '#', `create_by` = 'admin', `create_time` = '2022-07-16 07:45:58', `update_by` = '', `update_time` = NULL, `remark` = '' WHERE `menu_id` = 1146;

-- 2022年10月22日新增账单分析功能
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1150, '记账账单分析', 1091, 6, '#', 'menuItem', 'F', '0', '1', 'account:account:analysis', '#', '一粒麦子', '2022-10-22 12:47:41', '', NULL, '');-- ----------------------------

-- 2022年11月06日新增博客文章导出
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1151, '单文章导出', 1078, 7, '#', 'menuItem', 'F', '0', '1', 'mto:post:export', '#', '一粒麦子', '2022-11-05 20:06:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1152, '批量文章导出', 1078, 8, '#', 'menuItem', 'F', '0', '1', 'mto:post:exportDataBatch', '#', '一粒麦子', '2022-11-05 20:06:46', '', NULL, '');

-- 2022年11月10日新增文件管理下载，批量下载
INSERT INTO `sys_menu` ( `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES ( '单文件下载', 1144, 7, '#', 'menuItem', 'F', '0', '1', 'system:file:download', '#', '一粒麦子', '2022-11-05 20:06:22', '', NULL, '');
INSERT INTO `sys_menu` ( `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES ( '多批量下载', 1144, 8, '#', 'menuItem', 'F', '0', '1', 'system:file:downloadBatch', '#', '一粒麦子', '2022-11-05 20:06:46', '', NULL, '');

-- 2022年10月13日新增文章密码
alter table mto_post add COLUMN pwd VARCHAR(20) DEFAULT NULL

-- 2022年12月20日新增评论审核功能 (2022年12月20日之后执行了  ruoyi_blog.sql，则无需执行 )
ALTER TABLE mto_comment DROP content;
ALTER TABLE mto_comment ADD COLUMN  `examine_by` varchar(60) DEFAULT null COMMENT '审核人' ;
ALTER TABLE mto_comment ADD COLUMN  `examine_time` datetime DEFAULT null COMMENT '审核时间' ;
ALTER TABLE mto_comment ADD COLUMN  `content` varchar(2000) DEFAULT null COMMENT '内容' ;
ALTER TABLE mto_comment ADD COLUMN  `ip_addr` varchar(60) DEFAULT null COMMENT 'ip地址' ;
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, url, target, menu_type, visible, is_refresh, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1155, '评论管理', 5, 3, 'mto/comment/view', 'menuItem', 'C', '0', '1', 'mto:comment:view', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, url, target, menu_type, visible, is_refresh, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1156, '评论管理列表', 1155, 1, 'mto/comment/list', 'menuItem', 'F', '0', '1', 'mto:comment:list', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, url, target, menu_type, visible, is_refresh, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1157, '评论管理审核', 1155, 2, 'mto/comment/examine', 'menuItem', 'F', '0', '1', 'mto:comment:examine', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, url, target, menu_type, visible, is_refresh, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1158, '评论管理删除', 1155, 3, 'mto/comment/remove', 'menuItem', 'F', '0', '1', 'mto:comment:remove', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');

