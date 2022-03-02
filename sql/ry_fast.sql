/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : ry_fast

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 02/03/2022 14:38:49
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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_account
-- ----------------------------
INSERT INTO `account_account` VALUES (2, NULL, '家庭记账', '123', '0', 1, 'jiayaru', '2021-11-22 19:50:45', 'admin', '2022-01-08 09:15:16');

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_class
-- ----------------------------
INSERT INTO `account_class` VALUES (1, '衣', '1', '', '1', 1, 'jiayaru', '2021-11-22 19:49:09', 'superAdmin', '2021-11-23 12:28:01');
INSERT INTO `account_class` VALUES (2, '食', '1', '', '0', 2, 'jiayaru', '2021-11-22 19:49:26', '', NULL);
INSERT INTO `account_class` VALUES (3, '住', '1', '', '0', 3, 'jiayaru', '2021-11-22 19:49:41', '', NULL);
INSERT INTO `account_class` VALUES (4, '行', '1', '', '0', 4, 'jiayaru', '2021-11-22 19:49:53', '', NULL);
INSERT INTO `account_class` VALUES (5, '其他', '1', '', '0', 5, 'jiayaru', '2021-11-22 19:50:05', '', NULL);
INSERT INTO `account_class` VALUES (6, '名称', '0', '介绍', '0', 1, 'admin', '2021-11-24 16:31:09', '', NULL);
INSERT INTO `account_class` VALUES (7, '奖金', '0', '奖金', '0', 2, 'admin', '2021-12-04 12:59:28', '', NULL);

-- ----------------------------
-- Table structure for account_money
-- ----------------------------
DROP TABLE IF EXISTS `account_money`;
CREATE TABLE `account_money`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account_id` bigint(20) NOT NULL COMMENT '账本id',
  `class_id` bigint(20) NOT NULL COMMENT '类型id',
  `money_pay` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额(支出金额)',
  `money_income` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额(收入金额）',
  `money_date` date NULL DEFAULT NULL COMMENT '花钱日期',
  `money_introduce` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注/金额说明',
  `is_total` int(1) NOT NULL DEFAULT 0 COMMENT '是否记入总账（0记入，默认，1不记录）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0是正常，1是删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_money
-- ----------------------------
INSERT INTO `account_money` VALUES (15, 2, 2, 100.11, NULL, '2021-11-22', '', 0, 'admin', '2021-11-24 18:06:53', '', '2021-11-24 18:12:59', '0');
INSERT INTO `account_money` VALUES (16, 2, 6, NULL, 991.00, '2021-11-02', '', 0, 'admin', '2021-11-24 18:07:50', '', '2021-11-24 18:13:55', '0');
INSERT INTO `account_money` VALUES (17, 2, 6, NULL, 11.00, '2021-11-24', '1', 0, 'admin', '2021-11-24 18:16:23', '', '2021-11-26 22:37:19', '0');
INSERT INTO `account_money` VALUES (18, 2, 2, 9999.00, NULL, '2021-11-22', '', 0, 'admin', '2021-11-24 18:06:53', '', '2021-11-24 18:12:59', '0');
INSERT INTO `account_money` VALUES (19, 2, 2, 10.00, NULL, '2021-11-26', '', 0, 'admin', '2021-11-26 22:37:29', '', NULL, '0');
INSERT INTO `account_money` VALUES (20, 2, 2, 10.00, NULL, '2021-10-06', '', 0, 'admin', '2021-11-26 22:53:29', '', NULL, '0');
INSERT INTO `account_money` VALUES (21, 2, 4, 100.00, NULL, '2021-12-04', '', 0, 'admin', '2021-12-04 11:37:45', '', '2021-12-23 17:12:25', '0');
INSERT INTO `account_money` VALUES (22, 2, 4, 120.00, NULL, '2021-12-04', '', 0, 'admin', '2021-12-04 12:15:20', '', NULL, '0');
INSERT INTO `account_money` VALUES (23, 2, 2, 120.00, NULL, '2021-12-04', '', 0, 'admin', '2021-12-04 12:15:57', '', NULL, '0');
INSERT INTO `account_money` VALUES (24, 2, 6, NULL, 120.00, '2021-12-04', '', 0, 'admin', '2021-12-04 12:49:32', '', NULL, '0');
INSERT INTO `account_money` VALUES (25, 2, 7, NULL, 100.00, '2021-12-04', '', 0, 'admin', '2021-12-04 12:59:51', '', NULL, '0');
INSERT INTO `account_money` VALUES (26, 2, 2, 1.00, NULL, '2022-01-08', '', 0, 'admin', '2022-01-08 09:15:23', '', NULL, '0');

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_repeat_log
-- ----------------------------
INSERT INTO `biz_repeat_log` VALUES (1, 85, 1, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/blog/love', '0', '2022-01-29 15:09:57', NULL);
INSERT INTO `biz_repeat_log` VALUES (2, 85, 1, NULL, '223.104.3.132', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/blog/love', '0', '2022-01-29 15:56:38', NULL);
INSERT INTO `biz_repeat_log` VALUES (3, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-07 12:42:33', NULL);
INSERT INTO `biz_repeat_log` VALUES (4, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-07 12:43:32', NULL);
INSERT INTO `biz_repeat_log` VALUES (5, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-07 14:18:48', NULL);
INSERT INTO `biz_repeat_log` VALUES (6, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-07 14:18:50', NULL);
INSERT INTO `biz_repeat_log` VALUES (7, NULL, 3, NULL, '223.104.41.201', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.96 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-07 22:54:01', NULL);
INSERT INTO `biz_repeat_log` VALUES (8, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 06:46:04', NULL);
INSERT INTO `biz_repeat_log` VALUES (9, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 06:46:05', NULL);
INSERT INTO `biz_repeat_log` VALUES (10, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 08:34:21', NULL);
INSERT INTO `biz_repeat_log` VALUES (11, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 10:36:35', NULL);
INSERT INTO `biz_repeat_log` VALUES (12, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.43', '/admin/index/getWeathe', '0', '2022-02-08 11:26:54', NULL);
INSERT INTO `biz_repeat_log` VALUES (13, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 12:58:31', NULL);
INSERT INTO `biz_repeat_log` VALUES (14, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 13:55:48', NULL);
INSERT INTO `biz_repeat_log` VALUES (15, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 14:25:56', NULL);
INSERT INTO `biz_repeat_log` VALUES (16, NULL, 3, NULL, '221.218.139.124', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.92 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-08 14:26:00', NULL);
INSERT INTO `biz_repeat_log` VALUES (17, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-21 08:26:31', NULL);
INSERT INTO `biz_repeat_log` VALUES (18, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-21 17:20:48', NULL);
INSERT INTO `biz_repeat_log` VALUES (19, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-22 10:30:15', NULL);
INSERT INTO `biz_repeat_log` VALUES (20, NULL, 3, NULL, '223.104.44.44', 'Mozilla/5.0 (Linux; Android 10; PEAM00 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/86.0.4240.99 XWEB/3185 MMWEBSDK/20220105 Mobile Safari/537.36 MMWEBID/4446 MicroMessenger/8.0.19.2080(0x28001337) Process/toolsmp WeChat/arm64 Weixin NetType/4G Language/zh_CN ABI/arm64', '/admin/index/getWeathe', '0', '2022-02-22 11:09:21', NULL);
INSERT INTO `biz_repeat_log` VALUES (21, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-22 16:28:12', NULL);
INSERT INTO `biz_repeat_log` VALUES (22, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-22 17:29:17', NULL);
INSERT INTO `biz_repeat_log` VALUES (23, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-22 17:54:09', NULL);
INSERT INTO `biz_repeat_log` VALUES (24, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-22 20:33:21', NULL);
INSERT INTO `biz_repeat_log` VALUES (25, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-23 10:11:22', NULL);
INSERT INTO `biz_repeat_log` VALUES (26, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-23 15:03:08', NULL);
INSERT INTO `biz_repeat_log` VALUES (27, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Linux; U; Android 10; zh-CN; PEAM00 Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Quark/5.5.5.204 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-23 15:09:28', NULL);
INSERT INTO `biz_repeat_log` VALUES (28, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.58 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-23 15:32:46', NULL);
INSERT INTO `biz_repeat_log` VALUES (29, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-24 15:55:00', NULL);
INSERT INTO `biz_repeat_log` VALUES (30, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.58 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-24 16:04:08', NULL);
INSERT INTO `biz_repeat_log` VALUES (31, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.58 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-24 16:04:14', NULL);
INSERT INTO `biz_repeat_log` VALUES (32, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-24 16:13:24', NULL);
INSERT INTO `biz_repeat_log` VALUES (33, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Linux; U; Android 10; zh-CN; PEAM00 Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Quark/5.5.5.204 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-24 16:34:00', NULL);
INSERT INTO `biz_repeat_log` VALUES (34, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-24 17:14:33', NULL);
INSERT INTO `biz_repeat_log` VALUES (35, NULL, 3, NULL, '223.104.42.227', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.58 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-25 12:05:19', NULL);
INSERT INTO `biz_repeat_log` VALUES (36, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-25 13:32:44', NULL);
INSERT INTO `biz_repeat_log` VALUES (37, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-26 09:34:27', NULL);
INSERT INTO `biz_repeat_log` VALUES (38, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-26 21:31:06', NULL);
INSERT INTO `biz_repeat_log` VALUES (39, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-26 22:19:47', NULL);
INSERT INTO `biz_repeat_log` VALUES (40, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56', '/admin/index/getWeathe', '0', '2022-02-27 09:32:46', NULL);
INSERT INTO `biz_repeat_log` VALUES (41, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62', '/admin/index/getWeathe', '0', '2022-02-27 14:47:33', NULL);
INSERT INTO `biz_repeat_log` VALUES (42, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-27 14:56:56', NULL);
INSERT INTO `biz_repeat_log` VALUES (43, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-27 16:05:34', NULL);
INSERT INTO `biz_repeat_log` VALUES (44, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62', '/admin/index/getWeathe', '0', '2022-02-27 17:07:18', NULL);
INSERT INTO `biz_repeat_log` VALUES (45, NULL, 3, NULL, '221.218.136.4', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.58 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-27 19:00:57', NULL);
INSERT INTO `biz_repeat_log` VALUES (46, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62', '/admin/index/getWeathe', '0', '2022-02-28 16:05:07', NULL);
INSERT INTO `biz_repeat_log` VALUES (47, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-02-28 16:22:49', NULL);
INSERT INTO `biz_repeat_log` VALUES (48, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-03-01 11:20:43', NULL);
INSERT INTO `biz_repeat_log` VALUES (49, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '/admin/index/getWeathe', '0', '2022-03-01 13:55:49', NULL);
INSERT INTO `biz_repeat_log` VALUES (50, NULL, 3, NULL, '106.38.159.99', 'Mozilla/5.0 (Linux; Android 10; PEAM00) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.58 Mobile Safari/537.36', '/admin/index/getWeathe', '0', '2022-03-01 14:26:08', NULL);

-- ----------------------------
-- Table structure for board_agile
-- ----------------------------
DROP TABLE IF EXISTS `board_agile`;
CREATE TABLE `board_agile`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `agile_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `agile_status` int(1) NOT NULL COMMENT '状态',
  `agile_date` datetime(0) NOT NULL COMMENT '任务日期',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for board_note
