/*
 Navicat Premium Data Transfer

 Source Server         : https://giteekey.gitee.io/blog-notes/_3306
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : https://giteekey.gitee.io/blog-notes/:3306
 Source Schema         : ruoyi_blog

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 08/02/2023 17:36:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_account
-- ----------------------------
DROP TABLE IF EXISTS `account_account`;
CREATE TABLE `account_account` (
                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                   `cover` varbinary(300) DEFAULT NULL COMMENT '账户封面/图片',
                                   `account_name` varchar(20) NOT NULL COMMENT '账户分类',
                                   `account_introduce` varchar(60) DEFAULT NULL COMMENT '账本介绍',
                                   `visible` char(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '账本状态（0显示 1隐藏）',
                                   `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                                   `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
                                   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                   `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
                                   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                   `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户ID',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for account_class
-- ----------------------------
DROP TABLE IF EXISTS `account_class`;
CREATE TABLE `account_class` (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                 `class_name` varchar(20) NOT NULL COMMENT '分类名称',
                                 `class_type` varchar(100) DEFAULT NULL COMMENT '分类类型',
                                 `class_introduce` varchar(60) DEFAULT NULL COMMENT '分类介绍',
                                 `class_status` char(4) DEFAULT NULL COMMENT '分类状态（停用/启用）',
                                 `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                                 `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_class
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for account_money
-- ----------------------------
DROP TABLE IF EXISTS `account_money`;
CREATE TABLE `account_money` (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                 `account_id` bigint(20) NOT NULL COMMENT '账本id',
                                 `class_id` bigint(20) NOT NULL COMMENT '类型id',
                                 `money_pay` decimal(20,2) DEFAULT NULL COMMENT '金额(支出金额)',
                                 `money_income` decimal(20,2) DEFAULT NULL COMMENT '金额(收出金额)',
                                 `money_date` date DEFAULT NULL COMMENT '花钱日期',
                                 `money_introduce` varchar(2000) DEFAULT NULL COMMENT '备注/金额说明',
                                 `is_total` int(1) NOT NULL DEFAULT '0' COMMENT '是否记入总账（0记入，默认，1不记录）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `deleted` char(1) NOT NULL DEFAULT '0' COMMENT '0是正常，1是删除',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_money
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for account_user_account
-- ----------------------------
DROP TABLE IF EXISTS `account_user_account`;
CREATE TABLE `account_user_account` (
                                        `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                        `post_id` bigint(20) NOT NULL COMMENT '账户ID',
                                        `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                                        PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户与记账账户关联表';

-- ----------------------------
-- Records of account_user_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for biz_repeat_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_repeat_log`;
CREATE TABLE `biz_repeat_log` (
                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                  `biz_id` int(11) unsigned DEFAULT NULL COMMENT '业务ID',
                                  `biz_type` tinyint(1) NOT NULL COMMENT '业务类型：1.文章，2.评论,3.获取天气',
                                  `user_id` varchar(20) DEFAULT NULL COMMENT '已登录用户ID',
                                  `user_ip` varchar(50) DEFAULT NULL COMMENT '用户IP',
                                  `user_agent` varchar(500) DEFAULT NULL COMMENT '客户端标识',
                                  `url` varchar(100) DEFAULT NULL COMMENT '请求地址',
                                  `status` char(1) NOT NULL COMMENT '状态（0正常 1失败）',
                                  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                                  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_repeat_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for board_agile
-- ----------------------------
DROP TABLE IF EXISTS `board_agile`;
CREATE TABLE `board_agile` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
                               `agile_name` varchar(500) DEFAULT NULL COMMENT '任务名称',
                               `agile_status` int(1) NOT NULL COMMENT '状态',
                               `agile_date` datetime NOT NULL COMMENT '任务日期',
                               `user_id` bigint(20) NOT NULL COMMENT '用户id',
                               `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
                               `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '备注',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of board_agile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for board_note
-- ----------------------------
DROP TABLE IF EXISTS `board_note`;
CREATE TABLE `board_note` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                              `note_title` varchar(60) NOT NULL COMMENT '标题',
                              `author_id` bigint(20) DEFAULT NULL COMMENT '作者id',
                              `note_image` varchar(255) DEFAULT NULL COMMENT '图片（预留字段，暂时不考虑）',
                              `note_content` longtext COMMENT '内容',
                              `note_summary` varchar(100) DEFAULT NULL COMMENT '摘要',
                              `note_type` varchar(10) DEFAULT NULL COMMENT '类型（数据字典，不写死）',
                              `note_status` char(1) DEFAULT '0' COMMENT '状态',
                              `is_Public` char(1) DEFAULT NULL COMMENT '是否公共，0公共，  1 私有',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of board_note
-- ----------------------------
BEGIN;
INSERT INTO `board_note` (`id`, `note_title`, `author_id`, `note_image`, `note_content`, `note_summary`, `note_type`, `note_status`, `is_Public`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '说说那些最受欢迎的emoji表情（2019）', 1, NULL, '<h1 class=\"h2 pt2 pb2 center bold\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; padding-top: var(--space-2); padding-right: 0px; padding-bottom: var(--space-2); padding-left: 0px; font-size: var(--h2); font-weight: var(--bold-font-weight,bold); text-align: center; color: rgb(74, 74, 74); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">说说那些最受欢迎的emoji表情（2019）</h1><p><time class=\"block mb2 center\" datetime=\"2020-03-18T16:00:00.000Z\" style=\"box-sizing: inherit; color: rgb(119, 119, 119); font-size: 0.8em; text-align: center; margin-bottom: 1.5rem; font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">2020-03-18</time></p><article class=\"content is-medium px2\" style=\"box-sizing: inherit; padding-left: var(--space-2); padding-right: var(--space-2); font-size: 1.25rem; color: rgb(74, 74, 74); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Oxygen, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><p style=\"box-sizing: inherit; margin-bottom: 1em; padding: 0px; line-height: 1.8; text-indent: 2em;\">“当我们了解客户的情绪时，我们可以更好地满足他们的需求。”这是2020年全球情感报告的目的。那如何来收集客户的情绪数据呢？互联网的普及以及emoji表情的使用使得这个问题可以很好的解决了。研究者们分析了2019年1月的社交网络的上的emoji表情使用数据，那么现在大家一定很好奇，世界上最受欢迎的表情是哪些呢？</p><h4 style=\"box-sizing: inherit; margin: 0px 0px 0.8em; padding: 0px; font-size: 1.25em; color: rgb(54, 54, 54); line-height: 1.125;\">最常用的表情<img src=\"https://emojixd.com/uploads/e7cd9d72e9af4636874a02970de1446a.png\" alt=\"表情图\" style=\"text-indent: 2em; color: rgb(74, 74, 74); font-size: 1.25rem; box-sizing: inherit; height: auto; max-width: 100%;\"></h4><p style=\"box-sizing: inherit; margin-bottom: 1em; padding: 0px; line-height: 1.8; text-indent: 2em;\">前3个表情符号：<a href=\"https://emojixd.com/x7q0\" target=\"_blank\" title=\"笑哭了\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😂\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f602.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7ry\" target=\"_blank\" title=\"放声大哭\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😭\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f62d.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7tb\" target=\"_blank\" title=\"红心\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"❤️\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/2764.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>。而且在样本中的所有国家<a href=\"https://emojixd.com/x7q0\" target=\"_blank\" title=\"笑哭了\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😂\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f602.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>都位居首位！哭笑不得，这个表情的确比言语可以更好的表达一种尴尬的语境和状态。女性最常用的5位是：<a href=\"https://emojixd.com/x7q0\" target=\"_blank\" title=\"笑哭了\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😂\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f602.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7tb\" target=\"_blank\" title=\"红心\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"❤️\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/2764.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7ry\" target=\"_blank\" title=\"放声大哭\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😭\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f62d.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7q7\" target=\"_blank\" title=\"花痴\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😍\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f60d.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7pz\" target=\"_blank\" title=\"笑得满地打滚\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"🤣\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f923.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>；而男性最常用的是<a href=\"https://emojixd.com/x7q0\" target=\"_blank\" title=\"笑哭了\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😂\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f602.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7pz\" target=\"_blank\" title=\"笑得满地打滚\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"🤣\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f923.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7ry\" target=\"_blank\" title=\"放声大哭\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😭\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f62d.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7tb\" target=\"_blank\" title=\"红心\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"❤️\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/2764.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>，<a href=\"https://emojixd.com/x7wy\" target=\"_blank\" title=\"拇指向上\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"👍\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f44d.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>。同时世界各地中，美国使用的负面表情最多（<a href=\"https://emojixd.com/x7ry\" target=\"_blank\" title=\"放声大哭\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😭\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f62d.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>,<a href=\"https://emojixd.com/x7s4\" target=\"_blank\" title=\"累死了\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"😩\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f629.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>,<a href=\"https://emojixd.com/x7qv\" target=\"_blank\" title=\"翻白眼\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"🙄\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f644.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>,&nbsp;<a href=\"https://emojixd.com/x7qn\" target=\"_blank\" title=\"想一想\" style=\"box-sizing: inherit; color: rgb(50, 115, 220);\"><img class=\"emoji\" draggable=\"false\" alt=\"🤔\" src=\"https://twemoji.maxcdn.com/v/12.1.3/72x72/1f914.png\" style=\"box-sizing: inherit; height: auto; max-width: 100%; font-family: &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;noto color emoji&quot;, &quot;android emoji&quot;, emojisymbols, &quot;emojione mozilla&quot;, &quot;twemoji mozilla&quot;, &quot;segoe ui symbol&quot;; width: 2rem; padding: 0px 0.2rem; vertical-align: text-bottom;\"></a>），澳大利亚喜爱使用积极的表情，由于文化的差异，中国的网民更偏爱咧嘴笑。可以说礼仪之邦的中国还是比较客套的。但是随着中国互联网社交媒体的发展，这个占比还是有很大变化的可能的。</p><h4 style=\"box-sizing: inherit; margin: 0px 0px 0.8em; padding: 0px; font-size: 1.25em; color: rgb(54, 54, 54); line-height: 1.125;\">最常见的情感<img src=\"https://emojixd.com/uploads/5863322eaa3a43ad8cf6ff67a656af85.png\" alt=\"最常见的情感（2020全球情感报告）\" style=\"text-indent: 2em; color: rgb(74, 74, 74); font-size: 1.25rem; box-sizing: inherit; height: auto; max-width: 100%;\"></h4><p style=\"box-sizing: inherit; margin-bottom: 1em; padding: 0px; line-height: 1.8; text-indent: 2em;\">大家在网上最常见的就是分享快乐和悲伤了，而且这些表情中有一半以上是快乐的。所以说人们是很希望将自己的快乐分享的。当谈到快乐的谈话时，最常使用“爱”，“快乐”和“好”这样的短语，人们常常提到其他人祝他们生日快乐或称赞他们做得很好。这个也和之前的表情相对应。总体而言，与积极表情最相关的人是家人和朋友。而人们常常在愤怒的气氛中提到工作；当谈到恐惧时，可能是在即将来临的考试或是在面试中.......</p><p style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; line-height: 1.8; text-indent: 2em;\">通过分析人们常用的emoji可以发现，emoji的出现可以让人们更方便直接的表达自己的情感了，这是一件好事，更快速明了的沟通一定使得人与人之间的连接更加紧密，同时通过分析这些表情也可以对各行各业有着指导性的作用！</p></article>', '', '-1', '0', '0', 'superAdmin', '2022-03-18 17:50:39', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cloud_file
-- ----------------------------
DROP TABLE IF EXISTS `cloud_file`;
CREATE TABLE `cloud_file` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT,
                              `user_id` bigint(20) DEFAULT NULL COMMENT '文件所属用户',
                              `oldfilename` varchar(255) DEFAULT NULL COMMENT '原文件名',
                              `newfilename` varchar(255) DEFAULT NULL COMMENT '新文件名',
                              `ext` varchar(255) DEFAULT NULL COMMENT '文件后缀',
                              `url_path` varchar(255) DEFAULT NULL COMMENT '访问文件url地址',
                              `file_path` varchar(255) DEFAULT NULL COMMENT '文件存放路径',
                              `size` float(11,1) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `is_img` int(11) DEFAULT NULL COMMENT '是否是图片（0是，1否）',
  `downcounts` int(11) DEFAULT '0' COMMENT '下载次数',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_public` int(11) DEFAULT '0' COMMENT '是否共享（0正常，1共享）',
  `is_collect` int(11) DEFAULT '0' COMMENT '是否收藏（0正常，1收藏）',
  `is_share` int(11) DEFAULT '0' COMMENT '是否分享（0正常，1分享）',
  `is_recycle` int(11) DEFAULT '0' COMMENT '是否在回收箱（0正常，1删除）',
  `icon` varchar(255) DEFAULT NULL COMMENT '文件显示图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网盘文件';

-- ----------------------------
-- Records of cloud_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
                             `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
                             `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
                                    `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int(11) DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mto_category
-- ----------------------------
DROP TABLE IF EXISTS `mto_category`;
CREATE TABLE `mto_category` (
                                `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                `pid` int(11) unsigned DEFAULT '0',
                                `name` varchar(50) DEFAULT NULL COMMENT '文章类型名',
                                `description` varchar(200) DEFAULT NULL COMMENT '类型介绍',
                                `sort` int(10) DEFAULT NULL COMMENT '排序',
                                `icon` varchar(100) DEFAULT NULL COMMENT '图标',
                                `status` tinyint(1) unsigned DEFAULT '1' COMMENT '是否可用',
                                `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                                `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                `type` int(1) DEFAULT '0' COMMENT '类型 （0分类/1页面）',
                                `page_url` varchar(255) DEFAULT NULL COMMENT '页面请求地址',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='前台导航';

-- ----------------------------
-- Records of mto_category
-- ----------------------------
BEGIN;
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (1, 0, '首页', '', 1, 'fa fa-css3', 1, '2018-01-14 21:34:54', '2022-03-11 13:20:49', 1, '/blog');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (2, 4, '归档', '', 2, 'fa fa-coffee', 1, '2018-01-14 21:34:57', '2022-02-12 19:40:52', 1, '/blog/timeArchives?pageNum=1&pageSize=20');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (3, 0, '文档', '', 50, 'fa fa-folder-open-o', 1, '2018-01-20 22:28:03', '2022-02-08 16:27:11', 0, '');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (4, 0, '文章', '', 49, 'fa fa-folder-open-o', 1, '2018-01-20 22:28:03', '2022-02-08 16:27:11', 0, '');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (7, 4, '时间轴', '页面按时间排序', 3, 'fa fa-calendar-check-o', 1, '2022-01-02 21:58:34', '2022-01-03 18:55:59', 1, '/blog/blog/focus');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (8, 3, '源码', '', 1, 'fa fa-code-fork', 1, '2022-02-08 16:28:02', '2022-02-08 16:28:02', 1, 'https://gitee.com/GiteeKey/ruoyi-blog');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (9, 3, '文档', '', 2, 'fa fa-book', 1, '2022-02-08 16:28:55', '2022-02-08 16:31:32', 1, 'http://ruoyi.vip/');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (10, 4, '标签', '标签页面', 4, 'fa fa-bookmark-o', 1, '2022-03-11 13:20:21', '2022-03-11 13:20:20', 1, '/blog/tags');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (11, 0, '动态', '心情打卡', 5, 'fa fa-fire', 1, '2022-03-12 19:30:23', '2022-03-12 19:31:01', 1, '/blog/dynamics');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (12, 0, '留言板', '', 100, 'fa fa-comments', 1, '2022-03-16 17:04:53', '2022-03-16 17:04:53', 1, '/blog/message/messageBoard');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (13, 0, '新闻', '', 6, 'fa fa-hacker-news', 1, '2022-03-23 20:49:26', '2022-03-26 18:56:51', 1, '/blog/news');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (15, 0, '主页', '我的主页', 0, 'fa fa-home', 1, '2022-09-02 16:24:24', '2022-09-02 16:24:24', 1, '/blog/homepage');
INSERT INTO `mto_category` (`id`, `pid`, `name`, `description`, `sort`, `icon`, `status`, `create_time`, `update_time`, `type`, `page_url`) VALUES (16, 0, 'vue博客', '', 101, 'glyphicon glyphicon-book', 1, '2023-01-15 14:05:00', '2023-01-15 14:05:54', 1, 'https://giteekey.gitee.io/blog-notes/');
COMMIT;

-- ----------------------------
-- Table structure for mto_channel
-- ----------------------------
DROP TABLE IF EXISTS `mto_channel`;
CREATE TABLE `mto_channel` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `key_` varchar(32) DEFAULT NULL COMMENT 'key',
                               `name` varchar(32) DEFAULT NULL COMMENT '名称',
                               `status` int(5) NOT NULL COMMENT '状态：0正常，1隐藏',
                               `thumbnail` varchar(128) DEFAULT NULL COMMENT '图片链接',
                               `type` int(2) DEFAULT NULL COMMENT '类型：1分类，2专题',
                               `weight` int(11) NOT NULL DEFAULT '0',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mto_channel
-- ----------------------------
BEGIN;
INSERT INTO `mto_channel` (`id`, `key_`, `name`, `status`, `thumbnail`, `type`, `weight`) VALUES (15, '使用笔记', '使用笔记', 1, NULL, 1, 0);
INSERT INTO `mto_channel` (`id`, `key_`, `name`, `status`, `thumbnail`, `type`, `weight`) VALUES (17, '密码', '密码', 0, NULL, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for mto_comment
-- ----------------------------
DROP TABLE IF EXISTS `mto_comment`;
CREATE TABLE `mto_comment` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `p_id` bigint(20) DEFAULT NULL COMMENT '父id',
                               `ancestors` varchar(255) DEFAULT NULL COMMENT '祖级列表',
                               `post_id` bigint(20) DEFAULT NULL COMMENT '博客id',
                               `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
                               `nick_name` varchar(64) DEFAULT NULL COMMENT '昵称',
                               `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
                               `love` char(4) DEFAULT NULL COMMENT '点赞',
                               `status` varchar(255) DEFAULT NULL COMMENT '状态',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `examine_by` varchar(20) DEFAULT NULL COMMENT '审核人',
                               `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
                               `ip` varchar(64) DEFAULT NULL,
                               `parent_nick_name` varchar(255) DEFAULT NULL COMMENT '父级名称',
                               `content` varchar(2000) DEFAULT NULL COMMENT '内容',
                               `ip_addr` varchar(60) DEFAULT NULL COMMENT 'ip地址',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='留言';

-- ----------------------------
-- Records of mto_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mto_golden
-- ----------------------------
DROP TABLE IF EXISTS `mto_golden`;
CREATE TABLE `mto_golden` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `golden` varchar(255) DEFAULT NULL COMMENT '金句',
                              `author` varchar(255) DEFAULT NULL COMMENT '名言',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='金句';

-- ----------------------------
-- Records of mto_golden
-- ----------------------------
BEGIN;
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (1, '我们的得救目的不在于我们自身，而是上帝的国度和我们对他的侍奉。得救使我们回到我们治理的使命。这始于重生，并在成圣和治理的过程中继续进行。', '——路斯德尼');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (2, '当我们阅读世俗作者所写的东西时，仍见到令人钦佩的真理的亮光。这提醒我们，虽然人类理性已经大大偏离、扭曲了原初的纯正，但仍然有来自其创造者的奇妙恩赐。', '——约翰·加尔文');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (3, '阅读使人充实，会谈使人敏捷，写作使人精确', '--培根');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (4, '最大的骄傲于最大的自卑都表示心灵的最软弱无力', '--斯宾诺莎');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (5, '依赖人容易使人畏缩、依附，而信赖上帝则使人产生神圣的精神上的安静，使我们的灵魂得以圣化', '——司布真');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (6, '如果我们忠心遵行上帝的律法，我们就可以确信，上帝必信实地成全他的应许。如果我们不忘记上帝的律法，上帝必不会忘记我们', '——司布真');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (7, '在人的整个生命中，唯独基督有完全的主权；没有一寸土地不是属于他的，人都不能说：这是我的！ ', '——亚伯拉罕·凯伯尔');
INSERT INTO `mto_golden` (`id`, `golden`, `author`) VALUES (8, '如果你问我什么是上帝对我们的要求，我要告诉你，第一是谦卑，第二是谦卑，第三是谦卑。这不是说此外再无别的教训，而是因为如果在我们所有的行动之前没有谦卑，我们的努力将毫无意义。', '——奥古斯丁');
COMMIT;

-- ----------------------------
-- Table structure for mto_link
-- ----------------------------
DROP TABLE IF EXISTS `mto_link`;
CREATE TABLE `mto_link` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `link_name` varchar(255) DEFAULT NULL COMMENT '名称',
                            `link_logo` varchar(255) DEFAULT NULL COMMENT 'logo',
                            `link_url` varchar(255) DEFAULT NULL COMMENT 'url地址',
                            `link_description` varchar(255) DEFAULT NULL COMMENT '链接描述',
                            `status` int(1) DEFAULT NULL COMMENT '状态：0正常，1隐藏',
                            `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_link
-- ----------------------------
BEGIN;
INSERT INTO `mto_link` (`id`, `link_name`, `link_logo`, `link_url`, `link_description`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'CSDN', 'https://img-home.csdnimg.cn/images/20201125103341.png', 'https://blog.csdn.net/weixin_46237429', '', NULL, '', NULL, 'admin', '2022-05-28 21:58:45', '');
COMMIT;

-- ----------------------------
-- Table structure for mto_look_ip
-- ----------------------------
DROP TABLE IF EXISTS `mto_look_ip`;
CREATE TABLE `mto_look_ip` (
                               `date` date NOT NULL COMMENT '日期',
                               `ip_list` varchar(1000) DEFAULT NULL COMMENT '当前访问IP',
                               `type` char(1) DEFAULT NULL COMMENT '类型',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='每日访问博客IP';

-- ----------------------------
-- Records of mto_look_ip
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mto_look_ip_first
-- ----------------------------
DROP TABLE IF EXISTS `mto_look_ip_first`;
CREATE TABLE `mto_look_ip_first` (
                                     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                     `ip_addr` varchar(128) DEFAULT NULL COMMENT '当前访问IP',
                                     `ip_location` varchar(255) DEFAULT NULL COMMENT 'ip地址',
                                     `first_visit_url` varchar(255) DEFAULT NULL COMMENT '首次访问URL',
                                     `first_visit_date` datetime DEFAULT NULL COMMENT '首次访问时间',
                                     `remark` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首次访问博客记录';

-- ----------------------------
-- Records of mto_look_ip_first
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mto_post
-- ----------------------------
DROP TABLE IF EXISTS `mto_post`;
CREATE TABLE `mto_post` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                            `author_id` bigint(20) DEFAULT NULL COMMENT '作者id',
                            `channel_id` bigint(11) DEFAULT NULL COMMENT '栏目id',
                            `category_Id` bigint(20) DEFAULT NULL COMMENT '导航id',
                            `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `slider` int(11) DEFAULT '0' COMMENT '轮播图状态 (1是轮播图)',
                            `favors` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数(默认为0为推荐，1是推荐)',
                            `featured` int(11) NOT NULL DEFAULT '0' COMMENT '推荐状态',
                            `status` int(11) NOT NULL DEFAULT '0' COMMENT '文章状态',
                            `summary` varchar(500) DEFAULT NULL COMMENT '摘要',
                            `tags` varchar(100) DEFAULT NULL COMMENT '标签',
                            `thumbnail` varchar(500) DEFAULT NULL COMMENT '图片',
                            `title` varchar(64) DEFAULT NULL COMMENT 'title',
                            `views` int(11) NOT NULL DEFAULT '0' COMMENT '查看次数',
                            `pwd` varchar(20) DEFAULT NULL COMMENT '文章密码',
                            `weight` int(11) NOT NULL DEFAULT '0',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`) USING BTREE,
                            KEY `IK_CHANNEL_ID` (`channel_id`) USING BTREE,
                            KEY `index_title` (`title`) USING BTREE,
                            KEY `index_channel_id` (`channel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COMMENT='博客基本信息';

-- ----------------------------
-- Records of mto_post
-- ----------------------------
BEGIN;
INSERT INTO `mto_post` (`id`, `author_id`, `channel_id`, `category_Id`, `comments`, `create_time`, `slider`, `favors`, `featured`, `status`, `summary`, `tags`, `thumbnail`, `title`, `views`, `pwd`, `weight`, `update_time`) VALUES (134, 1, 15, NULL, 0, '2022-11-19 12:27:08', 0, 0, 0, 0, 'ruoyi-blog博客项目，是前后台响应式，前台与后台都支持手机端，并且跟随ruoyi项目升级，并且作者会长期维护的项目，你值得拥有', '笔记', '', '配置文件说明一', 2, '', 0, '2022-11-19 12:58:44');
INSERT INTO `mto_post` (`id`, `author_id`, `channel_id`, `category_Id`, `comments`, `create_time`, `slider`, `favors`, `featured`, `status`, `summary`, `tags`, `thumbnail`, `title`, `views`, `pwd`, `weight`, `update_time`) VALUES (135, 1, 15, NULL, 0, '2022-11-19 12:51:11', 0, 0, 0, 0, 'ruoyi-blog博客项目，是前后台响应式，前台与后台都支持手机端，并且跟随ruoyi项目升级，并且作者会长期维护的项目，你值得拥有', '笔记', '', '配置文件说明二', 0, '', 0, '2022-11-19 12:56:11');
INSERT INTO `mto_post` (`id`, `author_id`, `channel_id`, `category_Id`, `comments`, `create_time`, `slider`, `favors`, `featured`, `status`, `summary`, `tags`, `thumbnail`, `title`, `views`, `pwd`, `weight`, `update_time`) VALUES (136, 1, 17, NULL, 0, '2022-11-19 12:55:53', 0, 0, 0, 0, '密码：123456 ，', '密码', '', '密码测试', 5, '123456', 0, '2022-11-19 12:57:51');
COMMIT;

-- ----------------------------
-- Table structure for mto_post_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_attribute`;
CREATE TABLE `mto_post_attribute` (
                                      `id` bigint(20) NOT NULL,
                                      `content` longtext,
                                      `editor` varchar(16) DEFAULT 'tinymce',
                                      PRIMARY KEY (`id`) USING BTREE,
                                      KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='博客内容';

-- ----------------------------
-- Records of mto_post_attribute
-- ----------------------------
BEGIN;
INSERT INTO `mto_post_attribute` (`id`, `content`, `editor`) VALUES (134, '# 配置文件说明\r\n\r\n**1.推荐开启静态页面**\r\n\r\n>pageStaticEnabled: true\r\n\r\n**2.推荐配置邮件**\r\n\r\n```yaml\r\n  mail:\r\n	# true 开启邮件发送，为空或者false禁用发送邮件\r\n    enabled: true\r\n    host: QQ或者163或者其他\r\nmail邮箱只需要修改这两处地址即可\r\n    username: xxx你的邮箱地址（修改）\r\n    password: xxx你的mail秘钥（修改）\r\n```\r\n\r\n## application.yml\r\n\r\n```yaml\r\n# 项目相关配置\r\nruoyi:\r\n  # 名称\r\n  name: RuoYi\r\n  # 版本\r\n  version: 4.7.5\r\n  # 版权年份\r\n  copyrightYear: 2022\r\n  # 实例演示开关\r\n  demoEnabled: true\r\n  # 文件上传路径 示例（ Windows配置D:/ruoyi/uploadPath，Linux配置 /home/ruoyi/uploadPath）\r\n  # home/ruoyi/uploadPath 则在项目中创建文件夹\r\n  profile: home/ruoyi/uploadPath\r\n  # 获取ip地址开关\r\n  addressEnabled: true\r\n  # 开启页面静态化\r\n  pageStaticEnabled: true\r\n\r\n# 开发环境配置\r\nserver:\r\n  # 服务器的HTTP端口，默认为10011\r\n  port: 10011\r\n  servlet:\r\n    # 应用的访问路径\r\n    context-path: /\r\n  tomcat:\r\n    # tomcat的URI编码\r\n    uri-encoding: UTF-8\r\n    # tomcat最大线程数，默认为200\r\n    max-threads: 800\r\n    # Tomcat启动初始化的线程数，默认值25\r\n    min-spare-threads: 30\r\n    # 连接数满后的排队数，默认为100\r\n    accept-count: 1000\r\n    threads:\r\n      # tomcat最大线程数，默认为200\r\n      max: 800\r\n      # Tomcat启动初始化的线程数，默认值10\r\n      min-spare: 100\r\n\r\n# 日志配置\r\nlogging:\r\n  level:\r\n    com.ruoyi: debug\r\n    org.springframework: warn\r\n\r\n# 用户配置\r\nuser:\r\n  password:\r\n    # 密码错误{maxRetryCount}次锁定10分钟\r\n    maxRetryCount: 5\r\n\r\n# Spring配置\r\nspring:\r\n  # 模板引擎\r\n  thymeleaf:\r\n#    mode: HTML\r\n    mode: HTML\r\n    prefix: classpath:/templates/  #prefix：指定模板所在的目录\r\n    check-template-location: true  #check-tempate-location: 检查模板路径是否存在\r\n    suffix:  .html\r\n    encoding: utf-8\r\n    # 禁用缓存： false为关闭，true为开启\r\n    cache: false\r\n  # 资源信息\r\n  messages:\r\n    # 国际化资源文件路径\r\n    basename: static/i18n/messages\r\n  jackson:  # 时间格式转换\r\n    time-zone: GMT+8\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n  profiles:\r\n    active: druid\r\n  # 文件上传\r\n  servlet:\r\n     multipart:\r\n       # 单个文件大小\r\n       max-file-size:  10MB\r\n       # 设置总上传的文件大小\r\n       max-request-size:  20MB\r\n  # 服务模块\r\n  devtools:\r\n    restart:\r\n      # 热部署开关\r\n      enabled: true\r\n  # 邮箱配置 https://blog.csdn.net/weixin_38575051/article/details/93591123\r\n  mail:\r\n		# true 开启邮件发送，为空或者false禁用发送邮件\r\n    enabled: false\r\n    host: smtp.163.com\r\n		# port: 25\r\n    # mail邮箱只需要修改这两处地址即可\r\n    username: xxx你的邮箱地址（修改）\r\n    password: xxx你的mail秘钥（修改）\r\n    properties:\r\n      mail:\r\n        smtp:\r\n          auth: true\r\n          starttls:\r\n            enable: true\r\n            required: true\r\n          ssl:\r\n            enable: true\r\n            starttls:\r\n              socketFactory:\r\n                prot: 465\r\n                class: javax.ssl.SLSocketFactory\r\n    port: 465\r\n    protocol: smtp\r\n    default-encoding: UTF-8\r\n\r\n# MyBatis\r\n#mybatis:\r\n#    # 搜索指定包别名\r\n#    typeAliasesPackage: com.ruoyi.project.**.domain\r\n#    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n#    mapperLocations: classpath:mybatis/**/*Mapper.xml\r\n#    # 加载全局的配置文件\r\n#    configLocation: classpath:mybatis/mybatis-config.xml\r\n# MyBatis Plus配置\r\nmybatis-plus:\r\n  # 搜索指定包别名\r\n  type-aliases-package: com.ruoyi.project.**.domain\r\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n  mapperLocations: classpath:mybatis/**/*Mapper.xml\r\n  # 加载全局的配置文件\r\n  configLocation: classpath:mybatis/mybatis-config.xml\r\n\r\n# PageHelper分页插件\r\npagehelper:\r\n  helperDialect: mysql\r\n  supportMethodsArguments: true\r\n  params: count=countSql\r\n\r\n# Shiro\r\nshiro:\r\n  user:\r\n    # 登录地址\r\n    loginUrl: /login\r\n    # 身份认证失败，跳转地址\r\n    authFail: /blog/homepage\r\n    # 权限认证失败地址\r\n    unauthorizedUrl: /unauth\r\n    # 首页地址\r\n    indexUrl: /index\r\n    # 验证码开关\r\n    captchaEnabled: true\r\n    # 验证码类型 math 数组计算 char 字符\r\n    captchaType: math\r\n  cookie:\r\n    # 设置Cookie的域名 默认空，即当前访问的域名\r\n    domain:\r\n    # 设置cookie的有效访问路径\r\n    path: /\r\n    # 设置HttpOnly属性\r\n    httpOnly: true\r\n    # 设置Cookie的过期时间，天为单位\r\n    maxAge: 30\r\n    # 设置密钥，务必保持唯一性（生成方式，直接拷贝到main运行即可）Base64.encodeToString(CipherUtils.generateNewKey(128, \"AES\").getEncoded()) （默认启动生成随机秘钥，随机秘钥会导致之前客户端RememberMe Cookie无效，如设置固定秘钥RememberMe Cookie则有效）\r\n    cipherKey:\r\n  session:\r\n    # Session超时时间，-1代表永不过期（默认30分钟）\r\n    expireTime: 60\r\n    # 同步session到数据库的周期（默认1分钟）\r\n    dbSyncPeriod: 1\r\n    # 相隔多久检查一次session的有效性，默认就是10分钟\r\n    validationInterval: 10\r\n    # 同一个用户最大会话数，比如2的意思是同一个账号允许最多同时两个人登录（默认-1不限制）\r\n    maxSession: 2\r\n    # 踢出之前登录的 false/之后登录的用户，默认踢出之前登录的用户\r\n    kickoutAfter: false\r\n  rememberMe:\r\n    # 是否开启记住我\r\n    enabled: true\r\n\r\n# 防止XSS攻击\r\nxss:\r\n  # 过滤开关\r\n  enabled: true\r\n  # 排除链接（多个用逗号分隔）\r\n  excludes: /system/notice/*\r\n  # 匹配链接\r\n  urlPatterns: /system/*,/monitor/*,/tool/*\r\n\r\n# 第三方登录\r\nauth:\r\n  gitee:\r\n    clientId: 你的码云clientId\r\n    clientSecret: 你的码云clientSecret\r\n    callbackUrl: http://localhost:10011/oauth/gitee/callback\r\n\r\n# Swagger配置\r\nswagger:\r\n  # 是否开启swagger\r\n  enabled: true\r\n\r\n# 代码生成\r\ngen:\r\n  # 作者\r\n  author: 一粒麦子\r\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\r\n  packageName: com.ruoyi.project.system\r\n  # 自动去除表前缀，默认是true\r\n  autoRemovePre: true\r\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\r\n  tablePrefix: sys_\r\n\r\n```\r\n\r\n## application-druid.yml\r\n\r\n```yaml\r\n# 数据源配置\r\nspring:\r\n    datasource:\r\n        type: com.alibaba.druid.pool.DruidDataSource\r\n        driverClassName: com.mysql.cj.jdbc.Driver\r\n        druid:\r\n            # 主库数据源\r\n            master:\r\n                url: jdbc:mysql://localhost:3306/ruoyi_blog?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n                username: root\r\n                password: root\r\n            # 从库数据源\r\n            slave:\r\n                # 从数据源开关/默认关闭\r\n                enabled: false\r\n                url:\r\n                username:\r\n                password:\r\n            # 初始连接数\r\n            initialSize: 5\r\n            # 最小连接池数量\r\n            minIdle: 10\r\n            # 最大连接池数量\r\n            maxActive: 20\r\n            # 配置获取连接等待超时的时间\r\n            maxWait: 60000\r\n            # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒\r\n            timeBetweenEvictionRunsMillis: 60000\r\n            # 配置一个连接在池中最小生存的时间，单位是毫秒\r\n            minEvictableIdleTimeMillis: 300000\r\n            # 配置一个连接在池中最大生存的时间，单位是毫秒\r\n            maxEvictableIdleTimeMillis: 900000\r\n            # 配置检测连接是否有效\r\n            validationQuery: SELECT 1 FROM DUAL\r\n            testWhileIdle: true\r\n            testOnBorrow: false\r\n            testOnReturn: false\r\n            webStatFilter:\r\n                enabled: true\r\n            statViewServlet:\r\n                enabled: true\r\n                # 设置白名单，不填则允许所有访问\r\n                allow:\r\n                url-pattern: /druid/*\r\n                # 控制台管理用户名和密码\r\n                login-username: ruoyi\r\n                login-password: 123456\r\n            filter:\r\n                stat:\r\n                    enabled: true\r\n                    # 慢SQL记录\r\n                    log-slow-sql: true\r\n                    slow-sql-millis: 1000\r\n                    merge-sql: true\r\n                wall:\r\n                    config:\r\n                        multi-statement-allow: true\r\n```', 'markdown');
INSERT INTO `mto_post_attribute` (`id`, `content`, `editor`) VALUES (135, '**有的人喜欢使用一个配置文件**：\r\n\r\n**可以删除application-druid.yml**\r\n\r\n**修改application.yml**\r\n\r\n### application.yml\r\n\r\n```yaml\r\n# 项目相关配置\r\nruoyi:\r\n  # 名称\r\n  name: RuoYi\r\n  # 版本\r\n  version: 4.7.4\r\n  # 版权年份\r\n  copyrightYear: 2022\r\n  # 实例演示开关\r\n  demoEnabled: true\r\n  # 文件上传路径 示例（ Windows配置D:/ruoyi/uploadPath，Linux配置 /home/ruoyi/uploadPath）\r\n  # home/ruoyi/uploadPath 则在项目中创建文件夹\r\n  profile: home/ruoyi/uploadPath\r\n  # 获取ip地址开关\r\n  addressEnabled: true\r\n  # 开启页面静态化\r\n  pageStaticEnabled: true\r\n\r\n# 开发环境配置\r\nserver:\r\n  # 服务器的HTTP端口，默认为80\r\n  port: 10011\r\n  servlet:\r\n    # 应用的访问路径\r\n    context-path: /\r\n  tomcat:\r\n    # tomcat的URI编码\r\n    uri-encoding: UTF-8\r\n    # tomcat最大线程数，默认为200\r\n    max-threads: 800\r\n    # Tomcat启动初始化的线程数，默认值25\r\n    min-spare-threads: 30\r\n    # 连接数满后的排队数，默认为100\r\n    accept-count: 1000\r\n    threads:\r\n      # tomcat最大线程数，默认为200\r\n      max: 800\r\n      # Tomcat启动初始化的线程数，默认值10\r\n      min-spare: 100\r\n\r\n# 日志配置\r\nlogging:\r\n  level:\r\n    com.ruoyi: debug\r\n    org.springframework: warn\r\n\r\n# 用户配置\r\nuser:\r\n  password:\r\n    # 密码错误{maxRetryCount}次锁定10分钟\r\n    maxRetryCount: 5\r\n\r\n# Spring配置\r\nspring:\r\n  # 模板引擎\r\n  thymeleaf:\r\n#    mode: HTML\r\n    mode: LEGACYHTML5\r\n    prefix: classpath:/templates/  #prefix：指定模板所在的目录\r\n    check-template-location: true  #check-tempate-location: 检查模板路径是否存在\r\n    suffix:  .html\r\n    encoding: utf-8\r\n    # 禁用缓存： false为关闭，true为开启\r\n    cache: false\r\n  # 资源信息\r\n  messages:\r\n    # 国际化资源文件路径\r\n    basename: static/i18n/messages\r\n  jackson:  # 时间格式转换\r\n    time-zone: GMT+8\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n  profiles:\r\n    active: druid\r\n  # 文件上传\r\n  servlet:\r\n     multipart:\r\n       # 单个文件大小\r\n       max-file-size:  10MB\r\n       # 设置总上传的文件大小\r\n       max-request-size:  20MB\r\n  # 服务模块\r\n  devtools:\r\n    restart:\r\n      # 热部署开关\r\n      enabled: true\r\n  # 邮箱配置 https://blog.csdn.net/weixin_38575051/article/details/93591123\r\n  mail:\r\n		# true 开启邮件发送，为空或者false禁用发送邮件\r\n    enabled: false\r\n    # mail邮箱只需要修改这三处地址即可\r\n    host: \r\n    username: \r\n    password: \r\n    properties:\r\n      mail:\r\n        smtp:\r\n          auth: true\r\n          starttls:\r\n            enable: true\r\n            required: true\r\n          ssl:\r\n            enable: true\r\n            starttls:\r\n              socketFactory:\r\n                prot: 465\r\n                class: javax.ssl.SLSocketFactory\r\n    port: 465\r\n    protocol: smtp\r\n    default-encoding: UTF-8\r\n  # 数据库配置\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      # 主库数据源\r\n      master:\r\n        url: jdbc:mysql://127.0.0.1:3306/ruoyi_blog?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: root\r\n      # 从库数据源\r\n      slave:\r\n        # 从数据源开关/默认关闭\r\n        enabled: false\r\n        url:\r\n        username:\r\n        password:\r\n      # 初始连接数\r\n      initialSize: 5\r\n      # 最小连接池数量\r\n      minIdle: 10\r\n      # 最大连接池数量\r\n      maxActive: 20\r\n      # 配置获取连接等待超时的时间\r\n      maxWait: 60000\r\n      # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒\r\n      timeBetweenEvictionRunsMillis: 60000\r\n      # 配置一个连接在池中最小生存的时间，单位是毫秒\r\n      minEvictableIdleTimeMillis: 300000\r\n      # 配置一个连接在池中最大生存的时间，单位是毫秒\r\n      maxEvictableIdleTimeMillis: 900000\r\n      # 配置检测连接是否有效\r\n      validationQuery: SELECT 1 FROM DUAL\r\n      testWhileIdle: true\r\n      testOnBorrow: false\r\n      testOnReturn: false\r\n      webStatFilter:\r\n        enabled: true\r\n      statViewServlet:\r\n        enabled: true\r\n        # 设置白名单，不填则允许所有访问\r\n        allow:\r\n        url-pattern: /druid/*\r\n        # 控制台管理用户名和密码\r\n        login-username: ruoyi\r\n        login-password: 123456\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          # 慢SQL记录\r\n          log-slow-sql: true\r\n          slow-sql-millis: 1000\r\n          merge-sql: true\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n\r\n# MyBatis\r\n#mybatis:\r\n#    # 搜索指定包别名\r\n#    typeAliasesPackage: com.ruoyi.project.**.domain\r\n#    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n#    mapperLocations: classpath:mybatis/**/*Mapper.xml\r\n#    # 加载全局的配置文件\r\n#    configLocation: classpath:mybatis/mybatis-config.xml\r\n# MyBatis Plus配置\r\nmybatis-plus:\r\n  # 搜索指定包别名\r\n  type-aliases-package: com.ruoyi.project.**.domain\r\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n  mapperLocations: classpath:mybatis/**/*Mapper.xml\r\n  # 加载全局的配置文件\r\n  configLocation: classpath:mybatis/mybatis-config.xml\r\n\r\n# PageHelper分页插件\r\npagehelper:\r\n  helperDialect: mysql\r\n  supportMethodsArguments: true\r\n  params: count=countSql\r\n\r\n# Shiro\r\nshiro:\r\n  user:\r\n    # 登录地址\r\n    loginUrl: /login\r\n    # 身份认证失败，跳转地址\r\n    authFail: /blog/homepage\r\n    # 权限认证失败地址\r\n    unauthorizedUrl: /unauth\r\n    # 首页地址\r\n    indexUrl: /index\r\n    # 验证码开关\r\n    captchaEnabled: true\r\n    # 验证码类型 math 数组计算 char 字符\r\n    captchaType: math\r\n  cookie:\r\n    # 设置Cookie的域名 默认空，即当前访问的域名\r\n    domain:\r\n    # 设置cookie的有效访问路径\r\n    path: /\r\n    # 设置HttpOnly属性\r\n    httpOnly: true\r\n    # 设置Cookie的过期时间，天为单位\r\n    maxAge: 30\r\n    # 设置密钥，务必保持唯一性（生成方式，直接拷贝到main运行即可）Base64.encodeToString(CipherUtils.generateNewKey(128, \"AES\").getEncoded()) （默认启动生成随机秘钥，随机秘钥会导致之前客户端RememberMe Cookie无效，如设置固定秘钥RememberMe Cookie则有效）\r\n    cipherKey:\r\n  session:\r\n    # Session超时时间，-1代表永不过期（默认30分钟）\r\n    expireTime: 60\r\n    # 同步session到数据库的周期（默认1分钟）\r\n    dbSyncPeriod: 1\r\n    # 相隔多久检查一次session的有效性，默认就是10分钟\r\n    validationInterval: 10\r\n    # 同一个用户最大会话数，比如2的意思是同一个账号允许最多同时两个人登录（默认-1不限制）\r\n    maxSession: 2\r\n    # 踢出之前登录的 false/之后登录的用户，默认踢出之前登录的用户\r\n    kickoutAfter: false\r\n  rememberMe:\r\n    # 是否开启记住我\r\n    enabled: true\r\n\r\n# 防止XSS攻击\r\nxss:\r\n  # 过滤开关\r\n  enabled: true\r\n  # 排除链接（多个用逗号分隔）\r\n  excludes: /system/notice/*\r\n  # 匹配链接\r\n  urlPatterns: /system/*,/monitor/*,/tool/*\r\n\r\n# 第三方登录\r\nauth:\r\n  gitee:\r\n    clientId: 你的码云clientId\r\n    clientSecret: 你的码云clientSecret\r\n    callbackUrl: http://localhost:10011/oauth/gitee/callback\r\n\r\n# Swagger配置\r\nswagger:\r\n  # 是否开启swagger\r\n  enabled: true\r\n\r\n# 代码生成\r\ngen:\r\n  # 作者\r\n  author: 一粒麦子\r\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\r\n  packageName: com.ruoyi.project.system\r\n  # 自动去除表前缀，默认是true\r\n  autoRemovePre: true\r\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\r\n  tablePrefix: sys_\r\n```', 'markdown');
INSERT INTO `mto_post_attribute` (`id`, `content`, `editor`) VALUES (136, '\r\n\r\n\r\n\r\n\r\n<font color = red>成功解开密码</font>\r\n\r\n\r\n\r\n\r\n', 'markdown');
COMMIT;

