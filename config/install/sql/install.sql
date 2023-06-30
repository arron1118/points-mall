/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : points-mall-easyadmin

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 30/06/2023 17:35:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pm_company_signin_logs
-- ----------------------------
DROP TABLE IF EXISTS `pm_company_signin_logs`;
CREATE TABLE `pm_company_signin_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统信息',
  `platform_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统版本',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器信息',
  `browser_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备信息',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_signin_logs_user_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户登录记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_company_users
-- ----------------------------
DROP TABLE IF EXISTS `pm_company_users`;
CREATE TABLE `pm_company_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `corporation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '公司名称',
  `balance` decimal(10, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '余额',
  `integral` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Token',
  `token_expire_time` int(11) NULL DEFAULT NULL COMMENT 'Token过期时间',
  `login_num` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用, 1:启用)',
  `is_self_company` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否自营(0:否,1:是)',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `company_users_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '企业用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_brands
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_brands`;
CREATE TABLE `pm_mall_brands`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '品牌LOGO',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '品牌描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_cate`;
CREATE TABLE `pm_mall_cate`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_mall_cate
-- ----------------------------
INSERT INTO `pm_mall_cate` VALUES (9, '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', 0, 1, '', 1589440437, 1589440437, NULL);

-- ----------------------------
-- Table structure for pm_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods`;
CREATE TABLE `pm_mall_goods`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'UUID',
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID',
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `brand_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '品牌ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品logo',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品图片 以 | 做分割符号',
  `property` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品属性',
  `attribute_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '规格列表',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品详情',
  `market_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '市场价',
  `discount_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣价',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `sales` int(11) NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int(11) NULL DEFAULT 0 COMMENT '虚拟销量',
  `total_stock` int(11) NULL DEFAULT 0 COMMENT '总库存',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `is_integral_goods` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '积分商品(0:否,1:是)',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态(0:下架,1:上架)',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注说明',
  `evaluate_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价数量',
  `evaluate_rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '好评率',
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看数量',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_category_id`(`category_id`) USING BTREE,
  INDEX `mall_goods_brand_id`(`brand_id`) USING BTREE,
  INDEX `mall_goods_company_id`(`company_id`) USING BTREE,
  INDEX `mall_goods_title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_attribute_groups
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_attribute_groups`;
CREATE TABLE `pm_mall_goods_attribute_groups`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '属性组名称',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_attribute_groups_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品属性分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_category`;
CREATE TABLE `pm_mall_goods_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '父ID',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name`) USING BTREE,
  INDEX `mall_goods_category_name`(`category_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_mall_goods_category
-- ----------------------------
INSERT INTO `pm_mall_goods_category` VALUES (1, 0, '其他', 0, 1, '', 1688023469, 1688023469, NULL);