-- ----------------------------
DROP TABLE IF EXISTS `board_note`;
CREATE TABLE `board_note`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `note_title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者id',
  `note_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片（预留字段，暂时不考虑）',
  `note_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `note_summary` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `note_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型（数据字典，不写死）',
  `note_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态',
  `is_Public` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否公共，0公共，  1 私有',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of board_note
-- ----------------------------
INSERT INTO `board_note` VALUES (1, '1', 1, NULL, '<p>1</p>', '1', '1', '0', '0', 'admin', '2022-02-26 09:34:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'mto_category', '导航表', '', NULL, 'MtoCategory', 'tree', 'com.ruoyi.project.system', 'system', 'category', '导航表', '一粒麦子', '0', '/', '{\"parentMenuId\":\"5\",\"treeName\":\"name\",\"treeParentCode\":\"pid\",\"parentMenuName\":\"博客管理\",\"treeCode\":\"id\"}', 'admin', '2021-12-11 17:52:29', '', '2021-12-11 19:13:10', '');
INSERT INTO `gen_table` VALUES (2, 'biz_repeat_log', '需要校验重复性的业务记录日志', '', NULL, 'BizRepeatLog', 'crud', 'com.ruoyi.project.system', 'system', 'log', '需要校验重复性的业务记录日志', '一粒麦子', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}', 'admin', '2021-12-12 14:37:34', '', '2021-12-12 14:39:09', '');
INSERT INTO `gen_table` VALUES (3, 'mto_link', '友情链接', '', NULL, 'MtoLink', 'crud', 'com.ruoyi.project.system', 'mto', 'link', 'mto', '一粒麦子', '0', '/', '{\"parentMenuId\":\"5\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"博客管理\",\"treeCode\":\"\"}', 'admin', '2021-12-13 16:57:37', '', '2021-12-13 17:15:17', '');
INSERT INTO `gen_table` VALUES (4, 'pin_board', '便签墙', '', NULL, 'PinBoard', 'crud', 'com.ruoyi.project.system', 'system', 'board', '便签墙', '一粒麦子', '0', '/', '{\"parentMenuId\":\"1116\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"导航管理\",\"treeCode\":\"\"}', 'admin', '2021-12-17 17:39:36', '', '2021-12-17 17:41:39', '');
INSERT INTO `gen_table` VALUES (6, 'board_note', '随手记', '', NULL, 'BoardNote', 'crud', 'com.ruoyi.project.system', 'note', 'note', '随手记', '一粒麦子', '0', '/', '{\"parentMenuId\":\"7\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"备忘录\",\"treeCode\":\"\"}', 'admin', '2021-12-18 15:46:56', '', '2021-12-18 16:19:04', '');
INSERT INTO `gen_table` VALUES (7, 'sys_img', '图片素材', '', NULL, 'Img', 'crud', 'com.ruoyi.project.system', 'system', 'img', '图片素材', '一粒麦子', '0', '/', '{\"parentMenuId\":\"5\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"博客管理\",\"treeCode\":\"\"}', 'admin', '2021-12-25 11:14:44', '', '2021-12-25 11:15:42', '');
INSERT INTO `gen_table` VALUES (8, 'mto_post', '123', '', NULL, 'MtoPost', 'crud', 'com.ruoyi.project.system', 'system', 'post', '123', '一粒麦子', '0', '/', '{\"parentMenuId\":\"102\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"菜单管理\",\"treeCode\":\"\"}', 'admin', '2021-12-25 13:24:10', '', '2021-12-25 13:24:55', '');
INSERT INTO `gen_table` VALUES (9, 'mto_comment', '留言/评论', '', NULL, 'MtoComment', 'crud', 'com.ruoyi.project.system', 'system', 'comment', 'comment', '一粒麦子', '0', '/', '{\"parentMenuId\":\"5\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"博客管理\",\"treeCode\":\"\"}', 'admin', '2022-01-16 11:40:12', '', '2022-01-16 11:41:34', '');
INSERT INTO `gen_table` VALUES (10, 'mto_post_tag', '', NULL, NULL, 'MtoPostTag', 'crud', 'com.ruoyi.project.system', 'system', 'tag', NULL, '一粒麦子', '0', '/', NULL, 'admin', '2022-01-17 11:08:08', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '', 'int(11) unsigned', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (2, '1', 'pid', '', 'int(11) unsigned', 'Long', 'pid', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (3, '1', 'name', '文章类型名', 'varchar(50)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (4, '1', 'description', '类型介绍', 'varchar(200)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (5, '1', 'sort', '排序', 'int(10)', 'Integer', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (6, '1', 'icon', '图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (7, '1', 'status', '是否可用', 'tinyint(1) unsigned', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (8, '1', 'create_time', '添加时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (9, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-12-11 17:52:29', NULL, '2021-12-11 19:13:10');
INSERT INTO `gen_table_column` VALUES (10, '2', 'id', '主键', 'int(11) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (11, '2', 'biz_id', '业务ID', 'int(11) unsigned', 'Long', 'bizId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (12, '2', 'biz_type', '业务类型：1.文章，2.评论', 'tinyint(1)', 'Integer', 'bizType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (13, '2', 'user_id', '已登录用户ID', 'varchar(20)', 'Integer', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (14, '2', 'user_ip', '用户IP', 'varchar(50)', 'String', 'userIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (15, '2', 'user_agent', '客户端标识', 'varchar(200)', 'String', 'userAgent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (16, '2', 'url', '请求地址', 'varchar(100)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (17, '2', 'status', '状态（0正常 1失败）', 'char(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (18, '2', 'create_time', '添加时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (19, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2021-12-12 14:37:34', NULL, '2021-12-12 14:39:09');
INSERT INTO `gen_table_column` VALUES (20, '3', 'id', '', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (21, '3', 'link_name', '', 'varchar(255)', 'String', 'linkName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (22, '3', 'link_logo', '', 'varchar(255)', 'String', 'linkLogo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (23, '3', 'link_url', '', 'varchar(255)', 'String', 'linkUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (24, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (25, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (26, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (27, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (28, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2021-12-13 16:57:37', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (29, '3', 'link_description', '链接描述', 'varchar(255)', 'String', 'linkDescription', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2021-12-13 17:07:07', NULL, '2021-12-13 17:15:17');
INSERT INTO `gen_table_column` VALUES (30, '4', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (31, '4', 'board_title', '便签头', 'varchar(255)', 'String', 'boardTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (32, '4', 'board_content', '便签内容', 'varchar(1200)', 'String', 'boardContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (33, '4', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (34, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (35, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (36, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (37, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-17 17:39:36', NULL, '2021-12-17 17:41:39');
INSERT INTO `gen_table_column` VALUES (48, '6', 'id', '唯一id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (49, '6', 'note_title', '标题', 'varchar(60)', 'String', 'noteTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (50, '6', 'author_id', '作者id', 'bigint(20)', 'Long', 'authorId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (51, '6', 'note_image', '图片（预留字段，暂时不考虑）', 'varchar(255)', 'String', 'noteImage', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (52, '6', 'note_content', '内容', 'longtext', 'String', 'noteContent', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'summernote', '', 5, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (53, '6', 'note_summary', '摘要', 'varchar(100)', 'String', 'noteSummary', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (54, '6', 'note_type', '类型（数据字典，不写死）', 'varchar(10)', 'String', 'noteType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'note_type', 7, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (55, '6', 'note_status', '状态', 'char(1)', 'String', 'noteStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (56, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (57, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (58, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (59, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (60, '6', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-12-18 15:46:56', NULL, '2021-12-18 16:19:04');
INSERT INTO `gen_table_column` VALUES (61, '7', 'id', '', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (62, '7', 'img_name', '图片名称', 'varchar(255)', 'String', 'imgName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (63, '7', 'img', '图片', 'varchar(255)', 'String', 'img', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (64, '7', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', '', 4, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (65, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (66, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (67, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (68, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (69, '7', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2021-12-25 11:14:44', NULL, '2021-12-25 11:15:42');
INSERT INTO `gen_table_column` VALUES (70, '8', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (71, '8', 'author_id', '作者id', 'bigint(20)', 'Long', 'authorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (72, '8', 'channel_id', '栏目id', 'bigint(20)', 'Long', 'channelId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (73, '8', 'category_Id', '导航id', 'bigint(20)', 'Long', 'categoryId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (74, '8', 'comments', '评论数', 'int(11)', 'Long', 'comments', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (75, '8', 'create_time', '', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (76, '8', 'favors', '收藏数', 'int(11)', 'Long', 'favors', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (77, '8', 'slider', '轮播图状态', 'int(11)', 'Long', 'slider', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (78, '8', 'featured', '推荐状态', 'int(11)', 'Long', 'featured', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (79, '8', 'status', '文章状态', 'int(11)', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (80, '8', 'summary', '摘要', 'varchar(500)', 'String', 'summary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (81, '8', 'tags', '标签', 'varchar(64)', 'String', 'tags', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (82, '8', 'thumbnail', '图片', 'varchar(500)', 'String', 'thumbnail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'upload', '', 13, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (83, '8', 'title', 'title', 'varchar(64)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (84, '8', 'views', '查看次数', 'int(11)', 'Long', 'views', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (85, '8', 'weight', '总数量', 'int(11)', 'Long', 'weight', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (86, '8', 'update_time', '', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-12-25 13:24:10', NULL, '2021-12-25 13:24:55');
INSERT INTO `gen_table_column` VALUES (87, '9', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (88, '9', 'p_id', '父id', 'bigint(20)', 'Long', 'pId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (89, '9', 'post_id', '博客id', 'bigint(20)', 'Long', 'postId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (90, '9', 'email', '邮箱', 'varchar(64)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (91, '9', 'nick_name', '昵称', 'varchar(64)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (92, '9', 'content', '评论内容', 'varchar(255)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 6, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (93, '9', 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (94, '9', 'love', '点赞', 'char(4)', 'String', 'love', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (95, '9', 'status', '状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (96, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (97, '9', 'ip', NULL, 'varchar(64)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-01-16 11:40:12', NULL, '2022-01-16 11:41:34');
INSERT INTO `gen_table_column` VALUES (98, '10', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-17 11:08:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '10', 'post_id', NULL, 'bigint(20)', 'Long', 'postId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-01-17 11:08:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '10', 'tag_name', NULL, 'varchar(64)', 'String', 'tagName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-01-17 11:08:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '10', 'weight', NULL, 'bigint(20)', 'Long', 'weight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-01-17 11:08:08', '', NULL);

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `type` int(1) NULL DEFAULT 0 COMMENT '类型 （0分类/1页面）',
  `page_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面请求地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_category
