/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : ry_fast

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 09/07/2022 08:43:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_account
-- ----------------------------
DROP TABLE IF EXISTS `account_account`;
CREATE TABLE `account_account`  (
                                    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                    `cover` varbinary(300) NULL DEFAULT NULL COMMENT '账户封面/图片',
                                    `account_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户分类',
                                    `account_introduce` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账本介绍',
                                    `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '账本状态（0显示 1隐藏）',
                                    `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                                    `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_account
-- ----------------------------
INSERT INTO `account_account` VALUES (1, NULL, '2022账单', '本年度消费', '0', 1, 'admin', '2022-05-29 14:11:57', '', NULL);

-- ----------------------------
-- Table structure for account_class
-- ----------------------------
DROP TABLE IF EXISTS `account_class`;
CREATE TABLE `account_class`  (
                                  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                  `class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
                                  `class_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类类型',
                                  `class_introduce` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类介绍',
                                  `class_status` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类状态（停用/启用）',
                                  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                                  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_class
-- ----------------------------
INSERT INTO `account_class` VALUES (1, '衣', '1', '', '0', 1, 'admin', '2022-05-29 14:10:53', '', NULL);
INSERT INTO `account_class` VALUES (2, '食', '1', '', '0', 2, 'admin', '2022-05-29 14:11:15', '', NULL);

-- ----------------------------
-- Table structure for account_money
-- ----------------------------
DROP TABLE IF EXISTS `account_money`;
CREATE TABLE `account_money`  (
                                  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                  `account_id` bigint(20) NOT NULL COMMENT '账本id',
                                  `class_id` bigint(20) NOT NULL COMMENT '类型id',
                                  `money_pay` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额(支出金额)',
                                  `money_income` decimal(20, 0) NULL DEFAULT NULL COMMENT '金额(收出金额)',
                                  `money_date` date NULL DEFAULT NULL COMMENT '花钱日期',
                                  `money_introduce` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注/金额说明',
                                  `is_total` int(1) NOT NULL DEFAULT 0 COMMENT '是否记入总账（0记入，默认，1不记录）',
                                  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '0是正常，1是删除',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `account_id`(`account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_money
-- ----------------------------
INSERT INTO `account_money` VALUES (1, 1, 1, 10.00, NULL, '2022-05-29', '', 0, 'admin', '2022-05-29 14:12:09', '', NULL, '0');
INSERT INTO `account_money` VALUES (2, 1, 1, 10.00, NULL, '2022-05-30', '', 0, 'admin', '2022-05-29 14:12:09', '', NULL, '0');
INSERT INTO `account_money` VALUES (3, 1, 1, 10.00, NULL, '2022-05-31', '', 0, 'admin', '2022-05-29 14:12:09', '', NULL, '0');
INSERT INTO `account_money` VALUES (4, 1, 1, 10.00, NULL, '2022-06-01', '', 0, 'admin', '2022-05-29 14:12:09', '', NULL, '0');
INSERT INTO `account_money` VALUES (5, 1, 1, 10.00, NULL, '2022-06-09', '', 0, 'admin', '2022-05-29 14:12:09', '', NULL, '0');
INSERT INTO `account_money` VALUES (6, 1, 1, 18.00, NULL, '2022-06-10', '', 0, 'admin', '2022-05-29 14:12:09', '', NULL, '0');

-- ----------------------------
-- Table structure for biz_repeat_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_repeat_log`;
CREATE TABLE `biz_repeat_log`  (
                                   `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                   `biz_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '业务ID',
                                   `biz_type` tinyint(1) NOT NULL COMMENT '业务类型：1.文章，2.评论,3.获取天气',
                                   `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已登录用户ID',
                                   `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
                                   `user_agent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端标识',
                                   `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
                                   `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1失败）',
                                   `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                                   `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_repeat_log
-- ----------------------------
INSERT INTO `biz_repeat_log` VALUES (2, 6, 1, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '/blog/love', '0', '2022-05-29 13:51:59', NULL);

-- ----------------------------
-- Table structure for board_agile
-- ----------------------------
DROP TABLE IF EXISTS `board_agile`;
CREATE TABLE `board_agile`  (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
                                `agile_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
                                `agile_status` int(1) NOT NULL COMMENT '状态',
                                `agile_date` datetime NOT NULL COMMENT '任务日期',
                                `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of board_agile
-- ----------------------------
INSERT INTO `board_agile` VALUES (1, '今日任务', 2, '2022-05-29 14:00:00', 1, 'admin', '2022-05-29 14:03:06', '', NULL, '');
INSERT INTO `board_agile` VALUES (2, '完成首访博客记录', 1, '2022-05-29 23:00:00', 1, 'admin', '2022-05-29 14:03:40', '', NULL, '');
INSERT INTO `board_agile` VALUES (3, '编写新闻页面', 0, '2022-05-31 14:00:00', 1, 'admin', '2022-05-29 14:04:05', '', NULL, '');
INSERT INTO `board_agile` VALUES (4, '下午做核酸检测', 0, '2022-05-29 14:00:00', 1, 'admin', '2022-05-29 14:04:37', '', NULL, '');

-- ----------------------------
-- Table structure for board_note
-- ----------------------------
DROP TABLE IF EXISTS `board_note`;
CREATE TABLE `board_note`  (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                               `note_title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
                               `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者id',
                               `note_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片（预留字段，暂时不考虑）',
                               `note_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
                               `note_summary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
                               `note_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（数据字典，不写死）',
                               `note_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
                               `is_Public` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否公共，0公共，  1 私有',
                               `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of board_note
-- ----------------------------
INSERT INTO `board_note` VALUES (1, '工作是我快乐表情', 1, NULL, '<p><span style=\"color: rgb(74, 74, 74); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(245, 245, 245);\">&nbsp; &nbsp; &nbsp; &nbsp;“宅在家里🧘，越发觉得会想念工作💻...”小伙伴们，不知道是不是也会有和小编的一样的想法呢🙋？忽然有点想念深夜时分🌃绞尽脑汁🤔想出方案的喜悦🥰，会议室里热火朝天脑暴🗣️🤯的热血💗。虽然，工作很辛苦😫，有压力😩，但是渐渐我们会发现，我们热爱工作🤠，工作使我们快乐😃，让我们富有🤑，带我们进步📈！所以这一期，小编总结了工作相关的表情符号，伴随着逐渐复工🏢复产🏭，想必大家都很需要👏的呢！但是，工作虽对我们有很多好处，小伙伴们也别太爱工作了，还是要注意休息🛌，关注自己的身心🏃❤️健康🩺。平衡好家庭和生活👪。工作是做不完的♾️，让我们快乐的工作😄，幸福的生活🤞！</span><br></p>', '', '-1', '0', '0', 'admin', '2022-05-29 14:07:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for cloud_file
-- ----------------------------
DROP TABLE IF EXISTS `cloud_file`;
CREATE TABLE `cloud_file`  (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `user_id` bigint(20) NULL DEFAULT NULL COMMENT '文件所属用户',
                               `oldfilename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文件名',
                               `newfilename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新文件名',
                               `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
                               `url_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问文件url地址',
                               `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件存放路径',
                               `size` float(11, 1) NULL DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `is_img` int(11) NULL DEFAULT NULL COMMENT '是否是图片（0是，1否）',
  `downcounts` int(11) NULL DEFAULT 0 COMMENT '下载次数',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_public` int(11) NULL DEFAULT 0 COMMENT '是否共享（0正常，1共享）',
  `is_collect` int(11) NULL DEFAULT 0 COMMENT '是否收藏（0正常，1收藏）',
  `is_share` int(11) NULL DEFAULT 0 COMMENT '是否分享（0正常，1分享）',
  `is_recycle` int(11) NULL DEFAULT 0 COMMENT '是否在回收箱（0正常，1删除）',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件显示图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网盘文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cloud_file
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
                              `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                              `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
                              `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
                              `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
                              `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
                              `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
                              `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
                              `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
                              `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
                              `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
                              `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
                              `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
                              `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                              `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                              `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
                              `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
                                     `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                     `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
                                     `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
                                     `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
                                     `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
                                     `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
                                     `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
                                     `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
                                     `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
                                     `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
                                     `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                     `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                     `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
                                     `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
                                     `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                     `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                     `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                     `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
                                     `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                     PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for mto_category
-- ----------------------------
DROP TABLE IF EXISTS `mto_category`;
CREATE TABLE `mto_category`  (
                                 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `pid` int(11) UNSIGNED NULL DEFAULT 0,
                                 `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型名',
                                 `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型介绍',
                                 `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
                                 `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
                                 `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否可用',
                                 `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                                 `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `type` int(1) NULL DEFAULT 0 COMMENT '类型 （0分类/1页面）',
                                 `page_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面请求地址',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_category
-- ----------------------------
INSERT INTO `mto_category` VALUES (1, 0, '首页', '', 1, 'fa fa-css3', 1, '2018-01-14 21:34:54', '2022-03-11 13:20:49', 1, '/blog');
INSERT INTO `mto_category` VALUES (2, 0, '归档', '', 2, 'fa fa-coffee', 1, '2018-01-14 21:34:57', '2022-02-12 19:40:52', 1, '/blog/timeArchives?pageNum=1&pageSize=20');
INSERT INTO `mto_category` VALUES (3, 0, '文档', '', 50, 'fa fa-folder-open-o', 1, '2018-01-20 22:28:03', '2022-02-08 16:27:11', 0, '');
INSERT INTO `mto_category` VALUES (7, 0, '时间轴', '页面按时间排序', 3, 'fa fa-calendar-check-o', 1, '2022-01-02 21:58:34', '2022-01-03 18:55:59', 1, '/blog/blog/focus');
INSERT INTO `mto_category` VALUES (8, 3, '源码', '', 1, 'fa fa-code-fork', 1, '2022-02-08 16:28:02', '2022-02-08 16:28:02', 1, 'https://gitee.com/GiteeKey/ruoyi-blog');
INSERT INTO `mto_category` VALUES (9, 3, '文档', '', 2, 'fa fa-book', 1, '2022-02-08 16:28:55', '2022-02-08 16:31:32', 1, 'http://ruoyi.vip/');
INSERT INTO `mto_category` VALUES (10, 0, '标签', '标签页面', 4, 'fa fa-bookmark-o', 1, '2022-03-11 13:20:21', '2022-03-11 13:20:20', 1, '/blog/tags');
INSERT INTO `mto_category` VALUES (11, 0, '动态', '心情打卡', 5, 'fa fa-fire', 1, '2022-03-12 19:30:23', '2022-03-12 19:31:01', 1, '/blog/dynamics');
INSERT INTO `mto_category` VALUES (12, 0, '留言板', '', 100, 'fa fa-comments', 1, '2022-03-16 17:04:53', '2022-03-16 17:04:53', 1, '/blog/message/messageBoard');
INSERT INTO `mto_category` VALUES (13, 0, '新闻', '', 6, 'fa fa-hacker-news', 1, '2022-03-23 20:49:26', '2022-03-26 18:56:51', 1, '/blog/news');

-- ----------------------------
-- Table structure for mto_channel
-- ----------------------------
DROP TABLE IF EXISTS `mto_channel`;
CREATE TABLE `mto_channel`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `key_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
                                `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                                `status` int(5) NOT NULL COMMENT '状态：0正常，1隐藏',
                                `thumbnail` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
                                `type` int(2) NULL DEFAULT NULL COMMENT '类型：1分类，2专题',
                                `weight` int(11) NOT NULL DEFAULT 0,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_channel
-- ----------------------------
INSERT INTO `mto_channel` VALUES (1, 'banner', 'banner', 1, '', NULL, 4);
INSERT INTO `mto_channel` VALUES (2, '后端', '后端', 0, '', NULL, 38);
INSERT INTO `mto_channel` VALUES (3, '前端', '前端', 0, '', NULL, 2);
INSERT INTO `mto_channel` VALUES (4, '数据库', '数据库', 0, '', NULL, 5);
INSERT INTO `mto_channel` VALUES (5, 'Linux', 'Linux', 0, NULL, NULL, 7);
INSERT INTO `mto_channel` VALUES (7, '其他', '其他', 0, NULL, NULL, 5);
INSERT INTO `mto_channel` VALUES (8, '项目', '项目', 0, '', NULL, 9);
INSERT INTO `mto_channel` VALUES (10, 'NoSql', 'NoSql', 0, '', NULL, 6);
INSERT INTO `mto_channel` VALUES (11, '面试', '面试', 0, NULL, NULL, 0);
INSERT INTO `mto_channel` VALUES (12, 'mac', 'mac', 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for mto_comment
-- ----------------------------
DROP TABLE IF EXISTS `mto_comment`;
CREATE TABLE `mto_comment`  (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                `p_id` bigint(20) NULL DEFAULT NULL COMMENT '父id',
                                `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '祖级列表',
                                `post_id` bigint(20) NULL DEFAULT NULL COMMENT '博客id',
                                `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                                `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
                                `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
                                `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
                                `love` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '点赞',
                                `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `parent_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级名称',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_comment
-- ----------------------------
INSERT INTO `mto_comment` VALUES (1, 0, '0', NULL, '123@qq.com', '一粒麦子', '我来踩一脚😎', NULL, NULL, NULL, '2022-01-28 13:36:33', NULL, NULL);
INSERT INTO `mto_comment` VALUES (2, 0, '0', NULL, '1234@qq.com', 'BahetCoder', '我来踩一踩，很不错的哦！', NULL, NULL, NULL, '2022-03-26 18:17:47', NULL, NULL);
INSERT INTO `mto_comment` VALUES (3, 0, '0', NULL, '1234@qq.com', 'BahetCoder', '要是有个会员模块就好了', NULL, NULL, NULL, '2022-03-26 18:18:06', NULL, NULL);
INSERT INTO `mto_comment` VALUES (4, 3, '0,3', NULL, '123@qq.com', '一粒麦子', '慢慢来，博客是我利用空闲时间写的，在升级和维护中，后期会慢慢加更多内容', NULL, NULL, NULL, '2022-03-27 13:29:39', NULL, 'BahetCoder');

-- ----------------------------
-- Table structure for mto_golden
-- ----------------------------
DROP TABLE IF EXISTS `mto_golden`;
CREATE TABLE `mto_golden`  (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `golden` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '金句',
                               `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名言',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_golden
-- ----------------------------
INSERT INTO `mto_golden` VALUES (1, '我们的得救目的不在于我们自身，而是上帝的国度和我们对他的侍奉。得救使我们回到我们治理的使命。这始于重生，并在成圣和治理的过程中继续进行。', '——路斯德尼');
INSERT INTO `mto_golden` VALUES (2, '当我们阅读世俗作者所写的东西时，仍见到令人钦佩的真理的亮光。这提醒我们，虽然人类理性已经大大偏离、扭曲了原初的纯正，但仍然有来自其创造者的奇妙恩赐。', '——约翰·加尔文');
INSERT INTO `mto_golden` VALUES (3, '阅读使人充实，会谈使人敏捷，写作使人精确', '--培根');
INSERT INTO `mto_golden` VALUES (4, '最大的骄傲于最大的自卑都表示心灵的最软弱无力', '--斯宾诺莎');
INSERT INTO `mto_golden` VALUES (5, '依赖人容易使人畏缩、依附，而信赖上帝则使人产生神圣的精神上的安静，使我们的灵魂得以圣化', '——司布真');
INSERT INTO `mto_golden` VALUES (6, '如果我们忠心遵行上帝的律法，我们就可以确信，上帝必信实地成全他的应许。如果我们不忘记上帝的律法，上帝必不会忘记我们', '——司布真');
INSERT INTO `mto_golden` VALUES (7, '在人的整个生命中，唯独基督有完全的主权；没有一寸土地不是属于他的，人都不能说：这是我的！ ', '——亚伯拉罕·凯伯尔');
INSERT INTO `mto_golden` VALUES (8, '如果你问我什么是上帝对我们的要求，我要告诉你，第一是谦卑，第二是谦卑，第三是谦卑。这不是说此外再无别的教训，而是因为如果在我们所有的行动之前没有谦卑，我们的努力将毫无意义。', '——奥古斯丁');

-- ----------------------------
-- Table structure for mto_link
-- ----------------------------
DROP TABLE IF EXISTS `mto_link`;
CREATE TABLE `mto_link`  (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT,
                             `link_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                             `link_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo',
                             `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
                             `link_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接描述',
                             `status` int(1) NULL DEFAULT NULL COMMENT '状态：0正常，1隐藏',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_link
-- ----------------------------
INSERT INTO `mto_link` VALUES (1, 'CSDN', 'https://img-home.csdnimg.cn/images/20201125103341.png', 'https://blog.csdn.net/weixin_46237429', '', NULL, '', NULL, '一粒麦子', '2022-05-28 21:58:45', '');
INSERT INTO `mto_link` VALUES (2, '果核剥壳', 'https://www.ghxi.com/wp-content/uploads/2019/12/2020logo.png', 'https://www.ghxi.com/', '', NULL, '', NULL, '一粒麦子', '2022-05-28 22:00:04', '');

-- ----------------------------
-- Table structure for mto_look_ip
-- ----------------------------
DROP TABLE IF EXISTS `mto_look_ip`;
CREATE TABLE `mto_look_ip`  (
                                `date` date NOT NULL COMMENT '日期',
                                `ip_list` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前访问IP',
                                `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_look_ip
-- ----------------------------

-- ----------------------------
-- Table structure for mto_look_ip_first
-- ----------------------------
DROP TABLE IF EXISTS `mto_look_ip_first`;
CREATE TABLE `mto_look_ip_first`  (
                                      `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                      `ip_addr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前访问IP',
                                      `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
                                      `first_visit_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首次访问URL',
                                      `first_visit_date` datetime NULL DEFAULT NULL COMMENT '首次访问时间',
                                      `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首次访问博客记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_look_ip_first
-- ----------------------------
INSERT INTO `mto_look_ip_first` VALUES (1, '127.0.0.1', '内网IP', '/blog', '2022-05-29 13:41:51', NULL);

-- ----------------------------
-- Table structure for mto_post
-- ----------------------------
DROP TABLE IF EXISTS `mto_post`;
CREATE TABLE `mto_post`  (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                             `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者id',
                             `channel_id` bigint(11) NULL DEFAULT NULL COMMENT '栏目id',
                             `category_Id` bigint(20) NULL DEFAULT NULL COMMENT '导航id',
                             `comments` int(11) NOT NULL DEFAULT 0 COMMENT '评论数',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `slider` int(11) NULL DEFAULT 0 COMMENT '轮播图状态 (1是轮播图)',
                             `favors` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数(默认为0为推荐，1是推荐)',
                             `featured` int(11) NOT NULL DEFAULT 0 COMMENT '推荐状态',
                             `status` int(11) NOT NULL DEFAULT 0 COMMENT '文章状态',
                             `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
                             `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
                             `thumbnail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
                             `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'title',
                             `views` int(11) NOT NULL DEFAULT 0 COMMENT '查看次数',
                             `weight` int(11) NOT NULL DEFAULT 0,
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`id`) USING BTREE,
                             INDEX `IK_CHANNEL_ID`(`channel_id`) USING BTREE,
                             INDEX `index_title`(`title`) USING BTREE,
                             INDEX `index_channel_id`(`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_post
-- ----------------------------
INSERT INTO `mto_post` VALUES (3, 1, 2, NULL, 0, '2022-05-29 13:44:56', 0, 0, 0, 0, '', 'java', '', '@Autowired注解', 0, 0, '2022-05-29 13:45:14');
INSERT INTO `mto_post` VALUES (4, 1, 2, NULL, 0, '2022-05-29 13:44:56', 0, 0, 0, 0, '由于NumberFormat类的format()方法可以使用BigDecimal对象作为其参数，可以利用BigDecimal对超出16位有效数字的货币值，百分值，以及一般数值进行格式化控制。', 'java', '', 'BigDecimal常用方法详解', 0, 0, '2022-05-29 13:46:21');
INSERT INTO `mto_post` VALUES (5, 1, 2, NULL, 0, '2022-05-29 13:44:56', 0, 0, 0, 0, '', 'java', '', 'IDEA设置与常用插件', 0, 0, '2022-05-29 13:46:35');
INSERT INTO `mto_post` VALUES (6, 1, 2, NULL, 0, '2022-05-29 13:44:56', 0, 1, 0, 0, '', 'java, 多线程', '', 'Java多线程批量拆分List导入数据库', 1, 0, '2022-05-29 13:47:04');
INSERT INTO `mto_post` VALUES (13, 1, 2, NULL, 0, '2022-05-29 13:47:32', 1, 0, 1, 0, '', '', '', '异步编程(异步调用)', 1, 0, '2022-05-29 13:47:46');
INSERT INTO `mto_post` VALUES (14, 1, 4, NULL, 0, '2022-05-29 13:50:50', 1, 0, 0, 0, '', '', '', 'oracle数据库', 0, 0, '2022-05-29 13:51:08');

-- ----------------------------
-- Table structure for mto_post_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_attribute`;
CREATE TABLE `mto_post_attribute`  (
                                       `id` bigint(20) NOT NULL,
                                       `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                       `editor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'tinymce',
                                       PRIMARY KEY (`id`) USING BTREE,
                                       INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_post_attribute
-- ----------------------------
INSERT INTO `mto_post_attribute` VALUES (3, '@[TOC](@Autowired注解)\r\n# @Autowired注解\r\n\r\n![640](https://img-blog.csdnimg.cn/img_convert/4fe3d9e228c8973d4b1d8d9eba73492d.png)\r\n\r\n## @Autowired 字段\r\n\r\n我们可以把 `@Autowired` 注解标注在类文件中的字段属性上，通过这种方式，Spring 容器启动的时候会查找相应的 `Bean` ，然后通过反射的方式注入到这个字段中。\r\n\r\n例子如下：\r\n\r\n```java\r\n@Controller\r\npublic class PayController {\r\n    @Autowired\r\n    PayService aliPayService;\r\n}\r\n```\r\n\r\n这种方式使用起来非常方便，而且对于字段的要求也比较低，它可以是 `public`,也可以是 `private`范围。\r\n\r\n日常编程中，我一般是直接使用这种方式，简洁又便利。\r\n\r\n## @Autowired 构造方法\r\n\r\n第二种方式，我们可以使用类中的构造函数注入相应属性，例子如下：\r\n\r\n```java\r\n@Controller\r\npublic class PayController {\r\n    \r\n    PayService aliPayService;\r\n    \r\n    @Autowired\r\n    public PayController(PayService aliPayService) {\r\n        this.aliPayService = aliPayService;\r\n    }\r\n}\r\n```\r\n\r\n`@Autowired` 构造方法里的传参，可以是一个，也可以是多个。如果是多个参数，那 Spring 一起都注入进来。\r\n\r\n```java\r\n@Controller\r\npublic class PayController {\r\n\r\n    PayService aliPayService;\r\n    \r\n    OrderService orderService;\r\n    \r\n    @Autowired\r\n    public PayController(PayService aliPayService, OrderService orderService) {\r\n        this.aliPayService = aliPayService;\r\n        this.orderService=orderService;\r\n    }\r\n}\r\n```\r\n\r\n这种方式在注入多个属性的时候用起来还是比较方便的。\r\n\r\n那其实有一种情况下，如果一个类不存在无参的构造函数，只存在有参的构造函数，那实际上我们即使不用 `@Autowired`标注，Spring 也会帮我们注入相应的属性。\r\n\r\n## @Autowired 方法\r\n\r\n第三种方式，我们可以通过方法注入相应属性，例子如下：\r\n\r\n```java\r\n@Controller\r\npublic class PayController {\r\n\r\n    PayService aliPayService;\r\n    \r\n    @Autowired\r\n    public void setAliPayService(PayService aliPayService) {\r\n        this.aliPayService = aliPayService;\r\n    }\r\n}\r\n```\r\n\r\n那之前我一直以为这种方式只能使用  `setxxx`才可以成功的注入属性 ，那其实是我理解错了，这个方法可以任意的命名。\r\n\r\n那方法注入，其实跟构造方法一样，也可以同时有多个传参，Spring 将会把这些属性一起注入。\r\n\r\n# @Autowired与@Resource区别\r\n\r\n## @Autowired\r\n\r\n1.@Autowired只有一个属性required，默认值为true，为true时，找不到就抛异常，为false时，找不到就赋值为null\r\n\r\n2.@Autowired按类型查找，如果该类型的bean不唯一，则抛出异常；可通过组合注解解决·\r\n`@Autowired()@Qualifier(\"baseDao\")`\r\n\r\n## @Resource\r\n\r\n@Resource有两个常用属性name、type，所以分4种情况\r\n\r\n1.指定name和type：通过name找到唯一的bean，找不到抛出异常；如果type和字段类型不一致，也会抛出异常\r\n\r\n2.指定name：通过name找到唯一的bean，找不到抛出异常\r\n\r\n3.指定type：通过tpye找到唯一的bean，如果不唯一，则抛出异常：NoUniqueBeanDefinitionException\r\n\r\n4.都不指定：通过字段名作为key去查找，找到则赋值；找不到则再通过字段类型去查找，如果不唯一，则抛出异常：NoUniqueBeanDefinitionException\r\n\r\n## 不同点\r\n\r\n1.Resource是JDK提供的，而Autowired是Spring提供的\r\n\r\n2.Resource不允许找不到bean的情况，而Autowired允许（@Autowired(required = false)）\r\n\r\n3.指定name的方式不一样，@Resource(name = \"baseDao\"),@Autowired()@Qualifier(\"baseDao\")\r\n\r\n4.Resource默认通过name查找，而Autowired默认通过type查找\r\n\r\n\r\n\r\n学习来源：\r\n\r\n微信公众号：CodeSheep\r\n\r\n[CSDN balsamspear](https://blog.csdn.net/balsamspear/article/details/87936936?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522162838433516780366543073%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=162838433516780366543073&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_v2~rank_v29-3-87936936.pc_search_result_cache&utm_term=autowired%E5%92%8Cresource%E7%9A%84%E5%8C%BA%E5%88%AB&spm=1018.2226.3001.4187)\r\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (4, '### 1.常用方法\r\n\r\n+ **add(BigDecimal)**:  BigDecimal对象中的值相加，返回BigDecimal对象\r\n\r\n+ **subtract(BigDecimal)**:  BigDecimal对象中的值相减，返回BigDecimal对象\r\n\r\n+ **multiply(BigDecimal)**:  BigDecimal对象中的值相乘，返回BigDecimal对象\r\n\r\n+ **divide(BigDecimal)**:  BigDecimal对象中的值相除，返回BigDecimal对象\r\n\r\n+ **toString()**:  将BigDecimal对象中的值转换成字符串\r\n\r\n+ **doubleValue()**:  将BigDecimal对象中的值转换成双精度数\r\n\r\n+ **floatValue()**:  将BigDecimal对象中的值转换成单精度数\r\n\r\n+ **longValue()**:  将BigDecimal对象中的值转换成长整数\r\n\r\n+ **intValue()**:  将BigDecimal对象中的值转换成整数\r\n+ **a.max (b)**  比较取最大值\r\n+ **a.min(b)**    比较取最小值\r\n+ **a.abs()**        取最绝对值\r\n+ **a.negate()**:    取相反数\r\n\r\n### 2.BigDecimal大小比较\r\n\r\njava中对BigDecimal比较大小一般用的是bigdemical的compareTo方法\r\n\r\n```JAVA\r\n// 两个 BigDecimal 比较大小\r\nint a = bigdemical.compareTo(bigdemical2)\r\n\r\n// 于0比较大小\r\nint a = bigdemical.compareTo(BigDecimal.ZERO)\r\n```\r\n\r\n返回结果分析：\r\n\r\n```JAVA\r\na = -1,表示bigdemical小于bigdemical2；\r\na = 0,表示bigdemical等于bigdemical2；\r\na = 1,表示bigdemical大于bigdemical2；\r\n```\r\n\r\n举例：a大于等于b\r\n\r\n```JAVA\r\nnew bigdemica(a).compareTo(new bigdemical(b)) >= 0\r\n```\r\n\r\n### 3.BigDecimal格式化\r\n\r\n由于NumberFormat类的format()方法可以使用BigDecimal对象作为其参数，可以利用BigDecimal对超出16位有效数字的货币值，百分值，以及一般数值进行格式化控制。\r\n\r\n以利用BigDecimal对货币和百分比格式化为例。首先，创建BigDecimal对象，进行BigDecimal的算术运算后，分别建立对货币和百分比格式化的引用，最后利用BigDecimal对象作为format()方法的参数，输出其格式化的货币值和百分比。\r\n\r\n```java \r\nNumberFormat currency = NumberFormat.getCurrencyInstance(); //建立货币格式化引用 \r\nNumberFormat percent = NumberFormat.getPercentInstance();  //建立百分比格式化引用 \r\npercent.setMaximumFractionDigits(3); //百分比小数点最多3位 \r\n\r\nBigDecimal loanAmount = new BigDecimal(\"15000.48\"); //贷款金额\r\nBigDecimal interestRate = new BigDecimal(\"0.008\"); //利率   \r\nBigDecimal interest = loanAmount.multiply(interestRate); //相乘\r\n\r\nSystem.out.println(\"贷款金额:\\t\" + currency.format(loanAmount)); \r\nSystem.out.println(\"利率:\\t\" + percent.format(interestRate)); \r\nSystem.out.println(\"利息:\\t\" + currency.format(interest)); \r\n```\r\n\r\n结果：\r\n\r\n```tex\r\n贷款金额: ￥15,000.48 利率: 0.8% 利息: ￥120.00\r\n```\r\n\r\nBigDecimal格式化保留2为小数，不足则补0：\r\n\r\n```JAVA\r\npublic class NumberFormat {\r\n\r\n    public static void main(String[] s){\r\n        System.out.println(formatToNumber(new BigDecimal(\"3.435\")));\r\n        System.out.println(formatToNumber(new BigDecimal(0)));\r\n        System.out.println(formatToNumber(new BigDecimal(\"0.00\")));\r\n        System.out.println(formatToNumber(new BigDecimal(\"0.001\")));\r\n        System.out.println(formatToNumber(new BigDecimal(\"0.006\")));\r\n        System.out.println(formatToNumber(new BigDecimal(\"0.206\")));\r\n    }\r\n    /**\r\n     * @desc 1.0~1之间的BigDecimal小数，格式化后失去前面的0,则前面直接加上0。\r\n     * 2.传入的参数等于0，则直接返回字符串\"0.00\"\r\n     * 3.大于1的小数，直接格式化返回字符串\r\n     * @param obj传入的小数\r\n     * @return\r\n     */\r\n    public static String formatToNumber(BigDecimal obj) {\r\n        DecimalFormat df = new DecimalFormat(\"#.00\");\r\n        if(obj.compareTo(BigDecimal.ZERO)==0) {\r\n            return \"0.00\";\r\n        }else if(obj.compareTo(BigDecimal.ZERO)>0&&obj.compareTo(new BigDecimal(1))<0){\r\n            return \"0\"+df.format(obj).toString();\r\n        }else {\r\n            return df.format(obj).toString();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n结果为：\r\n\r\n```JAVA\r\n3.44\r\n0.00\r\n0.00\r\n0.00\r\n0.01\r\n0.21\r\n```\r\n\r\n### 4.BigDecimal常见异常\r\n\r\n除法的时候出现异常\r\n\r\n```java\r\njava.lang.ArithmeticException: \r\nNon-terminating decimal expansion; no exact representable decimal result\r\n```\r\n\r\n**原因分析：**\r\n\r\n通过BigDecimal的divide方法进行除法时当不整除，出现无限循环小数时，就会抛异常：java.lang.ArithmeticException: Non-terminating decimal expansion; no exact representable decimal result.\r\n\r\n**解决方法：**\r\n\r\n> divide方法设置精确的小数点，如：divide(xxxxx,2)\r\n\r\n### 5.BigDecimal总结\r\n\r\n#### 5.1总结\r\n\r\n在需要精确的小数计算时再使用BigDecimal，BigDecimal的性能比double和float差，在处理庞大，复杂的运算时尤为明显。故一般精度的计算没必要使用BigDecimal。\r\n尽量使用参数类型为String的构造函数。\r\n\r\nBigDecimal都是不可变的（immutable）的， 在进行每一次四则运算时，都会产生一个新的对象 ，所以在做加减乘除运算时要记得要保存操作后的值。\r\n\r\n#### 5.2工具类推荐\r\n\r\n```JAVA\r\npackage com.vivo.ars.util;\r\nimport java.math.BigDecimal;\r\n\r\n/**\r\n * 用于高精确处理常用的数学运算\r\n */\r\npublic class ArithmeticUtils {\r\n    //默认除法运算精度\r\n    private static final int DEF_DIV_SCALE = 10;\r\n\r\n    /**\r\n     * 提供精确的加法运算\r\n     *\r\n     * @param v1 被加数\r\n     * @param v2 加数\r\n     * @return 两个参数的和\r\n     */\r\n\r\n    public static double add(double v1, double v2) {\r\n        BigDecimal b1 = new BigDecimal(Double.toString(v1));\r\n        BigDecimal b2 = new BigDecimal(Double.toString(v2));\r\n        return b1.add(b2).doubleValue();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的加法运算\r\n     *\r\n     * @param v1 被加数\r\n     * @param v2 加数\r\n     * @return 两个参数的和\r\n     */\r\n    public static BigDecimal add(String v1, String v2) {\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.add(b2);\r\n    }\r\n\r\n    /**\r\n     * 提供精确的加法运算\r\n     *\r\n     * @param v1    被加数\r\n     * @param v2    加数\r\n     * @param scale 保留scale 位小数\r\n     * @return 两个参数的和\r\n     */\r\n    public static String add(String v1, String v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\r\n                    \"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.add(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).toString();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的减法运算\r\n     *\r\n     * @param v1 被减数\r\n     * @param v2 减数\r\n     * @return 两个参数的差\r\n     */\r\n    public static double sub(double v1, double v2) {\r\n        BigDecimal b1 = new BigDecimal(Double.toString(v1));\r\n        BigDecimal b2 = new BigDecimal(Double.toString(v2));\r\n        return b1.subtract(b2).doubleValue();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的减法运算。\r\n     *\r\n     * @param v1 被减数\r\n     * @param v2 减数\r\n     * @return 两个参数的差\r\n     */\r\n    public static BigDecimal sub(String v1, String v2) {\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.subtract(b2);\r\n    }\r\n\r\n    /**\r\n     * 提供精确的减法运算\r\n     *\r\n     * @param v1    被减数\r\n     * @param v2    减数\r\n     * @param scale 保留scale 位小数\r\n     * @return 两个参数的差\r\n     */\r\n    public static String sub(String v1, String v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\r\n                    \"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.subtract(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).toString();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的乘法运算\r\n     *\r\n     * @param v1 被乘数\r\n     * @param v2 乘数\r\n     * @return 两个参数的积\r\n     */\r\n    public static double mul(double v1, double v2) {\r\n        BigDecimal b1 = new BigDecimal(Double.toString(v1));\r\n        BigDecimal b2 = new BigDecimal(Double.toString(v2));\r\n        return b1.multiply(b2).doubleValue();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的乘法运算\r\n     *\r\n     * @param v1 被乘数\r\n     * @param v2 乘数\r\n     * @return 两个参数的积\r\n     */\r\n    public static BigDecimal mul(String v1, String v2) {\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.multiply(b2);\r\n    }\r\n\r\n    /**\r\n     * 提供精确的乘法运算\r\n     *\r\n     * @param v1    被乘数\r\n     * @param v2    乘数\r\n     * @param scale 保留scale 位小数\r\n     * @return 两个参数的积\r\n     */\r\n    public static double mul(double v1, double v2, int scale) {\r\n        BigDecimal b1 = new BigDecimal(Double.toString(v1));\r\n        BigDecimal b2 = new BigDecimal(Double.toString(v2));\r\n        return round(b1.multiply(b2).doubleValue(), scale);\r\n    }\r\n\r\n    /**\r\n     * 提供精确的乘法运算\r\n     *\r\n     * @param v1    被乘数\r\n     * @param v2    乘数\r\n     * @param scale 保留scale 位小数\r\n     * @return 两个参数的积\r\n     */\r\n    public static String mul(String v1, String v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\r\n                    \"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.multiply(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).toString();\r\n    }\r\n\r\n    /**\r\n     * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到\r\n     * 小数点以后10位，以后的数字四舍五入\r\n     *\r\n     * @param v1 被除数\r\n     * @param v2 除数\r\n     * @return 两个参数的商\r\n     */\r\n\r\n    public static double div(double v1, double v2) {\r\n        return div(v1, v2, DEF_DIV_SCALE);\r\n    }\r\n\r\n    /**\r\n     * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指\r\n     * 定精度，以后的数字四舍五入\r\n     *\r\n     * @param v1    被除数\r\n     * @param v2    除数\r\n     * @param scale 表示表示需要精确到小数点以后几位。\r\n     * @return 两个参数的商\r\n     */\r\n    public static double div(double v1, double v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b1 = new BigDecimal(Double.toString(v1));\r\n        BigDecimal b2 = new BigDecimal(Double.toString(v2));\r\n        return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();\r\n    }\r\n\r\n    /**\r\n     * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指\r\n     * 定精度，以后的数字四舍五入\r\n     *\r\n     * @param v1    被除数\r\n     * @param v2    除数\r\n     * @param scale 表示需要精确到小数点以后几位\r\n     * @return 两个参数的商\r\n     */\r\n    public static String div(String v1, String v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v1);\r\n        return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).toString();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的小数位四舍五入处理\r\n     *\r\n     * @param v     需要四舍五入的数字\r\n     * @param scale 小数点后保留几位\r\n     * @return 四舍五入后的结果\r\n     */\r\n    public static double round(double v, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b = new BigDecimal(Double.toString(v));\r\n        return b.setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();\r\n    }\r\n\r\n    /**\r\n     * 提供精确的小数位四舍五入处理\r\n     *\r\n     * @param v     需要四舍五入的数字\r\n     * @param scale 小数点后保留几位\r\n     * @return 四舍五入后的结果\r\n     */\r\n    public static String round(String v, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\r\n                    \"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b = new BigDecimal(v);\r\n        return b.setScale(scale, BigDecimal.ROUND_HALF_UP).toString();\r\n    }\r\n\r\n    /**\r\n     * 取余数\r\n     *\r\n     * @param v1    被除数\r\n     * @param v2    除数\r\n     * @param scale 小数点后保留几位\r\n     * @return 余数\r\n     */\r\n    public static String remainder(String v1, String v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\r\n                    \"The scale must be a positive integer or zero\");\r\n        }\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        return b1.remainder(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).toString();\r\n    }\r\n\r\n    /**\r\n     * 取余数  BigDecimal\r\n     *\r\n     * @param v1    被除数\r\n     * @param v2    除数\r\n     * @param scale 小数点后保留几位\r\n     * @return 余数\r\n     */\r\n    public static BigDecimal remainder(BigDecimal v1, BigDecimal v2, int scale) {\r\n        if (scale < 0) {\r\n            throw new IllegalArgumentException(\r\n                    \"The scale must be a positive integer or zero\");\r\n        }\r\n        return v1.remainder(v2).setScale(scale, BigDecimal.ROUND_HALF_UP);\r\n    }\r\n\r\n    /**\r\n     * 比较大小\r\n     *\r\n     * @param v1 被比较数\r\n     * @param v2 比较数\r\n     * @return 如果v1 大于v2 则 返回true 否则false\r\n     */\r\n    public static boolean compare(String v1, String v2) {\r\n        BigDecimal b1 = new BigDecimal(v1);\r\n        BigDecimal b2 = new BigDecimal(v2);\r\n        int bj = b1.compareTo(b2);\r\n        boolean res;\r\n        if (bj > 0)\r\n            res = true;\r\n        else\r\n            res = false;\r\n        return res;\r\n    }\r\n}\r\n```\r\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (5, '#### 0.myPlugins\r\n\r\n![image-20210226165437980](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210226165437980.png)\r\n\r\n#### 1. idea官网下载\r\n\r\n[idea下载](https://www.jetbrains.com/idea/)（https://www.jetbrains.com/idea/）\r\n\r\n![image-20210106135641330](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106135641330.png)\r\n\r\n#### 2. 安装\r\n\r\n**一路下一步即可**\r\n\r\n激活参考 ：\r\n\r\n[参考一]( https://tech.souyunku.com/?p=48379)\r\n\r\n[参考二](https://mp.weixin.qq.com/s?__biz=MzA4OTY5OTI2OA==&mid=2247484453&idx=1&sn=162dcebb57a9f097ffde9394e24830bf&chksm=9017a28ea7602b982d121d1b5ccd192f17dfa3bd6965aadc89e150a1187fa9bd87d7d92b0441&mpshare=1&scene=1&srcid=1231ZEJ49YsjbLMX7cB760ix&sharer_sharetime=1609426424668&sharer_shareid=5a84b86af98719460780d3903361d384&key=f4c334f5d6d13eef911839bb692bff65ab06f1f6da2f04e332b37ed9c51b59ae01ac1a738d5bb5cdd3fee9bd4e50aba31ce1226059bf0d3934424a2eb4f86bfb924ed7e411a8e95b9d1dc77ff700810a1a6bd20d0d9d92ce174a1090590369786e3dcc245947581e66d9f4743ad7b6cd96ad45bbb9e49b43a1a86c97d65d87ed&ascene=1&uin=Nzc4ODQ0MTQy&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=Ae7wrCbD7HOZZiBv8Dr4YVY%3D&pass_ticket=OSsOLAg4uC22LlKAntV7Q563SUiJisTOkjeAd4tBbo0ky%2FFuVrOnBHEf%2BajrVpkz&wx_header=0)\r\n\r\n![image-20210106135655486](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106135655486.png)\r\n\r\n#### 3.idea方法分割线\r\n\r\n![方法名分割线](https://gitee.com/GiteeKey/mblog/raw/master/images/方法名分割线.png)\r\n\r\n#### 4.idea显示参数提示设置\r\n\r\n![idea参数名提示](https://gitee.com/GiteeKey/mblog/raw/master/images/idea参数名提示.jpg)\r\n\r\n#### 5. 设置自动导包\r\n\r\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210101162036028.png)\r\n\r\n#### 6.取消与不必要的文件显示\r\n\r\n![img](https://img2018.cnblogs.com/blog/889782/201907/889782-20190708193913619-191369760.png)\r\n\r\n#### 7.热部署Tomcat\r\n\r\n**安装插件  jrebel and XRebel for IntelliJ**\r\n\r\n**安装插件  jrebel mybatisPlus extension （这个插件可以对 mapper.xml进行热部署）**\r\n\r\n1.安装插件并重新启动idea\r\n\r\n![image-20200311085301253](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311085301253.png)\r\n\r\n2.激活\r\n\r\n![image-20200311085832694](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311085832694.png)\r\n\r\n3.下载激工具https://github.com/ilanyu/ReverseProxy/releases/tag/v1.0\r\n\r\n双击运行\r\n\r\n![image-20200311091747951](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311091747951.png)\r\n\r\n4.在idear中激活\r\n\r\n**也可以使用[https://jrebel.qekang.com/](https://jrebel.qekang.com/)**\r\n\r\n第一行输入： http://127.0.0.1:8888/GUID\r\nGUID生成路径：https://www.guidgen.com/\r\n\r\n![image-20200311090314220](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311090314220.png)\r\n\r\n激活成功\r\n\r\n![image-20200311090954133](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311090954133.png)\r\n\r\n![image-20200311091616002](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311091616002.png)\r\n\r\n最后在idea中设置\r\n\r\n![image-20200418213738819](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200418213738819.png)\r\n\r\n#### 8.修改注释颜色\r\n\r\n![image-20210106134700112](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106134700112.png)\r\n\r\n#### 9.类上方法设置\r\n\r\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210107103536.png)\r\n\r\n```java\r\n/**\r\n * @ClassName ${NAME}\r\n * @description: TODO\r\n * @author: 一粒麦子\r\n * @Date ${DATE} ${TIME}\r\n **/\r\n```\r\n\r\n#### 10.方法上注释\r\n\r\n##### 1.基础设置\r\n\r\n```java\r\n/*\r\n * * methodName: $methodName$\r\n * * @Author: zhaoyi\r\n * * @Description: //TODO\r\n * * @Date:  $date$ $time$\r\n  $param$\r\n * @return $return$\r\n **/\r\n```\r\n\r\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210107111959.png)\r\n\r\n##### 2.赋值设置\r\n\r\n**param设置**\r\n\r\n```java\r\ngroovyScript(         \"def result=\'\';          def params=\\\"${_1}\\\".replaceAll(\'[\\\\\\\\[|\\\\\\\\]|\\\\\\\\s]\', \'\').split(\',\').toList();          for(i = 0; i < params.size(); i++) {             result +=\' * @param \' + params[i] + ((i < params.size() - 1) ? \'\\\\n\' : \'\')};              return result \", methodParameters())\r\n```\r\n\r\n**date设置**\r\n\r\n```java\r\ndate(\"yyyy/MM/dd\")\r\n```\r\n\r\n**其他设置**\r\n\r\n其他的在快捷方式里都可以找到\r\n\r\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210107112153.png)\r\n\r\n##### 3.使用\r\n\r\n我们起的名字是 /** + 回车，当然你也可以自己起个名字，输入名字会又提示\r\n\r\n#### 11.取消idea打开自动进入项目\r\n\r\n![image-20210120171905086](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210120171905086.png)\r\n\r\n#### 1. Translation\r\n\r\n中英文翻译\r\n\r\n#### 2. CodeGlance\r\n\r\n右边预览栏\r\n\r\n#### 3. Free MyBatis plugin\r\n\r\nmapper层与mapper.xml切换\r\n\r\n![](https://img-blog.csdnimg.cn/img_convert/2777885bd7786d44006979e8227c40d1.png)\r\n\r\n#### 4. Restfultookit/RestfulTool\r\n\r\n**在idea2020.3.1中Restfultookit失效，可以使用RestfulTool**\r\n\r\n![image-20210226164952688](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210226164952688.png)\r\n\r\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210101182521.png)\r\n\r\n\r\n\r\n#### 5. lombok\r\n\r\n![image-20210106134834113](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106134834113.png)\r\n\r\n#### 6. mybatisLog \r\n\r\nmybatisLog  / mybatis Log Plugin（需要注册码）可以将执行到SQL在控制台完整的打印\r\n\r\n![image-20210106134222344](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106134222344.png)\r\n\r\n#### 7.GitToolBox\r\n\r\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20220209133111.png)\r\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (6, '## 一、前言\r\n\r\n前两天做了一个导入的功能，导入开始的时候非常慢，导入2w条数据要1分多钟，后来一点一点的优化，从直接把list怼进Mysql中，到分配把list导入Mysql中，到多线程把list导入Mysql中。时间是一点一点的变少了。非常的爽，最后变成了10s以内。下面就展示一下过程。\r\n\r\n## 二、直接把list怼进Mysql\r\n\r\n使用mybatis的批量导入操作：\r\n\r\n```java\r\n @Transactional(rollbackFor = Exception.class)\r\n    public int addFreshStudentsNew2(List<FreshStudentAndStudentModel> list, String schoolNo) {\r\n        if (list == null || list.isEmpty()) {\r\n            return 0;\r\n        }\r\n        List<StudentEntity> studentEntityList = new LinkedList<>();\r\n        List<EnrollStudentEntity> enrollStudentEntityList = new LinkedList<>();\r\n        List<AllusersEntity> allusersEntityList = new LinkedList<>();\r\n\r\n        for (FreshStudentAndStudentModel freshStudentAndStudentModel : list) {\r\n\r\n            EnrollStudentEntity enrollStudentEntity = new EnrollStudentEntity();\r\n            StudentEntity studentEntity = new StudentEntity();\r\n            BeanUtils.copyProperties(freshStudentAndStudentModel, studentEntity);\r\n            BeanUtils.copyProperties(freshStudentAndStudentModel, enrollStudentEntity);\r\n            String operator = TenancyContext.UserID.get();\r\n            String studentId = BaseUuidUtils.base58Uuid();\r\n            enrollStudentEntity.setId(BaseUuidUtils.base58Uuid());\r\n            enrollStudentEntity.setStudentId(studentId);\r\n            enrollStudentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\r\n            enrollStudentEntity.setOperator(operator);\r\n            studentEntity.setId(studentId);\r\n            studentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\r\n            studentEntity.setOperator(operator);\r\n            studentEntityList.add(studentEntity);\r\n            enrollStudentEntityList.add(enrollStudentEntity);\r\n\r\n            AllusersEntity allusersEntity = new AllusersEntity();\r\n            allusersEntity.setId(enrollStudentEntity.getId());\r\n            allusersEntity.setUserCode(enrollStudentEntity.getNemtCode());\r\n            allusersEntity.setUserName(enrollStudentEntity.getName());\r\n            allusersEntity.setSchoolNo(schoolNo);\r\n            allusersEntity.setTelNum(enrollStudentEntity.getTelNum());\r\n            allusersEntity.setPassword(enrollStudentEntity.getNemtCode());  //密码设置为考生号\r\n            allusersEntityList.add(allusersEntity);\r\n        }\r\n            enResult = enrollStudentDao.insertAll(enrollStudentEntityList);\r\n            stuResult = studentDao.insertAll(studentEntityList);\r\n            allResult = allusersFacade.insertUserList(allusersEntityList);\r\n\r\n        if (enResult > 0 && stuResult > 0 && allResult) {\r\n            return 10;\r\n        }\r\n        return -10;\r\n    }\r\n```\r\n\r\nMapper.xml\r\n\r\n```xml\r\n<insert id=\"insertAll\" parameterType=\"com.dmsdbj.itoo.basicInfo.entity.EnrollStudentEntity\">\r\n        insert into tb_enroll_student\r\n        <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">\r\n                id,  \r\n                remark,  \r\n                nEMT_aspiration,  \r\n                nEMT_code,  \r\n                nEMT_score,  \r\n                student_id,  \r\n                identity_card_id,  \r\n                level,  \r\n                major,  \r\n                name,  \r\n                nation,  \r\n                secondary_college,  \r\n                operator,  \r\n                sex,  \r\n                is_delete,  \r\n                account_address,  \r\n                native_place,  \r\n                original_place,  \r\n                used_name,  \r\n                pictrue,  \r\n                join_party_date,  \r\n                political_status,  \r\n                tel_num,  \r\n                is_registry,  \r\n                graduate_school,  \r\n                create_time,  \r\n                update_time        </trim>        \r\n        values\r\n        <foreach collection=\"list\" item=\"item\" index=\"index\" separator=\",\">\r\n        (\r\n                #{item.id,jdbcType=VARCHAR},\r\n                #{item.remark,jdbcType=VARCHAR},\r\n                #{item.nemtAspiration,jdbcType=VARCHAR},\r\n                #{item.nemtCode,jdbcType=VARCHAR},\r\n                #{item.nemtScore,jdbcType=VARCHAR},\r\n                #{item.studentId,jdbcType=VARCHAR},\r\n                #{item.identityCardId,jdbcType=VARCHAR},\r\n                #{item.level,jdbcType=VARCHAR},\r\n                #{item.major,jdbcType=VARCHAR},\r\n                #{item.name,jdbcType=VARCHAR},\r\n                #{item.nation,jdbcType=VARCHAR},\r\n                #{item.secondaryCollege,jdbcType=VARCHAR},\r\n                #{item.operator,jdbcType=VARCHAR},\r\n                #{item.sex,jdbcType=VARCHAR},\r\n                0,\r\n                #{item.accountAddress,jdbcType=VARCHAR},\r\n                #{item.nativePlace,jdbcType=VARCHAR},\r\n                #{item.originalPlace,jdbcType=VARCHAR},\r\n                #{item.usedName,jdbcType=VARCHAR},\r\n                #{item.pictrue,jdbcType=VARCHAR},\r\n                #{item.joinPartyDate,jdbcType=VARCHAR},\r\n                #{item.politicalStatus,jdbcType=VARCHAR},\r\n                #{item.telNum,jdbcType=VARCHAR},\r\n                #{item.isRegistry,jdbcType=TINYINT},\r\n                #{item.graduateSchool,jdbcType=VARCHAR},\r\n                now(),\r\n                now()        \r\n        )   \r\n        </foreach>                \r\n  </insert> \r\n```\r\n\r\n**代码说明：**\r\n\r\n底层的mapper是通过逆向工程来生成的，批量插入如下，是拼接成类似：`insert into tb_enroll_student()values ()，()…….();`\r\n\r\n这样的缺点是，数据库一般有一个默认的设置，就是每次sql操作的数据不能超过4M。这样插入，数据多的时候，数据库会报错`Packet for query is too large (6071393 > 4194304). You can change this value on the server by setting the max_allowed_packet\' variable.，`虽然我们可以通过\r\n\r\n类似 修改 my.ini 加上 `max_allowed_packet =67108864`，`67108864=64M`，默认大小4194304 也就是4M\r\n\r\n修改完成之后要重启mysql服务，如果通过命令行修改就不用重启mysql服务。\r\n\r\n完成本次操作，但是我们不能保证项目单次最大的大小是多少，这样是有弊端的。所以可以考虑进行分组导入。\r\n\r\n## 三、分组把list导入Mysql中\r\n\r\n同样适用mybatis批量插入，区别是对每次的导入进行分组计算，然后分多次进行导入：\r\n\r\n```java\r\n@Transactional(rollbackFor = Exception.class)\r\n    public int addFreshStudentsNew2(List<FreshStudentAndStudentModel> list, String schoolNo) {\r\n        if (list == null || list.isEmpty()) {\r\n            return 0;\r\n        }\r\n        List<StudentEntity> studentEntityList = new LinkedList<>();\r\n        List<EnrollStudentEntity> enrollStudentEntityList = new LinkedList<>();\r\n        List<AllusersEntity> allusersEntityList = new LinkedList<>();\r\n\r\n        for (FreshStudentAndStudentModel freshStudentAndStudentModel : list) {\r\n\r\n            EnrollStudentEntity enrollStudentEntity = new EnrollStudentEntity();\r\n            StudentEntity studentEntity = new StudentEntity();\r\n            BeanUtils.copyProperties(freshStudentAndStudentModel, studentEntity);\r\n            BeanUtils.copyProperties(freshStudentAndStudentModel, enrollStudentEntity);\r\n            String operator = TenancyContext.UserID.get();\r\n            String studentId = BaseUuidUtils.base58Uuid();\r\n            enrollStudentEntity.setId(BaseUuidUtils.base58Uuid());\r\n            enrollStudentEntity.setStudentId(studentId);\r\n            enrollStudentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\r\n            enrollStudentEntity.setOperator(operator);\r\n            studentEntity.setId(studentId);\r\n            studentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\r\n            studentEntity.setOperator(operator);\r\n            studentEntityList.add(studentEntity);\r\n            enrollStudentEntityList.add(enrollStudentEntity);\r\n\r\n            AllusersEntity allusersEntity = new AllusersEntity();\r\n            allusersEntity.setId(enrollStudentEntity.getId());\r\n            allusersEntity.setUserCode(enrollStudentEntity.getNemtCode());\r\n            allusersEntity.setUserName(enrollStudentEntity.getName());\r\n            allusersEntity.setSchoolNo(schoolNo);\r\n            allusersEntity.setTelNum(enrollStudentEntity.getTelNum());\r\n            allusersEntity.setPassword(enrollStudentEntity.getNemtCode());  //密码设置为考生号\r\n            allusersEntityList.add(allusersEntity);\r\n        }\r\n\r\n        int c = 100;\r\n        int b = enrollStudentEntityList.size() / c;\r\n        int d = enrollStudentEntityList.size() % c;\r\n\r\n        int enResult = 0;\r\n        int stuResult = 0;\r\n        boolean allResult = false;\r\n\r\n        for (int e = c; e <= c * b; e = e + c) {\r\n            enResult = enrollStudentDao.insertAll(enrollStudentEntityList.subList(e - c, e));\r\n            stuResult = studentDao.insertAll(studentEntityList.subList(e - c, e));\r\n            allResult = allusersFacade.insertUserList(allusersEntityList.subList(e - c, e));\r\n        }\r\n        if (d != 0) {\r\n            enResult = enrollStudentDao.insertAll(enrollStudentEntityList.subList(c * b, enrollStudentEntityList.size()));\r\n            stuResult = studentDao.insertAll(studentEntityList.subList(c * b, studentEntityList.size()));\r\n            allResult = allusersFacade.insertUserList(allusersEntityList.subList(c * b, allusersEntityList.size()));\r\n        }\r\n\r\n        if (enResult > 0 && stuResult > 0 && allResult) {\r\n            return 10;\r\n        }\r\n        return -10;\r\n    }\r\n```\r\n\r\n**代码说明：**\r\n\r\n这样操作，可以避免上面的错误，但是分多次插入，无形中就增加了操作实践，很容易超时。所以这种方法还是不值得提倡的。\r\n\r\n再次改进，使用多线程分批导入。\r\n\r\n## 四、多线程分批导入Mysql\r\n\r\n依然使用mybatis的批量导入，不同的是，根据线程数目进行分组，然后再建立多线程池，进行导入。\r\n\r\n```java\r\n @Transactional(rollbackFor = Exception.class)\r\n    public int addFreshStudentsNew(List<FreshStudentAndStudentModel> list, String schoolNo) {\r\n        if (list == null || list.isEmpty()) {\r\n            return 0;\r\n        }\r\n        List<StudentEntity> studentEntityList = new LinkedList<>();\r\n        List<EnrollStudentEntity> enrollStudentEntityList = new LinkedList<>();\r\n        List<AllusersEntity> allusersEntityList = new LinkedList<>();\r\n\r\n        list.forEach(freshStudentAndStudentModel -> {\r\n            EnrollStudentEntity enrollStudentEntity = new EnrollStudentEntity();\r\n            StudentEntity studentEntity = new StudentEntity();\r\n            BeanUtils.copyProperties(freshStudentAndStudentModel, studentEntity);\r\n            BeanUtils.copyProperties(freshStudentAndStudentModel, enrollStudentEntity);\r\n            String operator = TenancyContext.UserID.get();\r\n            String studentId = BaseUuidUtils.base58Uuid();\r\n            enrollStudentEntity.setId(BaseUuidUtils.base58Uuid());\r\n            enrollStudentEntity.setStudentId(studentId);\r\n            enrollStudentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\r\n            enrollStudentEntity.setOperator(operator);\r\n            studentEntity.setId(studentId);\r\n            studentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\r\n            studentEntity.setOperator(operator);\r\n            studentEntityList.add(studentEntity);\r\n            enrollStudentEntityList.add(enrollStudentEntity);\r\n\r\n            AllusersEntity allusersEntity = new AllusersEntity();\r\n            allusersEntity.setId(enrollStudentEntity.getId());\r\n            allusersEntity.setUserCode(enrollStudentEntity.getNemtCode());\r\n            allusersEntity.setUserName(enrollStudentEntity.getName());\r\n            allusersEntity.setSchoolNo(schoolNo);\r\n            allusersEntity.setTelNum(enrollStudentEntity.getTelNum());\r\n            allusersEntity.setPassword(enrollStudentEntity.getNemtCode());  //密码设置为考生号\r\n            allusersEntityList.add(allusersEntity);\r\n        });\r\n\r\n\r\n        int nThreads = 50;\r\n\r\n        int size = enrollStudentEntityList.size();\r\n        ExecutorService executorService = Executors.newFixedThreadPool(nThreads);\r\n        List<Future<Integer>> futures = new ArrayList<Future<Integer>>(nThreads);\r\n\r\n        for (int i = 0; i < nThreads; i++) {\r\n            final List<EnrollStudentEntity> EnrollStudentEntityImputList = enrollStudentEntityList.subList(size / nThreads * i, size / nThreads * (i + 1));\r\n            final List<StudentEntity> studentEntityImportList = studentEntityList.subList(size / nThreads * i, size / nThreads * (i + 1));\r\n            final List<AllusersEntity> allusersEntityImportList = allusersEntityList.subList(size / nThreads * i, size / nThreads * (i + 1));\r\n\r\n           Callable<Integer> task1 = () -> {\r\n          studentSave.saveStudent(EnrollStudentEntityImputList,studentEntityImportList,allusersEntityImportList);\r\n               return 1;\r\n            };\r\n          futures.add(executorService.submit(task1));\r\n        }\r\n        executorService.shutdown();\r\n        if (!futures.isEmpty() && futures != null) {\r\n            return 10;\r\n        }\r\n        return -10;\r\n    }\r\n```\r\n\r\n**代码说明：**\r\n\r\n上面是通过应用ExecutorService 建立了固定的线程数，然后根据线程数目进行分组，批量依次导入。一方面可以缓解数据库的压力，另一个面线程数目多了，一定程度会提高程序运行的时间。缺点就是要看服务器的配置，如果配置好的话就可以开多点线程，配置差的话就开小点。\r\n\r\n## 五、小结\r\n\r\n通过使用这个操作真是不断的提高了，项目使用技巧也是不错。加油~~ 多线程哦~~\r\n\r\n## 六、文章来源\r\n\r\n微信公众号： 一行Java\r\n[Java多线程批量拆分List导入数据库](https://mp.weixin.qq.com/s/rZ_N7fSHbnvl-8JPtbs_Mg)\r\n\r\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (13, '### Future\r\n\r\n==一般不使用Future==\r\n\r\n```tex\r\nFuture 也是一个异步计算结果返回接口，目的获取返回值结果。但是 future 在获取返回值结构的时候，方法必须同步阻塞等待返回值结果。\r\n     Get : 获取结果（等待，阻塞）\r\n     Get(timeout) : 获取结果，指定等待时间\r\n     Cancel : 取消当前任务\r\n     isDone : 判断任务是否已经完成 （轮询）\r\nfutrure 对于结果获取不是很方便，只能通过同步阻塞的方式获取结果，或者是轮询的方式获取到结果；阻塞的方式获取返回值结果与异步的思想想违背，轮询方式又很占用 cpu 资源，也不能及时得到我们结果。\r\n```\r\n\r\n### CompletableFuture\r\n\r\n即异步编排\r\n\r\n```java\r\n CompletableFuture\r\n      可以帮助我们简化异步编程复杂性，提供了函数式编程的能力，可以通过回调函数的方式处理计算结果。\r\n public class CompletableFuture<T> implements Future<T>, CompletionStage<T>\r\n      CompletableFuture 具有Future 的特性，还实现了CompletionStage 接口，具备CompletionStage\r\n      接口的特性： 串行执行，并行执行，聚合（AND 聚合，OR 聚合）\r\n 1.串行关系执行\r\n      then – 然后，也就是表示下一步，所以通常是一个串行的关系体现，then后面的单词（比如 run/apply/accept）就是函数是接口中抽象方法名称；\r\n      利用上一步的执行结果，去进行下一步任务执行，任务执行具有先后顺序，因此把这种操作叫做串行关系\r\n      public CompletionStage<Void> thenRun(Runnable action);\r\n      public CompletionStage<Void> thenRunAsync(Runnable action);\r\n      public CompletableFuture<Void> thenRunAsync(Runnable action,Executor executor);\r\n      public <U> CompletableFuture<U> thenApply( Function<? super T,? extends U> fn) ;\r\n      public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn);\r\n      public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn,Executor executor);\r\n      public CompletionStage<Void> thenAccept(Consumer<? super T> action);\r\n      public CompletionStage<Void> thenAcceptAsync(Consumer<? super T> action);\r\n      public CompletionStage<Void> thenAcceptAsync(Consumer<? super T>  action, Executor executor);\r\n      public <U> CompletionStage<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn);\r\n      public <U> CompletionStage<U> thenComposeAsync(Function<? super T, ? extends CompletionStage<U>> fn);\r\n      public <U> CompletionStage<U> thenComposeAsync(Function<? super T, ? extends CompletionStage<U>> fn, Executor executor);\r\n 2.聚合and\r\n Combine…… with …… 和 both…… and …… 都是要求两者都必须满足，也就是and 且的关系。\r\n      public <U,V> CompletionStage<V> thenCombine  (CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn);\r\n      public <U,V> CompletionStage<V> thenCombineAsync  (CompletionStage<? extends U> other,  BiFunction<? super T,? super U,? extends V> fn);\r\n      public <U,V> CompletionStage<V> thenCombineAsync (CompletionStage<? extends U> other,  BiFunction<? super T,? super U,? extends V> fn, Executor executor);\r\n      public <U> CompletionStage<Void> thenAcceptBoth (CompletionStage<?  extends U> other, BiConsumer<? super T, ? super U> action);\r\n      public <U> CompletionStage<Void> thenAcceptBothAsync (CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action);\r\n      public <U> CompletionStage<Void> thenAcceptBothAsync(CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action,  Executor executor);\r\n      public CompletionStage<Void> runAfterBoth(CompletionStage<?> other, Runnable action);\r\n      public CompletionStage<Void> runAfterBothAsync(CompletionStage<?> other, Runnable action);\r\n      public CompletionStage<Void> runAfterBothAsync(CompletionStage<?> other, Runnable action, Executor executor);\r\n 3.聚合or\r\n      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn, Executor executor);\r\n      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn, Executor executor);\r\n      public CompletionStage<Void> acceptEither (CompletionStage<? extends T> other, Consumer<? super T> action);\r\n      public CompletionStage<Void> acceptEitherAsync (CompletionStage<? extends T> other, Consumer<? super T> action);\r\n      public CompletionStage<Void> acceptEitherAsync (CompletionStage<? extends T> other, Consumer<? super T> action, Executor executor);\r\n      public CompletionStage<Void> runAfterEither(CompletionStage<?> other, Runnable action);\r\n      public CompletionStage<Void> runAfterEitherAsync (CompletionStage<?> other, Runnable action);\r\n      public CompletionStage<Void> runAfterEitherAsync (CompletionStage<?> other, Runnable action, Executor executor);\r\n 4.异常处理\r\n      public CompletionStage<T> exceptionally(Function<Throwable, ? extends T> fn);\r\n      public CompletionStage<T> whenComplete (BiConsumer<? super T, ? super Throwable> action);\r\n      public CompletionStage<T> whenCompleteAsync (BiConsumer<? super T, ? super Throwable> action);\r\n      public CompletionStage<T> whenCompleteAsync (BiConsumer<? super T, ? super Throwable> action, Executor executor);\r\n      public <U> CompletionStage<U> handle (BiFunction<? super T, Throwable, ? extends U> fn);\r\n      public <U> CompletionStage<U> handleAsync (BiFunction<? super T, Throwable, ? extends U> fn);\r\n      public <U> CompletionStage<U> handleAsync (BiFunction<? super T, Throwable, ? extends U> fn, Executor executor);\r\n```\r\n\r\n### 异步开启\r\n\r\n```tex\r\n异步开启\r\n     CompletableFuture 提供了 4 个静态的方法，来创建一个异步操作（异步开启： 从这 4 个静态的方法开发即可）\r\n1.runAsync方法:\r\n     没有返回值的方法，不关注返回值\r\n     public static CompletableFuture<Void> runAsync(Runnable runnable);\r\n     public static CompletableFuture<Void> runAsync(Runnable runnable,Executor executor);\r\n2.supplyAsync :\r\n     有返回值，关注返回值的。\r\n     public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier);\r\n     public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,Executor executor)\r\n```\r\n\r\n### 案例：\r\n\r\n#### 方法说明\r\n\r\n```java\r\n1.runAsync 没有返回值\r\n2.1 public static CompletableFuture<Void> runAsync(Runnable runnable);  使用默认的线程池\r\n2.2 public static CompletableFuture<Void> runAsync(Runnable runnable,  Executor executor) 自定义线程池\r\n<p>\r\n2.supplyAsync：    有返回值的，关注返回值\r\n2.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier) 使用默认的线程池\r\n2.3 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,  Executor executor) 自定义线程池\r\n<p>\r\n3. thenRun 第一步执行完执行第二步，第二步的不关心第一执行的结果\r\n3.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n3.2 public CompletableFuture<Void> thenRun(Runnable action)  不关心返回值,也不关心也行结果，只有顺序，1执行后2才会执行\r\n<p>\r\n4. thenApply 有返回值U，也关心上一步的返回值，上一步的返回值会被当成参数,参数类型为T,也是顺序执行，1执行后执行2\r\n4.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n4.2 public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn);\r\n<p>\r\n5. thenAccept 没有返回结果，关心上一步的执行结果，上一步的执行结果会被当成参数，参数 T\r\n5.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n5.2 public CompletableFuture<Void> thenAccept(Consumer<? super T> action)\r\n<p>\r\n6. thenCompose 有返回值，顺序执行，第一步的返回结果为thenCompose的参数，允许对2个CompletionStage流水线进行操作，第一个操作完成时，将第一个的结果作为第二个参数\r\npublic <U> CompletableFuture<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn)\r\n<p>\r\n7.thenCombine\r\n7.1 聚合and,有返回值  当\r\n7.2 把两个任务都执行完毕后，会将两个结果都交给thenCombine去处理\r\n7.3 thenAcceptBoth（没有返回值）与 thenCombine（有返回值）的区别\r\npublic <U,V> CompletableFuture<V> thenCombine( CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn)\r\n<p>\r\n8.thenAcceptBoth\r\n8.1 聚合and\r\n8.2 没有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenAcceptBoth去处理\r\npublic <U> CompletableFuture<Void> thenAcceptBoth( CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action)\r\n<p>\r\n9.runAfterBoth\r\n9.1 聚合and\r\n9.2没有返回值，\r\n9.3当有连个任务时，两个任务都执行完，在执行下一个任务\r\npublic CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action);\r\n<p>\r\n10. applyToEither\r\n10.1 聚合 or\r\n10.2 有返回值\r\n10.2 针对2个CompletionStage,将计算速度最快的那个CompletionStage的结果作为下一步的处理\r\npublic <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n<p>\r\n11.exceptionally\r\n11.1 异常处理\r\n11.2 有返回值\r\n简单理解 就是当程序执行错误进入exceptionally方法\r\npublic CompletableFuture<T> exceptionally( Function<Throwable, ? extends T> fn)\r\n<p>\r\n12.whenComplete\r\n可以获取到上一次的返回结果\r\npublic CompletableFuture<T> whenComplete(BiConsumer<? super T, ? super Throwable> action)\r\n<p>\r\n13. handle\r\n有返回值\r\n相当于 try()finally() ,可以对执行结果进行处理，也可以对异常信息进行处理\r\n public <U> CompletableFuture<U> handle( BiFunction<? super T, Throwable, ? extends U> fn)\r\n```\r\n\r\n#### runAsync\r\n\r\n**1.public static CompletableFuture<Void> runAsync(Runnable runnable);**\r\n\r\n```java\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    \r\n    log.info(\"主线程start……\");\r\n\r\n    /**\r\n     * 异步任务\r\n     *  没有返回值,为定义线程池\r\n     *  public static CompletableFuture<Void> runAsync(Runnable runnable);\r\n     */\r\n    CompletableFuture<Void> runAsync = CompletableFuture.runAsync(\r\n            () -> {\r\n                log.info(\"子线程future线程start……\");\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                log.info(\"子线程future线程end……\");\r\n            });\r\n\r\n    // 调用异步任务\r\n    runAsync.get();\r\n\r\n    log.info(\"主线程end……\");\r\n}\r\n```\r\n\r\n2.**public static CompletableFuture<Void> runAsync(Runnable runnable,  Executor executor)**\r\n\r\n```java\r\n public static void main(String[] args) throws ExecutionException, InterruptedException {\r\n        AsyFutureDemo.runAsync();\r\n    }\r\n\r\n    /**\r\n     * 线程池对象\r\n     */\r\n    public static ThreadPoolExecutor threadPool = new ThreadPoolExecutor(Runtime.getRuntime().availableProcessors(),\r\n            Runtime.getRuntime().availableProcessors() + 1,\r\n            3,\r\n            TimeUnit.SECONDS,\r\n            new LinkedBlockingQueue<Runnable>(3),\r\n            Executors.defaultThreadFactory(),\r\n            new ThreadPoolExecutor.CallerRunsPolicy());\r\n\r\n    public static void runAsync() throws ExecutionException, InterruptedException {\r\n        log.info(\"主线程start……\");\r\n\r\n        /**\r\n         * 异步任务\r\n         *  没有返回值,为定义线程池\r\n         *  public static CompletableFuture<Void> runAsync(Runnable runnable);\r\n         */\r\n        CompletableFuture<Void> runAsync = CompletableFuture.runAsync(\r\n                () -> {\r\n                    log.info(\"子线程future线程start……\");\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    log.info(\"子线程future线程end……\");\r\n                }, threadPool);\r\n\r\n        // 调用异步任务\r\n        runAsync.get();\r\n\r\n        log.info(\"主线程end……\");\r\n    }\r\n```\r\n\r\n#### supplyAsync\r\n\r\n**public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)**\r\n\r\n```java\r\npublic static void supplyAsync() throws ExecutionException, InterruptedException {\r\n    log.info(\"主线程start……\");\r\n\r\n    CompletableFuture<Integer> supplyAsync = CompletableFuture.supplyAsync(\r\n            () -> {\r\n                log.info(\"子线程future线程start……\");\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                log.info(\"子线程future线程end……\");\r\n                return i;\r\n            });\r\n\r\n    supplyAsync.get();\r\n\r\n    log.info(\"主线程end……\");\r\n}\r\n```\r\n\r\n**public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,  Executor executor)**\r\n\r\n```java\r\npublic static void supplyAsync() throws ExecutionException, InterruptedException {\r\n    log.info(\"主线程start……\");\r\n\r\n    CompletableFuture<Integer> supplyAsync = CompletableFuture.supplyAsync(\r\n            () -> {\r\n                log.info(\"子线程future线程start……\");\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                log.info(\"子线程future线程end……\");\r\n                return i;\r\n            },threadPool);\r\n\r\n    supplyAsync.get();\r\n\r\n    log.info(\"主线程end……\");\r\n}\r\n\r\n/**\r\n * 线程池对象\r\n */\r\npublic static ThreadPoolExecutor threadPool = new ThreadPoolExecutor(Runtime.getRuntime().availableProcessors(),\r\n        Runtime.getRuntime().availableProcessors() + 1,\r\n        3,\r\n        TimeUnit.SECONDS,\r\n        new LinkedBlockingQueue<Runnable>(3),\r\n        Executors.defaultThreadFactory(),\r\n        new ThreadPoolExecutor.CallerRunsPolicy());\r\n```\r\n\r\n#### thenRun\r\n\r\n```java\r\n/**\r\n * 第一步执行完执行第二步，第二步的不关心第一执行的结果\r\n * <p>\r\n * 5. thenRun\r\n * 5.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n * 5.2 public CompletableFuture<Void> thenRun(Runnable action)  不关心返回值,也不关心也行结果，只有顺序，1执行后\r\n */\r\npublic static void main(String[] args) throws Exception {\r\n    // 1.public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n    // 2.public CompletableFuture<Void> thenRun(Runnable action)  不关心返回值,也不关心也行结果，只有顺序，1执行后2才会执行\r\n    CompletableFuture<Void> thenRun = CompletableFuture.supplyAsync(\r\n            () -> {\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                return i;\r\n            }\r\n    ).thenRun(\r\n            () -> {\r\n                log.info(\"上一步执行结束这一步才会执行，且不关心返回值,也不关心也行结果，只有顺序\");\r\n            }\r\n    );\r\n    // 异步调用执行\r\n    thenRun.get();\r\n    \r\n}\r\n```\r\n\r\n#### thenApply\r\n\r\n```java\r\n/**\r\n * 第一步执行完执行第二步，第二步的参数就是第一步返回的结果\r\n * <p>\r\n * 6. thenApply 有返回值U，也关心上一步的返回值，上一步的返回值会被当成参数,参数类型为T,也是顺序执行，1执行后执行2\r\n * 6.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n * 6.2 public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn);\r\n */\r\npublic static void main(String[] args) throws Exception {\r\n    // thenApply 有返回值U，也关心上一步的返回值，上一步的返回值会被当成参数,参数类型为T,也是顺序执行，1执行后执行2\r\n    // 1.public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n    // 2.public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn);\r\n    CompletableFuture<Integer> thenApply = CompletableFuture.supplyAsync(\r\n            () -> {\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                return i;\r\n            }\r\n    ).thenApply((e) -> {\r\n        return e + 2;\r\n    });\r\n\r\n    Integer e = thenApply.get();\r\n    System.out.println(\"e = \" + e);\r\n}\r\n```\r\n\r\n#### thenAccept\r\n\r\n```java\r\n/**\r\n *第一不执行完执行第二步，没有返回值，第一步的返回值为第二步的参数\r\n * supplyAsync  \r\n * 1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n * 2 public CompletableFuture<Void> thenAccept(Consumer<? super T> action)\r\n */\r\npublic static void main(String[] args) throws Exception {\r\n    // thenAccept 没有返回结果，关心上一步的执行结果，上一步的执行结果会被当成参数，参数 T\r\n    // 1.public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n    // 2.public CompletableFuture<Void> thenAccept(Consumer<? super T> action)\r\n    CompletableFuture<Void> thenAccept = CompletableFuture.supplyAsync(\r\n            () -> {\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                return i;\r\n            }\r\n    ).thenAccept(\r\n            e -> {\r\n                int k = e + 3;\r\n                log.info(\"k的结果为{}\", k);\r\n            }\r\n    );\r\n    \r\n    // 调用异步方法\r\n    thenAccept.get();\r\n}\r\n```\r\n\r\n#### thenCompose\r\n\r\n```java\r\n/**\r\n * 1. 有返回值\r\n * 2. 顺序执行，第一步的返回结果为thenCompose的参数\r\n * 3. 允许对2个CompletionStage流水线进行操作，第一个操作完成时，将第一个的结果作为第二个参数\r\n * thenCompose\r\n * public <U> CompletableFuture<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn)\r\n */\r\npublic static void main(String[] args) throws Exception {\r\n    // thenCompose\r\n    // public <U> CompletableFuture<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn)\r\n    // 第一次执行\r\n    CompletableFuture<Integer> thenCompose = CompletableFuture.supplyAsync(\r\n            () -> {\r\n                int i = 10 / 2;\r\n                log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                return i;\r\n            }).thenCompose(new Function<Integer, CompletionStage<Integer>>() {\r\n        @Override\r\n        public CompletionStage<Integer> apply(Integer i) {\r\n            // 第二次执行\r\n            CompletableFuture<Integer> supplyAsync = CompletableFuture.supplyAsync(\r\n                    () -> {\r\n                        int j = i + 2;\r\n                        log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), j);\r\n                        return j;\r\n                    });\r\n            return supplyAsync;\r\n        }\r\n    });\r\n    // 调用异步\r\n    Integer integer = thenCompose.get();\r\n    System.out.println(\"integer = \" + integer);\r\n}\r\n```\r\n\r\n#### thenCombine（and聚合）\r\n\r\n```java\r\n/**\r\n * 1. 聚合and\r\n * 2. 有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenCombine去处理\r\n * 3. thenAcceptBoth（没有返回值）与 thenCombine（有返回值）的区别\r\n * <p>\r\n * thenCombine\r\n * public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n * public <U,V> CompletableFuture<V> thenCombine( CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn)\r\n */\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    // 聚合and\r\n    // 有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenCombine去处理\r\n    //  public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n    //  public <U,V> CompletableFuture<V> thenCombine( CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn)\r\n    // 第一个执行\r\n    CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 2;\r\n        return i;\r\n    });\r\n    // 第二个执行\r\n    CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 3;\r\n        return i;\r\n    });\r\n    // thenCombine 合并操作\r\n    CompletableFuture<Integer> thenCombine = f1.thenCombine(f2, (x, y) -> {\r\n        log.info(\"x为第一个执行结果：{}\", x);\r\n        log.info(\"y为第二个执行结果：{}\", y);\r\n        return x + y;\r\n    });\r\n    // 调用异步方法\r\n    Integer integer = thenCombine.get();\r\n    System.out.println(\"最终结果 = \" + integer);\r\n    \r\n}\r\n```\r\n\r\n#### thenAcceptBoth（and聚合）\r\n\r\n```java\r\n/**\r\n * 1. 聚合and\r\n * 2. 没有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenAcceptBoth去处理\r\n * 3. thenAcceptBoth（没有返回值）与 thenCombine（有返回值）的区别\r\n * thenAcceptBoth\r\n * public <U> CompletableFuture<Void> thenAcceptBoth( CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action);\r\n */\r\npublic static void main(String[] args) throws Exception {\r\n    // public <U> CompletableFuture<Void> thenAcceptBoth( CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action)\r\n    // 第一个执行\r\n    CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 2;\r\n        return i;\r\n    });\r\n    // 第二个执行\r\n    CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 3;\r\n        return i;\r\n    });\r\n    // thenAcceptBoth 合并操作 ,没有返回值\r\n    CompletableFuture<Void> acceptBoth = f1.thenAcceptBoth(f2, (x, y) -> {\r\n        log.info(\"x为第一个执行结果：{}\", x);\r\n        log.info(\"y为第二个执行结果：{}\", y);\r\n    });\r\n    // 调用异步方法\r\n    acceptBoth.get();\r\n}\r\n```\r\n\r\n#### runAfterBoth（and聚合）\r\n\r\n```java\r\n/**\r\n * 9.runAfterBoth\r\n * 9.1 聚合and\r\n * 9.2没有返回值，\r\n * 9.3当有连个任务时，两个任务都执行完，在执行下一个任务\r\n * public CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action);\r\n */\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    \r\n    //  public CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action);\r\n    \r\n    // 第一个执行\r\n    CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 2;\r\n        return i;\r\n    });\r\n    // 第二个执行\r\n    CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 3;\r\n        return i;\r\n    });\r\n    // thenAcceptBoth 合并操作 ,没有返回值\r\n    CompletableFuture<Void> afterBoth = f1.runAfterBoth(f2, () -> {\r\n        log.info(\"第一个和第二个执行完，接下来的业务\");\r\n    });\r\n    // 调用异步方法\r\n    afterBoth.get();\r\n}\r\n```\r\n\r\n#### applyToEither（or聚合）\r\n\r\n```sql\r\n/**\r\n * 10. applyToEither\r\n * 10.1 聚合 or\r\n * 10.2 有返回值\r\n * 10.2 针对2个CompletionStage,将计算速度最快的那个CompletionStage的结果作为下一步的处理\r\n * public <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n */\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    // public <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n    // 第一个执行\r\n    CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 5;\r\n        log.info(\"第一个执行结果{}\",i);\r\n        return i;\r\n    });\r\n    // 第二个执行\r\n    CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 2;\r\n        log.info(\"第二个执行结果{}\",i);\r\n        return i;\r\n    });\r\n    // 将计算速度最快的那个CompletionStage的结果进行处理\r\n    CompletableFuture<Integer> applyToEither = f1.applyToEither(f2, res -> {\r\n        int i = res + 5;\r\n        return i;\r\n    });\r\n    Integer integer = applyToEither.get();\r\n    System.out.println(\"integer = \" + integer);\r\n}\r\n```\r\n\r\n#### exceptionally(异常处理)\r\n\r\n```java\r\n/**\r\n * 11.exceptionally\r\n * 11.1 异常处理\r\n * 11.2 有返回值\r\n * 简单理解 就是当程序执行错误进入exceptionally方法\r\n * public CompletableFuture<T> exceptionally( Function<Throwable, ? extends T> fn)\r\n *\r\n * @param args\r\n */\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    CompletableFuture<Integer> exceptionally = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 0;\r\n        return i;\r\n    }).exceptionally(e -> {\r\n        log.info(\"当执行抛出异常进入此方法，异常信息：{}\", e.getMessage());\r\n        return null;\r\n    });\r\n    Integer integer = exceptionally.get();\r\n    System.out.println(\"integer = \" + integer);\r\n}\r\n```\r\n\r\n#### whenComplete(异常处理)\r\n\r\n```java\r\n/**\r\n * 11.whenComplete\r\n * 可以获取到上一次的返回结果\r\n * public CompletableFuture<T> whenComplete(BiConsumer<? super T, ? super Throwable> action)\r\n */\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    //\r\n    CompletableFuture<Integer> whenComplete = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 5;\r\n        return i;\r\n    }).whenComplete((t, e) -> {\r\n        log.info(\"上一步的执行结果{}\", t);\r\n        if (t > 0) {\r\n            System.out.println(\"t 大于 0，结果为： \" + t);\r\n                       }\r\n    });\r\n    Integer integer = whenComplete.get();\r\n    System.out.println(\"integer = \" + integer);\r\n}\r\n```\r\n\r\n#### handle(异常处理)\r\n\r\n```java\r\n/**\r\n * 13. handle\r\n * 有返回值\r\n * 相当于 try()finally() ,可以对执行结果进行处理，也可以对异常信息进行处理\r\n * public <U> CompletableFuture<U> handle( BiFunction<? super T, Throwable, ? extends U> fn)\r\n */\r\npublic static void main(String[] args) throws ExecutionException, InterruptedException {\r\n    //\r\n    CompletableFuture<Integer> handle = CompletableFuture.supplyAsync(() -> {\r\n        int i = 10 / 0;\r\n        return i;\r\n    }).handle((t, e) -> {\r\n        log.info(\"上一步的执行结果{}\", t);\r\n        int res = 0;\r\n        if (e != null) {\r\n            log.info(\"异常信息{}\", e.getMessage());\r\n            return null;\r\n        }\r\n        if (t != null) {\r\n            res = t + 1;\r\n        }\r\n        return res;\r\n    });\r\n\r\n    Integer integer = handle.get();\r\n    System.out.println(\"integer = \" + integer);\r\n}\r\n```\r\n## 所有代码\r\n```java\r\nimport lombok.extern.slf4j.Slf4j;\r\nimport org.apache.tomcat.jni.User;\r\n\r\nimport java.util.concurrent.*;\r\nimport java.util.function.Function;\r\n\r\n/**\r\n * 异步编排\r\n */\r\n@Slf4j\r\npublic class AsyFutureDemo {\r\n\r\n\r\n    /**\r\n     * 1.runAsync 没有返回值\r\n     * 2.1 public static CompletableFuture<Void> runAsync(Runnable runnable);  使用默认的线程池\r\n     * 2.2 public static CompletableFuture<Void> runAsync(Runnable runnable,  Executor executor) 自定义线程池\r\n     * <p>\r\n     * 2.supplyAsync：    有返回值的，关注返回值\r\n     * 2.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier) 使用默认的线程池\r\n     * 2.3 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,  Executor executor) 自定义线程池\r\n     * <p>\r\n     * 3. thenRun 第一步执行完执行第二步，第二步的不关心第一执行的结果\r\n     * 3.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * 3.2 public CompletableFuture<Void> thenRun(Runnable action)  不关心返回值,也不关心也行结果，只有顺序，1执行后2才会执行\r\n     * <p>\r\n     * 4. thenApply 有返回值U，也关心上一步的返回值，上一步的返回值会被当成参数,参数类型为T,也是顺序执行，1执行后执行2\r\n     * 4.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * 4.2 public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn);\r\n     * <p>\r\n     * 5. thenAccept 没有返回结果，关心上一步的执行结果，上一步的执行结果会被当成参数，参数 T\r\n     * 5.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * 5.2 public CompletableFuture<Void> thenAccept(Consumer<? super T> action)\r\n     * <p>\r\n     * 6. thenCompose 有返回值，顺序执行，第一步的返回结果为thenCompose的参数，允许对2个CompletionStage流水线进行操作，第一个操作完成时，将第一个的结果作为第二个参数\r\n     * public <U> CompletableFuture<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn)\r\n     * <p>\r\n     * 7.thenCombine\r\n     * 7.1 聚合and,有返回值  当\r\n     * 7.2 把两个任务都执行完毕后，会将两个结果都交给thenCombine去处理\r\n     * 7.3 thenAcceptBoth（没有返回值）与 thenCombine（有返回值）的区别\r\n     * public <U,V> CompletableFuture<V> thenCombine( CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn)\r\n     * <p>\r\n     * 8.thenAcceptBoth\r\n     * 8.1 聚合and\r\n     * 8.2 没有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenAcceptBoth去处理\r\n     * public <U> CompletableFuture<Void> thenAcceptBoth( CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action)\r\n     * <p>\r\n     * 9.runAfterBoth\r\n     * 9.1 聚合and\r\n     * 9.2没有返回值，\r\n     * 9.3当有连个任务时，两个任务都执行完，在执行下一个任务\r\n     * public CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action);\r\n     * <p>\r\n     * 10. applyToEither\r\n     * 10.1 聚合 or\r\n     * 10.2 有返回值\r\n     * 10.2 针对2个CompletionStage,将计算速度最快的那个CompletionStage的结果作为下一步的处理\r\n     * public <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n     * <p>\r\n     * 11.exceptionally\r\n     * 11.1 异常处理\r\n     * 11.2 有返回值\r\n     * 简单理解 就是当程序执行错误进入exceptionally方法\r\n     * public CompletableFuture<T> exceptionally( Function<Throwable, ? extends T> fn)\r\n     * <p>\r\n     * 12.whenComplete\r\n     * 可以获取到上一次的返回结果\r\n     * public CompletableFuture<T> whenComplete(BiConsumer<? super T, ? super Throwable> action)\r\n     * <p>\r\n     * 13. handle\r\n     * 有返回值\r\n     * 相当于 try()finally() ,可以对执行结果进行处理，也可以对异常信息进行处理\r\n     *  public <U> CompletableFuture<U> handle( BiFunction<? super T, Throwable, ? extends U> fn)\r\n     */\r\n\r\n    /**\r\n     * 13. handle\r\n     * 有返回值\r\n     * 相当于 try()finally() ,可以对执行结果进行处理，也可以对异常信息进行处理\r\n     * public <U> CompletableFuture<U> handle( BiFunction<? super T, Throwable, ? extends U> fn)\r\n     */\r\n    public static void main(String[] args) throws ExecutionException, InterruptedException {\r\n        //\r\n        CompletableFuture<Integer> handle = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 0;\r\n            return i;\r\n        }).handle((t, e) -> {\r\n            log.info(\"上一步的执行结果{}\", t);\r\n            int res = 0;\r\n            if (e != null) {\r\n                log.info(\"异常信息{}\", e.getMessage());\r\n                return null;\r\n            }\r\n            if (t != null) {\r\n                res = t + 1;\r\n            }\r\n            return res;\r\n        });\r\n\r\n        Integer integer = handle.get();\r\n        System.out.println(\"integer = \" + integer);\r\n    }\r\n\r\n    /**\r\n     * 12.whenComplete\r\n     * 可以获取到上一次的返回结果\r\n     * public CompletableFuture<T> whenComplete(BiConsumer<? super T, ? super Throwable> action)\r\n     */\r\n    public static void whenComplete() throws ExecutionException, InterruptedException {\r\n\r\n        //\r\n        CompletableFuture<Integer> whenComplete = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 5;\r\n            return i;\r\n        }).whenComplete((t, e) -> {\r\n            log.info(\"上一步的执行结果{}\", t);\r\n            if (t > 0) {\r\n                System.out.println(\"t 大于 0，结果为： \" + t);\r\n            }\r\n\r\n        });\r\n\r\n        Integer integer = whenComplete.get();\r\n        System.out.println(\"integer = \" + integer);\r\n\r\n\r\n    }\r\n\r\n    /**\r\n     * 11.exceptionally\r\n     * 11.1 异常处理\r\n     * 11.2 有返回值\r\n     * 简单理解 就是当程序执行错误进入exceptionally方法\r\n     * public CompletableFuture<T> exceptionally( Function<Throwable, ? extends T> fn)\r\n     */\r\n    public static void exceptionally() throws ExecutionException, InterruptedException {\r\n        CompletableFuture<Integer> exceptionally = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 0;\r\n            return i;\r\n        }).exceptionally(e -> {\r\n            log.info(\"当执行抛出异常进入此方法，异常信息：{}\", e.getMessage());\r\n            return null;\r\n        });\r\n\r\n        Integer integer = exceptionally.get();\r\n        System.out.println(\"integer = \" + integer);\r\n    }\r\n\r\n    /**\r\n     * 10. applyToEither\r\n     * 10.1 聚合 or\r\n     * 10.2 有返回值\r\n     * 10.2 针对2个CompletionStage,将计算速度最快的那个CompletionStage的结果作为下一步的处理\r\n     * public <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n     */\r\n    public static void applyToEither() throws ExecutionException, InterruptedException {\r\n\r\n        // public <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n\r\n        // 第一个执行\r\n        CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 5;\r\n            log.info(\"第一个执行结果{}\", i);\r\n            return i;\r\n        });\r\n\r\n        // 第二个执行\r\n        CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 2;\r\n            log.info(\"第二个执行结果{}\", i);\r\n            return i;\r\n        });\r\n\r\n        // 将计算速度最快的那个CompletionStage的结果进行处理\r\n        CompletableFuture<Integer> applyToEither = f1.applyToEither(f2, res -> {\r\n            int i = res + 5;\r\n            return i;\r\n        });\r\n\r\n        Integer integer = applyToEither.get();\r\n        System.out.println(\"integer = \" + integer);\r\n    }\r\n\r\n\r\n    /**\r\n     * 9.runAfterBoth\r\n     * 9.1 聚合and\r\n     * 9.2没有返回值，\r\n     * 9.3当有连个任务时，两个任务都执行完，在执行下一个任务\r\n     * public CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action);\r\n     */\r\n    public static void runAfterBoth() throws ExecutionException, InterruptedException {\r\n\r\n        //  public CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action);\r\n\r\n        // 第一个执行\r\n        CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 2;\r\n            return i;\r\n        });\r\n\r\n        // 第二个执行\r\n        CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 3;\r\n            return i;\r\n        });\r\n\r\n        // thenAcceptBoth 合并操作 ,没有返回值\r\n        CompletableFuture<Void> afterBoth = f1.runAfterBoth(f2, () -> {\r\n            log.info(\"第一个和第二个执行完，接下来的业务\");\r\n        });\r\n\r\n        // 调用异步方法\r\n        afterBoth.get();\r\n    }\r\n\r\n\r\n    /**\r\n     * 1. 聚合and\r\n     * 2. 没有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenAcceptBoth去处理\r\n     * 3. thenAcceptBoth（没有返回值）与 thenCombine（有返回值）的区别\r\n     * thenAcceptBoth\r\n     * public <U> CompletableFuture<Void> thenAcceptBoth( CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action);\r\n     */\r\n    public static void thenAcceptBoth() throws Exception {\r\n\r\n        // public <U> CompletableFuture<Void> thenAcceptBoth( CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action)\r\n\r\n        // 第一个执行\r\n        CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 2;\r\n            return i;\r\n        });\r\n\r\n        // 第二个执行\r\n        CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 3;\r\n            return i;\r\n        });\r\n\r\n        // thenAcceptBoth 合并操作 ,没有返回值\r\n        CompletableFuture<Void> acceptBoth = f1.thenAcceptBoth(f2, (x, y) -> {\r\n            log.info(\"x为第一个执行结果：{}\", x);\r\n            log.info(\"y为第二个执行结果：{}\", y);\r\n\r\n        });\r\n\r\n        // 调用异步方法\r\n        acceptBoth.get();\r\n    }\r\n\r\n\r\n    /**\r\n     * 1. 聚合and\r\n     * 2. 有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenCombine去处理\r\n     * 3. thenAcceptBoth（没有返回值）与 thenCombine（有返回值）的区别\r\n     * <p>\r\n     * thenCombine\r\n     * public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * public <U,V> CompletableFuture<V> thenCombine( CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn)\r\n     */\r\n    public static void thenCombine() throws ExecutionException, InterruptedException {\r\n        // 聚合and\r\n        // 有返回值  会把两个任务都执行完毕后，回将两个结果都交给thenCombine去处理\r\n        //  public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n        //  public <U,V> CompletableFuture<V> thenCombine( CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn)\r\n\r\n        // 第一个执行\r\n        CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 2;\r\n            return i;\r\n        });\r\n\r\n        // 第二个执行\r\n        CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> {\r\n            int i = 10 / 3;\r\n            return i;\r\n        });\r\n\r\n        // thenCombine 合并操作\r\n        CompletableFuture<Integer> thenCombine = f1.thenCombine(f2, (x, y) -> {\r\n            log.info(\"x为第一个执行结果：{}\", x);\r\n            log.info(\"y为第二个执行结果：{}\", y);\r\n            return x + y;\r\n        });\r\n\r\n        // 调用异步方法\r\n        Integer integer = thenCombine.get();\r\n        System.out.println(\"最终结果 = \" + integer);\r\n\r\n    }\r\n\r\n    /**\r\n     * 1. 有返回值\r\n     * 2. 顺序执行，第一步的返回结果为thenCompose的参数\r\n     * 3. 允许对2个CompletionStage流水线进行操作，第一个操作完成时，将第一个的结果作为第二个参数\r\n     * thenCompose\r\n     * public <U> CompletableFuture<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn)\r\n     */\r\n    public static void thenCompose(String[] args) throws Exception {\r\n        // thenCompose\r\n        // public <U> CompletableFuture<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn)\r\n\r\n        // 第一次执行\r\n        CompletableFuture<Integer> thenCompose = CompletableFuture.supplyAsync(\r\n                () -> {\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    return i;\r\n                }).thenCompose(new Function<Integer, CompletionStage<Integer>>() {\r\n            @Override\r\n            public CompletionStage<Integer> apply(Integer i) {\r\n                // 第二次执行\r\n                CompletableFuture<Integer> supplyAsync = CompletableFuture.supplyAsync(\r\n                        () -> {\r\n                            int j = i + 2;\r\n                            log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), j);\r\n                            return j;\r\n                        });\r\n                return supplyAsync;\r\n            }\r\n        });\r\n\r\n        // 调用异步\r\n        Integer integer = thenCompose.get();\r\n        System.out.println(\"integer = \" + integer);\r\n    }\r\n\r\n\r\n    /**\r\n     * 第一不执行完执行第二步，没有返回值，第一步的返回值为第二步的参数\r\n     * 7. supplyAsync\r\n     * 7.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * 7.2 public CompletableFuture<Void> thenAccept(Consumer<? super T> action)\r\n     */\r\n    public static void thenAccept(String[] args) throws Exception {\r\n        // thenAccept 没有返回结果，关心上一步的执行结果，上一步的执行结果会被当成参数，参数 T\r\n        // 1.public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n        // 2.public CompletableFuture<Void> thenAccept(Consumer<? super T> action)\r\n        CompletableFuture<Void> thenAccept = CompletableFuture.supplyAsync(\r\n                () -> {\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    return i;\r\n                }\r\n        ).thenAccept(\r\n                e -> {\r\n                    int k = e + 3;\r\n                    log.info(\"k的结果为{}\", k);\r\n                }\r\n        );\r\n\r\n        // 调用异步方法\r\n        thenAccept.get();\r\n\r\n    }\r\n\r\n\r\n    /**\r\n     * 第一步执行完执行第二步，第二步的参数就是第一步返回的结果\r\n     * <p>\r\n     * 6. thenApply 有返回值U，也关心上一步的返回值，上一步的返回值会被当成参数,参数类型为T,也是顺序执行，1执行后执行2\r\n     * 6.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * 6.2 public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn);\r\n     */\r\n    public static void thenApply() throws Exception {\r\n        // thenApply 有返回值U，也关心上一步的返回值，上一步的返回值会被当成参数,参数类型为T,也是顺序执行，1执行后执行2\r\n        // 1.public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n        // 2.public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn);\r\n        CompletableFuture<Integer> thenApply = CompletableFuture.supplyAsync(\r\n                () -> {\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    return i;\r\n                }\r\n        ).thenApply((e) -> {\r\n            return e + 2;\r\n        });\r\n\r\n        Integer e = thenApply.get();\r\n        System.out.println(\"e = \" + e);\r\n    }\r\n\r\n    /**\r\n     * 第一步执行完执行第二步，第二步的不关心第一执行的结果\r\n     * <p>\r\n     * 5. thenRun\r\n     * 5.1 public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n     * 5.2 public CompletableFuture<Void> thenRun(Runnable action)  不关心返回值,也不关心也行结果，只有顺序，1执行后2才会执行\r\n     */\r\n    public static void thenRun() throws Exception {\r\n        // 1.public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)\r\n        // 2.public CompletableFuture<Void> thenRun(Runnable action)  不关心返回值,也不关心也行结果，只有顺序，1执行后2才会执行\r\n        CompletableFuture<Void> thenRun = CompletableFuture.supplyAsync(\r\n                () -> {\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    return i;\r\n                }\r\n        ).thenRun(\r\n                () -> {\r\n                    log.info(\"上一步执行结束这一步才会执行，且不关心返回值,也不关心也行结果，只有顺序\");\r\n                }\r\n        );\r\n\r\n        // 异步调用执行\r\n        thenRun.get();\r\n\r\n    }\r\n\r\n    /**\r\n     * public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier) 使用默认的线程池\r\n     * public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,  Executor executor) 自定义线程池\r\n     */\r\n    public static void supplyAsync() throws ExecutionException, InterruptedException {\r\n        log.info(\"主线程start……\");\r\n\r\n        CompletableFuture<Integer> supplyAsync = CompletableFuture.supplyAsync(\r\n                () -> {\r\n                    log.info(\"子线程future线程start……\");\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    log.info(\"子线程future线程end……\");\r\n                    return i;\r\n                }, threadPool);\r\n\r\n        supplyAsync.get();\r\n\r\n        log.info(\"主线程end……\");\r\n    }\r\n\r\n    /**\r\n     * 线程池对象\r\n     */\r\n    public static ThreadPoolExecutor threadPool = new ThreadPoolExecutor(Runtime.getRuntime().availableProcessors(),\r\n            Runtime.getRuntime().availableProcessors() + 1,\r\n            3,\r\n            TimeUnit.SECONDS,\r\n            new LinkedBlockingQueue<Runnable>(3),\r\n            Executors.defaultThreadFactory(),\r\n            new ThreadPoolExecutor.CallerRunsPolicy());\r\n\r\n    /**\r\n     * 1.public static CompletableFuture<Void> runAsync(Runnable runnable);  使用默认的线程池\r\n     * 只需将 ,threadPool 去掉即可\r\n     * 2.public static CompletableFuture<Void> runAsync(Runnable runnable,  Executor executor) 自定义线程池\r\n     * 只需将 ,threadPool 加上即可\r\n     */\r\n    public static void runAsync() throws ExecutionException, InterruptedException {\r\n        log.info(\"主线程start……\");\r\n\r\n        /**\r\n         * 异步任务\r\n         *  没有返回值,为定义线程池\r\n         *  public static CompletableFuture<Void> runAsync(Runnable runnable);\r\n         */\r\n        CompletableFuture<Void> runAsync = CompletableFuture.runAsync(\r\n                () -> {\r\n                    log.info(\"子线程future线程start……\");\r\n                    int i = 10 / 2;\r\n                    log.info(\"线程名称：{}，线程执行结果：{}\", Thread.currentThread().getName(), i);\r\n                    log.info(\"子线程future线程end……\");\r\n                }, threadPool);\r\n\r\n        // 调用异步任务\r\n        runAsync.get();\r\n\r\n        log.info(\"主线程end……\");\r\n    }\r\n\r\n    /**\r\n     * supplyAsync\r\n     */\r\n\r\n\r\n    /**\r\n     * 异步调用\r\n     *      异步调用实现一个不需要被等等的方法的返回值,让调用者继续执行（异步执行）；\r\n     *      在java 中，简单的讲就是开启另一个线程完成程序计算，使得调用者继续执行，不需要等等计算的结果，但是调用者任然需要获取线程的计算结果（不需要同步阻塞等待）。\r\n     * 通俗理解就是：\r\n     *      主线程将任务交个子线程，主线程就返回，不需要等待执行结果，主线程可以继续往下执行\r\n     */\r\n\r\n    /**\r\n     * Future 也是一个异步计算结果返回接口，目的获取返回值结果。但是 future 在获取返回值结构的时候，方法必须同步阻塞等待返回值结果。\r\n     *      Get : 获取结果（等待，阻塞）\r\n     *      Get(timeout) : 获取结果，指定等待时间\r\n     *      Cancel : 取消当前任务\r\n     *      isDone : 判断任务是否已经完成 （轮询）\r\n     * futrure 对于结果获取不是很方便，只能通过同步阻塞的方式获取结果，或者是轮询的方式获取到结果；阻塞的方式获取返回值结果与异步的思想想违背，轮询方式又很占用 cpu 资源，也不能及时得到我们结果。\r\n     */\r\n\r\n    /**\r\n     * CompletableFuture\r\n     *      可以帮助我们简化异步编程复杂性，提供了函数式编程的能力，可以通过回调函数的方式处理计算结果。\r\n     * public class CompletableFuture<T> implements Future<T>, CompletionStage<T>\r\n     *      CompletableFuture 具有Future 的特性，还实现了CompletionStage 接口，具备CompletionStage\r\n     *      接口的特性： 串行执行，并行执行，聚合（AND 聚合，OR 聚合）\r\n     * 1.串行关系执行\r\n     *      then – 然后，也就是表示下一步，所以通常是一个串行的关系体现，then后面的单词（比如 run/apply/accept）就是函数是接口中抽象方法名称；\r\n     *      利用上一步的执行结果，去进行下一步任务执行，任务执行具有先后顺序，因此把这种操作叫做串行关系\r\n     *\r\n     *      public CompletionStage<Void> thenRun(Runnable action);\r\n     *      public CompletionStage<Void> thenRunAsync(Runnable action);\r\n     *      public CompletableFuture<Void> thenRunAsync(Runnable action,Executor executor);\r\n     *\r\n     *      public <U> CompletableFuture<U> thenApply( Function<? super T,? extends U> fn) ;\r\n     *      public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn);\r\n     *      public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn,Executor executor);\r\n     *\r\n     *      public CompletionStage<Void> thenAccept(Consumer<? super T> action);\r\n     *      public CompletionStage<Void> thenAcceptAsync(Consumer<? super T> action);\r\n     *      public CompletionStage<Void> thenAcceptAsync(Consumer<? super T>  action, Executor executor);\r\n     *\r\n     *      public <U> CompletionStage<U> thenCompose(Function<? super T, ? extends CompletionStage<U>> fn);\r\n     *      public <U> CompletionStage<U> thenComposeAsync(Function<? super T, ? extends CompletionStage<U>> fn);\r\n     *      public <U> CompletionStage<U> thenComposeAsync(Function<? super T, ? extends CompletionStage<U>> fn, Executor executor);\r\n     *\r\n     * 2.聚合and\r\n     * Combine…… with …… 和 both…… and …… 都是要求两者都必须满足，也就是and 且的关系。\r\n     *\r\n     *      public <U,V> CompletionStage<V> thenCombine  (CompletionStage<? extends U> other, BiFunction<? super T,? super U,? extends V> fn);\r\n     *      public <U,V> CompletionStage<V> thenCombineAsync  (CompletionStage<? extends U> other,  BiFunction<? super T,? super U,? extends V> fn);\r\n     *      public <U,V> CompletionStage<V> thenCombineAsync (CompletionStage<? extends U> other,  BiFunction<? super T,? super U,? extends V> fn, Executor executor);\r\n     *\r\n     *      public <U> CompletionStage<Void> thenAcceptBoth (CompletionStage<?  extends U> other, BiConsumer<? super T, ? super U> action);\r\n     *      public <U> CompletionStage<Void> thenAcceptBothAsync (CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action);\r\n     *      public <U> CompletionStage<Void> thenAcceptBothAsync(CompletionStage<? extends U> other, BiConsumer<? super T, ? super U> action,  Executor executor);\r\n     *\r\n     *      public CompletionStage<Void> runAfterBoth(CompletionStage<?> other, Runnable action);\r\n     *      public CompletionStage<Void> runAfterBothAsync(CompletionStage<?> other, Runnable action);\r\n     *      public CompletionStage<Void> runAfterBothAsync(CompletionStage<?> other, Runnable action, Executor executor);\r\n     *\r\n     * 3.聚合or\r\n     *      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n     *      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn, Executor executor);\r\n     *\r\n     *      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn);\r\n     *      public <U> CompletionStage<U> applyToEitherAsync (CompletionStage<? extends T> other, Function<? super T, U> fn, Executor executor);\r\n     *      public CompletionStage<Void> acceptEither (CompletionStage<? extends T> other, Consumer<? super T> action);\r\n     *\r\n     *      public CompletionStage<Void> acceptEitherAsync (CompletionStage<? extends T> other, Consumer<? super T> action);\r\n     *      public CompletionStage<Void> acceptEitherAsync (CompletionStage<? extends T> other, Consumer<? super T> action, Executor executor);\r\n     *      public CompletionStage<Void> runAfterEither(CompletionStage<?> other, Runnable action);\r\n     *      public CompletionStage<Void> runAfterEitherAsync (CompletionStage<?> other, Runnable action);\r\n     *      public CompletionStage<Void> runAfterEitherAsync (CompletionStage<?> other, Runnable action, Executor executor);\r\n     *\r\n     * 4.异常处理\r\n     *      public CompletionStage<T> exceptionally(Function<Throwable, ? extends T> fn);\r\n     *      public CompletionStage<T> whenComplete (BiConsumer<? super T, ? super Throwable> action);\r\n     *      public CompletionStage<T> whenCompleteAsync (BiConsumer<? super T, ? super Throwable> action);\r\n     *      public CompletionStage<T> whenCompleteAsync (BiConsumer<? super T, ? super Throwable> action, Executor executor);\r\n     *      public <U> CompletionStage<U> handle (BiFunction<? super T, Throwable, ? extends U> fn);\r\n     *      public <U> CompletionStage<U> handleAsync (BiFunction<? super T, Throwable, ? extends U> fn);\r\n     *      public <U> CompletionStage<U> handleAsync (BiFunction<? super T, Throwable, ? extends U> fn, Executor executor);\r\n     *\r\n     */\r\n\r\n    /**\r\n     * 异步开启\r\n     *      CompletableFuture 提供了 4 个静态的方法，来创建一个异步操作（异步开启： 从这 4 个静态的方法开发即可）\r\n     * 1.runAsync方法:\r\n     *      没有返回值的方法，不关注返回值\r\n     *      public static CompletableFuture<Void> runAsync(Runnable runnable);\r\n     *      public static CompletableFuture<Void> runAsync(Runnable runnable,Executor executor);\r\n     * 2.supplyAsync :\r\n     *      有返回值，关注返回值的。\r\n     *      public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier);\r\n     *      public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,Executor executor)\r\n     */\r\n}\r\n\r\n```\r\n## 网上找的参考Demo\r\n```java\r\n	@Autowired\r\n    private ThreadPoolExecutor executor;\r\n\r\n\r\n // 新建一个包装类对象\r\n    SkuItemVo itemVo = new SkuItemVo();\r\n\r\n    // 开启异步编排实现，提升服务性能  supplyAsync 有返回值\r\n    // 1、根据 skuId 查询 sku 基本信息\r\n    CompletableFuture<SkuInfoEntity> infoFuture =\r\n            CompletableFuture.supplyAsync(() -> {\r\n                SkuInfoEntity skuInfoEntity = this.getById(skuId);\r\n                itemVo.setInfo(skuInfoEntity);\r\n                return skuInfoEntity;\r\n            }, executor);\r\n\r\n    // 2、根据 skuId 查询 sku 图片信息（多个图片），skuId 是外键  runAsync 没有返回值\r\n    CompletableFuture<Void> imagesFuture =\r\n            CompletableFuture.runAsync(() -> {\r\n                List<SkuImagesEntity> imageList =\r\n                        skuImagesService.list(new\r\n                                QueryWrapper<SkuImagesEntity>().eq(\"sku_id\", skuId));\r\n                itemVo.setImages(imageList);\r\n            }, executor);\r\n\r\n    //3、根据 spuID 获取 spu 的销售属性  （thenAcceptAsync 串行，没有返回值）\r\n    CompletableFuture<Void> salesFuture =\r\n            infoFuture.thenAcceptAsync((res) -> {\r\n                // 获取 sku 与之对应的 spuId\r\n                Long spuId = res.getSpuId();\r\n                List<SkuItemSaleAttrVo> saleAttrVos =\r\n                        skuSaleAttrValueService.getSaleAttrs(spuId);\r\n                if (saleAttrVos.size() > 0 && saleAttrVos != null) {\r\n                    itemVo.setAttrSales(saleAttrVos);\r\n                }\r\n            }, executor);\r\n\r\n    //4、根据 spuId 查询 spu 的描述信息 （thenAcceptAsync 串行，没有返回值）\r\n    CompletableFuture<Void> descFuture =\r\n            infoFuture.thenAcceptAsync((res) -> {\r\n                // 获取 sku 与之对应的 spuId\r\n                Long spuId = res.getSpuId();\r\n                SpuInfoDescEntity spuInfoDescEntity =\r\n                        spuInfoDescService.getOne(new QueryWrapper<SpuInfoDescEntity>()\r\n                                .eq(\"spu_id\", spuId));\r\n                if (spuInfoDescEntity != null) {\r\n                    itemVo.setDesc(spuInfoDescEntity);\r\n                }\r\n            }, executor);\r\n\r\n    //5、根据 spuID,categoryId 查询 sku 分组规格参数属性值 （thenAcceptAsync 串行，没有返回值）\r\n    CompletableFuture<Void> groupFuture =\r\n            infoFuture.thenAcceptAsync((res) -> {\r\n                // 获取 sku 与之对应的 spuId\r\n                Long spuId = res.getSpuId();\r\n                // 获取分类 id\r\n                Long categoryId = res.getCategoryId();\r\n                List<SpuAttrGroupVo> attrGroupVos =\r\n                        attrGroupService.getGroupAttr(spuId, categoryId);\r\n                if (attrGroupVos.size() > 0) {\r\n                    itemVo.setAttrGroups(attrGroupVos);\r\n                }\r\n            }, executor);\r\n\r\n    // 等待所有的任务完成后，才能返回结果   \r\n    try{\r\n        CompletableFuture.allOf(infoFuture, imagesFuture, salesFuture, descFuture, groupFuture).get();\r\n    catch (Exception e) {\r\n        e.printStackTrace();\r\n    }\r\n```\r\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (14, '## 1.如果\r\n\r\ncase when …… then……ELSE……end\r\n\r\n```sql\r\nselect row_number ( ) over ( ORDER BY schangedate DESC ) RN,\r\n       CASE WHEN STITLE = \'主要人员\' THEN REPLACE ( SBEFORECHANGE, \',\', to_char( chr( 13 ) ) ) ELSE SBEFORECHANGE  END as SBEFORECHANGE,\r\n       CASE WHEN STITLE = \'主要人员\' THEN REPLACE ( SAFTERCHANGE, \',\', to_char( chr( 13 ) ) ) ELSE SAFTERCHANGE  END as SAFTERCHANGE,\r\n       ID,\r\n       SCOMPANYCODE,\r\n       STITLE,\r\n       SUSER,\r\n       SCHANGEDATE\r\nfrom CO_COMPANYINFO_CHANGELOG\r\n```\r\n\r\n## 2.字符串替换/换行\r\n\r\n```sql\r\n# 将 123,1234,12345  结果 123#1234#12345\r\nSELECT REPLACE ( SBEFORECHANGE, \',\', to_char( \'#\' )) from CO_COMPANYINFO_CHANGELOG;\r\n\r\n# 制表符 chr(9)\r\n# 换行符 chr(10)\r\n# 回车符  chr(13)\r\nSELECT REPLACE ( SBEFORECHANGE, \',\', to_char( chr(13) )) from CO_COMPANYINFO_CHANGELOG;\r\n\r\n# 如果多个一起使用   chr(13) || chr(10)\r\nSELECT REPLACE ( SBEFORECHANGE, \',\', to_char( chr(13) || chr(10) )) from CO_COMPANYINFO_CHANGELOG;\r\n```\r\n\r\n## 3.字符串拆分\r\n\r\n[参照CSDN](https://blog.csdn.net/a720561252803/article/details/90487187?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522165207852616781667824006%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=165207852616781667824006&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_ecpm_v1~rank_v31_ecpm-1-90487187-null-null.142^v9^pc_search_result_cache,157^v4^control&utm_term=regexp_substr&spm=1018.2226.3001.4187)\r\n\r\n```sql\r\nREGEXP_SUBSTR(String, pattern, position, occurrence, modifier)\r\nstring:需要进行正则处理的字符串\r\npattern：进行匹配的正则表达式\r\nposition：起始位置，从字符串的第几个字符开始正则表达式匹配（默认为1） 注意：字符串最初的位置是1而不是0\r\noccurrence：获取第几个分割出来的组（分割后最初的字符串会按分割的顺序排列成组）\r\nmodifier：模式（‘i’不区分大小写进行检索；‘c’区分大小写进行检索。默认为’c’）针对的是正则表达式里字符大小写的匹配\r\n```\r\n\r\n| 参数            | 含义                                                         |\r\n| :-------------- | :----------------------------------------------------------- |\r\n| source_char     | 源字符串，查找此字符串中的数据。                             |\r\n| pattern         | 正则表达式。                                                 |\r\n| position        | 起始位置，从字符串的第几个字符开始匹配（默认为1） 注意：字符串最初的位置是1而不是0 |\r\n| occurrence      | 获取第几个分割出来的组（分割后最初的字符串会按分割的顺序排列成组） |\r\n| match_parameter | 模式选择，i不区分大小写，c区分大小写(默认)。                 |\r\n\r\n```sql\r\n-- 案例  将字符串	 \'2001,2002,200103,2005\' 拆分成 2001,2002,200103,2005 结果集\r\nSELECT\r\n	regexp_substr( \'2001,2002,200103,2005\', \'[^,]+\', 1, LEVEL, \'i\' ) AS str \r\nFROM\r\n	dual CONNECT BY LEVEL <= length( \'2001,2002,200103,2005\' ) - length( regexp_replace( \'2001,2002,200103,2005\', \',\', \'\' ) ) + 1;\r\n\r\n-- 案例 将字符串 11a22A33a 安装A区分大小写，level层级小于5， 11a22，33a   \r\nSELECT REGEXP_SUBSTR(\'11a22A33a\',\'[^A]+\',1,level,\'c\') AS STR\r\nFROM DUAL\r\nconnect by level<=5;\r\n```\r\n\r\n```java\r\n-- 案例  将字符串	 \'2001,2002,200103,2005\' 拆分成 2001,2002,200103,2005 结果集\r\n    \r\nSELECT\r\n	regexp_substr( \'2001,2002,200103,2005\', \'[^,]+\', 1, LEVEL, \'i\' ) AS str \r\nFROM\r\n	dual CONNECT BY LEVEL <= length( \'2001,2002,200103,2005\' ) - length( regexp_replace( \'2001,2002,200103,2005\', \',\', \'\' ) ) + 1;\r\n\r\n\r\nSELECT DISTINCT\r\n	id,\r\n	regexp_substr( SPOSITION, \'[^,]+\', 1, LEVEL, \'i\' ) AS str \r\nFROM\r\n	CO_COMPANY_KEYPERSONNEL CONNECT BY LEVEL <= length( SPOSITION ) - length( regexp_replace( SPOSITION, \',\', \'\' ) ) + 1 \r\nORDER BY	id\r\n```\r\n\r\n\r\n\r\n```sql\r\n\r\nSELECT\r\nm1.ID,\r\nm1.SCOMPANYCODE,\r\nm1.NNAME,\r\nm1.NCGBL,\r\nwm_concat ( m3.JOB_NAME ) \r\nFROM\r\n	CO_COMPANY_KEYPERSONNEL m1,\r\n	(\r\n	SELECT DISTINCT\r\n		id,\r\n		REGEXP_SUBSTR( k.SPOSITION, \'[^,]+\', 1, LEVEL, \'i\' ) AS STR \r\n	FROM\r\n		CO_COMPANY_KEYPERSONNEL k \r\n		CONNECT BY LEVEL <= LENGTH( k.SPOSITION ) - LENGTH( REPLACE ( k.SPOSITION, \',\', \'\' ) ) + 1 \r\n	) m2,\r\n	u_job m3 \r\nWHERE\r\n	m1.id = m2.id \r\n	AND m2.str = m3.JOB_ID \r\nGROUP BY\r\nm1.ID,\r\nm1.SCOMPANYCODE,\r\nm1.NNAME,\r\nm1.NCGBL;\r\n```\r\n\r\n', 'markdown');

-- ----------------------------
-- Table structure for mto_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_tag`;
CREATE TABLE `mto_post_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NULL DEFAULT NULL,
  `tag_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IK_TAG_ID`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_post_tag
-- ----------------------------
INSERT INTO `mto_post_tag` VALUES (1, 3, '4', NULL);
INSERT INTO `mto_post_tag` VALUES (2, 4, '4', NULL);
INSERT INTO `mto_post_tag` VALUES (3, 5, '4', NULL);
INSERT INTO `mto_post_tag` VALUES (4, 6, '4', NULL);
INSERT INTO `mto_post_tag` VALUES (5, 6, '32', NULL);

-- ----------------------------
-- Table structure for mto_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_tag`;
CREATE TABLE `mto_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `thumbnail` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(5) NOT NULL DEFAULT 0 COMMENT '状态(0为正常)',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_9ki38gg59bw5agwxsc4xtednf`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mto_tag
-- ----------------------------
INSERT INTO `mto_tag` VALUES (1, NULL, 'mysql', NULL, NULL, '2021-08-28 21:15:01', 0, 0);
INSERT INTO `mto_tag` VALUES (2, NULL, 'Linux', NULL, NULL, '2021-01-09 23:11:31', 0, 0);
INSERT INTO `mto_tag` VALUES (4, NULL, 'java', NULL, NULL, '2021-11-09 16:39:41', 0, 0);
INSERT INTO `mto_tag` VALUES (5, NULL, '其他', NULL, NULL, '2020-11-20 10:04:36', 0, 0);
INSERT INTO `mto_tag` VALUES (7, NULL, 'ElasticSearch', NULL, NULL, '2020-11-28 15:16:36', 0, 0);
INSERT INTO `mto_tag` VALUES (10, NULL, 'SpringBoot', NULL, NULL, '2021-05-20 09:34:05', 0, 0);
INSERT INTO `mto_tag` VALUES (22, NULL, '项目', NULL, NULL, '2021-03-12 12:27:59', 0, 0);
INSERT INTO `mto_tag` VALUES (24, NULL, 'redis', NULL, NULL, '2021-06-05 15:50:38', 0, 0);
INSERT INTO `mto_tag` VALUES (32, NULL, '多线程', NULL, NULL, '2021-05-22 15:30:40', 0, 0);
INSERT INTO `mto_tag` VALUES (35, NULL, 'yml', NULL, NULL, '2021-06-28 21:50:52', 0, 0);
INSERT INTO `mto_tag` VALUES (36, NULL, '面试', NULL, NULL, '2021-08-30 22:35:58', 0, 0);

-- ----------------------------
-- Table structure for pin_board
-- ----------------------------
DROP TABLE IF EXISTS `pin_board`;
CREATE TABLE `pin_board`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `board_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '便签头',
  `board_content` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '便签内容',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pin_board
-- ----------------------------
INSERT INTO `pin_board` VALUES (3, 'HTML5 文档类型', 'Bootstrap 使用到的某些 HTML 元素和 CSS 属性需要将页面设置为 HTML5 文档类型。在你项目中的每个页面都要参照下面的格式进行设置。', 1, 'admin', '2022-05-29 13:58:30', '', NULL);
INSERT INTO `pin_board` VALUES (4, '移动设备优先', '在 Bootstrap 2 中，我们对框架中的某些关键部分增加了对移动设备友好的样式。而在 Bootstrap 3 中，我们重写了整个框架，使其一开始就是对移动设备友好的。这次不是简单的增……', 2, 'admin', '2022-05-29 13:58:52', '', NULL);
INSERT INTO `pin_board` VALUES (5, '排版与链接', 'Bootstrap 排版、链接样式设置了基本的全局样式。分别是： 为 body 元素设置 background-color: #fff;', 3, 'admin', '2022-05-29 13:59:53', '', NULL);
INSERT INTO `pin_board` VALUES (6, 'Normalize', '为了增强跨浏览器表现的一致性，我们使用了 Normalize.css，这是由 Nicolas Gallagher 和 Jonathan Neal 维护的一个CSS 重置样式库。', 4, 'admin', '2022-05-29 14:00:44', '', NULL);
INSERT INTO `pin_board` VALUES (7, '布局容器', 'Bootstrap 需要为页面内容和栅格系统包裹一个 .container 容器。我们提供了两个作此用处的类。注意，由于 padding 等属性的原因，这两种 容器类不能互相嵌套', 6, 'admin', '2022-05-29 14:01:10', '', NULL);
INSERT INTO `pin_board` VALUES (8, '栅格系统', 'Bootstrap 提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。它包含了易于使', 6, 'admin', '2022-05-29 14:02:43', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_user`;
CREATE TABLE `sys_auth_user`  (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `uuid` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方平台用户唯一ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '系统用户ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户来源',
  `info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方返回的所有信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-05-29 13:23:54', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 2, '收入', '0', 'account_income_pay', NULL, 'success', 'N', '0', 'admin', '2021-11-21 09:36:30', '', NULL, '账户分类的收支状态');
INSERT INTO `sys_dict_data` VALUES (31, 1, '支出', '1', 'account_income_pay', '', 'danger', 'Y', '0', 'admin', '2021-11-21 09:36:55', 'admin', '2021-11-21 09:37:12', '账户分类的收支状态');
INSERT INTO `sys_dict_data` VALUES (32, 1, '入账', '0', 'account_is_Total', NULL, 'primary', 'Y', '0', 'admin', '2021-11-21 14:36:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 2, '不入账', '1', 'account_is_Total', NULL, 'warning', 'N', '0', 'admin', '2021-11-21 14:37:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 1, '永结同心', '1', 'note_type', '', 'primary', 'Y', '0', 'admin', '2021-12-18 16:19:40', 'superAdmin', '2022-02-14 22:34:11', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-11-13 11:48:10', 'admin', '2021-11-21 17:49:30', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态(显/藏)', 'sys_show_hide', '0', 'admin', '2021-11-13 11:48:10', 'admin', '2021-11-21 10:51:28', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '账户收支', 'account_income_pay', '0', 'admin', '2021-11-21 09:34:24', '', NULL, '收入与支出');
INSERT INTO `sys_dict_type` VALUES (12, '是否记入总账', 'account_is_Total', '0', 'admin', '2021-11-21 14:36:17', '', NULL, '是否记入总账');
INSERT INTO `sys_dict_type` VALUES (13, '随手记类型', 'note_type', '0', 'admin', '2021-12-18 15:49:06', '', NULL, '随手记类型');
INSERT INTO `sys_dict_type` VALUES (14, '正常停用状态', 'start_stop_status', '0', 'admin', '2021-12-11 18:06:04', '', NULL, '正常停用状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-05-29 13:23:54', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-11-13 11:48:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 11, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-11-13 11:48:05', 'admin', '2021-11-21 09:09:53', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 10, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-11-13 11:48:05', 'admin', '2021-11-21 09:10:19', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 13, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2021-11-13 11:48:05', 'admin', '2021-11-21 09:10:04', '若依官网地址');
INSERT INTO `sys_menu` VALUES (5, '博客管理', 0, 1, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-keyboard-o', 'admin', '2021-11-13 11:48:05', 'admin', '2021-11-21 09:07:05', '博客管理目录');
INSERT INTO `sys_menu` VALUES (6, '毅茹记账', 0, 3, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-bank', 'admin', '2021-11-21 09:05:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (7, '备忘录', 0, 4, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-address-card', 'admin', '2021-11-27 13:25:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (8, '文件管理', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-map', 'admin', '2022-06-19 08:38:03', 'admin', '2022-06-19 08:38:11', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-11-13 11:48:05', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-11-13 11:48:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-11-13 11:48:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-11-13 11:48:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-11-13 11:48:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-11-13 11:48:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-11-13 11:48:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-11-13 11:48:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 2, 9, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-11-13 11:48:05', 'superAdmin', '2022-01-28 18:41:45', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-11-13 11:48:05', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-11-13 11:48:05', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-11-13 11:48:05', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-11-13 11:48:05', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-11-13 11:48:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-11-13 11:48:05', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-11-13 11:48:05', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-11-13 11:48:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-11-13 11:48:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-11-13 11:48:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '栏目管理', 5, 1, '/mto/channel', '', 'C', '0', '1', 'mto:channel:view', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '栏目管理菜单');
INSERT INTO `sys_menu` VALUES (1071, '栏目管理查询', 1070, 1, '#', '', 'F', '0', '1', 'mto:channel:list', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '栏目管理新增', 1070, 2, '#', '', 'F', '0', '1', 'mto:channel:add', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '栏目管理修改', 1070, 3, '#', '', 'F', '0', '1', 'mto:channel:edit', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '栏目管理删除', 1070, 4, '#', '', 'F', '0', '1', 'mto:channel:remove', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '栏目管理导出', 1070, 5, '#', '', 'F', '0', '1', 'mto:channel:export', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '博客管理', 5, 3, '/mto/post', 'menuItem', 'C', '0', '1', 'mto:post:view', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO `sys_menu` VALUES (1079, '博客页面List查询', 1078, 1, '#', 'menuItem', 'F', '0', '1', 'mto:post:list', '#', 'admin', '2021-11-13 15:23:07', 'admin', '2021-11-21 08:48:26', '');
INSERT INTO `sys_menu` VALUES (1080, '博客新增', 1078, 3, '#', '', 'F', '0', '1', 'mto:post:add', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '博客详情查看', 1078, 2, '#', '', 'F', '0', '1', 'mto:post:selectDetail', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '博客修改', 1078, 4, '#', '', 'F', '0', '1', 'mto:post:edit', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '博客删除', 1078, 5, '#', '', 'F', '0', '1', 'mto:post:remove', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '博客导入', 1078, 6, '#', 'menuItem', 'F', '0', '1', 'mto:post:import', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2022-02-27 19:26:48', '');
INSERT INTO `sys_menu` VALUES (1085, '记账分类', 6, 1, '/account/classif', 'menuItem', 'C', '0', '1', 'classif:account:view', '#', 'admin', '2021-11-21 09:44:44', 'admin', '2021-11-22 12:56:01', '记账分类菜单');
INSERT INTO `sys_menu` VALUES (1086, '记账分类查询', 1085, 1, '#', '', 'F', '0', '1', 'classif:account:list', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '记账分类新增', 1085, 2, '#', '', 'F', '0', '1', 'classif:account:add', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '记账分类修改', 1085, 3, '#', '', 'F', '0', '1', 'classif:account:edit', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1089, '记账分类删除', 1085, 4, '#', '', 'F', '0', '1', 'classif:account:remove', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, '记账分类导出', 1085, 5, '#', '', 'F', '0', '1', 'classif:account:export', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1091, '记账账户', 6, 2, '/account/account', 'menuItem', 'C', '0', '1', 'account:account:view', '#', 'admin', '2021-11-21 10:56:40', 'superAdmin', '2021-11-22 22:36:02', '记账账户菜单');
INSERT INTO `sys_menu` VALUES (1092, '记账账户查询', 1091, 1, '#', '', 'F', '0', '1', 'account:account:list', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1093, '记账账户新增', 1091, 2, '#', '', 'F', '0', '1', 'account:account:add', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1094, '记账账户修改', 1091, 3, '#', '', 'F', '0', '1', 'account:account:edit', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1095, '记账账户删除', 1091, 4, '#', '', 'F', '0', '1', 'account:account:remove', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1096, '记账账户导出', 1091, 5, '#', '', 'F', '0', '1', 'account:account:export', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1097, '记账详情按钮', 1091, 1, '/account/account', '', 'F', '0', '1', 'account:account:detail', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '记账账户菜单');
INSERT INTO `sys_menu` VALUES (1098, '账目详情列表', 1097, 1, '#', '', 'F', '0', '1', 'account:money:list', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, '账目详情新增', 1097, 2, '#', '', 'F', '0', '1', 'account:money:add', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (1100, '账目详情修改', 1097, 3, '#', '', 'F', '0', '1', 'account:money:edit', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (1101, '账目详情删除', 1097, 4, '#', '', 'F', '0', '1', 'account:money:remove', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '账目详情导出', 1097, 5, '#', '', 'F', '0', '1', 'account:money:export', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (1103, '账单详情', 6, 3, '/account/bill', 'menuItem', 'C', '0', '1', 'account:bill:view', '#', 'superAdmin', '2021-11-23 13:32:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1104, '账单详情导出', 1103, 3, '#', 'menuItem', 'F', '0', '1', 'account:money:export', '#', 'superAdmin', '2021-11-23 13:32:48', 'admin', '2021-11-26 14:49:50', '');
INSERT INTO `sys_menu` VALUES (1105, '标签管理', 5, 2, '/mto/tag', 'menuItem', 'C', '0', '1', 'mto:tag:view', '#', 'admin', '2021-11-27 11:29:13', 'admin', '2021-11-27 12:50:28', '博客标签菜单');
INSERT INTO `sys_menu` VALUES (1106, '博客标签查询', 1105, 1, '#', '', 'F', '0', '1', 'mto:tag:list', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1107, '博客标签新增', 1105, 2, '#', '', 'F', '0', '1', 'mto:tag:add', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '博客标签修改', 1105, 3, '#', '', 'F', '0', '1', 'mto:tag:edit', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1109, '博客标签删除', 1105, 4, '#', '', 'F', '0', '1', 'mto:tag:remove', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '详情导出', 1103, 1, '#', 'menuItem', 'F', '0', '1', 'account:bill:export', '#', 'admin', '2021-11-27 12:59:02', 'admin', '2021-12-04 13:23:21', '');
INSERT INTO `sys_menu` VALUES (1111, '备忘录', 7, 1, '/memorial/pinBoard', 'menuItem', 'C', '0', '1', 'memorial:pin_board:view', '#', 'admin', '2021-11-27 13:27:48', 'admin', '2021-11-27 21:35:11', '');
INSERT INTO `sys_menu` VALUES (1112, '任务清单', 7, 2, '/memorial/agileBoard', 'menuItem', 'C', '0', '1', 'memorial:agile_board:view', '#', 'admin', '2021-11-27 21:36:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1113, '任务清单删除', 1112, 3, '#', 'menuItem', 'F', '0', '1', 'memorial:agile:remov', '#', 'admin', '2021-12-01 17:25:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1114, '报表统计', 1103, 2, '#', 'menuItem', 'F', '0', '1', 'account:bill:count', '#', 'admin', '2021-12-04 13:20:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1115, '博客前台', 5, 5, '/blog/list', 'menuBlank', 'C', '0', '1', '', '#', 'superAdmin', '2021-12-05 19:14:45', '一粒麦子', '2022-05-22 12:41:13', '');
INSERT INTO `sys_menu` VALUES (1116, '导航管理', 5, 0, '/mto/category', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2021-12-11 17:45:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1117, '导航管理查询', 1116, 1, '#', '', 'F', '0', '1', 'system:category:list', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1118, '导航管理新增', 1116, 2, '#', '', 'F', '0', '1', 'system:category:add', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1119, '导航管理修改', 1116, 3, '#', '', 'F', '0', '1', 'system:category:edit', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1120, '导航管理删除', 1116, 4, '#', '', 'F', '0', '1', 'system:category:remove', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1121, '导航管理导出', 1116, 5, '#', '', 'F', '0', '1', 'system:category:export', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1122, '友情链接', 5, 4, '/mto/link', 'menuItem', 'C', '0', '1', 'mto:link:view', '#', 'admin', '2021-12-13 17:27:35', 'admin', '2021-12-17 21:23:22', 'mto菜单');
INSERT INTO `sys_menu` VALUES (1123, '友情链接查询', 1122, 1, '#', '', 'F', '0', '1', 'mto:link:list', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1124, '友情链接新增', 1122, 2, '#', '', 'F', '0', '1', 'mto:link:add', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1125, '友情链接修改', 1122, 3, '#', '', 'F', '0', '1', 'mto:link:edit', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1126, '友情链接删除', 1122, 4, '#', '', 'F', '0', '1', 'mto:link:remove', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1127, '备忘录新增', 1111, 2, '#', '', 'F', '0', '1', 'memorial:pin_board:add', '#', 'admin', '2021-12-17 20:21:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1128, '备忘录删除', 1111, 4, '#', '', 'F', '0', '1', 'memorial:pin_board:remove', '#', 'admin', '2021-12-17 20:22:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1129, '备忘录修改', 1111, 3, '#', '', 'F', '0', '1', 'memorial:pin_board:edit', '#', 'admin', '2021-12-17 21:18:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1130, '任务清单新增', 1112, 1, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:add', '#', 'admin', '2021-12-18 12:57:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1131, '任务清单状态修改', 1112, 2, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:editStatus', '#', 'admin', '2021-12-18 12:57:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1132, '备忘录查询', 1111, 4, '#', 'menuItem', 'F', '0', '1', 'memorial:pin_board:view', '#', 'admin', '2021-12-18 13:28:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1133, '任务清单查询', 1112, 4, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:view', '#', 'admin', '2021-12-18 13:29:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1134, '随手记', 7, 4, '/emmanuel/noteBoard', 'menuItem', 'C', '0', '1', 'memorial:note_board:view', '#', 'admin', '2021-12-13 17:27:35', 'admin', '2021-12-17 21:23:22', 'mto菜单');
INSERT INTO `sys_menu` VALUES (1135, '随手记查询', 1134, 1, '#', '', 'F', '0', '1', 'memorial:note_board:list', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1136, '随手记新增', 1134, 2, '#', '', 'F', '0', '1', 'memorial:note_board:add', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1137, '随手记修改', 1134, 3, '#', '', 'F', '0', '1', 'memorial:note_board:edit', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1138, '随手记删除', 1134, 4, '#', '', 'F', '0', '1', 'memorial:note_board:remove', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1139, '随手记查询详情', 1134, 5, '#', 'menuItem', 'F', '0', '1', 'memorial:note_board:datail', '#', 'superAdmin', '2022-02-21 07:23:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1140, '首访博客', 108, 3, '/mto/post/first', 'menuItem', 'C', '0', '1', 'mto:blog:first', 'fa fa-clock-o', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-05-29 13:34:55', '进入访问ip列表');
INSERT INTO `sys_menu` VALUES (1141, '公告详情', 107, 5, '#', 'menuItem', 'F', '0', '1', 'system:notice:selectDetail', '#', 'admin', '2022-05-04 15:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1142, '删除首次访问博客记录', 1140, 1, '#', 'menuItem', 'F', '0', '1', 'mto:blog:first:remove', '#', '一粒麦子', '2022-05-29 13:35:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1143, '上传文件', 8, 0, '/upload/uploader', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2022-06-19 08:39:22', 'admin', '2022-06-19 08:41:14', '');
INSERT INTO `sys_menu` VALUES (1145, '博客清空静态页面', 1078, 7, '#', 'menuItem', 'F', '0', '1', 'mto:post:cleasrStaticPage', '#', 'admin', '2022-07-10 12:52:28', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1146, '文件管理', 8, 1, '/cloud/file/fileManagementHtml', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-07-16 07:45:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1145, '邮件管理', 1, 9, '/system/mail', 'menuItem', 'C', '0', '1', 'system:mail:view', '#', 'admin', '2022-07-22 14:18:46', '一粒麦子', '2022-07-23 11:13:22', '【请填写功能名称】菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1146, '【邮件】查询', 1145, 1, '#', '', 'F', '0', '1', 'system:mail:list', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1147, '【邮件】发送', 1145, 2, '#', '', 'F', '0', '1', 'system:mail:add', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1148, '【邮件】查看', 1145, 3, '#', '', 'F', '0', '1', 'system:mail:detail', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1149, '【邮件】删除', 1145, 4, '#', '', 'F', '0', '1', 'system:mail:remove', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-05-29 13:23:54', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-05-29 13:23:54', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `totalSpace` float(11, 1) NULL DEFAULT 0.0 COMMENT '网盘总空间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-05-29 13:42:35', '2022-05-29 13:23:54', 'admin', '2022-05-29 13:23:54', '', '2022-05-29 13:42:34', '管理员', 10.0);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-05-29 13:23:54', '2022-05-29 13:23:54', 'admin', '2022-05-29 13:23:54', '', NULL, '测试员', 10.0);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('6e2d2819-48a8-4e35-8e89-e5bcffc2a812', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', 'on_line', '2022-07-09 07:44:16', '2022-07-09 08:42:54', 3600000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_mail
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail`;
CREATE TABLE `sys_mail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `mail_title` varchar(255) NOT NULL COMMENT '邮件标题',
  `mail_content` varchar(15000) DEFAULT NULL COMMENT '邮件内容',
  `mail_message` varchar(255) DEFAULT NULL COMMENT '邮件info',
  `mail_type` int(1) DEFAULT NULL COMMENT '邮件类型：0简单邮件，1复杂邮件',
  `mail_status` int(1) DEFAULT NULL COMMENT '邮件状态(0草稿，1成功，-1失败)',
  `mail_from` varchar(50) DEFAULT NULL COMMENT '谁发送',
  `mail_to` varchar(50) DEFAULT NULL COMMENT '谁接受',
  `mail_source` varchar(30) DEFAULT NULL COMMENT '邮件发送来源',
  `del_flag` int(1) DEFAULT NULL COMMENT '删除标志（0代表存在, 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