-- ----------------------------
-- Table structure for pm_mall_goods_company_attributes
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_company_attributes`;
CREATE TABLE `pm_mall_goods_company_attributes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID',
  `goods_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `sku_attribute_key_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性key编号',
  `sku_attribute_value_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性value编号',
  `sku_attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '属性value值',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_company_attributes_goods_id`(`goods_id`) USING BTREE,
  INDEX `goods_company_attributes_company_id`(`company_id`) USING BTREE,
  INDEX `goods_company_sku_attribute_key_id`(`sku_attribute_key_id`) USING BTREE,
  INDEX `goods_company_sku_attribute_value_id`(`sku_attribute_value_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商家商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_evaluate_messages
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_evaluate_messages`;
CREATE TABLE `pm_mall_goods_evaluate_messages`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `evaluate_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价ID',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '留言内容',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_evaluate_messages_user_id`(`user_id`) USING BTREE,
  INDEX `mall_goods_evaluate_messages_evaluate_id`(`evaluate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品评价留言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_evaluate_reply
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_evaluate_reply`;
CREATE TABLE `pm_mall_goods_evaluate_reply`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `evaluate_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价ID',
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内家',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_evaluate_reply_company_id`(`company_id`) USING BTREE,
  INDEX `mall_goods_evaluate_reply_evaluate_id`(`evaluate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商家回复评价信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_evaluates
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_evaluates`;
CREATE TABLE `pm_mall_goods_evaluates`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `goods_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '评级',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评价内容',
  `message_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '留言数量',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_evaluates_user_id`(`user_id`) USING BTREE,
  INDEX `mall_goods_evaluates_goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_history`;
CREATE TABLE `pm_mall_goods_history`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_specs_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'SKU ID',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统信息',
  `platform_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统版本',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器信息',
  `browser_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备信息',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_history_goods_id`(`goods_id`) USING BTREE,
  INDEX `mall_goods_history_goods_specs_id`(`goods_specs_id`) USING BTREE,
  INDEX `mall_goods_history_user_id`(`user_id`) USING BTREE,
  INDEX `mall_goods_history_company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品浏览记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_goods_sku_attribute_keys
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_sku_attribute_keys`;
CREATE TABLE `pm_mall_goods_sku_attribute_keys`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID',
  `sku_attribute_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '属性key值',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_sku_attribute_key_cid`(`category_id`) USING BTREE,
  INDEX `mall_goods_sku_attribute_key_name`(`sku_attribute_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品sku属性key表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_mall_goods_sku_attribute_keys
-- ----------------------------
INSERT INTO `pm_mall_goods_sku_attribute_keys` VALUES (1, 1, '姿色分类22', 0, '颜色分类', 1688023172, 1688027202, 1688027202);
INSERT INTO `pm_mall_goods_sku_attribute_keys` VALUES (2, 1, '颜色分类', 0, '', 1688023674, 1688027218, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_keys` VALUES (3, 1, '姿色分类2', 0, '', 1688023702, 1688027202, 1688027202);
INSERT INTO `pm_mall_goods_sku_attribute_keys` VALUES (4, 1, '姿色分类1', 0, '', 1688024254, 1688027202, 1688027202);
INSERT INTO `pm_mall_goods_sku_attribute_keys` VALUES (5, 1, '姿色分类11', 0, '', 1688024271, 1688027188, 1688027188);

-- ----------------------------
-- Table structure for pm_mall_goods_sku_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_sku_attribute_values`;
CREATE TABLE `pm_mall_goods_sku_attribute_values`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku_attribute_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品属性key外键',
  `sku_attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '属性value值',
  `sub_sku_attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '属性value附属值',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_sku_attribute_value_aid`(`sku_attribute_id`) USING BTREE,
  INDEX `mall_goods_sku_attribute_value_avalue`(`sku_attribute_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品sku属性value表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm_mall_goods_sku_attribute_values
-- ----------------------------
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (1, 2, '军绿色', 'rgb(93, 118, 42)', 0, '', 1688029167, 1688029167, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (2, 2, '天蓝色', 'rgb(68, 206, 246)', 0, '', 1688029275, 1688029275, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (3, 2, '巧克力色', 'rgb(210, 105, 30)', 0, '', 1688029289, 1688029289, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (4, 2, '桔色', 'rgb(255, 165, 0)', 0, '', 1688029303, 1688029303, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (5, 2, '浅灰色', 'rgb(228, 228, 228)', 0, '', 1688029334, 1688029334, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (6, 2, '浅绿色', 'rgb(152, 251, 152)', 0, '', 1688029352, 1688029352, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (7, 2, '浅黄色', 'rgb(250, 255, 114)', 0, '', 1688029366, 1688029366, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (8, 2, '深卡其布色', 'rgb(189, 183, 107)', 0, '', 1688029382, 1688029382, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (9, 2, '深灰色', 'rgb(102, 102, 102)', 0, '', 1688029394, 1688029394, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (10, 2, '深紫色', 'rgb(67, 6, 83)', 0, '', 1688029405, 1688029405, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (11, 2, '深蓝色', 'rgb(4, 22, 144)', 0, '', 1688029415, 1688029415, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (12, 2, '白色', 'rgb(255, 255, 255)', 0, '', 1688029428, 1688029428, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (13, 2, '粉红色', 'rgb(255, 182, 193)', 0, '', 1688029439, 1688029439, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (14, 2, '紫罗兰', 'rgb(183, 172, 228)', 0, '', 1688029451, 1688029451, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (15, 2, '紫色', 'rgb(128, 0, 128)', 0, '', 1688029463, 1688029463, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (16, 2, '红色', 'rgb(255, 0, 0)', 0, '', 1688029474, 1688029474, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (17, 2, '绿色', 'rgb(0, 128, 0)', 0, '', 1688029485, 1688029485, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (18, 2, '花色', 'rgb(255, 255, 255)', 0, '', 1688029500, 1688029500, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (19, 2, '蓝色', 'rgb(0, 0, 255)', 0, '', 1688029516, 1688029516, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (20, 2, '褐色', 'rgb(133, 91, 0)', 0, '', 1688029528, 1688029528, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (21, 2, '透明', '', 0, '', 1688029538, 1688029538, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (22, 2, '酒红色', 'rgb(153, 0, 0)', 0, '', 1688029551, 1688029551, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (23, 2, '黄色', 'rgb(255, 255, 0)', 0, '', 1688029561, 1688029561, NULL);
INSERT INTO `pm_mall_goods_sku_attribute_values` VALUES (24, 2, '黑色', 'rgb(0, 0, 0)', 0, '', 1688029570, 1688029570, NULL);

-- ----------------------------
-- Table structure for pm_mall_goods_specs
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_goods_specs`;
CREATE TABLE `pm_mall_goods_specs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `specs_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `sell_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '卖点',
  `specs_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '规格列表',
  `market_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `discount_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣价',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `sales` int(11) NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int(11) NULL DEFAULT 0 COMMENT '虚拟销量',
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品logo',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品图片 以 | 做分割符号',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(0:下架,1:上架)',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_goods_specs_goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品规格表（SKU表）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_lottery
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_lottery`;
CREATE TABLE `pm_mall_lottery`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标题',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '规则详情',
  `prize_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '奖品列表',
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_lottery_company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '幸运抽奖信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_lottery_prizes
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_lottery_prizes`;
CREATE TABLE `pm_mall_lottery_prizes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lottery_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '抽奖ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `integral_prize` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '积分奖励',
  `amount_prize` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额奖励',
  `goods_prize` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '商品奖励',
  `probability` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中奖概率',
  `quantity` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_lottery_prizes_lottery_id`(`lottery_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '幸运抽奖奖品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_order_items
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_order_items`;
CREATE TABLE `pm_mall_order_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `goods_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `goods_specs_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品规格(sku)ID',
  `specs_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_order_items_goods_id`(`goods_id`) USING BTREE,
  INDEX `mall_order_items_goods_specs_id`(`goods_specs_id`) USING BTREE,
  INDEX `mall_order_items_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_order_payment`;
CREATE TABLE `pm_mall_order_payment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_platform` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付平台(1:平台,2:微信,3:支付宝)',
  `platform_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '支付平台单号',
  `platform_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '支付平台状态',
  `pay_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_order_payment_user_id`(`user_id`) USING BTREE,
  INDEX `mall_order_payment_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单支付信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_mall_orders
-- ----------------------------
DROP TABLE IF EXISTS `pm_mall_orders`;
CREATE TABLE `pm_mall_orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `postage` decimal(4, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `address_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '收货地址ID',
  `pay_time` int(11) NULL DEFAULT NULL COMMENT '支付时间',
  `send_time` int(11) NULL DEFAULT NULL COMMENT '发货时间',
  `complete_time` int(11) NULL DEFAULT NULL COMMENT '完成时间',
  `close_time` int(11) NULL DEFAULT NULL COMMENT '关闭时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态(0:未付款,1:已付款,2:已发货,3:交易完成,4:交易关闭)',
  `evaluate_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评价状态(0:未评价,1:已评价)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_orders_user_id`(`user_id`) USING BTREE,
  INDEX `mall_orders_company_id`(`company_id`) USING BTREE,
  INDEX `mall_orders_order_no`(`order_no`) USING BTREE,
  INDEX `mall_orders_address_id`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_member_address
-- ----------------------------
DROP TABLE IF EXISTS `pm_member_address`;
CREATE TABLE `pm_member_address`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `receiver_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '省份',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '城市',
  `receiver_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '区/县',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认地址(0:否,1:是)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_address_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_member_integral_logs
-- ----------------------------
DROP TABLE IF EXISTS `pm_member_integral_logs`;
CREATE TABLE `pm_member_integral_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型(1:支出,2:收入)',
  `integral_amount` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分数量',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '记录说明',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_integral_logs_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_member_lottery_logs
-- ----------------------------
DROP TABLE IF EXISTS `pm_member_lottery_logs`;
CREATE TABLE `pm_member_lottery_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `lottery_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投资ID',
  `prize_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '奖品ID',
  `lottery_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '抽奖详情',
  `prize_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '抽奖奖品详情',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_lottery_logs_user_id`(`user_id`) USING BTREE,
  INDEX `member_lottery_logs_lottery_id`(`lottery_id`) USING BTREE,
  INDEX `member_lottery_logs_prize_id`(`prize_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_member_signin_logs
-- ----------------------------
DROP TABLE IF EXISTS `pm_member_signin_logs`;
CREATE TABLE `pm_member_signin_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统信息',
  `platform_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统版本',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器信息',
  `browser_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备信息',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_signin_logs_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户登录记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_member_users
-- ----------------------------
DROP TABLE IF EXISTS `pm_member_users`;
CREATE TABLE `pm_member_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `company_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '公司ID',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `balance` decimal(10, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '余额',
  `integral` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Token',
  `token_expire_time` int(11) NULL DEFAULT NULL COMMENT 'Token过期时间',
  `login_num` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用, 1:启用)',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `member_users_phone`(`phone`) USING BTREE,
  INDEX `member_users_company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pm_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_admin`;
CREATE TABLE `pm_system_admin`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_admin
-- ----------------------------
INSERT INTO `pm_system_admin` VALUES (1, NULL, '/static/admin/images/head.jpg', 'admin', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', NULL, '超级管理员', 24, 0, 1, 1687661447, 1688115911, NULL);
INSERT INTO `pm_system_admin` VALUES (2, '7', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', 'arron', '', '', '测试员账号', 0, 0, 1, 1687685108, 1687685108, NULL);

-- ----------------------------
-- Table structure for pm_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_auth`;
CREATE TABLE `pm_system_auth`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_auth
-- ----------------------------
INSERT INTO `pm_system_auth` VALUES (1, '管理员', 1, 1, '测试管理员', 1588921753, 1589614331, NULL);
INSERT INTO `pm_system_auth` VALUES (6, '游客权限', 0, 1, '', 1588227513, 1589591751, 1589591751);
INSERT INTO `pm_system_auth` VALUES (7, '测试员', 0, 1, '', 1687664954, 1687664954, NULL);

-- ----------------------------
-- Table structure for pm_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_auth_node`;
CREATE TABLE `pm_system_auth_node`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) NULL DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_auth_auth`(`auth_id`) USING BTREE,
  INDEX `index_system_auth_node`(`node_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与节点关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_auth_node
-- ----------------------------
INSERT INTO `pm_system_auth_node` VALUES (1, 6, 1);
INSERT INTO `pm_system_auth_node` VALUES (2, 6, 2);
INSERT INTO `pm_system_auth_node` VALUES (3, 6, 9);
INSERT INTO `pm_system_auth_node` VALUES (4, 6, 12);
INSERT INTO `pm_system_auth_node` VALUES (5, 6, 18);
INSERT INTO `pm_system_auth_node` VALUES (6, 6, 19);
INSERT INTO `pm_system_auth_node` VALUES (7, 6, 21);
INSERT INTO `pm_system_auth_node` VALUES (8, 6, 22);
INSERT INTO `pm_system_auth_node` VALUES (9, 6, 29);
INSERT INTO `pm_system_auth_node` VALUES (10, 6, 30);
INSERT INTO `pm_system_auth_node` VALUES (11, 6, 38);
INSERT INTO `pm_system_auth_node` VALUES (12, 6, 39);
INSERT INTO `pm_system_auth_node` VALUES (13, 6, 45);
INSERT INTO `pm_system_auth_node` VALUES (14, 6, 46);
INSERT INTO `pm_system_auth_node` VALUES (15, 6, 52);
INSERT INTO `pm_system_auth_node` VALUES (16, 6, 53);

-- ----------------------------
-- Table structure for pm_system_config
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_config`;
CREATE TABLE `pm_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变量值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_config
-- ----------------------------
INSERT INTO `pm_system_config` VALUES (41, 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (42, 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (55, 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (56, 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (57, 'upload_allow_size', 'upload', '1024000', '允许上传的大小', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (58, 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (59, 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (60, 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (61, 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (62, 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (63, 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (64, 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (65, 'logo_title', 'site', 'EasyAdmin', 'LOGO标题', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (66, 'logo_image', 'site', '/favicon.ico', 'logo图片', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (68, 'site_name', 'site', 'EasyAdmin后台系统', '站点名称', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (69, 'site_ico', 'site', '填你的', '浏览器图标', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (70, 'site_copyright', 'site', '填你的', '版权信息', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (71, 'site_beian', 'site', '填你的', '备案信息', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (72, 'site_version', 'site', '2.0.0', '版本信息', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (75, 'sms_type', 'sms', 'alisms', '短信类型', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (76, 'miniapp_appid', 'wechat', '填你的', '小程序公钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (77, 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (78, 'web_appid', 'wechat', '填你的', '公众号公钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (79, 'web_appsecret', 'wechat', '填你的', '公众号私钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (80, 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (81, 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (82, 'txcos_region', 'upload', '填你的', '存储桶地域', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (83, 'tecos_bucket', 'upload', '填你的', '存储桶名称', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (84, 'qnoss_access_key', 'upload', '填你的', '访问密钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (85, 'qnoss_secret_key', 'upload', '填你的', '安全密钥', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (86, 'qnoss_bucket', 'upload', '填你的', '存储空间', 0, NULL, NULL);
INSERT INTO `pm_system_config` VALUES (87, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, NULL, NULL);

-- ----------------------------
-- Table structure for pm_system_log_202306
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_log_202306`;
CREATE TABLE `pm_system_log_202306`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 827 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台操作日志表 - 202306' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_log_202306
-- ----------------------------
INSERT INTO `pm_system_log_202306` VALUES (630, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687664674);
INSERT INTO `pm_system_log_202306` VALUES (631, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"tccr\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687664713);
INSERT INTO `pm_system_log_202306` VALUES (632, 1, '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687664744);
INSERT INTO `pm_system_log_202306` VALUES (633, 1, '/admin/system.auth/add', 'post', '', '{\"\\/admin\\/system_auth\\/add\":\"\",\"title\":\"测试员\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687664954);
INSERT INTO `pm_system_log_202306` VALUES (634, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"xxbs\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687675717);
INSERT INTO `pm_system_log_202306` VALUES (635, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677301);
INSERT INTO `pm_system_log_202306` VALUES (636, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677304);
INSERT INTO `pm_system_log_202306` VALUES (637, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677316);
INSERT INTO `pm_system_log_202306` VALUES (638, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677322);
INSERT INTO `pm_system_log_202306` VALUES (639, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677329);
INSERT INTO `pm_system_log_202306` VALUES (640, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677429);
INSERT INTO `pm_system_log_202306` VALUES (641, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677432);
INSERT INTO `pm_system_log_202306` VALUES (642, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687677611);
INSERT INTO `pm_system_log_202306` VALUES (643, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687679445);
INSERT INTO `pm_system_log_202306` VALUES (644, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687679453);
INSERT INTO `pm_system_log_202306` VALUES (645, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687679478);
INSERT INTO `pm_system_log_202306` VALUES (646, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687679507);
INSERT INTO `pm_system_log_202306` VALUES (647, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687680971);
INSERT INTO `pm_system_log_202306` VALUES (648, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687680977);
INSERT INTO `pm_system_log_202306` VALUES (649, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687680983);
INSERT INTO `pm_system_log_202306` VALUES (650, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687680996);
INSERT INTO `pm_system_log_202306` VALUES (651, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"t3f2\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687681014);
INSERT INTO `pm_system_log_202306` VALUES (652, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"bvrh\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687681024);
INSERT INTO `pm_system_log_202306` VALUES (653, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687681114);
INSERT INTO `pm_system_log_202306` VALUES (654, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687681243);
INSERT INTO `pm_system_log_202306` VALUES (655, 1, '/admin/system.admin/password?id=1', 'post', '', '{\"\\/admin\\/system_admin\\/password\":\"\",\"id\":\"1\",\"username\":\"admin\",\"password\":\"***********\",\"password_again\":\"***********\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687681830);
INSERT INTO `pm_system_log_202306` VALUES (656, NULL, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"cdma\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687681848);
INSERT INTO `pm_system_log_202306` VALUES (657, 1, '/admin/system.admin/add', 'post', '', '{\"\\/admin\\/system_admin\\/add\":\"\",\"head_img\":\"https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"file\":\"\",\"username\":\"arron\",\"phone\":\"***********\",\"auth_ids\":{\"7\":\"on\"},\"remark\":\"测试员账号\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687685108);
INSERT INTO `pm_system_log_202306` VALUES (658, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"2pyr\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687744307);
INSERT INTO `pm_system_log_202306` VALUES (659, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"6eat\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687761822);
INSERT INTO `pm_system_log_202306` VALUES (660, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"cv6l\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687769111);
INSERT INTO `pm_system_log_202306` VALUES (661, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"jrk8\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687769118);
INSERT INTO `pm_system_log_202306` VALUES (662, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"ni7y\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687828515);
INSERT INTO `pm_system_log_202306` VALUES (663, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"r6ek\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687850958);
INSERT INTO `pm_system_log_202306` VALUES (664, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"xyqe\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687862202);
INSERT INTO `pm_system_log_202306` VALUES (665, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687862291);
INSERT INTO `pm_system_log_202306` VALUES (666, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687862807);
INSERT INTO `pm_system_log_202306` VALUES (667, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"hjss\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687914435);
INSERT INTO `pm_system_log_202306` VALUES (668, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687914644);
INSERT INTO `pm_system_log_202306` VALUES (669, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687914842);
INSERT INTO `pm_system_log_202306` VALUES (670, 1, '/admin/system.node/refreshNode?force=1', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687915136);
INSERT INTO `pm_system_log_202306` VALUES (671, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687915560);
INSERT INTO `pm_system_log_202306` VALUES (672, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687915910);
INSERT INTO `pm_system_log_202306` VALUES (673, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687916032);
INSERT INTO `pm_system_log_202306` VALUES (674, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687916180);
INSERT INTO `pm_system_log_202306` VALUES (675, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687916246);
INSERT INTO `pm_system_log_202306` VALUES (676, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687917085);
INSERT INTO `pm_system_log_202306` VALUES (677, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"\\/admin\\/system_node\\/refreshNode\":\"\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687917100);
INSERT INTO `pm_system_log_202306` VALUES (678, 1, '/admin/system.node/clearNode', 'post', '', '{\"\\/admin\\/system_node\\/clearNode\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687917817);
INSERT INTO `pm_system_log_202306` VALUES (679, 1, '/admin/system.menu/edit?id=250', 'post', '', '{\"\\/admin\\/system_menu\\/edit\":\"\",\"id\":\"250\",\"pid\":\"249\",\"title\":\"商品分类\",\"href\":\"mall.category\\/index\",\"icon\":\"fa fa-calendar-check-o\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687917856);
INSERT INTO `pm_system_log_202306` VALUES (680, 1, '/admin/system.menu/edit?id=250', 'post', '', '{\"\\/admin\\/system_menu\\/edit\":\"\",\"id\":\"250\",\"pid\":\"249\",\"title\":\"商品分类\",\"href\":\"mall.goods_category\\/index\",\"icon\":\"fa fa-calendar-check-o\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687917918);
INSERT INTO `pm_system_log_202306` VALUES (681, 1, '/admin/mall.goods_category/add', 'post', '', '{\"\\/admin\\/mall_goods_category\\/add\":\"\",\"pid\":\"0\",\"category_name\":\"手机\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687920484);
INSERT INTO `pm_system_log_202306` VALUES (682, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"wuke\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922286);
INSERT INTO `pm_system_log_202306` VALUES (683, 1, '/admin/mall.goods_category/add?id=1', 'post', '', '{\"\\/admin\\/mall_goods_category\\/add\":\"\",\"id\":\"1\",\"pid\":\"1\",\"category_name\":\"Apple\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922580);
INSERT INTO `pm_system_log_202306` VALUES (684, 1, '/admin/mall.goods_category/add?id=2', 'post', '', '{\"\\/admin\\/mall_goods_category\\/add\":\"\",\"id\":\"2\",\"pid\":\"2\",\"category_name\":\"Iphone 14pro\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922626);
INSERT INTO `pm_system_log_202306` VALUES (685, 1, '/admin/mall.goods_category/add?id=3', 'post', '', '{\"\\/admin\\/mall_goods_category\\/add\":\"\",\"id\":\"3\",\"pid\":\"3\",\"category_name\":\"256G\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922773);
INSERT INTO `pm_system_log_202306` VALUES (686, 1, '/admin/mall.goods_category/modify', 'post', '', '{\"\\/admin\\/mall_goods_category\\/modify\":\"\",\"id\":\"2\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922783);
INSERT INTO `pm_system_log_202306` VALUES (687, 1, '/admin/system.menu/modify', 'post', '', '{\"\\/admin\\/system_menu\\/modify\":\"\",\"id\":\"249\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922799);
INSERT INTO `pm_system_log_202306` VALUES (688, 1, '/admin/system.menu/modify', 'post', '', '{\"\\/admin\\/system_menu\\/modify\":\"\",\"id\":\"249\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687922803);
INSERT INTO `pm_system_log_202306` VALUES (689, 1, '/admin/mall.goods_category/modify', 'post', '', '{\"\\/admin\\/mall_goods_category\\/modify\":\"\",\"id\":\"2\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687923050);
INSERT INTO `pm_system_log_202306` VALUES (690, 1, '/admin/system.menu/add?id=251', 'post', '', '{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"251\",\"pid\":\"251\",\"title\":\"test\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687923474);
INSERT INTO `pm_system_log_202306` VALUES (691, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"tuce\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687932710);
INSERT INTO `pm_system_log_202306` VALUES (692, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"vyvx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1687940384);
INSERT INTO `pm_system_log_202306` VALUES (693, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"jklf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688001681);
INSERT INTO `pm_system_log_202306` VALUES (694, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"0\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\"]},\"attribute_list\":[{\"market_price\":\"20\"},{\"discount_price\":\"10\"},{\"integral\":\"100\"},{\"stock\":\"500\"}],\"total_stock\":\"1000\",\"integral\":\"203\",\"market_price\":\"156\",\"discount_price\":\"213\",\"virtual_sales\":\"810230\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688007855);
INSERT INTO `pm_system_log_202306` VALUES (695, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"0\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\",\"广东东莞\",\"2010-10\"]},\"attribute_list\":{\"market_price\":\"90\",\"discount_price\":\"100\",\"integral\":\"110\",\"stock\":\"120\"},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688008074);
INSERT INTO `pm_system_log_202306` VALUES (696, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"0\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\",\"2010-10\"]},\"attribute_list\":{\"color\":[\"军绿色\",\"天蓝色\",\"巧克力色\",\"桔色\",\"浅灰色\",\"浅绿色\",\"浅黄色\",\"深卡其布色\",\"深灰色\",\"深紫色\",\"深蓝色\",\"白色\",\"粉红色\",\"紫罗兰\",\"紫色\",\"红色\",\"绿色\",\"花色\",\"蓝色\",\"褐色\",\"透明\",\"酒红色\",\"黄色\",\"黑色\"]},\"specs_list\":{\"market_price\":[\"10\",\"50\",\"90\"],\"discount_price\":[\"20\",\"60\",\"100\"],\"integral\":[\"30\",\"70\",\"110\"],\"stock\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688008637);
INSERT INTO `pm_system_log_202306` VALUES (697, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"jvqa\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688009396);
INSERT INTO `pm_system_log_202306` VALUES (698, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"3\",\"title\":\"苹果大甩卖啦\",\"sub_title\":\"Iphone 14pro\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg|http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"苹果\",\"广东东莞\",\"2012-10\"]},\"attribute_list\":{\"color\":{\"1\":\"天蓝色\",\"11\":\"白色\",\"23\":\"黑色\"}},\"specs_list\":{\"market_price\":[\"10\",\"50\",\"90\"],\"discount_price\":[\"20\",\"60\",\"100\"],\"integral\":[\"30\",\"70\",\"110\"],\"stock\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688009702);
INSERT INTO `pm_system_log_202306` VALUES (699, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"0\",\"title\":\"苹果大甩卖啦\",\"sub_title\":\"Iphone 14pro\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"苹果\",\"广东东莞\",\"2012-10\"]},\"attribute_list\":{\"颜色分类\":{\"1\":\"天蓝色\",\"19\":\"褐色\",\"20\":\"透明\",\"23\":\"黑色\"}},\"specs_list\":{\"market_price\":[\"10\",\"50\",\"90\",\"130\"],\"discount_price\":[\"20\",\"60\",\"100\",\"140\"],\"integral\":[\"30\",\"70\",\"110\",\"150\"],\"stock\":[\"40\",\"80\",\"120\",\"160\"]},\"total_stock\":\"NaN\",\"integral\":\"170\",\"market_price\":\"180\",\"discount_price\":\"190\",\"virtual_sales\":\"200\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688009987);
INSERT INTO `pm_system_log_202306` VALUES (700, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"0\",\"title\":\"44444444\",\"sub_title\":\"\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"attribute_list\":{\"颜色分类\":{\"0\":\"军绿色\",\"10\":\"深蓝色\"}},\"specs_list\":{\"market_price\":[\"\",\"\"],\"discount_price\":[\"\",\"\"],\"integral\":[\"\",\"\"],\"stock\":[\"1\",\"5\"]},\"total_stock\":\"6\",\"integral\":\"\",\"market_price\":\"\",\"discount_price\":\"\",\"virtual_sales\":\"\",\"describe\":\"\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688010616);
INSERT INTO `pm_system_log_202306` VALUES (701, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"ae4n\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688018646);
INSERT INTO `pm_system_log_202306` VALUES (702, 1, '/admin/system.menu/delete?id=254', 'post', '', '{\"\\/admin\\/system_menu\\/delete\":\"\",\"id\":\"254\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688021541);
INSERT INTO `pm_system_log_202306` VALUES (703, 1, '/admin/system.menu/add?id=249', 'post', '', '{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"249\",\"pid\":\"249\",\"title\":\"销量发书属性\",\"href\":\"mall.goods_sku_attribute_keys\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688021629);
INSERT INTO `pm_system_log_202306` VALUES (704, 1, '/admin/system.menu/edit?id=255', 'post', '', '{\"\\/admin\\/system_menu\\/edit\":\"\",\"id\":\"255\",\"pid\":\"249\",\"title\":\"销售属性\",\"href\":\"mall.goods_sku_attribute_keys\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688021653);
INSERT INTO `pm_system_log_202306` VALUES (705, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"title\":\"颜色分类\",\"remark\":\"颜色分类\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023171);
INSERT INTO `pm_system_log_202306` VALUES (706, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023350);
INSERT INTO `pm_system_log_202306` VALUES (707, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023424);
INSERT INTO `pm_system_log_202306` VALUES (708, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023438);
INSERT INTO `pm_system_log_202306` VALUES (709, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023451);
INSERT INTO `pm_system_log_202306` VALUES (710, 1, '/admin/mall.goods_category/add', 'post', '', '{\"\\/admin\\/mall_goods_category\\/add\":\"\",\"pid\":\"0\",\"category_name\":\"其他\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023469);
INSERT INTO `pm_system_log_202306` VALUES (711, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023485);
INSERT INTO `pm_system_log_202306` VALUES (712, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023674);
INSERT INTO `pm_system_log_202306` VALUES (713, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023702);
INSERT INTO `pm_system_log_202306` VALUES (714, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688023950);
INSERT INTO `pm_system_log_202306` VALUES (715, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024196);
INSERT INTO `pm_system_log_202306` VALUES (716, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024199);
INSERT INTO `pm_system_log_202306` VALUES (717, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类1\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024203);
INSERT INTO `pm_system_log_202306` VALUES (718, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类1\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024254);
INSERT INTO `pm_system_log_202306` VALUES (719, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024260);
INSERT INTO `pm_system_log_202306` VALUES (720, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024264);
INSERT INTO `pm_system_log_202306` VALUES (721, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类1\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024268);
INSERT INTO `pm_system_log_202306` VALUES (722, 1, '/admin/mall.goods_sku_attribute_keys/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/add\":\"\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类11\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688024271);
INSERT INTO `pm_system_log_202306` VALUES (723, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688025818);
INSERT INTO `pm_system_log_202306` VALUES (724, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688025854);
INSERT INTO `pm_system_log_202306` VALUES (725, NULL, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026500);
INSERT INTO `pm_system_log_202306` VALUES (726, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"xhhc\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026541);
INSERT INTO `pm_system_log_202306` VALUES (727, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026554);
INSERT INTO `pm_system_log_202306` VALUES (728, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026559);
INSERT INTO `pm_system_log_202306` VALUES (729, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026879);
INSERT INTO `pm_system_log_202306` VALUES (730, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026891);
INSERT INTO `pm_system_log_202306` VALUES (731, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688026969);
INSERT INTO `pm_system_log_202306` VALUES (732, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027065);
INSERT INTO `pm_system_log_202306` VALUES (733, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027093);
INSERT INTO `pm_system_log_202306` VALUES (734, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027122);
INSERT INTO `pm_system_log_202306` VALUES (735, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=3', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"3\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类2\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027131);
INSERT INTO `pm_system_log_202306` VALUES (736, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=1', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"1\",\"category_id\":\"0\",\"sku_attribute_name\":\"姿色分类22\",\"remark\":\"颜色分类\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027172);
INSERT INTO `pm_system_log_202306` VALUES (737, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=1', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"1\",\"category_id\":\"1\",\"sku_attribute_name\":\"姿色分类22\",\"remark\":\"颜色分类\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027176);
INSERT INTO `pm_system_log_202306` VALUES (738, 1, '/admin/mall.goods_sku_attribute_keys/delete?id=5', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/delete\":\"\",\"id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027188);
INSERT INTO `pm_system_log_202306` VALUES (739, 1, '/admin/mall.goods_sku_attribute_keys/delete', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/delete\":\"\",\"id\":[\"4\",\"3\",\"1\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027201);
INSERT INTO `pm_system_log_202306` VALUES (740, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=2', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"2\",\"category_id\":\"1\",\"sku_attribute_name\":\"颜色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027218);
INSERT INTO `pm_system_log_202306` VALUES (741, 1, '/admin/system.menu/add?id=249', 'post', '', '{\"\\/admin\\/system_menu\\/add\":\"\",\"id\":\"249\",\"pid\":\"249\",\"title\":\"销售属性值\",\"href\":\"mall.goods_sku_attribute_values\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688027335);
INSERT INTO `pm_system_log_202306` VALUES (742, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"category_id\":\"2\",\"sku_attribute_value\":\"天蓝色\",\"remark\":\"天蓝色\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688028581);
INSERT INTO `pm_system_log_202306` VALUES (743, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"category_id\":\"2\",\"sku_attribute_value\":\"天蓝色\",\"remark\":\"天蓝色\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688028641);
INSERT INTO `pm_system_log_202306` VALUES (744, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"天蓝色\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688028683);
INSERT INTO `pm_system_log_202306` VALUES (745, 1, '/admin/mall.goods_sku_attribute_values/edit?id=1', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/edit\":\"\",\"id\":\"1\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"水蓝色\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688028779);
INSERT INTO `pm_system_log_202306` VALUES (746, 1, '/admin/mall.goods_sku_attribute_values/edit?id=1', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/edit\":\"\",\"id\":\"1\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"水蓝色\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688028806);
INSERT INTO `pm_system_log_202306` VALUES (747, 1, '/admin/mall.goods_sku_attribute_values/edit?id=1', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/edit\":\"\",\"id\":\"1\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"水蓝色\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688028875);
INSERT INTO `pm_system_log_202306` VALUES (748, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"军绿色\",\"sub_sku_attribute_value\":\"rgb(93, 118, 42)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029167);
INSERT INTO `pm_system_log_202306` VALUES (749, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"天蓝色\",\"sub_sku_attribute_value\":\"rgb(68, 206, 246)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029275);
INSERT INTO `pm_system_log_202306` VALUES (750, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"巧克力色\",\"sub_sku_attribute_value\":\"rgb(210, 105, 30)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029289);
INSERT INTO `pm_system_log_202306` VALUES (751, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"桔色\",\"sub_sku_attribute_value\":\"rgb(255, 165, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029303);
INSERT INTO `pm_system_log_202306` VALUES (752, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"浅灰色\",\"sub_sku_attribute_value\":\"rgb(228, 228, 228)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029334);
INSERT INTO `pm_system_log_202306` VALUES (753, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"浅绿色\",\"sub_sku_attribute_value\":\"rgb(152, 251, 152)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029352);
INSERT INTO `pm_system_log_202306` VALUES (754, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"浅黄色\",\"sub_sku_attribute_value\":\"rgb(250, 255, 114)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029366);
INSERT INTO `pm_system_log_202306` VALUES (755, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"深卡其布色\",\"sub_sku_attribute_value\":\"rgb(189, 183, 107)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029382);
INSERT INTO `pm_system_log_202306` VALUES (756, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"深灰色\",\"sub_sku_attribute_value\":\"rgb(102, 102, 102)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029394);
INSERT INTO `pm_system_log_202306` VALUES (757, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"深紫色\",\"sub_sku_attribute_value\":\"rgb(67, 6, 83)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029405);
INSERT INTO `pm_system_log_202306` VALUES (758, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"深蓝色\",\"sub_sku_attribute_value\":\"rgb(4, 22, 144)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029415);
INSERT INTO `pm_system_log_202306` VALUES (759, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"白色\",\"sub_sku_attribute_value\":\"rgb(255, 255, 255)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029428);
INSERT INTO `pm_system_log_202306` VALUES (760, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"粉红色\",\"sub_sku_attribute_value\":\"rgb(255, 182, 193)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029439);
INSERT INTO `pm_system_log_202306` VALUES (761, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"紫罗兰\",\"sub_sku_attribute_value\":\"rgb(183, 172, 228)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029451);
INSERT INTO `pm_system_log_202306` VALUES (762, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"紫色\",\"sub_sku_attribute_value\":\"rgb(128, 0, 128)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029462);
INSERT INTO `pm_system_log_202306` VALUES (763, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"红色\",\"sub_sku_attribute_value\":\"rgb(255, 0, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029474);
INSERT INTO `pm_system_log_202306` VALUES (764, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"绿色\",\"sub_sku_attribute_value\":\"rgb(0, 128, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029485);
INSERT INTO `pm_system_log_202306` VALUES (765, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"花色\",\"sub_sku_attribute_value\":\"rgb(255, 255, 255)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029500);
INSERT INTO `pm_system_log_202306` VALUES (766, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"蓝色\",\"sub_sku_attribute_value\":\"rgb(0, 0, 255)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029516);
INSERT INTO `pm_system_log_202306` VALUES (767, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"褐色\",\"sub_sku_attribute_value\":\"rgb(133, 91, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029528);
INSERT INTO `pm_system_log_202306` VALUES (768, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"透明\",\"sub_sku_attribute_value\":\"\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029538);
INSERT INTO `pm_system_log_202306` VALUES (769, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"酒红色\",\"sub_sku_attribute_value\":\"rgb(153, 0, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029551);
INSERT INTO `pm_system_log_202306` VALUES (770, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"黄色\",\"sub_sku_attribute_value\":\"rgb(255, 255, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029561);
INSERT INTO `pm_system_log_202306` VALUES (771, 1, '/admin/mall.goods_sku_attribute_values/add', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_values\\/add\":\"\",\"sku_attribute_id\":\"2\",\"sku_attribute_value\":\"黑色\",\"sub_sku_attribute_value\":\"rgb(0, 0, 0)\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688029570);
INSERT INTO `pm_system_log_202306` VALUES (772, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031666);
INSERT INTO `pm_system_log_202306` VALUES (773, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031673);
INSERT INTO `pm_system_log_202306` VALUES (774, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031677);
INSERT INTO `pm_system_log_202306` VALUES (775, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031732);
INSERT INTO `pm_system_log_202306` VALUES (776, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031940);
INSERT INTO `pm_system_log_202306` VALUES (777, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031943);
INSERT INTO `pm_system_log_202306` VALUES (778, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031968);
INSERT INTO `pm_system_log_202306` VALUES (779, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688031970);
INSERT INTO `pm_system_log_202306` VALUES (780, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688032088);
INSERT INTO `pm_system_log_202306` VALUES (781, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688032217);
INSERT INTO `pm_system_log_202306` VALUES (782, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688032305);
INSERT INTO `pm_system_log_202306` VALUES (783, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688032705);
INSERT INTO `pm_system_log_202306` VALUES (784, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"pjjj\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035081);
INSERT INTO `pm_system_log_202306` VALUES (785, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035106);
INSERT INTO `pm_system_log_202306` VALUES (786, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035187);
INSERT INTO `pm_system_log_202306` VALUES (787, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035524);
INSERT INTO `pm_system_log_202306` VALUES (788, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035678);
INSERT INTO `pm_system_log_202306` VALUES (789, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035830);
INSERT INTO `pm_system_log_202306` VALUES (790, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688035889);
INSERT INTO `pm_system_log_202306` VALUES (791, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688036245);
INSERT INTO `pm_system_log_202306` VALUES (792, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688036653);
INSERT INTO `pm_system_log_202306` VALUES (793, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688036720);
INSERT INTO `pm_system_log_202306` VALUES (794, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688036761);
INSERT INTO `pm_system_log_202306` VALUES (795, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688036855);
INSERT INTO `pm_system_log_202306` VALUES (796, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688037245);
INSERT INTO `pm_system_log_202306` VALUES (797, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"rxuz\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688088191);
INSERT INTO `pm_system_log_202306` VALUES (798, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688088302);
INSERT INTO `pm_system_log_202306` VALUES (799, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688088406);
INSERT INTO `pm_system_log_202306` VALUES (800, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"1\",\"title\":\"测试商品标题\",\"sub_title\":\"\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"attribute_list\":{\"颜色分类\":[\"浅绿色\",\"深蓝色\"]},\"specs_list\":{\"market_price\":[\"\",\"\"],\"discount_price\":[\"\",\"\"],\"integral\":[\"\",\"\"],\"stock\":[\"0\",\"0\"]},\"total_stock\":\"0\",\"integral\":\"\",\"market_price\":\"\",\"discount_price\":\"\",\"virtual_sales\":\"\",\"describe\":\"\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688088511);
INSERT INTO `pm_system_log_202306` VALUES (801, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"1\",\"title\":\"测试商品标题\",\"sub_title\":\"\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"attribute_list\":{\"颜色分类\":[\"浅绿色\",\"深蓝色\"]},\"specs_list\":{\"market_price\":[\"\",\"\"],\"discount_price\":[\"\",\"\"],\"integral\":[\"\",\"\"],\"stock\":[\"10\",\"20\"]},\"total_stock\":\"30\",\"integral\":\"\",\"market_price\":\"\",\"discount_price\":\"\",\"virtual_sales\":\"\",\"describe\":\"\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688088566);
INSERT INTO `pm_system_log_202306` VALUES (802, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688089069);
INSERT INTO `pm_system_log_202306` VALUES (803, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688092718);
INSERT INTO `pm_system_log_202306` VALUES (804, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"attribute_list\":{\"颜色分类\":[\"天蓝色色\",\"深紫色\",\"酒红色\"]},\"specs_list\":{\"market_price\":[\"10\",\"50\",\"90\"],\"discount_price\":[\"20\",\"60\",\"100\"],\"integral\":[\"30\",\"70\",\"110\"],\"stock\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688092853);
INSERT INTO `pm_system_log_202306` VALUES (805, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"0\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"attribute_list\":{\"颜色分类\":[\"天蓝色色呀\",\"深紫色\",\"酒红色\"]},\"specs_list\":{\"market_price\":[\"10\",\"50\",\"90\"],\"discount_price\":[\"20\",\"60\",\"100\"],\"integral\":[\"30\",\"70\",\"110\"],\"stock\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688092889);
INSERT INTO `pm_system_log_202306` VALUES (806, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688095370);
INSERT INTO `pm_system_log_202306` VALUES (807, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"xz7v\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688095915);
INSERT INTO `pm_system_log_202306` VALUES (808, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688095970);
INSERT INTO `pm_system_log_202306` VALUES (809, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688096010);
INSERT INTO `pm_system_log_202306` VALUES (810, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688096122);
INSERT INTO `pm_system_log_202306` VALUES (811, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"1\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"goods_attribute_list\":{\"2\":{\"value_id\":{\"0\":\"1\",\"12\":\"13\",\"16\":\"17\"},\"value_name\":[\"军绿色3\",\"天蓝色\",\"巧克力色\",\"桔色\",\"浅灰色\",\"浅绿色\",\"浅黄色\",\"深卡其布色\",\"深灰色\",\"深紫色\",\"深蓝色\",\"白色\",\"粉红色1\",\"紫罗兰\",\"紫色\",\"红色\",\"绿色2\",\"花色\",\"蓝色\",\"褐色\",\"透明\",\"酒红色\",\"黄色\",\"黑色\"]}},\"attribute_list\":{\"\\\"颜色分类\\\"\":[\"军绿色3\",\"绿色2\",\"粉红色1\"]},\"specs_list\":{\"market_price\":[\"10\",\"50\",\"90\"],\"discount_price\":[\"20\",\"60\",\"100\"],\"integral\":[\"30\",\"70\",\"110\"],\"stock\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688096243);
INSERT INTO `pm_system_log_202306` VALUES (812, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688097085);
INSERT INTO `pm_system_log_202306` VALUES (813, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688097282);
INSERT INTO `pm_system_log_202306` VALUES (814, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"1\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"goods_attribute_list\":{\"2\":{\"value_id\":{\"0\":\"1\",\"12\":\"13\",\"13\":\"14\"}},\"\\\"2\\\"\":{\"value_name\":\"紫罗兰\"}},\"attribute_list\":{\"\\\"颜色分类\\\"\":[\"军绿色333\",\"粉红色\",\"紫罗兰\"]},\"specs_list\":{\"market_prices\":[\"10\",\"50\",\"90\"],\"discount_prices\":[\"20\",\"60\",\"100\"],\"integrals\":[\"30\",\"70\",\"110\"],\"stocks\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688097356);
INSERT INTO `pm_system_log_202306` VALUES (815, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688097445);
INSERT INTO `pm_system_log_202306` VALUES (816, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"1\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":[\"品牌\",\"产地\",\"生产日期\"],\"value\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"goods_attribute_list\":{\"2\":{\"value_id\":{\"1\":\"2\",\"5\":\"6\",\"7\":\"8\"},\"value_name\":[\"浅绿色555\",\"天蓝色\",\"深卡其布色\"]}},\"attribute_list\":{\"\\\"颜色分类\\\"\":[\"浅绿色555\",\"天蓝色\",\"深卡其布色\"]},\"specs_list\":{\"market_prices\":[\"10\",\"50\",\"90\"],\"discount_prices\":[\"20\",\"60\",\"100\"],\"integrals\":[\"30\",\"70\",\"110\"],\"stocks\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688097532);
INSERT INTO `pm_system_log_202306` VALUES (817, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"1\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"key\":{\"0\":\"品牌\",\"2\":\"生产日期\"},\"value\":{\"0\":\"Apple\\/苹果\",\"2\":\"2023-06\"}},\"goods_attribute_list\":{\"2\":{\"value_id\":{\"1\":\"2\",\"5\":\"6\",\"7\":\"8\"},\"value_name\":[\"浅绿色555\",\"天蓝色\",\"深卡其布色\"]}},\"attribute_list\":{\"\\\"颜色分类\\\"\":[\"浅绿色555\",\"天蓝色\",\"深卡其布色\"]},\"specs_list\":{\"market_prices\":[\"10\",\"50\",\"90\"],\"discount_prices\":[\"20\",\"60\",\"100\"],\"integrals\":[\"30\",\"70\",\"110\"],\"stocks\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688097644);
INSERT INTO `pm_system_log_202306` VALUES (818, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688107204);
INSERT INTO `pm_system_log_202306` VALUES (819, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"cep7\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688107219);
INSERT INTO `pm_system_log_202306` VALUES (820, 1, '/admin/mall.goods_sku_attribute_keys/edit?id=2', 'post', '', '{\"\\/admin\\/mall_goods_sku_attribute_keys\\/edit\":\"\",\"id\":\"2\",\"category_id\":\"0\",\"sku_attribute_name\":\"颜色分类\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688107237);
INSERT INTO `pm_system_log_202306` VALUES (821, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688107316);
INSERT INTO `pm_system_log_202306` VALUES (822, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"1\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"keys\":[\"品牌\",\"产地\",\"生产日期\"],\"values\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"goods_attribute_list\":{\"2\":{\"value_id\":{\"5\":\"6\",\"6\":\"7\",\"18\":\"19\"},\"value_name\":[\"浅绿色A\",\"浅黄色\",\"蓝色\"]}},\"attribute_list\":{\"\\\"颜色分类\\\"\":[\"浅绿色A\",\"浅黄色\",\"蓝色\"]},\"specs_list\":{\"market_prices\":[\"10\",\"50\",\"90\"],\"discount_prices\":[\"20\",\"60\",\"100\"],\"integrals\":[\"30\",\"70\",\"110\"],\"stocks\":[\"40\",\"80\",\"120\"]},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;商品详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688107436);
INSERT INTO `pm_system_log_202306` VALUES (823, 1, '/admin/mall.goods/add', 'post', '', '{\"\\/admin\\/mall_goods\\/add\":\"\",\"is_integral_goods\":\"1\",\"category_id\":\"1\",\"title\":\"测试标题\",\"sub_title\":\"测试副标题\",\"logo\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg\",\"file\":\"\",\"images\":\"http:\\/\\/points-mall-easyadmin.local.com\\/upload\\/20230625\\/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg|https:\\/\\/easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com\\/upload\\/20191114\\/2381eaf81208ac188fa994b6f2579953.jpg\",\"property\":{\"keys\":[\"品牌\",\"产地\",\"生产日期\"],\"values\":[\"Apple\\/苹果\",\"广东东莞\",\"2023-06\"]},\"goods_attribute_list\":{\"2\":{\"value_id\":{\"5\":\"6\",\"18\":\"19\"},\"value_name\":{\"0\":\"浅绿色A\",\"2\":\"蓝色\"}}},\"attribute_list\":{\"\\\"颜色分类\\\"\":{\"0\":\"浅绿色A\",\"2\":\"蓝色\"}},\"specs_list\":{\"market_prices\":{\"0\":\"10\",\"2\":\"90\"},\"discount_prices\":{\"0\":\"20\",\"2\":\"100\"},\"integrals\":{\"0\":\"30\",\"2\":\"110\"},\"stocks\":{\"0\":\"40\",\"2\":\"120\"}},\"total_stock\":\"240\",\"integral\":\"130\",\"market_price\":\"140\",\"discount_price\":\"150\",\"virtual_sales\":\"160\",\"describe\":\"&lt;p&gt;商品详情&lt;\\/p&gt;\\n\",\"sort\":\"0\",\"remark\":\"备注信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688110609);
INSERT INTO `pm_system_log_202306` VALUES (824, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688113694);
INSERT INTO `pm_system_log_202306` VALUES (825, NULL, '/admin/login/index.html', 'post', '', '{\"\\/admin\\/login\\/index_html\":\"\",\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"wupg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688115911);
INSERT INTO `pm_system_log_202306` VALUES (826, 1, '/admin/mall.goods/getAttributes', 'post', '', '{\"\\/admin\\/mall_goods\\/getAttributes\":\"\",\"category_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1688117518);

-- ----------------------------
-- Table structure for pm_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_menu`;
CREATE TABLE `pm_system_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `href`(`href`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_menu
-- ----------------------------
INSERT INTO `pm_system_menu` VALUES (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '_self', 0, 1, NULL, NULL, 1573120497, NULL);
INSERT INTO `pm_system_menu` VALUES (228, 0, '系统管理', 'fa fa-cog', '', '', '_self', 0, 1, '', NULL, 1588999529, NULL);
INSERT INTO `pm_system_menu` VALUES (234, 228, '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', 10, 1, '', NULL, 1588228555, NULL);
INSERT INTO `pm_system_menu` VALUES (244, 228, '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', 12, 1, '', 1573185011, 1588228573, NULL);
INSERT INTO `pm_system_menu` VALUES (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', 11, 1, '', 1573435877, 1588228634, NULL);
INSERT INTO `pm_system_menu` VALUES (246, 228, '节点管理', 'fa fa-list', 'system.node/index', '', '_self', 9, 1, '', 1573435919, 1588228648, NULL);
INSERT INTO `pm_system_menu` VALUES (247, 228, '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', 8, 1, '', 1573457448, 1588228566, NULL);
INSERT INTO `pm_system_menu` VALUES (248, 228, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', 0, 1, '', 1573542953, 1588228043, NULL);
INSERT INTO `pm_system_menu` VALUES (249, 0, '商城管理', 'fa fa-list', '', '', '_self', 0, 1, '', 1589439884, 1687922803, NULL);
INSERT INTO `pm_system_menu` VALUES (250, 249, '商品分类', 'fa fa-calendar-check-o', 'mall.goods_category/index', '', '_self', 0, 1, '', 1589439910, 1687917918, NULL);
INSERT INTO `pm_system_menu` VALUES (251, 249, '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', 0, 1, '', 1589439931, 1589439942, NULL);
INSERT INTO `pm_system_menu` VALUES (252, 228, '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', 0, 1, '', 1589623683, 1589623683, NULL);
INSERT INTO `pm_system_menu` VALUES (253, 228, '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', 0, 1, '', 1589623684, 1589623684, NULL);
INSERT INTO `pm_system_menu` VALUES (254, 251, 'test', 'fa fa-list', '', '', '_self', 0, 1, '', 1687923474, 1688021541, 1688021541);
INSERT INTO `pm_system_menu` VALUES (255, 249, '销售属性', 'fa fa-list', 'mall.goods_sku_attribute_keys/index', '', '_self', 0, 1, '', 1688021629, 1688021653, NULL);
INSERT INTO `pm_system_menu` VALUES (256, 249, '销售属性值', 'fa fa-list', 'mall.goods_sku_attribute_values/index', '', '_self', 0, 1, '', 1688027335, 1688027335, NULL);

-- ----------------------------
-- Table structure for pm_system_node
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_node`;
CREATE TABLE `pm_system_node`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) NULL DEFAULT 3 COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_node
-- ----------------------------
INSERT INTO `pm_system_node` VALUES (1, 'system.admin', '管理员管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (2, 'system.admin/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (3, 'system.admin/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (4, 'system.admin/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (5, 'system.admin/password', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (6, 'system.admin/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (7, 'system.admin/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (8, 'system.admin/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (9, 'system.auth', '角色权限管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (10, 'system.auth/authorize', '授权', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (11, 'system.auth/saveAuthorize', '授权保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (12, 'system.auth/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (13, 'system.auth/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (14, 'system.auth/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (15, 'system.auth/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (16, 'system.auth/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (17, 'system.auth/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (18, 'system.config', '系统配置管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (19, 'system.config/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (20, 'system.config/save', '保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (21, 'system.menu', '菜单管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (22, 'system.menu/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (23, 'system.menu/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (24, 'system.menu/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (25, 'system.menu/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (26, 'system.menu/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (27, 'system.menu/getMenuTips', '添加菜单提示', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (28, 'system.menu/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (29, 'system.node', '系统节点管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (30, 'system.node/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (31, 'system.node/refreshNode', '系统节点更新', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (32, 'system.node/clearNode', '清除失效节点', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (33, 'system.node/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (34, 'system.node/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (35, 'system.node/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (36, 'system.node/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (37, 'system.node/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (38, 'system.uploadfile', '上传文件管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (39, 'system.uploadfile/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (40, 'system.uploadfile/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (41, 'system.uploadfile/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (42, 'system.uploadfile/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (43, 'system.uploadfile/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (44, 'system.uploadfile/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (52, 'mall.goods', '商城商品管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (53, 'mall.goods/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (54, 'mall.goods/stock', '入库', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (55, 'mall.goods/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (56, 'mall.goods/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (57, 'mall.goods/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (58, 'mall.goods/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (59, 'mall.goods/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `pm_system_node` VALUES (60, 'system.quick', '快捷入口管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (61, 'system.quick/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (62, 'system.quick/add', '添加', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (63, 'system.quick/edit', '编辑', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (64, 'system.quick/delete', '删除', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (65, 'system.quick/export', '导出', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (66, 'system.quick/modify', '属性修改', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (67, 'system.log', '操作日志管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (68, 'system.log/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `pm_system_node` VALUES (69, 'member.address', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (70, 'member.address/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (71, 'member.address/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (72, 'member.address/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (73, 'member.address/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (74, 'member.address/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (75, 'member.address/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (76, 'member.integral_logs', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (77, 'member.integral_logs/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (78, 'member.integral_logs/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (79, 'member.integral_logs/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (80, 'member.integral_logs/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (81, 'member.integral_logs/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (82, 'member.integral_logs/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (83, 'member.lottery_logs', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (84, 'member.lottery_logs/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (85, 'member.lottery_logs/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (86, 'member.lottery_logs/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (87, 'member.lottery_logs/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (88, 'member.lottery_logs/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (89, 'member.lottery_logs/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (90, 'member.signin_logs', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (91, 'member.signin_logs/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (92, 'member.signin_logs/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (93, 'member.signin_logs/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (94, 'member.signin_logs/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (95, 'member.signin_logs/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (96, 'member.signin_logs/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (97, 'member.users', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (98, 'member.users/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (99, 'member.users/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (100, 'member.users/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (101, 'member.users/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (102, 'member.users/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (103, 'member.users/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (104, 'mall.brands', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (105, 'mall.brands/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (106, 'mall.brands/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (107, 'mall.brands/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (108, 'mall.brands/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (109, 'mall.brands/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (110, 'mall.brands/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (111, 'mall.goods_attribute_groups', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (112, 'mall.goods_attribute_groups/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (113, 'mall.goods_attribute_groups/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (114, 'mall.goods_attribute_groups/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (115, 'mall.goods_attribute_groups/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (116, 'mall.goods_attribute_groups/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (117, 'mall.goods_attribute_groups/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (118, 'mall.goods_category', '商品分类管理', 1, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (119, 'mall.goods_category/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (120, 'mall.goods_category/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (121, 'mall.goods_category/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (122, 'mall.goods_category/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (123, 'mall.goods_category/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (124, 'mall.goods_category/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (125, 'mall.goods_evaluate_messages', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (126, 'mall.goods_evaluate_messages/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (127, 'mall.goods_evaluate_messages/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (128, 'mall.goods_evaluate_messages/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (129, 'mall.goods_evaluate_messages/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (130, 'mall.goods_evaluate_messages/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (131, 'mall.goods_evaluate_messages/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (132, 'mall.goods_evaluate_reply', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (133, 'mall.goods_evaluate_reply/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (134, 'mall.goods_evaluate_reply/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (135, 'mall.goods_evaluate_reply/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (136, 'mall.goods_evaluate_reply/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (137, 'mall.goods_evaluate_reply/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (138, 'mall.goods_evaluate_reply/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (139, 'mall.goods_evaluates', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (140, 'mall.goods_evaluates/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (141, 'mall.goods_evaluates/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (142, 'mall.goods_evaluates/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (143, 'mall.goods_evaluates/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (144, 'mall.goods_evaluates/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (145, 'mall.goods_evaluates/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (146, 'mall.goods_history', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (147, 'mall.goods_history/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (148, 'mall.goods_history/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (149, 'mall.goods_history/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (150, 'mall.goods_history/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (151, 'mall.goods_history/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (152, 'mall.goods_history/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (153, 'mall.goods_sku_attribute_keys', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (154, 'mall.goods_sku_attribute_keys/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (155, 'mall.goods_sku_attribute_keys/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (156, 'mall.goods_sku_attribute_keys/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (157, 'mall.goods_sku_attribute_keys/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (158, 'mall.goods_sku_attribute_keys/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (159, 'mall.goods_sku_attribute_keys/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (160, 'mall.goods_sku_attribute_values', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (161, 'mall.goods_sku_attribute_values/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (162, 'mall.goods_sku_attribute_values/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (163, 'mall.goods_sku_attribute_values/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (164, 'mall.goods_sku_attribute_values/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (165, 'mall.goods_sku_attribute_values/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (166, 'mall.goods_sku_attribute_values/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (167, 'mall.goods_specs', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (168, 'mall.goods_specs/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (169, 'mall.goods_specs/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (170, 'mall.goods_specs/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (171, 'mall.goods_specs/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (172, 'mall.goods_specs/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (173, 'mall.goods_specs/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (174, 'mall.lottery', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (175, 'mall.lottery/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (176, 'mall.lottery/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (177, 'mall.lottery/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (178, 'mall.lottery/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (179, 'mall.lottery/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (180, 'mall.lottery/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (181, 'mall.lottery_prizes', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (182, 'mall.lottery_prizes/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (183, 'mall.lottery_prizes/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (184, 'mall.lottery_prizes/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (185, 'mall.lottery_prizes/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (186, 'mall.lottery_prizes/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (187, 'mall.lottery_prizes/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (188, 'mall.order_items', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (189, 'mall.order_items/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (190, 'mall.order_items/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (191, 'mall.order_items/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (192, 'mall.order_items/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (193, 'mall.order_items/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (194, 'mall.order_items/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (195, 'mall.order_payment', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (196, 'mall.order_payment/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (197, 'mall.order_payment/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (198, 'mall.order_payment/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (199, 'mall.order_payment/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (200, 'mall.order_payment/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (201, 'mall.order_payment/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (202, 'mall.orders', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (203, 'mall.orders/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (204, 'mall.orders/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (205, 'mall.orders/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (206, 'mall.orders/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (207, 'mall.orders/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (208, 'mall.orders/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (209, 'company.signin_logs', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (210, 'company.signin_logs/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (211, 'company.signin_logs/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (212, 'company.signin_logs/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (213, 'company.signin_logs/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (214, 'company.signin_logs/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (215, 'company.signin_logs/modify', '属性修改', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (216, 'company.users', NULL, 1, 0, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (217, 'company.users/index', '列表', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (218, 'company.users/add', '添加', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (219, 'company.users/edit', '编辑', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (220, 'company.users/delete', '删除', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (221, 'company.users/export', '导出', 2, 1, 1687917101, 1687917101);
INSERT INTO `pm_system_node` VALUES (222, 'company.users/modify', '属性修改', 2, 1, 1687917101, 1687917101);

-- ----------------------------
-- Table structure for pm_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_quick`;
CREATE TABLE `pm_system_quick`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统快捷入口表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_quick
-- ----------------------------
INSERT INTO `pm_system_quick` VALUES (1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1589624097, 1589624792, NULL);
INSERT INTO `pm_system_quick` VALUES (2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1589624772, 1589624781, NULL);
INSERT INTO `pm_system_quick` VALUES (3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `pm_system_quick` VALUES (6, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `pm_system_quick` VALUES (7, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `pm_system_quick` VALUES (8, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `pm_system_quick` VALUES (10, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `pm_system_quick` VALUES (11, '商品管理', 'fa fa-list', 'mall.goods/index', 0, 1, NULL, 1589624772, 1589624781, NULL);

-- ----------------------------
-- Table structure for pm_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `pm_system_uploadfile`;
CREATE TABLE `pm_system_uploadfile`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `file_ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `upload_type`(`upload_type`) USING BTREE,
  INDEX `original_name`(`original_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 317 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传文件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_system_uploadfile
-- ----------------------------
INSERT INTO `pm_system_uploadfile` VALUES (286, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (287, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (288, 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', 0, 'image/x-icon', 0, 'ico', '', NULL, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (289, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (290, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (291, 'alioss', 'timg (1).jpg', 'http://easyadmin.oss-cn-shenzhen.aliyuncs.com/upload/20191113/ff793ced447febfa9ea2d86f9f88fa8e.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573612437, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (296, 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573712153, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (297, 'local', 'timg.jpg', 'http://admin.host/upload/20200423/5055a273cf8e3f393d699d622b74f247.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1587614155, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (298, 'local', 'timg.jpg', 'http://admin.host/upload/20200423/243f4e59f1b929951ef79c5f8be7468a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1587614269, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (299, 'local', 'head.jpg', 'http://admin.host/upload/20200512/a5ce9883379727324f5686ef61205ce2.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589255649, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (300, 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/577c65f101639f53dbbc9e7aa346f81c.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589427798, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (301, 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589427840, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (302, 'local', '18811e7611c8f292.jpg', 'http://admin.host/upload/20200514/e1c6c9ef6a4b98b8f7d95a1a0191a2df.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589438645, NULL, NULL, NULL);
INSERT INTO `pm_system_uploadfile` VALUES (316, 'local', 'O1CN01347T7J1C0kFZqNflC_!!6000000000019-0-tps-2880-1432.jpg', 'http://points-mall-easyadmin.local.com/upload/20230625/1ff1eb6a8e0258724b3db0e8dc1ca8d1.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1687664744, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