-- ----------------------------
INSERT INTO `mto_category` VALUES (1, 0, '首页', '', 1, 'fa fa-css3', 1, '2018-01-14 21:34:54', '2022-01-08 15:00:11', 1, '/blog');
INSERT INTO `mto_category` VALUES (2, 0, '归档', '', 3, 'fa fa-coffee', 1, '2018-01-14 21:34:57', '2022-01-22 09:41:25', 1, '/blog/timeArchives?pageNum=1&pageSize=10');
INSERT INTO `mto_category` VALUES (3, 0, '其他文章', '记录网站建设以及日常工作、学习中的闲言碎语', 50, 'fa fa-folder-open-o', 1, '2018-01-20 22:28:03', '2019-09-14 15:28:50', 0, NULL);
INSERT INTO `mto_category` VALUES (4, 0, '领悟', '记录个人生活等文章', 40, NULL, 1, '2018-08-02 11:20:26', '2019-09-14 15:28:38', 0, NULL);
INSERT INTO `mto_category` VALUES (5, 3, '总结', '总结反思', 12, NULL, 1, '2019-09-11 11:28:15', '2022-02-25 13:32:56', 0, '');
INSERT INTO `mto_category` VALUES (6, 0, '工具资源', '开发工具、服务端工具、中间件', 20, NULL, 1, '2019-09-14 15:26:39', '2019-09-14 15:28:28', 0, NULL);
INSERT INTO `mto_category` VALUES (7, 0, '时间轴', '页面按时间排序', 2, NULL, 1, '2022-01-02 21:58:34', '2022-01-03 18:55:59', 1, '/blog/blog/focus');