-- ----------------------------
-- Table structure for mto_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_tag`;
CREATE TABLE `mto_post_tag` (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                `post_id` bigint(20) DEFAULT NULL,
                                `tag_id` varchar(64) DEFAULT NULL,
                                `weight` bigint(20) DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE,
                                KEY `IK_TAG_ID` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='博客标签';

-- ----------------------------
-- Records of mto_post_tag
-- ----------------------------
BEGIN;
INSERT INTO `mto_post_tag` (`id`, `post_id`, `tag_id`, `weight`) VALUES (84, 135, '42', NULL);
INSERT INTO `mto_post_tag` (`id`, `post_id`, `tag_id`, `weight`) VALUES (86, 136, '41', NULL);
INSERT INTO `mto_post_tag` (`id`, `post_id`, `tag_id`, `weight`) VALUES (87, 134, '42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mto_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_tag`;
CREATE TABLE `mto_tag` (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                           `description` varchar(255) DEFAULT NULL COMMENT '描述',
                           `name` varchar(32) NOT NULL COMMENT '标签名',
                           `thumbnail` varchar(128) DEFAULT NULL COMMENT '图片',
                           `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `status` int(5) NOT NULL DEFAULT '0' COMMENT '状态(0为正常)',
                           `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                           PRIMARY KEY (`id`) USING BTREE,
                           UNIQUE KEY `UK_9ki38gg59bw5agwxsc4xtednf` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='标签';

-- ----------------------------
-- Records of mto_tag
-- ----------------------------
BEGIN;
INSERT INTO `mto_tag` (`id`, `description`, `name`, `thumbnail`, `update_time`, `create_time`, `status`, `order_num`) VALUES (41, NULL, '密码', NULL, NULL, '2022-11-19 12:55:18', 0, 2);
INSERT INTO `mto_tag` (`id`, `description`, `name`, `thumbnail`, `update_time`, `create_time`, `status`, `order_num`) VALUES (42, NULL, '笔记', NULL, NULL, '2022-11-19 12:55:27', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for pin_board
-- ----------------------------
DROP TABLE IF EXISTS `pin_board`;
CREATE TABLE `pin_board` (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                             `board_title` varchar(255) DEFAULT NULL COMMENT '便签头',
                             `board_content` varchar(1200) DEFAULT NULL COMMENT '便签内容',
                             `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                             `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pin_board
-- ----------------------------
BEGIN;
INSERT INTO `pin_board` (`id`, `board_title`, `board_content`, `order_num`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (3, 'HTML5 文档类型', 'Bootstrap 使用到的某些 HTML 元素和 CSS 属性需要将页面设置为 HTML5 文档类型。在你项目中的每个页面都要参照下面的格式进行设置。', 1, 'admin', '2022-05-29 13:58:30', '', NULL);
INSERT INTO `pin_board` (`id`, `board_title`, `board_content`, `order_num`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (4, '移动设备优先', '在 Bootstrap 2 中，我们对框架中的某些关键部分增加了对移动设备友好的样式。而在 Bootstrap 3 中，我们重写了整个框架，使其一开始就是对移动设备友好的。这次不是简单的增……', 2, 'admin', '2022-05-29 13:58:52', '', NULL);
INSERT INTO `pin_board` (`id`, `board_title`, `board_content`, `order_num`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (5, '排版与链接', 'Bootstrap 排版、链接样式设置了基本的全局样式。分别是： 为 body 元素设置 background-color: #fff;', 3, 'admin', '2022-05-29 13:59:53', '', NULL);
INSERT INTO `pin_board` (`id`, `board_title`, `board_content`, `order_num`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (6, 'Normalize', '为了增强跨浏览器表现的一致性，我们使用了 Normalize.css，这是由 Nicolas Gallagher 和 Jonathan Neal 维护的一个CSS 重置样式库。', 4, 'admin', '2022-05-29 14:00:44', '', NULL);
INSERT INTO `pin_board` (`id`, `board_title`, `board_content`, `order_num`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (7, '布局容器', 'Bootstrap 需要为页面内容和栅格系统包裹一个 .container 容器。我们提供了两个作此用处的类。注意，由于 padding 等属性的原因，这两种 容器类不能互相嵌套', 6, 'admin', '2022-05-29 14:01:10', '', NULL);
INSERT INTO `pin_board` (`id`, `board_title`, `board_content`, `order_num`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (8, '栅格系统', 'Bootstrap 提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。它包含了易于使', 6, 'admin', '2022-05-29 14:02:43', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
                                      `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `blob_data` blob COMMENT '存放持久化Trigger对象',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
                                      CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
                                  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
                                  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
                                  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
                                      `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
                                      `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
                                      CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
                                       `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                       `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
                                       `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
                                       `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
                                       `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
                                       `priority` int(11) NOT NULL COMMENT '优先级',
                                       `state` varchar(16) NOT NULL COMMENT '状态',
                                       `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
                                       `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
                                       `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
                                       `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
                                       PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
                                    `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                    `job_name` varchar(200) NOT NULL COMMENT '任务名称',
                                    `job_group` varchar(200) NOT NULL COMMENT '任务组名',
                                    `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
                                    `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
                                    `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
                                    `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
                                    `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
                                    `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
                                    `job_data` blob COMMENT '存放持久化job对象',
                                    PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D1768E49078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D1768E49078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D1768E49078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
                              `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                              `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
                              PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO qrtz_locks (sched_name, lock_name) VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO qrtz_locks (sched_name, lock_name) VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
                                            `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                            `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                            PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
                                        `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                        `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
                                        `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
                                        `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
                                        PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) VALUES ('RuoyiScheduler', 'root1645534794964', 1645777236815, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
                                        `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                        `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                        `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                        `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
                                        `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
                                        `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
                                        PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
                                        CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
                                         `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                         `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                         `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                         `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
                                         `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
                                         `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
                                         `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
                                         `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
                                         `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
                                         `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
                                         `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
                                         `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
                                         `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
                                         `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
                                         PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
                                         CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
                                 `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                 `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
                                 `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
                                 `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
                                 `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
                                 `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
                                 `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
                                 `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
                                 `priority` int(11) DEFAULT NULL COMMENT '优先级',
                                 `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
                                 `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
                                 `start_time` bigint(13) NOT NULL COMMENT '开始时间',
                                 `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
                                 `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
                                 `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
                                 `job_data` blob COMMENT '存放持久化job对象',
                                 PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
                                 KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
                                 CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_user`;
CREATE TABLE `sys_auth_user` (
                                 `auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '授权ID',
                                 `uuid` varchar(500) NOT NULL COMMENT '第三方平台用户唯一ID',
                                 `user_id` bigint(20) DEFAULT NULL COMMENT '系统用户ID',
                                 `login_name` varchar(30) NOT NULL COMMENT '登录账号',
                                 `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
                                 `avatar` varchar(500) DEFAULT '' COMMENT '头像地址',
                                 `email` varchar(255) DEFAULT '' COMMENT '用户邮箱',
                                 `source` varchar(255) DEFAULT '' COMMENT '用户来源',
                                 `info` varchar(2000) DEFAULT NULL COMMENT '第三方返回的所有信息',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方授权表';

-- ----------------------------
-- Records of sys_auth_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
                              `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2021-11-13 11:48:10', 'admin', '2022-11-19 12:08:52', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '180', 'Y', 'admin', '2021-11-13 11:48:10', 'admin', '2022-07-25 17:34:54', '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2021-11-13 11:48:10', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
insert into  sys_config values(11, '用户登录-黑名单列表',           'sys.login.blackIPList',            '',              'Y', 'admin', sysdate(), '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
                            `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept_temp
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_temp`;
CREATE TABLE `sys_dept_temp` (
                                 `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                                 `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
                                 `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                                 `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                                 `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                                 `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                                 `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                                 `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                                 `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                                 `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept_temp
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (30, 2, '收入', '0', 'account_income_pay', NULL, 'success', 'N', '0', 'admin', '2021-11-21 09:36:30', '', NULL, '账户分类的收支状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (31, 1, '支出', '1', 'account_income_pay', '', 'danger', 'Y', '0', 'admin', '2021-11-21 09:36:55', 'admin', '2021-11-21 09:37:12', '账户分类的收支状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (32, 1, '入账', '0', 'account_is_Total', NULL, 'primary', 'Y', '0', 'admin', '2021-11-21 14:36:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (33, 2, '不入账', '1', 'account_is_Total', NULL, 'warning', 'N', '0', 'admin', '2021-11-21 14:37:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (34, 1, '永结同心', '1', 'note_type', '', 'primary', 'Y', '0', 'admin', '2021-12-18 16:19:40', 'superAdmin', '2022-02-14 22:34:11', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`) USING BTREE,
                                 UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-11-13 11:48:10', 'admin', '2021-11-21 17:49:30', '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态(显/藏)', 'sys_show_hide', '0', 'admin', '2021-11-13 11:48:10', 'admin', '2021-11-21 10:51:28', '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-11-13 11:48:10', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, '账户收支', 'account_income_pay', '0', 'admin', '2021-11-21 09:34:24', '', NULL, '收入与支出');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, '是否记入总账', 'account_is_Total', '0', 'admin', '2021-11-21 14:36:17', '', NULL, '是否记入总账');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, '随手记类型', 'note_type', '0', 'admin', '2021-12-18 15:49:06', '', NULL, '随手记类型');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, '正常停用状态', 'start_stop_status', '0', 'admin', '2021-12-11 18:06:04', '', NULL, '正常停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_ip
-- ----------------------------
DROP TABLE IF EXISTS `sys_ip`;
CREATE TABLE `sys_ip` (
                          `ip` varchar(50) NOT NULL,
                          `ip_addr` varchar(200) DEFAULT NULL,
                          `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          `status` char(1) DEFAULT '1',
                          PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_ip
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
                           `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                           `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-11-13 11:48:10', '', '2022-04-19 10:19:05', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-11-13 11:48:10', '', '2022-04-19 10:19:03', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-11-13 11:48:10', '', '2022-04-19 10:19:01', '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '获取上周账单详情', 'DEFAULT', 'billTask.getPreWeekBill()', '0 0 6 ? * MON', '1', '1', '0', 'admin', '2022-07-26 19:43:43', '一粒麦子', '2022-07-27 16:15:33', '每周一上午10点执行 （0 15 10 ? * MON）');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
                                  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_mail
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail`;
CREATE TABLE `sys_mail` (
                            `id` int(20) NOT NULL AUTO_INCREMENT,
                            `mail_title` varchar(255) NOT NULL COMMENT '邮件标题',
                            `mail_content` longtext COMMENT '邮件内容',
                            `mail_message` varchar(800) DEFAULT NULL COMMENT '邮件info',
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

-- ----------------------------
-- Records of sys_mail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
                            `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
                            `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1159 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-11-13 11:48:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 11, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-11-13 11:48:05', 'admin', '2021-11-21 09:09:53', '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 10, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-07-22 10:48:19', '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '若依官网', 0, 13, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-09-01 15:48:33', '若依官网地址');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '博客管理', 0, 2, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-keyboard-o', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-12-22 13:41:41', '博客管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '毅茹记账', 0, 3, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bank', 'admin', '2021-11-21 09:05:56', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '备忘录', 0, 4, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-address-card', 'admin', '2021-11-27 13:25:43', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '文件管理', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-map', 'admin', '2022-06-19 08:38:03', 'admin', '2022-06-19 08:38:11', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, '/system/user', 'menuItem', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-09-10 12:19:06', '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-11-13 11:48:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-11-13 11:48:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-11-13 11:48:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-11-13 11:48:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-11-13 11:48:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-11-13 11:48:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-11-13 11:48:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 2, 9, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-11-13 11:48:05', 'superAdmin', '2022-01-28 18:41:45', '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-11-13 11:48:05', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-11-13 11:48:05', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-11-13 11:48:05', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-11-13 11:48:05', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-11-13 11:48:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '表单构建', 3, 1, '/tool/build', 'menuItem', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-07-22 10:48:11', '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-11-13 11:48:05', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-11-13 11:48:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-11-13 11:48:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-11-13 11:48:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-11-13 11:48:05', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-11-13 11:48:06', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-11-13 11:48:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-11-13 11:48:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1070, '栏目管理', 5, 1, '/mto/channel', '', 'C', '0', '1', 'mto:channel:view', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '栏目管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1071, '栏目管理查询', 1070, 1, '#', '', 'F', '0', '1', 'mto:channel:list', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1072, '栏目管理新增', 1070, 2, '#', '', 'F', '0', '1', 'mto:channel:add', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1073, '栏目管理修改', 1070, 3, '#', '', 'F', '0', '1', 'mto:channel:edit', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1074, '栏目管理删除', 1070, 4, '#', '', 'F', '0', '1', 'mto:channel:remove', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1075, '栏目管理导出', 1070, 5, '#', '', 'F', '0', '1', 'mto:channel:export', '#', 'admin', '2021-11-13 12:14:52', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1078, '博客管理', 5, 4, '/mto/post', 'menuItem', 'C', '0', '1', 'mto:post:view', '#', 'admin', '2021-11-13 15:23:07', '一粒麦子', '2022-12-22 13:41:57', '文章标题题菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1079, '博客页面List查询', 1078, 1, '#', 'menuItem', 'F', '0', '1', 'mto:post:list', '#', 'admin', '2021-11-13 15:23:07', 'admin', '2021-11-21 08:48:26', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1080, '博客新增', 1078, 3, '#', '', 'F', '0', '1', 'mto:post:add', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1081, '博客详情查看', 1078, 2, '#', '', 'F', '0', '1', 'mto:post:selectDetail', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1082, '博客修改', 1078, 4, '#', '', 'F', '0', '1', 'mto:post:edit', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1083, '博客删除', 1078, 5, '#', '', 'F', '0', '1', 'mto:post:remove', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1084, '博客导入', 1078, 6, '#', 'menuItem', 'F', '0', '1', 'mto:post:import', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2022-02-27 19:26:48', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1085, '记账分类', 6, 1, '/account/classif', 'menuItem', 'C', '0', '1', 'classif:account:view', '#', 'admin', '2021-11-21 09:44:44', 'admin', '2021-11-22 12:56:01', '记账分类菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1086, '记账分类查询', 1085, 1, '#', '', 'F', '0', '1', 'classif:account:list', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1087, '记账分类新增', 1085, 2, '#', '', 'F', '0', '1', 'classif:account:add', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1088, '记账分类修改', 1085, 3, '#', '', 'F', '0', '1', 'classif:account:edit', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1089, '记账分类删除', 1085, 4, '#', '', 'F', '0', '1', 'classif:account:remove', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1090, '记账分类导出', 1085, 5, '#', '', 'F', '0', '1', 'classif:account:export', '#', 'admin', '2021-11-21 09:44:44', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1091, '记账账户', 6, 2, '/account/account', 'menuItem', 'C', '0', '1', 'account:account:view', '#', 'admin', '2021-11-21 10:56:40', 'superAdmin', '2021-11-22 22:36:02', '记账账户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1092, '记账账户查询', 1091, 1, '#', '', 'F', '0', '1', 'account:account:list', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1093, '记账账户新增', 1091, 2, '#', '', 'F', '0', '1', 'account:account:add', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1094, '记账账户修改', 1091, 3, '#', '', 'F', '0', '1', 'account:account:edit', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1095, '记账账户删除', 1091, 4, '#', '', 'F', '0', '1', 'account:account:remove', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1096, '记账账户导出', 1091, 5, '#', '', 'F', '0', '1', 'account:account:export', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1097, '记账详情按钮', 1091, 1, '/account/account', '', 'F', '0', '1', 'account:account:detail', '#', 'admin', '2021-11-21 10:56:40', '', NULL, '记账账户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1098, '账目详情列表', 1097, 1, '#', '', 'F', '0', '1', 'account:money:list', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1099, '账目详情新增', 1097, 2, '#', '', 'F', '0', '1', 'account:money:add', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1100, '账目详情修改', 1097, 3, '#', '', 'F', '0', '1', 'account:money:edit', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1101, '账目详情删除', 1097, 4, '#', '', 'F', '0', '1', 'account:money:remove', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1102, '账目详情导出', 1097, 5, '#', '', 'F', '0', '1', 'account:money:export', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1103, '账单详情', 6, 3, '/account/bill', 'menuItem', 'C', '0', '1', 'account:bill:view', '#', 'superAdmin', '2021-11-23 13:32:48', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1104, '账单详情导出', 1103, 3, '#', 'menuItem', 'F', '0', '1', 'account:money:export', '#', 'superAdmin', '2021-11-23 13:32:48', 'admin', '2021-11-26 14:49:50', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1105, '标签管理', 5, 2, '/mto/tag', 'menuItem', 'C', '0', '1', 'mto:tag:view', '#', 'admin', '2021-11-27 11:29:13', 'admin', '2021-11-27 12:50:28', '博客标签菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1106, '博客标签查询', 1105, 1, '#', '', 'F', '0', '1', 'mto:tag:list', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1107, '博客标签新增', 1105, 2, '#', '', 'F', '0', '1', 'mto:tag:add', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1108, '博客标签修改', 1105, 3, '#', '', 'F', '0', '1', 'mto:tag:edit', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1109, '博客标签删除', 1105, 4, '#', '', 'F', '0', '1', 'mto:tag:remove', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1110, '详情导出', 1103, 1, '#', 'menuItem', 'F', '0', '1', 'account:bill:export', '#', 'admin', '2021-11-27 12:59:02', 'admin', '2021-12-04 13:23:21', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1111, '备忘录', 7, 1, '/memorial/pinBoard', 'menuItem', 'C', '0', '1', 'memorial:pin_board:view', '#', 'admin', '2021-11-27 13:27:48', 'admin', '2021-11-27 21:35:11', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1112, '任务清单', 7, 2, '/memorial/agileBoard', 'menuItem', 'C', '0', '1', 'memorial:agile_board:view', '#', 'admin', '2021-11-27 21:36:12', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1113, '任务清单删除', 1112, 3, '#', 'menuItem', 'F', '0', '1', 'memorial:agile:remov', '#', 'admin', '2021-12-01 17:25:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1114, '报表统计', 1103, 2, '#', 'menuItem', 'F', '0', '1', 'account:bill:count', '#', 'admin', '2021-12-04 13:20:42', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1115, '博客前台', 5, 6, '/blog/list', 'menuBlank', 'C', '0', '1', '', '#', 'superAdmin', '2021-12-05 19:14:45', '一粒麦子', '2022-12-22 13:41:16', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1116, '导航管理', 5, 0, '/mto/category', 'menuItem', 'C', '0', '1', 'system:category:view', '#', 'admin', '2021-12-11 17:45:54', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1117, '导航管理查询', 1116, 1, '#', '', 'F', '0', '1', 'system:category:list', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1118, '导航管理新增', 1116, 2, '#', '', 'F', '0', '1', 'system:category:add', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1119, '导航管理修改', 1116, 3, '#', '', 'F', '0', '1', 'system:category:edit', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1120, '导航管理删除', 1116, 4, '#', '', 'F', '0', '1', 'system:category:remove', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1121, '导航管理导出', 1116, 5, '#', '', 'F', '0', '1', 'system:category:export', '#', 'admin', '2021-12-13 13:56:19', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1122, '友情链接', 5, 5, '/mto/link', 'menuItem', 'C', '0', '1', 'mto:link:view', '#', 'admin', '2021-12-13 17:27:35', '一粒麦子', '2022-12-22 13:41:30', 'mto菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1123, '友情链接查询', 1122, 1, '#', '', 'F', '0', '1', 'mto:link:list', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1124, '友情链接新增', 1122, 2, '#', '', 'F', '0', '1', 'mto:link:add', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1125, '友情链接修改', 1122, 3, '#', '', 'F', '0', '1', 'mto:link:edit', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1126, '友情链接删除', 1122, 4, '#', '', 'F', '0', '1', 'mto:link:remove', '#', 'admin', '2021-12-13 17:27:35', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1127, '备忘录新增', 1111, 2, '#', '', 'F', '0', '1', 'memorial:pin_board:add', '#', 'admin', '2021-12-17 20:21:39', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1128, '备忘录删除', 1111, 4, '#', '', 'F', '0', '1', 'memorial:pin_board:remove', '#', 'admin', '2021-12-17 20:22:43', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1129, '备忘录修改', 1111, 3, '#', '', 'F', '0', '1', 'memorial:pin_board:edit', '#', 'admin', '2021-12-17 21:18:55', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1130, '任务清单新增', 1112, 1, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:add', '#', 'admin', '2021-12-18 12:57:02', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1131, '任务清单状态修改', 1112, 2, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:editStatus', '#', 'admin', '2021-12-18 12:57:35', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1132, '备忘录查询', 1111, 4, '#', 'menuItem', 'F', '0', '1', 'memorial:pin_board:view', '#', 'admin', '2021-12-18 13:28:49', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1133, '任务清单查询', 1112, 4, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:view', '#', 'admin', '2021-12-18 13:29:20', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1134, '随手记', 7, 4, '/emmanuel/noteBoard', 'menuItem', 'C', '0', '1', 'memorial:note_board:view', '#', 'admin', '2021-12-13 17:27:35', 'admin', '2021-12-17 21:23:22', 'mto菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1135, '随手记查询', 1134, 1, '#', '', 'F', '0', '1', 'memorial:note_board:list', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1136, '随手记新增', 1134, 2, '#', '', 'F', '0', '1', 'memorial:note_board:add', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1137, '随手记修改', 1134, 3, '#', '', 'F', '0', '1', 'memorial:note_board:edit', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1138, '随手记删除', 1134, 4, '#', '', 'F', '0', '1', 'memorial:note_board:remove', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1139, '随手记查询详情', 1134, 5, '#', 'menuItem', 'F', '0', '1', 'memorial:note_board:datail', '#', 'superAdmin', '2022-02-21 07:23:20', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1140, '首访博客', 108, 3, '/mto/post/first', 'menuItem', 'C', '0', '1', 'mto:blog:first', 'fa fa-clock-o', 'admin', '2021-11-13 11:48:05', '一粒麦子', '2022-05-29 13:34:55', '进入访问ip列表');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1141, '公告详情', 107, 5, '#', 'menuItem', 'F', '0', '1', 'system:notice:selectDetail', '#', 'admin', '2022-05-04 15:49:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1142, '删除首次访问博客记录', 1140, 1, '#', 'menuItem', 'F', '0', '1', 'mto:blog:first:remove', '#', '一粒麦子', '2022-05-29 13:35:34', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1143, '文件上传', 8, 1, '/upload/uploader', '', 'C', '0', '1', '', 'fa fa-gear', 'admin', '2021-11-13 11:48:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1144, '文件管理', 8, 1, '/cloud/file/fileManagementHtml', 'menuItem', 'C', '0', '1', 'file:Management:view', '#', 'admin', '2022-07-16 07:45:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1145, '邮件管理', 1, 9, '/system/mail', 'menuItem', 'C', '0', '1', 'system:mail:view', '#', 'admin', '2022-07-22 14:18:46', '一粒麦子', '2022-07-23 11:13:22', '【请填写功能名称】菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1146, '邮件查询', 1145, 1, '#', '', 'F', '0', '1', 'system:mail:list', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1147, '邮件发送', 1145, 2, '#', '', 'F', '0', '1', 'system:mail:add', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1148, '邮件查看', 1145, 3, '#', '', 'F', '0', '1', 'system:mail:detail', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1149, '邮件删除', 1145, 4, '#', '', 'F', '0', '1', 'system:mail:remove', '#', 'admin', '2022-07-22 14:18:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1150, '记账账单分析', 1091, 6, '#', 'menuItem', 'F', '0', '1', 'account:account:analysis', '#', '一粒麦子', '2022-10-22 12:47:41', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1151, '单文章导出', 1078, 7, '#', 'menuItem', 'F', '0', '1', 'mto:post:export', '#', '一粒麦子', '2022-11-05 20:06:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1152, '批量文章导出', 1078, 8, '#', 'menuItem', 'F', '0', '1', 'mto:post:exportDataBatch', '#', '一粒麦子', '2022-11-05 20:06:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1153, '单文件下载', 1144, 7, '#', 'menuItem', 'F', '0', '1', 'system:file:download', '#', '一粒麦子', '2022-11-05 20:06:22', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1154, '多批量下载', 1144, 8, '#', 'menuItem', 'F', '0', '1', 'system:file:downloadBatch', '#', '一粒麦子', '2022-11-05 20:06:46', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1155, '评论管理', 5, 3, 'mto/comment/view', 'menuItem', 'C', '0', '1', 'mto:comment:view', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1156, '评论管理列表', 1155, 1, 'mto/comment/list', 'menuItem', 'F', '0', '1', 'mto:comment:list', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1157, '评论管理审核', 1155, 2, 'mto/comment/examine', 'menuItem', 'F', '0', '1', 'mto:comment:examine', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1158, '评论管理删除', 1155, 3, 'mto/comment/remove', 'menuItem', 'F', '0', '1', 'mto:comment:remove', '#', 'admin', '2021-11-13 15:23:07', 'superAdmin', '2021-11-22 22:35:22', '文章标题题菜单');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
                              `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` longtext COMMENT '公告内容',
                              `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) DEFAULT '' COMMENT '模块标题',
                                `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(100) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                 cost_time         bigint(20)      default 0                  comment '消耗时间',
                                PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
                            `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
                            `post_sort` int(4) NOT NULL COMMENT '显示顺序',
                            `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-05-29 13:23:54', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int(4) NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-05-29 13:23:54', '', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
                            `login_name` varchar(30) NOT NULL COMMENT '登录账号',
                            `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
                            `password` varchar(50) DEFAULT '' COMMENT '密码',
                            `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                            `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            `totalSpace` float(11,1) DEFAULT '0.0' COMMENT '网盘总空间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `totalSpace`) VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2023-02-08 17:34:56', '2023-02-08 17:34:56', 'admin', '2023-02-08 17:34:56', '', '2023-02-08 17:34:56', '管理员', 10.0);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `totalSpace`) VALUES (2, 100, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2023-02-08 17:34:56', '2023-02-08 17:34:56', 'admin', '2023-02-08 17:34:56', 'admin', '2023-02-08 17:34:56', '测试员', 10.0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
                                   `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
                                   `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
                                   `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                   `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                   `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                   `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                   `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                   `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
                                   `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
                                   `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
                                   `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
                                   PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
                                 `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                 `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                 `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