-- ----------------------------
-- Table structure for mto_channel
-- ----------------------------
DROP TABLE IF EXISTS `mto_channel`;
CREATE TABLE `mto_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(5) NOT NULL,
  `thumbnail` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_channel
-- ----------------------------
INSERT INTO `mto_channel` VALUES (1, 'banner', 'banner', 1, '', 4);
INSERT INTO `mto_channel` VALUES (2, '后端', '后端', 0, '', 38);
INSERT INTO `mto_channel` VALUES (3, '前端', '前端', 0, '', 2);
INSERT INTO `mto_channel` VALUES (4, '数据库', '数据库', 0, '', 5);
INSERT INTO `mto_channel` VALUES (5, 'Linux', 'Linux', 0, NULL, 7);
INSERT INTO `mto_channel` VALUES (6, 'ElasticSearch', 'ElasticSearch', 1, '', 0);
INSERT INTO `mto_channel` VALUES (7, '其他', '其他', 0, NULL, 5);
INSERT INTO `mto_channel` VALUES (8, '项目', '项目', 0, '', 9);
INSERT INTO `mto_channel` VALUES (10, 'NoSql', 'NoSql', 0, '', 6);

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_comment
-- ----------------------------
INSERT INTO `mto_comment` VALUES (1, 0, '0', NULL, '1228134035@qq.com', '一粒麦子', '我来踩一脚😂', NULL, NULL, NULL, '2022-01-28 13:36:33', '2130706433', NULL);

-- ----------------------------
-- Table structure for mto_golden
-- ----------------------------
DROP TABLE IF EXISTS `mto_golden`;
CREATE TABLE `mto_golden`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `golden` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '金句',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_link
-- ----------------------------
INSERT INTO `mto_link` VALUES (1, 'CSDN', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1509214541,1213602824&fm=26&gp=0.jpg', 'https://blog.csdn.net/weixin_46237429', '', '', NULL, 'admin', '2021-12-17 21:23:53', '');
INSERT INTO `mto_link` VALUES (2, '果核剥壳', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1509214541,1213602824&fm=26&gp=0.jpg', 'https://www.ghxi.com/', NULL, '', NULL, '', NULL, '');
INSERT INTO `mto_link` VALUES (3, '预见未来', NULL, 'https://www.puboot.com/', NULL, '', NULL, '', NULL, '');

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `slider` int(11) NULL DEFAULT 0 COMMENT '轮播图状态 (1是轮播图)',
  `favors` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数(默认为0为推荐，1是推荐)',
  `featured` int(11) NOT NULL DEFAULT 0 COMMENT '推荐状态',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '文章状态',
  `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `thumbnail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'title',
  `views` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IK_CHANNEL_ID`(`channel_id`) USING BTREE,
  INDEX `index_title`(`title`) USING BTREE,
  INDEX `index_channel_id`(`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_post
-- ----------------------------
INSERT INTO `mto_post` VALUES (1, 2, 1, NULL, 0, '2020-11-09 17:57:46', 1, 0, 0, 0, '2020年发布文章目录', '', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=276549915,4259787207&fm=26&gp=0.jpg', '2020年文章发布目录 ', 166, 0, '2022-01-13 18:02:35');
INSERT INTO `mto_post` VALUES (2, 2, 5, NULL, 0, '2020-11-10 14:37:26', 0, 0, 0, 0, '文档的编辑，关机与重启，用户与用户组管理', 'Linux,原创', 'https://img0.baidu.com/it/u=3132030522,553099578&fm=26&fmt=auto&gp=0.jpg', 'Linux入门学习第一天', 72, 0, '2020-11-10 14:37:00');
INSERT INTO `mto_post` VALUES (9, 1, NULL, NULL, 0, '2022-03-01 14:19:56', 0, 0, 0, 0, NULL, '', NULL, '@Autowired注', 1, 0, NULL);
INSERT INTO `mto_post` VALUES (10, 1, NULL, NULL, 0, '2022-03-01 14:19:56', 0, 0, 0, 0, NULL, '', NULL, 'IDEA设置与常用插', 0, 0, NULL);
INSERT INTO `mto_post` VALUES (11, 1, NULL, NULL, 0, '2022-03-01 14:19:56', 0, 0, 0, 0, NULL, '', NULL, 'Java多线程批量拆分List导入数据', 0, 0, NULL);
INSERT INTO `mto_post` VALUES (12, 1, NULL, NULL, 0, '2022-03-01 14:19:56', 0, 0, 0, 0, NULL, '', NULL, 'JDK8常用时间操作 - 副', 0, 0, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_post_attribute
-- ----------------------------
INSERT INTO `mto_post_attribute` VALUES (1, '### [2020年文章发布目录 ](/blog/article/1)\r\n(2020-11-9)  2020年发布文章目录\r\n\r\n### [Linux入门学习第一天](/blog/article/2)\r\n(2020-11-10)  文档的编辑，关机与重启，用户与用户组管理\r\n\r\n### [Linux入门学习第二天](/blog/article/3)\r\n(2020-11-11)  Linux运行级别，文件指令（创建,删除,复制,查看,>与>>）\r\n\r\n### [Linux入门学习第三天](/blog/article/4)\r\n(2020-11-12)  echo指令,head指令，tail指令，history指令，时间类，搜索查找命令，grep指令和管道符号 |，解压缩\r\n\r\n### [Linux入门学习第四天](/blog/article/5)\r\n(2020-11-13)  组，Linux定时调度任务，权限\r\n\r\n### [Linux入门学习第五天](/blog/article/6)\r\n(2020-11-16)  分区，磁盘，工作统计实用指令，tree命令，修改固定IP地址\r\n\r\n### [Linux入门学习第六天](/blog/article/7)\r\n(2020-11-18)  查看进程（动态），杀死进程 \r\n\r\n### [BigDecimal常用方法详解](/blog/article/8)\r\n(2020-11-19)  1.常用方法  add(BigDecimal)  BigDecimal对象中的值相加，返回BigDecimal对象  subtract(BigDecimal)  BigDecimal对象中的值相减，返回BigDecimal对象  multiply...\r\n\r\n### [git常用命令总结](/blog/article/9)\r\n(2020-11-20)  git常用命令总结\r\n\r\n### [windows自动关机和取消关机](/blog/article/10)\r\n(2020-11-25)  windows自动关机和取消关机\r\n\r\n### [HashMap的遍历方式](/blog/article/11)\r\n(2020-11-26)  HashMap遍历方式【迭代器（Iterator）方式遍历； For Each 方式遍历； Lambda 表达式遍历（JDK 1.8+）; Streams API 遍历（JDK 1.8+）】\r\n\r\n### [List去重和过滤某个值](/blog/article/12)\r\n(2020-12-7)  List去重和过滤某个值\r\n\r\n### [java生成二维码](/blog/article/13)\r\n(2020-12-14)  java生成二维码\r\n\r\n### [为什么建议使用你 LocalDateTime ，而不是 Date？](/blog/article/14)\r\n(2020-12-16)  为什么建议使用你 LocalDateTime ，而不是 Date\r\n\r\n### [mybatis-puls生成代码](/blog/article/15)\r\n(2020-12-21)  介绍 官方最新版（2020-10-21） mybatis-plus代码生成器，可以生成oracle和mysql的相对应的代码，简单好用，生成有 实体类， controller， service和serviceimpl, mapper和mapper...\r\n\r\n### [一个list删除另一个list的数据](/blog/article/16)\r\n(2020-12-26)  有两个list (分别为list1和list2，将list1里面的list2元素删除),先将list1和list2去重，然后list1删除所有的list2,将list1添加到新集合里\r\n\r\n### [sql解析身份证](/blog/article/17)\r\n(2020-12-27)  解析身份证\r\n\r\n### [Stream流使用](/blog/article/18)\r\n(2020-12-30)  Stream,总结目前常用的方法，后期有遇到新方法在补\r\n\r\n### [oracle数据库中的行锁](/blog/article/19)\r\n(2020-12-31)  查找并杀死oracle中被锁的行 所谓的行锁\r\n', 'tinymce');
INSERT INTO `mto_post_attribute` VALUES (2, '文章来源：【原创】\r\n\r\n参考视频：[哔哩哔哩](https://www.bilibili.com/video/BV1dW411M7xL?p=12)\r\n\r\n## 0.说明\r\n\r\nvi/vim java.txt  【进入正常模式】\r\n\r\ni  【进入编辑模式】\r\n\r\n按Esc 【进入正常模式】\r\n\r\n## 1.Linux文件编辑\r\n\r\n### 【vi或vim使用】\r\n\r\n1.没有则创建，有就打开文档  \r\n\r\n```shell\r\nvim java.txt  \r\n```\r\n\r\n2.使用 i 开始编辑\r\n\r\n3.按 Esc 后 \r\n\r\n:wq  【保存并退出】\r\n\r\n:q  【退出】\r\n\r\n:q!  【强制退出】\r\n\r\n## 2.复制粘贴/删除/查找/撤销\r\n\r\n==以下操作在正常模式==\r\n\r\nyy  【复制当前行】   p  【粘贴】\r\n\r\n5yy  【复制光标下的5行】    p  【粘贴】\r\n\r\ndd 【 删除当前行】\r\n\r\n5dd 【删除光标下的5行】\r\n\r\n/你好 回车 【查找】 n 【查找下一个】\r\n\r\nu  【撤销当前行】\r\n\r\n## 3.行号显示与取消\r\n\r\n==以下操作在正常模式==\r\n\r\n:set nu  【显示行号】\r\n\r\n:set nonu  【取消行号显示】\r\n\r\n## 4.快速到文章底部/顶部\r\n\r\n==以下操作在正常模式==\r\n\r\nG  【到文章顶部】\r\n\r\ngg  【到文章底部】\r\n\r\n## 5.关机/重启\r\n\r\nshutdown -h now  【立即关机】\r\n\r\nshutdown -h 60  【一个小时后关机】\r\n\r\nshutdown -r now   【重启】  \r\n\r\nreboot   【重启】\r\n\r\nsync   【将内存数据保存到磁盘，建议关机或者重启时使用】\r\n\r\n## 6.用户管理\r\n\r\n#### 6.1创建用户\r\n\r\nuseradd zhaoyi   【创建用户zhaoyi，会在**/home**文件夹下创建默认的**zhaoyi组**】\r\n\r\nuseradd -d /home/group/zhaoyi   【创建用户zhaoyi，会在**/home/group**文件夹下创建**group组**】\r\n\r\n注意：如果group已经存在，会常见失败\r\n\r\n#### 6.2给用户指定密码\r\n\r\npasswd 用户名   【 **passwd zhaoyi**  给用户zhaoyi指定密码】\r\n\r\n#### 6.3删除用户\r\n\r\nuserdel zhaoyi  【删除用户但不删除/home下的用户目录】\r\n\r\nuserdel -r zhaoyi  【删除用户并删除/home下的用户目录】\r\n\r\n#### 6.4查看用户信息\r\n\r\nid 用户名  【例如：id zhaoyi】\r\n\r\n#### 6.4切换用户\r\n\r\nsu - 用户名\r\n\r\n**案例**\r\n\r\n```shell\r\nuseradd zhangsan          --常见用户\r\npasswd  zhangsan          --给用户指定密码\r\nsu - zhangsan             --切换到zhangsan用户下\r\nexit                      --退出张三用户(回退到原来的用户)\r\n```\r\n\r\n## 7.用户组\r\n\r\ngroupadd  用户组名   【创建用户组】\r\n\r\ngroupdel   用户组名   【删除用户组】\r\n\r\nuseradd -g 用户组名 用户名   【创建用户并指定用户组】\r\n\r\nid  用户名   【查看用户信息】\r\n\r\npasswd 用户名   【给用户指定密码】\r\n\r\nusermod -g 用户组名 用户名   【修改用户的用户组】\r\n\r\n## 8.用户和用户组相关的文件\r\n\r\n/etc/passwd                【用户信息， vi /etc/passwd】\r\n\r\n/etc/group                   【用户组信息， vi /etc/group】\r\n\r\n/etc/shadow               【用户密码，加过密， vi /etc/shadow】', 'tinymce');
INSERT INTO `mto_post_attribute` VALUES (9, '@[TOC](@Autowired注解)\n# @Autowired注解\n\n![640](https://img-blog.csdnimg.cn/img_convert/4fe3d9e228c8973d4b1d8d9eba73492d.png)\n\n## @Autowired 字段\n\n我们可以把 `@Autowired` 注解标注在类文件中的字段属性上，通过这种方式，Spring 容器启动的时候会查找相应的 `Bean` ，然后通过反射的方式注入到这个字段中。\n\n例子如下：\n\n```java\n@Controller\npublic class PayController {\n    @Autowired\n    PayService aliPayService;\n}\n```\n\n这种方式使用起来非常方便，而且对于字段的要求也比较低，它可以是 `public`,也可以是 `private`范围。\n\n日常编程中，我一般是直接使用这种方式，简洁又便利。\n\n## @Autowired 构造方法\n\n第二种方式，我们可以使用类中的构造函数注入相应属性，例子如下：\n\n```java\n@Controller\npublic class PayController {\n    \n    PayService aliPayService;\n    \n    @Autowired\n    public PayController(PayService aliPayService) {\n        this.aliPayService = aliPayService;\n    }\n}\n```\n\n`@Autowired` 构造方法里的传参，可以是一个，也可以是多个。如果是多个参数，那 Spring 一起都注入进来。\n\n```java\n@Controller\npublic class PayController {\n\n    PayService aliPayService;\n    \n    OrderService orderService;\n    \n    @Autowired\n    public PayController(PayService aliPayService, OrderService orderService) {\n        this.aliPayService = aliPayService;\n        this.orderService=orderService;\n    }\n}\n```\n\n这种方式在注入多个属性的时候用起来还是比较方便的。\n\n那其实有一种情况下，如果一个类不存在无参的构造函数，只存在有参的构造函数，那实际上我们即使不用 `@Autowired`标注，Spring 也会帮我们注入相应的属性。\n\n## @Autowired 方法\n\n第三种方式，我们可以通过方法注入相应属性，例子如下：\n\n```java\n@Controller\npublic class PayController {\n\n    PayService aliPayService;\n    \n    @Autowired\n    public void setAliPayService(PayService aliPayService) {\n        this.aliPayService = aliPayService;\n    }\n}\n```\n\n那之前我一直以为这种方式只能使用  `setxxx`才可以成功的注入属性 ，那其实是我理解错了，这个方法可以任意的命名。\n\n那方法注入，其实跟构造方法一样，也可以同时有多个传参，Spring 将会把这些属性一起注入。\n\n# @Autowired与@Resource区别\n\n## @Autowired\n\n1.@Autowired只有一个属性required，默认值为true，为true时，找不到就抛异常，为false时，找不到就赋值为null\n\n2.@Autowired按类型查找，如果该类型的bean不唯一，则抛出异常；可通过组合注解解决·\n`@Autowired()@Qualifier(\"baseDao\")`\n\n## @Resource\n\n@Resource有两个常用属性name、type，所以分4种情况\n\n1.指定name和type：通过name找到唯一的bean，找不到抛出异常；如果type和字段类型不一致，也会抛出异常\n\n2.指定name：通过name找到唯一的bean，找不到抛出异常\n\n3.指定type：通过tpye找到唯一的bean，如果不唯一，则抛出异常：NoUniqueBeanDefinitionException\n\n4.都不指定：通过字段名作为key去查找，找到则赋值；找不到则再通过字段类型去查找，如果不唯一，则抛出异常：NoUniqueBeanDefinitionException\n\n## 不同点\n\n1.Resource是JDK提供的，而Autowired是Spring提供的\n\n2.Resource不允许找不到bean的情况，而Autowired允许（@Autowired(required = false)）\n\n3.指定name的方式不一样，@Resource(name = \"baseDao\"),@Autowired()@Qualifier(\"baseDao\")\n\n4.Resource默认通过name查找，而Autowired默认通过type查找\n\n\n\n学习来源：\n\n微信公众号：CodeSheep\n\n[CSDN balsamspear](https://blog.csdn.net/balsamspear/article/details/87936936?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522162838433516780366543073%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=162838433516780366543073&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_v2~rank_v29-3-87936936.pc_search_result_cache&utm_term=autowired%E5%92%8Cresource%E7%9A%84%E5%8C%BA%E5%88%AB&spm=1018.2226.3001.4187)\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (10, '#### 0.myPlugins\n\n![image-20210226165437980](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210226165437980.png)\n\n#### 1. idea官网下载\n\n[idea下载](https://www.jetbrains.com/idea/)（https://www.jetbrains.com/idea/）\n\n![image-20210106135641330](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106135641330.png)\n\n#### 2. 安装\n\n**一路下一步即可**\n\n激活参考 ：\n\n[参考一]( https://tech.souyunku.com/?p=48379)\n\n[参考二](https://mp.weixin.qq.com/s?__biz=MzA4OTY5OTI2OA==&mid=2247484453&idx=1&sn=162dcebb57a9f097ffde9394e24830bf&chksm=9017a28ea7602b982d121d1b5ccd192f17dfa3bd6965aadc89e150a1187fa9bd87d7d92b0441&mpshare=1&scene=1&srcid=1231ZEJ49YsjbLMX7cB760ix&sharer_sharetime=1609426424668&sharer_shareid=5a84b86af98719460780d3903361d384&key=f4c334f5d6d13eef911839bb692bff65ab06f1f6da2f04e332b37ed9c51b59ae01ac1a738d5bb5cdd3fee9bd4e50aba31ce1226059bf0d3934424a2eb4f86bfb924ed7e411a8e95b9d1dc77ff700810a1a6bd20d0d9d92ce174a1090590369786e3dcc245947581e66d9f4743ad7b6cd96ad45bbb9e49b43a1a86c97d65d87ed&ascene=1&uin=Nzc4ODQ0MTQy&devicetype=Windows+10+x64&version=62090529&lang=zh_CN&exportkey=Ae7wrCbD7HOZZiBv8Dr4YVY%3D&pass_ticket=OSsOLAg4uC22LlKAntV7Q563SUiJisTOkjeAd4tBbo0ky%2FFuVrOnBHEf%2BajrVpkz&wx_header=0)\n\n![image-20210106135655486](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106135655486.png)\n\n#### 3.idea方法分割线\n\n![方法名分割线](https://gitee.com/GiteeKey/mblog/raw/master/images/方法名分割线.png)\n\n#### 4.idea显示参数提示设置\n\n![idea参数名提示](https://gitee.com/GiteeKey/mblog/raw/master/images/idea参数名提示.jpg)\n\n#### 5. 设置自动导包\n\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210101162036028.png)\n\n#### 6.取消与不必要的文件显示\n\n![img](https://img2018.cnblogs.com/blog/889782/201907/889782-20190708193913619-191369760.png)\n\n#### 7.热部署Tomcat\n\n**安装插件  jrebel and XRebel for IntelliJ**\n\n**安装插件  jrebel mybatisPlus extension （这个插件可以对 mapper.xml进行热部署）**\n\n1.安装插件并重新启动idea\n\n![image-20200311085301253](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311085301253.png)\n\n2.激活\n\n![image-20200311085832694](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311085832694.png)\n\n3.下载激工具https://github.com/ilanyu/ReverseProxy/releases/tag/v1.0\n\n双击运行\n\n![image-20200311091747951](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311091747951.png)\n\n4.在idear中激活\n\n**也可以使用[https://jrebel.qekang.com/](https://jrebel.qekang.com/)**\n\n第一行输入： http://127.0.0.1:8888/GUID\nGUID生成路径：https://www.guidgen.com/\n\n![image-20200311090314220](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311090314220.png)\n\n激活成功\n\n![image-20200311090954133](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311090954133.png)\n\n![image-20200311091616002](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200311091616002.png)\n\n最后在idea中设置\n\n![image-20200418213738819](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20200418213738819.png)\n\n#### 8.修改注释颜色\n\n![image-20210106134700112](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106134700112.png)\n\n#### 9.类上方法设置\n\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210107103536.png)\n\n```java\n/**\n * @ClassName ${NAME}\n * @description: TODO\n * @author: 一粒麦子\n * @Date ${DATE} ${TIME}\n **/\n```\n\n#### 10.方法上注释\n\n##### 1.基础设置\n\n```java\n/*\n * * methodName: $methodName$\n * * @Author: zhaoyi\n * * @Description: //TODO\n * * @Date:  $date$ $time$\n  $param$\n * @return $return$\n **/\n```\n\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210107111959.png)\n\n##### 2.赋值设置\n\n**param设置**\n\n```java\ngroovyScript(         \"def result=\'\';          def params=\\\"${_1}\\\".replaceAll(\'[\\\\\\\\[|\\\\\\\\]|\\\\\\\\s]\', \'\').split(\',\').toList();          for(i = 0; i < params.size(); i++) {             result +=\' * @param \' + params[i] + ((i < params.size() - 1) ? \'\\\\n\' : \'\')};              return result \", methodParameters())\n```\n\n**date设置**\n\n```java\ndate(\"yyyy/MM/dd\")\n```\n\n**其他设置**\n\n其他的在快捷方式里都可以找到\n\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210107112153.png)\n\n##### 3.使用\n\n我们起的名字是 /** + 回车，当然你也可以自己起个名字，输入名字会又提示\n\n#### 11.取消idea打开自动进入项目\n\n![image-20210120171905086](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210120171905086.png)\n\n#### 1. Translation\n\n中英文翻译\n\n#### 2. CodeGlance\n\n右边预览栏\n\n#### 3. Free MyBatis plugin\n\nmapper层与mapper.xml切换\n\n![](https://img-blog.csdnimg.cn/img_convert/2777885bd7786d44006979e8227c40d1.png)\n\n#### 4. Restfultookit/RestfulTool\n\n**在idea2020.3.1中Restfultookit失效，可以使用RestfulTool**\n\n![image-20210226164952688](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210226164952688.png)\n\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20210101182521.png)\n\n\n\n#### 5. lombok\n\n![image-20210106134834113](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106134834113.png)\n\n#### 6. mybatisLog \n\nmybatisLog  / mybatis Log Plugin（需要注册码）可以将执行到SQL在控制台完整的打印\n\n![image-20210106134222344](https://gitee.com/GiteeKey/mblog/raw/master/images/image-20210106134222344.png)\n\n#### 7.GitToolBox\n\n![](https://gitee.com/GiteeKey/mblog/raw/master/images/20220209133111.png)\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (11, '## 一、前言\n\n前两天做了一个导入的功能，导入开始的时候非常慢，导入2w条数据要1分多钟，后来一点一点的优化，从直接把list怼进Mysql中，到分配把list导入Mysql中，到多线程把list导入Mysql中。时间是一点一点的变少了。非常的爽，最后变成了10s以内。下面就展示一下过程。\n\n## 二、直接把list怼进Mysql\n\n使用mybatis的批量导入操作：\n\n```java\n @Transactional(rollbackFor = Exception.class)\n    public int addFreshStudentsNew2(List<FreshStudentAndStudentModel> list, String schoolNo) {\n        if (list == null || list.isEmpty()) {\n            return 0;\n        }\n        List<StudentEntity> studentEntityList = new LinkedList<>();\n        List<EnrollStudentEntity> enrollStudentEntityList = new LinkedList<>();\n        List<AllusersEntity> allusersEntityList = new LinkedList<>();\n\n        for (FreshStudentAndStudentModel freshStudentAndStudentModel : list) {\n\n            EnrollStudentEntity enrollStudentEntity = new EnrollStudentEntity();\n            StudentEntity studentEntity = new StudentEntity();\n            BeanUtils.copyProperties(freshStudentAndStudentModel, studentEntity);\n            BeanUtils.copyProperties(freshStudentAndStudentModel, enrollStudentEntity);\n            String operator = TenancyContext.UserID.get();\n            String studentId = BaseUuidUtils.base58Uuid();\n            enrollStudentEntity.setId(BaseUuidUtils.base58Uuid());\n            enrollStudentEntity.setStudentId(studentId);\n            enrollStudentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\n            enrollStudentEntity.setOperator(operator);\n            studentEntity.setId(studentId);\n            studentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\n            studentEntity.setOperator(operator);\n            studentEntityList.add(studentEntity);\n            enrollStudentEntityList.add(enrollStudentEntity);\n\n            AllusersEntity allusersEntity = new AllusersEntity();\n            allusersEntity.setId(enrollStudentEntity.getId());\n            allusersEntity.setUserCode(enrollStudentEntity.getNemtCode());\n            allusersEntity.setUserName(enrollStudentEntity.getName());\n            allusersEntity.setSchoolNo(schoolNo);\n            allusersEntity.setTelNum(enrollStudentEntity.getTelNum());\n            allusersEntity.setPassword(enrollStudentEntity.getNemtCode());  //密码设置为考生号\n            allusersEntityList.add(allusersEntity);\n        }\n            enResult = enrollStudentDao.insertAll(enrollStudentEntityList);\n            stuResult = studentDao.insertAll(studentEntityList);\n            allResult = allusersFacade.insertUserList(allusersEntityList);\n\n        if (enResult > 0 && stuResult > 0 && allResult) {\n            return 10;\n        }\n        return -10;\n    }\n```\n\nMapper.xml\n\n```xml\n<insert id=\"insertAll\" parameterType=\"com.dmsdbj.itoo.basicInfo.entity.EnrollStudentEntity\">\n        insert into tb_enroll_student\n        <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">\n                id,  \n                remark,  \n                nEMT_aspiration,  \n                nEMT_code,  \n                nEMT_score,  \n                student_id,  \n                identity_card_id,  \n                level,  \n                major,  \n                name,  \n                nation,  \n                secondary_college,  \n                operator,  \n                sex,  \n                is_delete,  \n                account_address,  \n                native_place,  \n                original_place,  \n                used_name,  \n                pictrue,  \n                join_party_date,  \n                political_status,  \n                tel_num,  \n                is_registry,  \n                graduate_school,  \n                create_time,  \n                update_time        </trim>        \n        values\n        <foreach collection=\"list\" item=\"item\" index=\"index\" separator=\",\">\n        (\n                #{item.id,jdbcType=VARCHAR},\n                #{item.remark,jdbcType=VARCHAR},\n                #{item.nemtAspiration,jdbcType=VARCHAR},\n                #{item.nemtCode,jdbcType=VARCHAR},\n                #{item.nemtScore,jdbcType=VARCHAR},\n                #{item.studentId,jdbcType=VARCHAR},\n                #{item.identityCardId,jdbcType=VARCHAR},\n                #{item.level,jdbcType=VARCHAR},\n                #{item.major,jdbcType=VARCHAR},\n                #{item.name,jdbcType=VARCHAR},\n                #{item.nation,jdbcType=VARCHAR},\n                #{item.secondaryCollege,jdbcType=VARCHAR},\n                #{item.operator,jdbcType=VARCHAR},\n                #{item.sex,jdbcType=VARCHAR},\n                0,\n                #{item.accountAddress,jdbcType=VARCHAR},\n                #{item.nativePlace,jdbcType=VARCHAR},\n                #{item.originalPlace,jdbcType=VARCHAR},\n                #{item.usedName,jdbcType=VARCHAR},\n                #{item.pictrue,jdbcType=VARCHAR},\n                #{item.joinPartyDate,jdbcType=VARCHAR},\n                #{item.politicalStatus,jdbcType=VARCHAR},\n                #{item.telNum,jdbcType=VARCHAR},\n                #{item.isRegistry,jdbcType=TINYINT},\n                #{item.graduateSchool,jdbcType=VARCHAR},\n                now(),\n                now()        \n        )   \n        </foreach>                \n  </insert> \n```\n\n**代码说明：**\n\n底层的mapper是通过逆向工程来生成的，批量插入如下，是拼接成类似：`insert into tb_enroll_student()values ()，()…….();`\n\n这样的缺点是，数据库一般有一个默认的设置，就是每次sql操作的数据不能超过4M。这样插入，数据多的时候，数据库会报错`Packet for query is too large (6071393 > 4194304). You can change this value on the server by setting the max_allowed_packet\' variable.，`虽然我们可以通过\n\n类似 修改 my.ini 加上 `max_allowed_packet =67108864`，`67108864=64M`，默认大小4194304 也就是4M\n\n修改完成之后要重启mysql服务，如果通过命令行修改就不用重启mysql服务。\n\n完成本次操作，但是我们不能保证项目单次最大的大小是多少，这样是有弊端的。所以可以考虑进行分组导入。\n\n## 三、分组把list导入Mysql中\n\n同样适用mybatis批量插入，区别是对每次的导入进行分组计算，然后分多次进行导入：\n\n```java\n@Transactional(rollbackFor = Exception.class)\n    public int addFreshStudentsNew2(List<FreshStudentAndStudentModel> list, String schoolNo) {\n        if (list == null || list.isEmpty()) {\n            return 0;\n        }\n        List<StudentEntity> studentEntityList = new LinkedList<>();\n        List<EnrollStudentEntity> enrollStudentEntityList = new LinkedList<>();\n        List<AllusersEntity> allusersEntityList = new LinkedList<>();\n\n        for (FreshStudentAndStudentModel freshStudentAndStudentModel : list) {\n\n            EnrollStudentEntity enrollStudentEntity = new EnrollStudentEntity();\n            StudentEntity studentEntity = new StudentEntity();\n            BeanUtils.copyProperties(freshStudentAndStudentModel, studentEntity);\n            BeanUtils.copyProperties(freshStudentAndStudentModel, enrollStudentEntity);\n            String operator = TenancyContext.UserID.get();\n            String studentId = BaseUuidUtils.base58Uuid();\n            enrollStudentEntity.setId(BaseUuidUtils.base58Uuid());\n            enrollStudentEntity.setStudentId(studentId);\n            enrollStudentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\n            enrollStudentEntity.setOperator(operator);\n            studentEntity.setId(studentId);\n            studentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\n            studentEntity.setOperator(operator);\n            studentEntityList.add(studentEntity);\n            enrollStudentEntityList.add(enrollStudentEntity);\n\n            AllusersEntity allusersEntity = new AllusersEntity();\n            allusersEntity.setId(enrollStudentEntity.getId());\n            allusersEntity.setUserCode(enrollStudentEntity.getNemtCode());\n            allusersEntity.setUserName(enrollStudentEntity.getName());\n            allusersEntity.setSchoolNo(schoolNo);\n            allusersEntity.setTelNum(enrollStudentEntity.getTelNum());\n            allusersEntity.setPassword(enrollStudentEntity.getNemtCode());  //密码设置为考生号\n            allusersEntityList.add(allusersEntity);\n        }\n\n        int c = 100;\n        int b = enrollStudentEntityList.size() / c;\n        int d = enrollStudentEntityList.size() % c;\n\n        int enResult = 0;\n        int stuResult = 0;\n        boolean allResult = false;\n\n        for (int e = c; e <= c * b; e = e + c) {\n            enResult = enrollStudentDao.insertAll(enrollStudentEntityList.subList(e - c, e));\n            stuResult = studentDao.insertAll(studentEntityList.subList(e - c, e));\n            allResult = allusersFacade.insertUserList(allusersEntityList.subList(e - c, e));\n        }\n        if (d != 0) {\n            enResult = enrollStudentDao.insertAll(enrollStudentEntityList.subList(c * b, enrollStudentEntityList.size()));\n            stuResult = studentDao.insertAll(studentEntityList.subList(c * b, studentEntityList.size()));\n            allResult = allusersFacade.insertUserList(allusersEntityList.subList(c * b, allusersEntityList.size()));\n        }\n\n        if (enResult > 0 && stuResult > 0 && allResult) {\n            return 10;\n        }\n        return -10;\n    }\n```\n\n**代码说明：**\n\n这样操作，可以避免上面的错误，但是分多次插入，无形中就增加了操作实践，很容易超时。所以这种方法还是不值得提倡的。\n\n再次改进，使用多线程分批导入。\n\n## 四、多线程分批导入Mysql\n\n依然使用mybatis的批量导入，不同的是，根据线程数目进行分组，然后再建立多线程池，进行导入。\n\n```java\n @Transactional(rollbackFor = Exception.class)\n    public int addFreshStudentsNew(List<FreshStudentAndStudentModel> list, String schoolNo) {\n        if (list == null || list.isEmpty()) {\n            return 0;\n        }\n        List<StudentEntity> studentEntityList = new LinkedList<>();\n        List<EnrollStudentEntity> enrollStudentEntityList = new LinkedList<>();\n        List<AllusersEntity> allusersEntityList = new LinkedList<>();\n\n        list.forEach(freshStudentAndStudentModel -> {\n            EnrollStudentEntity enrollStudentEntity = new EnrollStudentEntity();\n            StudentEntity studentEntity = new StudentEntity();\n            BeanUtils.copyProperties(freshStudentAndStudentModel, studentEntity);\n            BeanUtils.copyProperties(freshStudentAndStudentModel, enrollStudentEntity);\n            String operator = TenancyContext.UserID.get();\n            String studentId = BaseUuidUtils.base58Uuid();\n            enrollStudentEntity.setId(BaseUuidUtils.base58Uuid());\n            enrollStudentEntity.setStudentId(studentId);\n            enrollStudentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\n            enrollStudentEntity.setOperator(operator);\n            studentEntity.setId(studentId);\n            studentEntity.setIdentityCardId(freshStudentAndStudentModel.getIdCard());\n            studentEntity.setOperator(operator);\n            studentEntityList.add(studentEntity);\n            enrollStudentEntityList.add(enrollStudentEntity);\n\n            AllusersEntity allusersEntity = new AllusersEntity();\n            allusersEntity.setId(enrollStudentEntity.getId());\n            allusersEntity.setUserCode(enrollStudentEntity.getNemtCode());\n            allusersEntity.setUserName(enrollStudentEntity.getName());\n            allusersEntity.setSchoolNo(schoolNo);\n            allusersEntity.setTelNum(enrollStudentEntity.getTelNum());\n            allusersEntity.setPassword(enrollStudentEntity.getNemtCode());  //密码设置为考生号\n            allusersEntityList.add(allusersEntity);\n        });\n\n\n        int nThreads = 50;\n\n        int size = enrollStudentEntityList.size();\n        ExecutorService executorService = Executors.newFixedThreadPool(nThreads);\n        List<Future<Integer>> futures = new ArrayList<Future<Integer>>(nThreads);\n\n        for (int i = 0; i < nThreads; i++) {\n            final List<EnrollStudentEntity> EnrollStudentEntityImputList = enrollStudentEntityList.subList(size / nThreads * i, size / nThreads * (i + 1));\n            final List<StudentEntity> studentEntityImportList = studentEntityList.subList(size / nThreads * i, size / nThreads * (i + 1));\n            final List<AllusersEntity> allusersEntityImportList = allusersEntityList.subList(size / nThreads * i, size / nThreads * (i + 1));\n\n           Callable<Integer> task1 = () -> {\n          studentSave.saveStudent(EnrollStudentEntityImputList,studentEntityImportList,allusersEntityImportList);\n               return 1;\n            };\n          futures.add(executorService.submit(task1));\n        }\n        executorService.shutdown();\n        if (!futures.isEmpty() && futures != null) {\n            return 10;\n        }\n        return -10;\n    }\n```\n\n**代码说明：**\n\n上面是通过应用ExecutorService 建立了固定的线程数，然后根据线程数目进行分组，批量依次导入。一方面可以缓解数据库的压力，另一个面线程数目多了，一定程度会提高程序运行的时间。缺点就是要看服务器的配置，如果配置好的话就可以开多点线程，配置差的话就开小点。\n\n## 五、小结\n\n通过使用这个操作真是不断的提高了，项目使用技巧也是不错。加油~~ 多线程哦~~\n\n## 六、文章来源\n\n微信公众号： 一行Java\n[Java多线程批量拆分List导入数据库](https://mp.weixin.qq.com/s/rZ_N7fSHbnvl-8JPtbs_Mg)\n\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (12, '# JDK8 常用的时间操作\n\n[学习参考](https://juejin.cn/post/6997570314003546120)\n\n```java\npublic static void main(String[] args) {\n\n	//1. 获取当前时间\n	LocalDateTime localDateTime = LocalDateTime.now();\n	System.out.println(\"LocalDateTime.now 输出:\" + localDateTime);\n	String fmtDate = localDateTime.format(DateTimeFormatter.ofPattern(\"yyyy-MM-dd HH:mm:ss\"));\n	System.out.println(\"格式化后的时间:\" + fmtDate);\n\n	//2. 时间格式转时间戳\n	long timeLong = LocalDateTime.now().toInstant(ZoneOffset.of(\"+8\")).toEpochMilli();\n	System.out.println(\"LocalDateTime获取的时间戳:\" + timeLong);\n	System.out.println(\"系统获取的时间戳:\" + System.currentTimeMillis());\n\n        //3. 特定时间转为时间戳:\n	LocalDateTime specificTime = LocalDateTime.of(2021, Month.DECEMBER, 17, 21, 57, 00);\n	long specificTimeX = specificTime.toInstant(ZoneOffset.of(\"+8\")).toEpochMilli();\n	System.out.println(\"特定时间的时间戳:\" + specificTimeX);\n\n	//4. 时间转时间戳\n	LocalDate localDate = Instant.ofEpochMilli(1629166353155L).atZone(ZoneOffset.ofHours(8)).toLocalDate();\n	System.out.println(\"时间戳:1629166353155 的时间为:\" + localDate);\n\n	//5. 或者转成LocalDateTime以后然后进行格式化\n	LocalDateTime date = LocalDateTime.ofInstant(Instant.ofEpochMilli(1629166353155L), ZoneId.systemDefault());\n	System.out.println(\"时间戳转换为时间输出:\" + date);\n	String dateFmt = date.format(DateTimeFormatter.ofPattern(\"yyyy-MM-dd HH:mm:ss\"));\n	System.out.println(\"时间戳转换为时间并格式化输出:\" + dateFmt);\n\n	//6. 对时间进行加减\n	LocalDateTime nowDateTime = LocalDateTime.now();\n	System.out.println(\"当前日期加一天,使用plusDays:\" + nowDateTime.plusDays(1));\n	System.out.println(\"当前日期减一天,使用minusDays:\" + nowDateTime.minusDays(1));\n	System.out.println(\"当前日期减一天,使用plusDays:\" + nowDateTime.plusDays(-1));\n\n	//7. 对月进行加减\n        /**\n         *  plusYears()\n         *  plusMonths()\n         *  plusWeeks()\n         *  plusDays()\n         *  plusHours()\n         *  plusMinutes()\n         *  plusSeconds()\n         *  plusNanos()\n         */\n	LocalDateTime localDateTime1 = LocalDateTime.now().plusMonths(1);\n	System.out.println(\"一个月后的时间 = \" + localDateTime1);\n	LocalDateTime localDateTime2 = LocalDateTime.now().minusMonths(1);\n	System.out.println(\"一个月前的时间 = \" + localDateTime2);\n\n	//8. .获取时间差  Duration.between(x1, x2);\n	Duration erroDuration = Duration.between(localDateTime2, localDateTime1);\n	System.out.println(\"相差多少毫秒\" + erroDuration.abs().toMillis());\n	System.out.println(\"相差多少分钟\" + erroDuration.abs().toMinutes());\n	System.out.println(\"相差多少小时\" + erroDuration.abs().toHours());\n	System.out.println(\"相差多少天\" + erroDuration.abs().toDays());\n}\n```\n\n', 'markdown');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_post_tag
-- ----------------------------
INSERT INTO `mto_post_tag` VALUES (1, 1, '12', NULL);

-- ----------------------------
-- Table structure for mto_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_tag`;
CREATE TABLE `mto_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `thumbnail` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(5) NOT NULL DEFAULT 0 COMMENT '状态(0为正常)',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_9ki38gg59bw5agwxsc4xtednf`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mto_tag
-- ----------------------------
INSERT INTO `mto_tag` VALUES (1, NULL, 'mysql', NULL, NULL, '2021-08-28 21:15:01', 0, 0);
INSERT INTO `mto_tag` VALUES (2, NULL, 'Linux', NULL, NULL, '2021-01-09 23:11:31', 0, 0);
INSERT INTO `mto_tag` VALUES (4, NULL, 'java', NULL, NULL, '2021-11-09 16:39:41', 0, 0);
INSERT INTO `mto_tag` VALUES (5, NULL, '其他', NULL, NULL, '2020-11-20 10:04:36', 0, 0);
INSERT INTO `mto_tag` VALUES (7, NULL, 'ElasticSearch', NULL, NULL, '2020-11-28 15:16:36', 0, 0);
INSERT INTO `mto_tag` VALUES (9, NULL, 'oracle', NULL, '2022-02-25 13:33:06', '2020-12-31 10:34:03', 0, 0);
INSERT INTO `mto_tag` VALUES (10, NULL, 'SpringBoot', NULL, NULL, '2021-05-20 09:34:05', 0, 0);
INSERT INTO `mto_tag` VALUES (11, NULL, 'swagger', NULL, NULL, '2021-04-13 13:16:33', 0, 0);
INSERT INTO `mto_tag` VALUES (12, NULL, 'docker', NULL, NULL, '2021-01-09 23:11:31', 0, 0);
INSERT INTO `mto_tag` VALUES (13, NULL, 'list', NULL, NULL, '2021-01-12 17:51:44', 0, 0);
INSERT INTO `mto_tag` VALUES (14, NULL, '验证码', NULL, NULL, '2021-03-28 16:26:56', 0, 0);
INSERT INTO `mto_tag` VALUES (15, NULL, '雪花算法', NULL, NULL, '2021-02-01 13:01:15', 0, 0);
INSERT INTO `mto_tag` VALUES (22, NULL, '项目', NULL, NULL, '2021-03-12 12:27:59', 0, 0);
INSERT INTO `mto_tag` VALUES (23, NULL, '豆宝社区', NULL, NULL, '2021-03-12 12:27:59', 0, 0);
INSERT INTO `mto_tag` VALUES (24, NULL, 'redis', NULL, NULL, '2021-06-05 15:50:38', 0, 0);
INSERT INTO `mto_tag` VALUES (25, NULL, '案例', NULL, NULL, '2021-03-16 13:10:02', 0, 0);
INSERT INTO `mto_tag` VALUES (26, NULL, 'vue', NULL, NULL, '2021-03-27 14:56:56', 0, 0);
INSERT INTO `mto_tag` VALUES (27, NULL, '文件上传', NULL, NULL, '2021-04-13 13:16:33', 0, 0);
INSERT INTO `mto_tag` VALUES (28, NULL, '三级分类', NULL, NULL, '2021-04-20 11:09:21', 0, 0);
INSERT INTO `mto_tag` VALUES (29, NULL, '树', NULL, NULL, '2021-04-20 11:09:21', 0, 0);
INSERT INTO `mto_tag` VALUES (30, NULL, 'Nginx', NULL, NULL, '2021-06-06 09:00:25', 0, 0);
INSERT INTO `mto_tag` VALUES (31, NULL, '调优', NULL, NULL, '2021-05-20 09:34:05', 0, 0);
INSERT INTO `mto_tag` VALUES (32, NULL, '多线程', NULL, NULL, '2021-05-22 15:30:40', 0, 0);
INSERT INTO `mto_tag` VALUES (33, NULL, 'NoSQL', NULL, NULL, '2021-06-05 15:50:38', 0, 0);
INSERT INTO `mto_tag` VALUES (34, NULL, 'bug', NULL, NULL, '2021-06-13 18:51:56', 0, 0);
INSERT INTO `mto_tag` VALUES (35, NULL, 'yml', NULL, NULL, '2021-06-28 21:50:52', 0, 0);
INSERT INTO `mto_tag` VALUES (36, NULL, '面试', NULL, NULL, '2021-08-30 22:35:58', 0, 0);
INSERT INTO `mto_tag` VALUES (37, NULL, 'mongoDB', NULL, NULL, '2021-08-28 13:17:32', 0, 0);
INSERT INTO `mto_tag` VALUES (38, NULL, '1', NULL, NULL, '2022-02-27 17:08:46', 0, 1);

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D89597CB878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D89597CB878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D89597CB878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-JD2V280H1645534524325', 1645534558307, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1645534530000, -1, 5, 'PAUSED', 'CRON', 1645534524000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1645534530000, -1, 5, 'PAUSED', 'CRON', 1645534524000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1645534540000, -1, 5, 'PAUSED', 'CRON', 1645534524000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2021-12-05 14:48:03', 'admin', '2022-02-08 13:19:05', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2021-12-05 14:48:03', 'admin', '2022-02-25 12:07:07', '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2021-12-05 14:48:03', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', 'admin', '2022-02-25 12:06:37');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL);

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_data` VALUES (34, 1, '测试type', '1', 'note_type', NULL, 'primary', 'Y', '0', 'admin', '2021-12-18 16:19:40', '', NULL, NULL);

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_type` VALUES (12, '是否记入总账', 'account_is_Total', '0', 'admin', '2021-11-21 14:36:17', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '随手记类型', 'note_type', '0', 'admin', '2021-12-18 15:49:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '正常停用状态', 'start_stop_status', '0', 'admin', '2021-12-11 18:06:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-12-05 14:48:03', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-12-05 14:48:03', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-12-05 14:48:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 14:56:54');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 15:30:28');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 15:42:45');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-27 17:07:05');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2022-02-27 17:07:08');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 17:07:16');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '192.168.0.103', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-02-27 19:00:50');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 16:05:04');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 16:22:44');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 11:20:39');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 13:55:47');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 14:15:17');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 14:19:37');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '192.168.35.186', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-03-01 14:26:04');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '192.168.35.186', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-03-01 14:28:50');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 14:30:03');

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'menuItem', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-11-13 11:48:05', 'admin', '2022-02-25 12:06:24', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-11-13 11:48:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-11-13 11:48:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-11-13 11:48:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-11-13 11:48:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-11-13 11:48:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-11-13 11:48:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-11-13 11:48:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-11-13 11:48:05', '', NULL, '日志管理菜单');
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
INSERT INTO `sys_menu` VALUES (1084, '博客导出', 1078, 6, '#', '', 'F', '0', '1', 'mto:post:export', '#', 'admin', '2021-11-13 15:23:07', '', NULL, '');
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
INSERT INTO `sys_menu` VALUES (1105, '标签管理', 5, 2, '/mto/tag', 'menuItem', 'C', '0', '1', 'mto:tag:view', '#', 'admin', '2021-11-27 11:29:13', 'admin', '2021-11-27 12:50:28', '博客标签菜单');
INSERT INTO `sys_menu` VALUES (1106, '博客标签查询', 1105, 1, '#', '', 'F', '0', '1', 'mto:tag:list', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1107, '博客标签新增', 1105, 2, '#', '', 'F', '0', '1', 'mto:tag:add', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '博客标签修改', 1105, 3, '#', '', 'F', '0', '1', 'mto:tag:edit', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1109, '博客标签删除', 1105, 4, '#', '', 'F', '0', '1', 'mto:tag:remove', '#', 'admin', '2021-11-27 11:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '详情导出', 1103, 1, '#', 'menuItem', 'F', '0', '1', 'account:bill:export', '#', 'admin', '2021-11-27 12:59:02', 'admin', '2021-12-04 13:23:21', '');
INSERT INTO `sys_menu` VALUES (1111, '备忘录', 7, 1, '/memorial/pinBoard', 'menuItem', 'C', '0', '1', 'memorial:pin_board:view', '#', 'admin', '2021-11-27 13:27:48', 'admin', '2021-12-18 13:30:08', '');
INSERT INTO `sys_menu` VALUES (1112, '任务清单', 7, 2, '/memorial/agileBoard', 'menuItem', 'C', '0', '1', 'memorial:agile_board:view', '#', 'admin', '2021-11-27 21:36:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1113, '任务清单删除', 1112, 3, '#', 'menuItem', 'F', '0', '1', 'memorial:agile_board:remove', '#', 'admin', '2021-12-01 17:25:21', 'admin', '2021-12-18 12:56:23', '');
INSERT INTO `sys_menu` VALUES (1114, '报表统计', 1103, 2, '#', 'menuItem', 'F', '0', '1', 'account:bill:count', '#', 'admin', '2021-12-04 13:20:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1115, '博客前台', 5, 5, '/blog/list', 'menuItem', 'C', '0', '1', '', '#', 'superAdmin', '2021-12-05 19:14:45', 'admin', '2021-12-17 21:23:35', '');
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
INSERT INTO `sys_menu` VALUES (1139, '随手记查询详情', 1134, 5, '#', '', 'F', '0', '1', 'memorial:note_board:datail', '#', 'admin', '2021-12-18 16:15:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '<blockquote>新版本内容</blockquote>', '0', 'admin', '2021-12-05 14:48:03', 'admin', '2022-02-25 12:07:28', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-12-05 14:48:03', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.project.monitor.operlog.controller.OperlogController.clean()', 'POST', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 14:53:44');
INSERT INTO `sys_oper_log` VALUES (2, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', NULL, 1, '', '2022-02-27 15:31:14');
INSERT INTO `sys_oper_log` VALUES (3, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', NULL, 1, '', '2022-02-27 15:31:33');
INSERT INTO `sys_oper_log` VALUES (4, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"123\",\"code\":0}', 0, NULL, '2022-02-27 15:32:13');
INSERT INTO `sys_oper_log` VALUES (5, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"123\",\"code\":0}', 0, NULL, '2022-02-27 15:33:01');
INSERT INTO `sys_oper_log` VALUES (6, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-02-27 15:42:58');
INSERT INTO `sys_oper_log` VALUES (7, '删除博客', 3, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.remove()', 'POST', 1, 'admin', '研发部门', '/mto/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 15:49:39');
INSERT INTO `sys_oper_log` VALUES (8, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-02-27 15:49:52');
INSERT INTO `sys_oper_log` VALUES (9, '删除博客', 3, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.remove()', 'POST', 1, 'admin', '研发部门', '/mto/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 15:57:39');
INSERT INTO `sys_oper_log` VALUES (10, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-02-27 15:57:48');
INSERT INTO `sys_oper_log` VALUES (11, '修改博客', 2, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/mto/post/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"title\":[\"j\"],\"content\":[\"首先要说一下，本文对这些Java集合框架的面试题只做了一个总结式的回答，对每一道题目，都值得深入去了解一下（什么是扎实基本功，这些就是基本功~~），后续可能对每一道题目拆开独立篇章来深入讲解一下。\\r\\n\\r\\n大家看到这些总结，有疑惑的，就赶紧去查一查深入了解一下，当然也欢迎指出文中错误之处。\\r\\n\\r\\n以下是大纲：\\r\\n\\r\\n> - HashMap和HashTable的区别？\\r\\n> - 说一下 HashMap 的底层结构？\\r\\n> - 为什么HashMap是线程不安全的\\r\\n> - ArrayList 和 LinkedList 的区别是什么？\\r\\n> - ArrayList 和 Vector 的区别是什么？\\r\\n> - Array 和 ArrayList 有何区别？\\r\\n> - 说一下 HashSet 的实现原理？\\r\\n> - 如何决定使用 HashMap 还是 TreeMap？\\r\\n> - List、Set、Map 之间的区别是什么？\\r\\n> - HashMap怎样解决hash冲突\\r\\n\\r\\n### 1.HashMap和HashTable的区别？ \\r\\n\\r\\n**HashMap 不是线程安全的**\\r\\n\\r\\nHashMap 是 map 接口的实现类，是将键映射到值的对象，其中键和值都是对象，并且不能包含重复键，但可以包含重复值。HashMap 允许 null key 和 null value，而 HashTable 不允许。\\r\\n\\r\\n**HashTable 是线程安全 Collection。**\\r\\n\\r\\nHashMap 是 HashTable 的轻量级实现，他们都完成了Map 接口，主要区别在于 HashMap 允许 null key 和 null value,由于非线程安全，效率上可能高于 Hashtable。\\r\\n\\r\\n**区别：**\\r\\n\\r\\n- HashMap允许将 null 作为一个 entry 的 key 或者 value，而 Hashtable 不允许。\\r\\n- HashMap 把 Hashtable 的 contains 方法去掉了，改成 containsValue 和 containsKey。因为 contains 方法容易让人引起误解。\\r\\n- HashTable 继承自 Dictionary 类，而 HashMap 是 Java1.2 引进的 Map interface 的一个实现。\\r\\n- HashTable 的方法是 Synchronize 的，而 HashMap 不是，在多个线程访问 Hashtable 时，不需要自己为它的方法实现同步，而 HashMap 就必须为之提供外同步。\\r\\n\\r\\n### 2.说一下 HashMap 的底层结构？\\r\\n\\r\\nHashMap的主干是一个Entry数组。Entry是HashMap的基本组成单元，每一个Entry包含一个key-value键值对。整体结构图：\\r\\n\\r\\n![图片](https://mmbiz.qpic.cn/mmbiz_png/8KKrHK5ic6XByIKxMewRibiaeickEsBwzwYL8Epicx2ic4U6khXOBiczC0zSNxC3h0FZ6mx4usiaIkNgrVMqqdpL6LhaYw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)\\r\\n\\r\\nHashMap由**数组+链表**组成的。\\r\\n\\r\\n数组是HashMap的主体，链表则是主要为了解决哈希冲突而存在的，如果定位到的数组位置不含链表（当前entry的next指向null），那么对于查找，添加等操作很快，仅需一次寻址即可；如果定位到的数组包含链表，对于添加操作，其时间复杂度为O(n)，首先遍历链表，存在即覆盖，否则新增；对于查找操作来讲，仍需遍历链表，然后通过key对象的equals方法逐一比对查找。所以，性能考虑，HashMap中的链表出现越少，性能才会越好。\\r\\n\\r\\n### 3.为什么HashMap是线程不安全的\\r\\n\\r\\n见18期：[【018期】你知道为什么HashMap是线程不安全的吗？](http://mp.weixin.qq.com/s?__biz=MzUxNzg2ODQ1Mw==&mid=2247487544&idx=1&sn=acc00c0ca03350489e7461a695b6f70c&chksm=f990cef2cee747e4e60f5de8408bc2619cbe42693e828a0a617c6362cb52f', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 15:58:18');
INSERT INTO `sys_oper_log` VALUES (12, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-02-27 16:06:06');
INSERT INTO `sys_oper_log` VALUES (13, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-02-27 16:06:32');
INSERT INTO `sys_oper_log` VALUES (14, '查询账单年月统计', 5, 'com.ruoyi.project.emmanuel.account.controller.AccountBillController.list()', 'POST', 1, 'admin', '研发部门', '/account/bill/list', '127.0.0.1', '内网IP', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"],\"month\":[\"\"],\"accountId\":[\"\"]}', '{\"code\":0,\"currentPage\":0,\"currentSize\":0,\"rows\":[{\"balance\":-1.00,\"income\":0.00,\"month\":\"2022-01\",\"pay\":1.00},{\"balance\":-120.00,\"income\":220.00,\"month\":\"2021-12\",\"pay\":340.00},{\"balance\":-9107.11,\"income\":1002.00,\"month\":\"2021-11\",\"pay\":10109.11},{\"balance\":-10.00,\"income\":0.00,\"month\":\"2021-10\",\"pay\":10.00}],\"total\":4}', 0, NULL, '2022-02-27 17:08:06');
INSERT INTO `sys_oper_log` VALUES (15, '查询月账单图形统计', 0, 'com.ruoyi.project.emmanuel.account.controller.AccountBillController.billConunt()', 'GET', 1, 'admin', '研发部门', '/account/bill//bullCount/month', '127.0.0.1', '内网IP', '{\"month\":[\"2021-11\"]}', '{\"payTypeList\":[\"食\"],\"totalPay\":10109.11,\"incomeMoneyList\":[1002.00],\"payData\":[{\"name\":\"食\",\"value\":10109.11}],\"incomeTypeList\":[\"名称\"]}', 0, NULL, '2022-02-27 17:08:22');
INSERT INTO `sys_oper_log` VALUES (16, '博客标签', 1, 'com.ruoyi.project.emmanuel.mto.controller.MtoTagController.addSave()', 'POST', 1, 'admin', '研发部门', '/mto/tag/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"orderNum\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 17:08:45');
INSERT INTO `sys_oper_log` VALUES (17, '删除博客', 3, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.remove()', 'POST', 1, 'admin', '研发部门', '/mto/post/remove', '192.168.0.103', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 19:02:02');
INSERT INTO `sys_oper_log` VALUES (18, '修改博客', 2, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/mto/post/edit', '192.168.0.103', '内网IP', '{\"id\":[\"7\"],\"title\":[\"数据库操\"],\"content\":[\"## 导入数据库\\r\\n\\r\\n```sql\\r\\nmysql -uroot -p -h (ip地址)\\r\\nCREATE  DATRABSE [数据库名字]\\r\\nsource [所在的路径//*.sql]\\r\\n```\\r\\n\\r\\n\\r\\n\\r\\n# 一.通用查询\\r\\n\\r\\n## 查询数据库/表/字段\\r\\n\\r\\n**mblog_mblog 是数据库名，mto_post/mto_mblog是数据库表名**\\r\\n\\r\\n```sql\\r\\n-- 查询数据库\\r\\nshow databases;  \\r\\n\\r\\n-- 查询指定数据库(mblog_mblog)中所有的表\\r\\nselect table_name from information_schema.tables where table_schema=\'mblog_mblog\' and table_type=\'base table\';\\r\\n\\r\\n\\r\\n-- 查询指定表(mto_post)中的所有字段名\\r\\nselect column_name from information_schema.columns where table_schema=\'mblog_mblog\' and table_name=\'mto_post\';\\r\\n\\r\\n\\r\\n-- 查询指定表中的所有字段名和字段类型\\r\\nselect column_name,data_type from information_schema.columns where table_schema=\'mto_mblog\' and table_name=\'mto_post\';\\r\\n\\r\\n-- 查看表结构\\r\\nDESC mto_mblog;\\r\\nSHOW COLUMNS FROM mto_mblog;\\r\\n```\\r\\n\\r\\n## 删除表数据\\r\\n\\r\\n```sql\\r\\n使用 delete from table_name，会生成日志，序号 id 会延续之前的编号继续编号。\\r\\n\\r\\n使用 truncate table table_name ，无日志生成，序号 id 重新开始从1编号。\\r\\n```\\r\\n\\r\\n## 外键\\r\\n\\r\\n执行SQL `truncate TABLE homepension_member;`  报错 \\r\\n\\r\\n> truncate TABLE homepension_member\\r\\n>\\r\\n> 1701 - Cannot truncate a table referenced in a foreign key constraint (`homepensioncloud`.`homepension_finance_subsidy_standard_member`, CONSTRAINT `fk_finance_subsidy_standard_member2` FOREIGN KEY (`member_id`) REFERENCES `homepensioncloud`.`homepension_member` )\\r\\n\\r\\n这是因为有外键约束引起的，\\r\\n\\r\\n可以先执行  `SET FOREIGN_KEY_CHECKS=0;` 取消外键约束，在执行删除SQL，\\r\\n\\r\\n执行删除SQL后 `SET FOREIGN_KEY_CHECKS=1;` 恢复外键约束。\\r\\n\\r\\n```sql\\r\\n-- 禁用外键约束\\r\\nSET FOREIGN_KEY_CHECKS=0;\\r\\n-- 启用外键约束\\r\\nSET FOREIGN_KEY_CHECKS=1;\\r\\n-- 检查外键状态\\r\\nSELECT @@FOREIGN_KEY_CHECKS; \\r\\n```\\r\\n\\r\\n##  模糊查询\\r\\n\\r\\n|          函数          |                 说明                  |\\r\\n| :--------------------: | :-----------------------------------: |\\r\\n|          like          |               使用 %和_               |\\r\\n|      between and       | 等价于age>=20 AND age<=50(包含20和50) |\\r\\n|           in           |         IN(expr1, expr2, ……)       ', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 19:02:18');
INSERT INTO `sys_oper_log` VALUES (19, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-03-01 14:08:39');
INSERT INTO `sys_oper_log` VALUES (20, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', NULL, 0, NULL, '2022-03-01 14:11:34');
INSERT INTO `sys_oper_log` VALUES (21, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', NULL, 0, NULL, '2022-03-01 14:13:51');
INSERT INTO `sys_oper_log` VALUES (22, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', NULL, 0, NULL, '2022-03-01 14:15:52');
INSERT INTO `sys_oper_log` VALUES (23, '删除博客', 3, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.remove()', 'POST', 1, 'admin', '研发部门', '/mto/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8,7,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 14:19:45');
INSERT INTO `sys_oper_log` VALUES (24, '导入markdown', 6, 'com.ruoyi.project.emmanuel.mto.controller.MtoPostController.importData()', 'POST', 1, 'admin', '研发部门', '/mto/post/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"成功导入\",\"code\":0}', 0, NULL, '2022-03-01 14:19:56');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-12-05 14:48:02', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-12-05 14:48:02', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-12-05 14:48:02', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-12-05 14:48:02', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-12-05 14:48:02', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2021-12-05 14:48:02', 'admin', '2022-02-25 12:06:12', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
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
INSERT INTO `sys_role_menu` VALUES (2, 1070);
INSERT INTO `sys_role_menu` VALUES (2, 1071);
INSERT INTO `sys_role_menu` VALUES (2, 1072);
INSERT INTO `sys_role_menu` VALUES (2, 1073);
INSERT INTO `sys_role_menu` VALUES (2, 1074);
INSERT INTO `sys_role_menu` VALUES (2, 1075);
INSERT INTO `sys_role_menu` VALUES (2, 1078);
INSERT INTO `sys_role_menu` VALUES (2, 1079);
INSERT INTO `sys_role_menu` VALUES (2, 1080);
INSERT INTO `sys_role_menu` VALUES (2, 1081);
INSERT INTO `sys_role_menu` VALUES (2, 1082);
INSERT INTO `sys_role_menu` VALUES (2, 1083);
INSERT INTO `sys_role_menu` VALUES (2, 1084);
INSERT INTO `sys_role_menu` VALUES (2, 1085);
INSERT INTO `sys_role_menu` VALUES (2, 1086);
INSERT INTO `sys_role_menu` VALUES (2, 1087);
INSERT INTO `sys_role_menu` VALUES (2, 1088);
INSERT INTO `sys_role_menu` VALUES (2, 1089);
INSERT INTO `sys_role_menu` VALUES (2, 1090);
INSERT INTO `sys_role_menu` VALUES (2, 1091);
INSERT INTO `sys_role_menu` VALUES (2, 1092);
INSERT INTO `sys_role_menu` VALUES (2, 1093);
INSERT INTO `sys_role_menu` VALUES (2, 1094);
INSERT INTO `sys_role_menu` VALUES (2, 1095);
INSERT INTO `sys_role_menu` VALUES (2, 1096);
INSERT INTO `sys_role_menu` VALUES (2, 1097);
INSERT INTO `sys_role_menu` VALUES (2, 1098);
INSERT INTO `sys_role_menu` VALUES (2, 1099);
INSERT INTO `sys_role_menu` VALUES (2, 1100);
INSERT INTO `sys_role_menu` VALUES (2, 1101);
INSERT INTO `sys_role_menu` VALUES (2, 1102);
INSERT INTO `sys_role_menu` VALUES (2, 1103);
INSERT INTO `sys_role_menu` VALUES (2, 1105);
INSERT INTO `sys_role_menu` VALUES (2, 1106);
INSERT INTO `sys_role_menu` VALUES (2, 1107);
INSERT INTO `sys_role_menu` VALUES (2, 1108);
INSERT INTO `sys_role_menu` VALUES (2, 1109);
INSERT INTO `sys_role_menu` VALUES (2, 1110);
INSERT INTO `sys_role_menu` VALUES (2, 1111);
INSERT INTO `sys_role_menu` VALUES (2, 1112);
INSERT INTO `sys_role_menu` VALUES (2, 1113);
INSERT INTO `sys_role_menu` VALUES (2, 1114);
INSERT INTO `sys_role_menu` VALUES (2, 1115);
INSERT INTO `sys_role_menu` VALUES (2, 1116);
INSERT INTO `sys_role_menu` VALUES (2, 1117);
INSERT INTO `sys_role_menu` VALUES (2, 1118);
INSERT INTO `sys_role_menu` VALUES (2, 1119);
INSERT INTO `sys_role_menu` VALUES (2, 1120);
INSERT INTO `sys_role_menu` VALUES (2, 1121);
INSERT INTO `sys_role_menu` VALUES (2, 1122);
INSERT INTO `sys_role_menu` VALUES (2, 1123);
INSERT INTO `sys_role_menu` VALUES (2, 1124);
INSERT INTO `sys_role_menu` VALUES (2, 1125);
INSERT INTO `sys_role_menu` VALUES (2, 1126);
INSERT INTO `sys_role_menu` VALUES (2, 1127);
INSERT INTO `sys_role_menu` VALUES (2, 1128);
INSERT INTO `sys_role_menu` VALUES (2, 1129);
INSERT INTO `sys_role_menu` VALUES (2, 1130);
INSERT INTO `sys_role_menu` VALUES (2, 1131);
INSERT INTO `sys_role_menu` VALUES (2, 1132);
INSERT INTO `sys_role_menu` VALUES (2, 1133);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', '1228134035@qq.com', '15888888888', '1', 'https://unsplash.it/800/450?1005', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-03-01 14:30:03', '2021-12-05 14:48:02', 'admin', '2021-12-05 14:48:02', '', '2022-03-01 14:30:03', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', 'https://unsplash.it/800/450?1005', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-12-18 15:25:57', '2021-12-05 14:48:02', 'admin', '2021-12-05 14:48:02', '', '2021-12-18 15:25:56', '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'test', 'test', '01', '', '', '0', '', '3c4e0e328e1a9bfa05d79c393214264a', '637b16', '0', '0', '127.0.0.1', '2022-02-08 13:29:32', '2022-02-08 13:29:14', '', '2022-02-08 13:29:14', 'admin', '2022-02-25 12:05:52', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
