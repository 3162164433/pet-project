/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : pet_4_24

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 09/07/2025 17:40:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adopt
-- ----------------------------
DROP TABLE IF EXISTS `adopt`;
CREATE TABLE `adopt`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `animal_id` int NULL DEFAULT NULL COMMENT '宠物ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '领养时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '领养状态',
  `review_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核意见',
  `reviewer_id` int NULL DEFAULT NULL COMMENT '审核人ID',
  `review_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '领养记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adopt
-- ----------------------------
INSERT INTO `adopt` VALUES (1, 1, 12, '2025-04-18 23:29:47', '领养中', NULL, NULL, NULL);
INSERT INTO `adopt` VALUES (2, 1, 11, '2025-05-05 11:53:41', '领养中', NULL, NULL, NULL);
INSERT INTO `adopt` VALUES (3, 1, 13, '2025-05-05 12:01:18', '领养中', 'ok', 5, '2025-05-05 12:03:32');
INSERT INTO `adopt` VALUES (4, 1, 10, '2025-05-05 12:20:27', '审核不通过', 'no', 5, '2025-05-05 12:23:01');
INSERT INTO `adopt` VALUES (5, 1, 9, '2025-05-05 12:22:28', '领养中', 'oK', 5, '2025-05-05 12:22:56');
INSERT INTO `adopt` VALUES (6, 1, 10, '2025-05-21 12:32:21', '领养中', 'OK', 5, '2025-05-21 12:32:37');

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物图片',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物名字',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物性别',
  `age` int NULL DEFAULT NULL COMMENT '宠物年龄',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物种类',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物状态',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物介绍',
  `breed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `registration_date` datetime NULL DEFAULT NULL,
  `behavior_traits` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sterilization_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `training_level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `special_needs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宠物信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES (6, '/img/1724511018499-屏幕截图 2024-08-24 225007.png', '花花', '公', 3, '鸟', '待领养', '一只色彩斑斓的鹦鹉，能说会道', '鹦鹉', '2024-09-13 00:00:00', '暂无11', '无需绝育', '白色', '一般', '暂111');
INSERT INTO `animal` VALUES (7, '/img/1724511038524-屏幕截图 2024-08-24 225032.png', '阿黄', '公', 6, '狗', '待领养', '一只忠诚的拉布拉多寻回犬，因特殊原因无法继续被领养', '拉布拉多寻回犬', '2024-09-26 15:44:21', '暂无', '已绝育', '白色', '一般', '暂无');
INSERT INTO `animal` VALUES (8, '/img/1724511069969-屏幕截图 2024-08-24 225058.png', '小灰', '母', 2, '鼠', '待领养', '一只聪明的仓鼠，小巧可爱', '仓鼠', '2024-07-18 15:44:27', '暂无', '已绝育', '白色', '一般', '暂无');
INSERT INTO `animal` VALUES (9, '/img/1724511095229-屏幕截图 2024-08-24 225127.png', '大白', '公', 7, '狗', '领养中', '一只威武的德国牧羊犬，需要有经验的主人', '德国牧羊犬', '2024-09-11 00:00:00', '暂无', '已绝育', '白色', '一般', '暂无');
INSERT INTO `animal` VALUES (10, '/img/1724511116287-屏幕截图 2024-08-24 225148.png', '咪咪', '母', 2, '猫', '领养中', '一只刚出生不久的小猫，需要特别的照顾', '缅因猫', '2024-09-04 00:00:00', '暂无', '已绝育', '白色', '一般', '暂无');
INSERT INTO `animal` VALUES (11, '/img/1724511715121-屏幕截图 2024-08-24 225356.png', '小白', '母', 1, '狗', '领养中', '一只可爱的白色比熊犬，需要一个温暖的家', '比熊', '2024-09-11 00:00:00', '暂无', '已绝育', '白色', '专业训练', '暂无');
INSERT INTO `animal` VALUES (12, '/img/1724511792787-屏幕截图 2024-08-24 230307.png', '喵喵', '公', 2, '英国短毛猫', '领养中', '一只温顺的英国短毛猫，期待您的关爱', '波斯猫', '2024-06-18 00:00:00', '暂无', '未绝育', '白色', '专业训练', '暂无');
INSERT INTO `animal` VALUES (13, '/img/1724512063239-屏幕截图 2024-08-24 230736.png', '旺财', '母', 1, '犬', '领养中', '一只活泼的金毛寻回犬，正在寻找新家', '斗牛犬', '2024-05-28 00:00:00', '暂无', '未绝育', '白色', '一般', '暂无');

-- ----------------------------
-- Table structure for breed
-- ----------------------------
DROP TABLE IF EXISTS `breed`;
CREATE TABLE `breed`  (
  `breed_id` int NOT NULL AUTO_INCREMENT,
  `breed_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`breed_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of breed
-- ----------------------------
INSERT INTO `breed` VALUES (1, '拉布拉多寻回犬');
INSERT INTO `breed` VALUES (2, '德国牧羊犬');
INSERT INTO `breed` VALUES (3, '斗牛犬');
INSERT INTO `breed` VALUES (4, '波斯猫');
INSERT INTO `breed` VALUES (5, '缅因猫');
INSERT INTO `breed` VALUES (9, '鹦鹉');
INSERT INTO `breed` VALUES (10, '仓鼠');
INSERT INTO `breed` VALUES (11, '短尾猫');
INSERT INTO `breed` VALUES (12, '比熊');

-- ----------------------------
-- Table structure for dict_item
-- ----------------------------
DROP TABLE IF EXISTS `dict_item`;
CREATE TABLE `dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典项的键',
  `item_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典项的值',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '字典项的描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_key`(`item_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_item
-- ----------------------------
INSERT INTO `dict_item` VALUES (1, 'user', 'el-icon-user', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (2, 'house', 'el-icon-house', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (3, 'menu', 'el-icon-menu', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (4, 's-custom', 'el-icon-s-custom', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (5, 's-grid', 'el-icon-s-grid', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (6, 'document', 'el-icon-document', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (7, 'coffee', 'el-icon-coffee', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (8, 's-marketing', 'el-icon-s-marketing', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (9, 'phone-outline', 'el-icon-phone-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (10, 'platform-eleme', 'el-icon-platform-eleme', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (11, 'eleme', 'el-icon-eleme', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (12, 'delete-solid', 'el-icon-delete-solid', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (13, 'delete', 'el-icon-delete', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (14, 's-tools', 'el-icon-s-tools', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (15, 'setting', 'el-icon-setting', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (16, 'user-solid', 'el-icon-user-solid', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (17, 'phone', 'el-icon-phone', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (18, 'more', 'el-icon-more', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (19, 'more-outline', 'el-icon-more-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (20, 'star-on', 'el-icon-star-on', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (21, 'star-off', 'el-icon-star-off', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (22, 's-goods', 'el-icon-s-goods', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (23, 'goods', 'el-icon-goods', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (24, 'warning', 'el-icon-warning', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (25, 'warning-outline', 'el-icon-warning-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (26, 'question', 'el-icon-question', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (27, 'info', 'el-icon-info', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (28, 'remove', 'el-icon-remove', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (29, 'circle-plus', 'el-icon-circle-plus', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (30, 'success', 'el-icon-success', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (31, 'error', 'el-icon-error', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (32, 'zoom-in', 'el-icon-zoom-in', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (33, 'zoom-out', 'el-icon-zoom-out', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (34, 'remove-outline', 'el-icon-remove-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (35, 'circle-plus-outline', 'el-icon-circle-plus-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (36, 'circle-check', 'el-icon-circle-check', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (37, 'circle-close', 'el-icon-circle-close', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (38, 's-help', 'el-icon-s-help', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (39, 'help', 'el-icon-help', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (40, 'minus', 'el-icon-minus', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (41, 'plus', 'el-icon-plus', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (42, 'check', 'el-icon-check', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (43, 'close', 'el-icon-close', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (44, 'picture', 'el-icon-picture', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (45, 'picture-outline', 'el-icon-picture-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (46, 'picture-outline-round', 'el-icon-picture-outline-round', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (47, 'upload', 'el-icon-upload', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (48, 'upload2', 'el-icon-upload2', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (49, 'download', 'el-icon-download', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (50, 'camera-solid', 'el-icon-camera-solid', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (51, 'camera', 'el-icon-camera', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (52, 'video-camera-solid', 'el-icon-video-camera-solid', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (53, 'video-camera', 'el-icon-video-camera', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (54, 'message-solid', 'el-icon-message-solid', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (55, 'bell', 'el-icon-bell', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (56, 's-cooperation', 'el-icon-s-cooperation', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (57, 's-order', 'el-icon-s-order', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (58, 's-platform', 'el-icon-s-platform', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (59, 's-fold', 'el-icon-s-fold', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (60, 's-unfold', 'el-icon-s-unfold', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (61, 's-operation', 'el-icon-s-operation', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (62, 's-promotion', 'el-icon-s-promotion', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (63, 's-home', 'el-icon-s-home', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (64, 's-release', 'el-icon-s-release', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (65, 's-ticket', 'el-icon-s-ticket', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (66, 's-management', 'el-icon-s-management', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (67, 's-open', 'el-icon-s-open', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (68, 's-shop', 'el-icon-s-shop', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (69, 's-flag', 'el-icon-s-flag', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (70, 's-comment', 'el-icon-s-comment', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (71, 's-finance', 'el-icon-s-finance', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (72, 's-claim', 'el-icon-s-claim', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (73, 's-opportunity', 'el-icon-s-opportunity', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (74, 's-data', 'el-icon-s-data', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (75, 's-check', 'el-icon-s-check', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (76, 'share', 'el-icon-share', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (77, 'd-caret', 'el-icon-d-caret', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (78, 'caret-left', 'el-icon-caret-left', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (79, 'caret-right', 'el-icon-caret-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (80, 'caret-bottom', 'el-icon-caret-bottom', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (81, 'caret-top', 'el-icon-caret-top', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (82, 'bottom-left', 'el-icon-bottom-left', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (83, 'bottom-right', 'el-icon-bottom-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (84, 'back', 'el-icon-back', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (85, 'right', 'el-icon-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (86, 'bottom', 'el-icon-bottom', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (87, 'top', 'el-icon-top', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (88, 'top-left', 'el-icon-top-left', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (89, 'top-right', 'el-icon-top-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (90, 'arrow-left', 'el-icon-arrow-left', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (91, 'arrow-right', 'el-icon-arrow-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (92, 'arrow-down', 'el-icon-arrow-down', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (93, 'arrow-up', 'el-icon-arrow-up', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (94, 'd-arrow-left', 'el-icon-d-arrow-left', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (95, 'd-arrow-right', 'el-icon-d-arrow-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (96, 'video-pause', 'el-icon-video-pause', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (97, 'video-play', 'el-icon-video-play', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (98, 'refresh', 'el-icon-refresh', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (99, 'refresh-right', 'el-icon-refresh-right', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (100, 'refresh-left', 'el-icon-refresh-left', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (101, 'finished', 'el-icon-finished', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (102, 'sort', 'el-icon-sort', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (103, 'sort-up', 'el-icon-sort-up', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (104, 'sort-down', 'el-icon-sort-down', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (105, 'rank', 'el-icon-rank', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (106, 'loading', 'el-icon-loading', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (107, 'view', 'el-icon-view', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (108, 'c-scale-to-original', 'el-icon-c-scale-to-original', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (109, 'date', 'el-icon-date', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (110, 'edit', 'el-icon-edit', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (111, 'edit-outline', 'el-icon-edit-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (112, 'folder', 'el-icon-folder', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (113, 'folder-opened', 'el-icon-folder-opened', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (114, 'folder-add', 'el-icon-folder-add', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (115, 'folder-remove', 'el-icon-folder-remove', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (116, 'folder-delete', 'el-icon-folder-delete', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (117, 'folder-checked', 'el-icon-folder-checked', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (118, 'tickets', 'el-icon-tickets', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (119, 'document-remove', 'el-icon-document-remove', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (120, 'document-delete', 'el-icon-document-delete', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (121, 'document-copy', 'el-icon-document-copy', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (122, 'document-checked', 'el-icon-document-checked', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (123, 'document-add', 'el-icon-document-add', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (124, 'printer', 'el-icon-printer', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (125, 'paperclip', 'el-icon-paperclip', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (126, 'takeaway-box', 'el-icon-takeaway-box', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (127, 'search', 'el-icon-search', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (128, 'monitor', 'el-icon-monitor', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (129, 'attract', 'el-icon-attract', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (130, 'mobile', 'el-icon-mobile', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (131, 'scissors', 'el-icon-scissors', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (132, 'umbrella', 'el-icon-umbrella', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (133, 'headset', 'el-icon-headset', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (134, 'brush', 'el-icon-brush', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (135, 'mouse', 'el-icon-mouse', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (136, 'coordinate', 'el-icon-coordinate', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (137, 'magic-stick', 'el-icon-magic-stick', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (138, 'reading', 'el-icon-reading', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (139, 'data-line', 'el-icon-data-line', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (140, 'data-board', 'el-icon-data-board', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (141, 'pie-chart', 'el-icon-pie-chart', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (142, 'data-analysis', 'el-icon-data-analysis', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (143, 'collection-tag', 'el-icon-collection-tag', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (144, 'film', 'el-icon-film', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (145, 'suitcase', 'el-icon-suitcase', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (146, 'suitcase-1', 'el-icon-suitcase-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (147, 'receiving', 'el-icon-receiving', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (148, 'collection', 'el-icon-collection', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (149, 'files', 'el-icon-files', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (150, 'notebook-1', 'el-icon-notebook-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (151, 'notebook-2', 'el-icon-notebook-2', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (152, 'toilet-paper', 'el-icon-toilet-paper', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (153, 'office-building', 'el-icon-office-building', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (154, 'school', 'el-icon-school', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (155, 'table-lamp', 'el-icon-table-lamp', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (156, 'no-smoking', 'el-icon-no-smoking', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (157, 'smoking', 'el-icon-smoking', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (158, 'shopping-cart-full', 'el-icon-shopping-cart-full', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (159, 'shopping-cart-1', 'el-icon-shopping-cart-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (160, 'shopping-cart-2', 'el-icon-shopping-cart-2', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (161, 'shopping-bag-1', 'el-icon-shopping-bag-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (162, 'shopping-bag-2', 'el-icon-shopping-bag-2', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (163, 'sold-out', 'el-icon-sold-out', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (164, 'sell', 'el-icon-sell', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (165, 'present', 'el-icon-present', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (166, 'box', 'el-icon-box', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (167, 'bank-card', 'el-icon-bank-card', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (168, 'money', 'el-icon-money', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (169, 'coin', 'el-icon-coin', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (170, 'wallet', 'el-icon-wallet', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (171, 'discount', 'el-icon-discount', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (172, 'price-tag', 'el-icon-price-tag', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (173, 'news', 'el-icon-news', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (174, 'guide', 'el-icon-guide', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (175, 'male', 'el-icon-male', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (176, 'female', 'el-icon-female', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (177, 'thumb', 'el-icon-thumb', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (178, 'cpu', 'el-icon-cpu', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (179, 'link', 'el-icon-link', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (180, 'connection', 'el-icon-connection', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (181, 'open', 'el-icon-open', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (182, 'turn-off', 'el-icon-turn-off', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (183, 'set-up', 'el-icon-set-up', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (184, 'chat-round', 'el-icon-chat-round', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (185, 'chat-line-round', 'el-icon-chat-line-round', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (186, 'chat-square', 'el-icon-chat-square', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (187, 'chat-dot-round', 'el-icon-chat-dot-round', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (188, 'chat-dot-square', 'el-icon-chat-dot-square', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (189, 'chat-line-square', 'el-icon-chat-line-square', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (190, 'message', 'el-icon-message', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (191, 'postcard', 'el-icon-postcard', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (192, 'position', 'el-icon-position', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (193, 'turn-off-microphone', 'el-icon-turn-off-microphone', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (194, 'microphone', 'el-icon-microphone', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (195, 'close-notification', 'el-icon-close-notification', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (196, 'bangzhu', 'el-icon-bangzhu', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (197, 'time', 'el-icon-time', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (198, 'odometer', 'el-icon-odometer', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (199, 'crop', 'el-icon-crop', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (200, 'aim', 'el-icon-aim', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (201, 'switch-button', 'el-icon-switch-button', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (202, 'full-screen', 'el-icon-full-screen', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (203, 'copy-document', 'el-icon-copy-document', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (204, 'mic', 'el-icon-mic', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (205, 'stopwatch', 'el-icon-stopwatch', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (206, 'medal-1', 'el-icon-medal-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (207, 'medal', 'el-icon-medal', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (208, 'trophy', 'el-icon-trophy', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (209, 'trophy-1', 'el-icon-trophy-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (210, 'first-aid-kit', 'el-icon-first-aid-kit', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (211, 'discover', 'el-icon-discover', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (212, 'place', 'el-icon-place', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (213, 'location', 'el-icon-location', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (214, 'location-outline', 'el-icon-location-outline', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (215, 'location-information', 'el-icon-location-information', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (216, 'add-location', 'el-icon-add-location', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (217, 'delete-location', 'el-icon-delete-location', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (218, 'map-location', 'el-icon-map-location', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (219, 'alarm-clock', 'el-icon-alarm-clock', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (220, 'timer', 'el-icon-timer', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (221, 'watch-1', 'el-icon-watch-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (222, 'watch', 'el-icon-watch', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (223, 'lock', 'el-icon-lock', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (224, 'unlock', 'el-icon-unlock', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (225, 'key', 'el-icon-key', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (226, 'service', 'el-icon-service', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (227, 'mobile-phone', 'el-icon-mobile-phone', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (228, 'bicycle', 'el-icon-bicycle', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (229, 'truck', 'el-icon-truck', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (230, 'ship', 'el-icon-ship', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (231, 'basketball', 'el-icon-basketball', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (232, 'football', 'el-icon-football', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (233, 'soccer', 'el-icon-soccer', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (234, 'baseball', 'el-icon-baseball', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (235, 'wind-power', 'el-icon-wind-power', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (236, 'light-rain', 'el-icon-light-rain', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (237, 'lightning', 'el-icon-lightning', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (238, 'heavy-rain', 'el-icon-heavy-rain', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (239, 'sunrise', 'el-icon-sunrise', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (240, 'sunrise-1', 'el-icon-sunrise-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (241, 'sunset', 'el-icon-sunset', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (242, 'sunny', 'el-icon-sunny', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (243, 'cloudy', 'el-icon-cloudy', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (244, 'partly-cloudy', 'el-icon-partly-cloudy', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (246, 'moon', 'el-icon-moon', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (247, 'moon-night', 'el-icon-moon-night', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (248, 'dish', 'el-icon-dish', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (249, 'dish-1', 'el-icon-dish-1', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (250, 'food', 'el-icon-food', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (251, 'chicken', 'el-icon-chicken', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (252, 'fork-spoon', 'el-icon-fork-spoon', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (253, 'knife-fork', 'el-icon-knife-fork', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (254, 'burger', 'el-icon-burger', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (255, 'tableware', 'el-icon-tableware', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (256, 'sugar', 'el-icon-sugar', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (257, 'dessert', 'el-icon-dessert', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (258, 'ice-cream', 'el-icon-ice-cream', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (259, 'hot-water', 'el-icon-hot-water', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (260, 'water-cup', 'el-icon-water-cup', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (261, 'coffee-cup', 'el-icon-coffee-cup', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (262, 'cold-drink', 'el-icon-cold-drink', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (263, 'goblet', 'el-icon-goblet', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (264, 'goblet-full', 'el-icon-goblet-full', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (265, 'goblet-square', 'el-icon-goblet-square', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (266, 'goblet-square-full', 'el-icon-goblet-square-full', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (267, 'refrigerator', 'el-icon-refrigerator', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (268, 'grape', 'el-icon-grape', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (269, 'watermelon', 'el-icon-watermelon', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (270, 'cherry', 'el-icon-cherry', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (271, 'apple', 'el-icon-apple', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (272, 'pear', 'el-icon-pear', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (273, 'orange', 'el-icon-orange', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (274, 'ice-tea', 'el-icon-ice-tea', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (275, 'ice-drink', 'el-icon-ice-drink', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (276, 'milk-tea', 'el-icon-milk-tea', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (277, 'potato-strips', 'el-icon-potato-strips', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (278, 'lollipop', 'el-icon-lollipop', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (279, 'ice-cream-square', 'el-icon-ice-cream-square', NULL, '2024-07-30 23:06:45', '2024-07-30 23:06:45');
INSERT INTO `dict_item` VALUES (280, '1', '1', '1', '2024-07-30 23:06:45', '2024-07-30 23:06:45');

-- ----------------------------
-- Table structure for foster
-- ----------------------------
DROP TABLE IF EXISTS `foster`;
CREATE TABLE `foster`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物昵称',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '寄养时间',
  `days` int NULL DEFAULT NULL COMMENT '寄养天数',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '寄养状态',
  `room_id` int NULL DEFAULT NULL COMMENT '房间ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1296592899 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '寄养信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of foster
-- ----------------------------
INSERT INTO `foster` VALUES (1, 1, '小白', '2024-09-01 10:00:00', 7, '寄养中', -1547083775);
INSERT INTO `foster` VALUES (2, 2, '小黑', '2024-09-02 11:00:00', 5, '已领回', -615948286);
INSERT INTO `foster` VALUES (4, 3, '大黄', '2024-09-04 13:00:00', 3, '已领回', 4);
INSERT INTO `foster` VALUES (5, 20, '阿福', '2024-09-05 14:00:00', 8, '已领回', 84500481);
INSERT INTO `foster` VALUES (6, 21, '阿财', '2024-09-06 15:00:00', 6, '已领回', 6);
INSERT INTO `foster` VALUES (7, 23, '11', '2024-08-07', 11, '寄养中', -469139454);
INSERT INTO `foster` VALUES (8, 1, '小红', '2024-08-13', 123, '寄养中', 1867079681);
INSERT INTO `foster` VALUES (9, 2, '小红', '2024-08-05', 12, '寄养中', 1867079681);
INSERT INTO `foster` VALUES (10, 3, '阿旺', '2024-09-13', 12, '待处理', NULL);
INSERT INTO `foster` VALUES (1296592898, 1, '阿财', '2024-09-08', 12, '已领回', 5);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用品名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `desrc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品描述',
  `num` int NULL DEFAULT 0 COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1833476098 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宠物用品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '猫粮', '/img/1725250654656-ebe20d5e-a284-4c5c-be84-00566cf0803a.png', 16.02, '猫猫爱吃1', 23);
INSERT INTO `goods` VALUES (2, '狗粮', '/img/1724850319112-屏幕截图 2024-08-28 210021.png', 25.60, '狗狗爱吃', 18);

-- ----------------------------
-- Table structure for health_record
-- ----------------------------
DROP TABLE IF EXISTS `health_record`;
CREATE TABLE `health_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `record_date` date NOT NULL,
  `temperature` decimal(5, 2) NOT NULL,
  `weight` decimal(10, 2) NOT NULL,
  `height` decimal(10, 2) NOT NULL,
  `vaccination_date` date NULL DEFAULT NULL,
  `health_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_record
-- ----------------------------
INSERT INTO `health_record` VALUES (6, 6, '2022-01-25', 39.80, 20.00, 70.00, '2022-01-05', '健康', '2024-09-06 23:02:28', '2024-09-06 23:02:28');
INSERT INTO `health_record` VALUES (7, 7, '2022-02-01', 38.50, 13.00, 58.00, '2022-01-10', '健康', '2024-09-06 23:02:28', '2024-09-06 23:02:28');
INSERT INTO `health_record` VALUES (8, 8, '2022-02-05', 39.20, 16.00, 62.00, '2022-01-15', '健康', '2024-09-06 23:02:28', '2024-09-06 23:02:28');
INSERT INTO `health_record` VALUES (9, 9, '2022-02-10', 38.80, 14.00, 56.00, '2022-01-20', '健康', '2024-09-06 23:02:28', '2024-09-06 23:02:28');
INSERT INTO `health_record` VALUES (10, 10, '2022-02-15', 39.50, 19.00, 68.00, '2022-01-25', '健康', '2024-09-06 23:02:28', '2024-09-06 23:02:28');
INSERT INTO `health_record` VALUES (11, 7, '2024-09-09', 12.00, 11.00, 168.00, '2024-09-10', '健康', '2024-09-06 23:28:12', '2025-05-21 13:30:21');

-- ----------------------------
-- Table structure for home_slider
-- ----------------------------
DROP TABLE IF EXISTS `home_slider`;
CREATE TABLE `home_slider`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '轮播图的唯一标识符，自动递增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '轮播图的名称或标题',
  `desrc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '对轮播图内容的简短描述',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '轮播图的图片链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2106064899 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页轮播图数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_slider
-- ----------------------------
INSERT INTO `home_slider` VALUES (-1937240062, '豹纹守宫', '外形十分可爱，又容易饲养与繁殖', 'homeSlider/1725793758703-e5b1dfb6-c74f-4c64-a0ae-672fbd005144.jpeg');
INSERT INTO `home_slider` VALUES (-884469758, '波曼猫', '有“四蹄踏雪”之称', 'homeSlider/1725794369269-465daf2f-fbba-4578-9a02-083696ee8072.jpeg');
INSERT INTO `home_slider` VALUES (92803073, '波斯猫', '“猫中王子”“猫中王妃”', 'homeSlider/1725793987543-f7466e40-d511-432d-89d7-50cfe7dbdd8d.jpeg');
INSERT INTO `home_slider` VALUES (923275266, '拉布拉多', 'TA们是我们的伙伴，一旦选择，终身负责', 'homeSlider/1725793872026-cb54b3e8-8848-453c-9f23-02a05ef4c0fc.jpeg');

-- ----------------------------
-- Table structure for medical_service_types
-- ----------------------------
DROP TABLE IF EXISTS `medical_service_types`;
CREATE TABLE `medical_service_types`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '服务类型的唯一标识符，自动递增',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医疗服务的类型名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '对医疗服务类型的详细描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医疗服务类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medical_service_types
-- ----------------------------
INSERT INTO `medical_service_types` VALUES (1, '常规检查', '对宠物进行的常规健康检查，包括听诊、触诊和基本的健康状况评估');
INSERT INTO `medical_service_types` VALUES (2, '疫苗接种', '为宠物接种疫苗，以预防各种传染病');
INSERT INTO `medical_service_types` VALUES (3, '牙齿清洁', '专业的牙齿清洁服务，以维护宠物的口腔健康');
INSERT INTO `medical_service_types` VALUES (4, '手术', '为宠物提供各种类型的手术服务，如绝育手术、肿瘤切除等');
INSERT INTO `medical_service_types` VALUES (5, '急诊治疗', '对宠物的紧急医疗状况进行快速诊断和治疗');
INSERT INTO `medical_service_types` VALUES (6, '物理治疗', '为受伤或术后恢复的宠物提供物理治疗服务');
INSERT INTO `medical_service_types` VALUES (7, '慢性病管理', '为患有慢性疾病的宠物提供长期管理和治疗');
INSERT INTO `medical_service_types` VALUES (8, '营养咨询', '提供宠物营养和饮食建议，以改善或维持宠物的健康');
INSERT INTO `medical_service_types` VALUES (9, '行为咨询', '为宠物主人提供宠物行为问题的咨询服务和解决方案');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '宠物之家开业大酬宾', '欢迎来到宠物之家！我们新店开业，所有宠物食品和用品一律8折优惠，活动时间：2024-09-01至2024-09-30。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (2, '宠物健康讲座', '本周六下午2点，我们将举办宠物健康讲座，邀请资深兽医讲解宠物常见疾病预防和日常护理。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (3, '宠物领养活动', '本周日，我们将举办宠物领养活动，有多种可爱的狗狗和猫咪等待新家，欢迎有爱心的您来领养。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (4, '宠物美容服务', '宠物之家提供专业的宠物美容服务，包括洗澡、剪毛、美甲等，让您的宠物焕然一新。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (5, '宠物训练课程', '我们提供专业的宠物训练课程，帮助您的宠物学习基本的服从命令和行为规范。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (6, '宠物摄影大赛', '宠物之家摄影大赛开始啦！快来分享您宠物的可爱瞬间，赢取丰厚奖品。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (7, '宠物用品特卖', '本周宠物之家将举行宠物用品特卖会，各种宠物玩具、床铺、食具等应有尽有，价格优惠。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (8, '宠物健康检查', '为了宠物的健康，我们提供免费的健康检查服务，包括体重、体温、皮肤检查等。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (9, '宠物之家会员卡', '成为宠物之家会员，享受更多优惠和服务，包括会员日折扣、生日礼物等。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (10, '宠物之家社区活动', '宠物之家将定期举办社区活动，增进宠物主人之间的交流，分享养宠经验。', '2024-09-01 23:21:38');
INSERT INTO `notice` VALUES (12, '111', '11', '2025-06-11 22:31:19');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `goods_id` int NOT NULL COMMENT '商品ID',
  `num` int NOT NULL COMMENT '商品数量',
  `user_id` int NOT NULL COMMENT '用户ID',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'pending' COMMENT '订单状态',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_goods_id`(`goods_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (7, '1745475130012', 1, 2, 1, 'Completed', '2025-04-24 14:12:10');
INSERT INTO `orders` VALUES (8, '1746416888472', 1, 3, 1, 'Completed', '2025-05-05 11:48:08');
INSERT INTO `orders` VALUES (9, '1746417203204', 1, 2, 1, 'W_Pay', '2025-05-05 11:53:23');
INSERT INTO `orders` VALUES (10, '1746418732553', 1, 4, 1, 'Completed', '2025-05-05 12:18:52');
INSERT INTO `orders` VALUES (11, '1746419017632', 1, 2, 1, 'Completed', '2025-05-05 12:23:37');

-- ----------------------------
-- Table structure for pet_ai_chat
-- ----------------------------
DROP TABLE IF EXISTS `pet_ai_chat`;
CREATE TABLE `pet_ai_chat`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `pet_id` int NOT NULL COMMENT '宠物ID',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户发送的消息',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AI回复的消息',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_pet_id`(`pet_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宠物AI对话记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_ai_chat
-- ----------------------------
INSERT INTO `pet_ai_chat` VALUES (1, 21, 7, '你好', '{\"error_code\":23,\"error_msg\":\"IAM API-KEY authentication failed\"}', '2025-02-14 00:56:23');
INSERT INTO `pet_ai_chat` VALUES (2, 21, 7, '你好', '{\"error_code\":23,\"error_msg\":\"IAM API-KEY authentication failed\"}', '2025-02-14 00:57:30');
INSERT INTO `pet_ai_chat` VALUES (3, 21, 6, '你好', '{\"error_code\":23,\"error_msg\":\"IAM API-KEY authentication failed\"}', '2025-02-14 01:01:01');
INSERT INTO `pet_ai_chat` VALUES (4, 21, 11, '你好', '{\"error_code\":23,\"error_msg\":\"IAM API-KEY authentication failed\"}', '2025-02-14 01:01:24');
INSERT INTO `pet_ai_chat` VALUES (5, 21, 11, '11', '{\"error_code\":23,\"error_msg\":\"IAM API-KEY authentication failed\"}', '2025-02-14 01:01:38');
INSERT INTO `pet_ai_chat` VALUES (6, 21, 7, '11', '（摇动尾巴，眼神中充满好奇）汪汪！（虽然我听不懂人类复杂的语言，但我感觉到你在跟我说话。作为一只拉布拉多，我热爱交流和互动，尽管我只能用汪汪来回应你。但请相信，你的每一个字我都用心去听了。）', '2025-02-14 01:04:58');
INSERT INTO `pet_ai_chat` VALUES (7, 21, 7, '66\n', '汪~ 你在说啥呢？66是啥意思呀？不过听起来好像挺好玩的，你是不是想和我玩什么游戏呀？快告诉我怎么玩，我已经迫不及待啦！', '2025-02-14 01:05:53');
INSERT INTO `pet_ai_chat` VALUES (8, 21, 9, '介绍一下你吧\n', '汪汪！我是一只7岁的公德国牧羊犬，我的名字叫大白！我超级活泼，喜欢和人们互动，尤其是和我的小主人一起玩耍。我还是个聪明的狗狗，能很快学会新指令。作为一只牧羊犬，我有着敏锐的观察力和强烈的保护欲，总是警惕地守护着家人的安全。希望这些能让你更好地了解我哦！', '2025-02-14 01:06:56');
INSERT INTO `pet_ai_chat` VALUES (9, 21, 7, '介绍一下你自己吧\n', '汪汪！我是一只名叫阿黄的拉布拉多寻回犬，今年已经6岁了。我超级活泼，喜欢与人互动和玩耍。作为一只寻回犬，我天生就有追寻和找回东西的本领，这也让我成为了很多人的好帮手和忠诚伙伴。希望以后有机会能跟你一起玩哦！', '2025-02-14 01:07:42');
INSERT INTO `pet_ai_chat` VALUES (10, 21, 7, '你好可爱啊\n', '汪汪！（尾巴摇晃，眼神中透露出对主人的喜爱和期待）谢谢夸奖，主人！我会继续努力，做你的好伙伴。', '2025-02-14 01:07:53');
INSERT INTO `pet_ai_chat` VALUES (11, 21, 7, '嘿嘿\n', '嘿嘿，你笑什么呢？是不是想到什么开心的事情啦？我也想听听，一起分享快乐嘛。', '2025-02-14 01:09:05');
INSERT INTO `pet_ai_chat` VALUES (12, 21, 9, '你好呀，介绍一下你自己吧\n', '汪汪！我是一只名叫大白的德国牧羊犬，今年7岁啦。我超级活泼，喜欢和主人一起散步、玩耍。我还是个很聪明的狗狗呢，能听懂很多指令。你喜欢和我交朋友吗？', '2025-02-14 01:11:16');
INSERT INTO `pet_ai_chat` VALUES (13, 21, 6, '介绍一下你自己吧\n', '嗨！我是一只名叫花花的鹦鹉，今年3岁了。我喜欢和人们聊天，也特别善于模仿各种声音。你有什么想问我的吗？', '2025-02-14 01:11:31');
INSERT INTO `pet_ai_chat` VALUES (14, 21, 6, '表演一段节目\n', '好呀，那我就来表演一段吧！看我跳舞咯~ （开始摆动身体，展开翅膀，跳起欢快的舞蹈）怎么样，我的舞蹈还不错吧？希望你们喜欢哦！', '2025-02-14 01:11:44');
INSERT INTO `pet_ai_chat` VALUES (15, 21, 6, '你会vue吗\n', '哈喽！vue这个东东我听过，但是呢，我是一只鹦鹉，我的专长是模仿说话和飞翔，编程这种事情对我来说可能有点难哦。你如果想学vue的话，我可以帮你找找资料，或者陪你一起学习进步，怎么样？', '2025-02-14 01:12:04');
INSERT INTO `pet_ai_chat` VALUES (16, 21, 6, '帮我找一点资料吧\n', '好呀，主人～我很乐意帮忙！但是你要知道，作为一只鹦鹉，我上网查找资料的能力可是有限的哦。不过，你可以告诉我你需要哪方面的资料，我会尽力提供一些有趣的信息和建议。或者，我可以帮你向其他宠物或者人类寻求帮助，你觉得怎么样呢？', '2025-02-14 01:12:43');
INSERT INTO `pet_ai_chat` VALUES (17, 21, 6, '帮我找一点vue的资料吧\n', '好的主人，我来帮你找找Vue的资料吧！\n\nVue是一套用于构建用户界面的渐进式框架，旨在更好地组织与简化Web开发。它的核心思想是响应式数据绑定和组件化开发，让开发者能够高效地构建出交互式的界面。\n\n以下是关于Vue的一些基础资料：\n\n1. Vue的简介与特点：\n   - Vue是一个轻量级、易上手的前端框架，适合用于构建各种规模的Web应用。\n   - 它具有响应式数据绑定的特性，能够自动更新DOM以反映数据的变化。\n   - Vue还提供了丰富的指令和组件化开发方式，使得开发者能够灵活地构建出复杂的界面。\n\n2. Vue的基础语法与用法：\n   - Vue的模板语法基于HTML，通过插值表达式（{{ }}）将数据绑定到DOM元素上。\n   - 开发者可以使用Vue的指令（如v-if、v-for等）来控制DOM的行为和渲染逻辑。\n   - Vue还提供了计算属性、侦听器、生命周期钩子等高级特性，以满足更复杂的开发需求。\n\n3. Vue的项目结构与组件开发：\n   - 在Vue项目中，通常会包含多个组件，每个组件负责渲染特定的界面部分。\n   - 组件之间可以通过props传递数据，也可以通过事件进行通信。\n   - Vue还提供了插槽（slot）机制，允许开发者在组件中插入自定义的内容。\n\n4. Vue的路由与状态管理：\n   - 对于单页面应用（SPA），Vue提供了vue-router库来实现页面的导航与路由管理。\n   - 对于复杂的应用，Vue还提供了vuex库来进行状态管理，使得开发者能够方便地跟踪和修改应用的状态。\n\n5. Vue的生态系统与周边工具：\n   - Vue拥有丰富的生态系统，包括各种第三方库和插件，如axios用于异步请求、element-ui用于构建UI组件等。\n   - Vue还提供了命令行工具vue-cli，帮助开发者快速搭建和配置Vue项目。\n\n希望这些资料能够帮助你更好地了解和学习Vue！如果你有任何其他问题或需要进一步的资料，请随时告诉我哦！', '2025-02-14 01:14:04');
INSERT INTO `pet_ai_chat` VALUES (18, 21, 6, '帮我找一点vue的资料吧，简单描述一下\n', '作为一只鹦鹉，我虽然不能直接帮你编程，但我可以帮你整理一些关于Vue的资料哦！\n\nVue.js 是一种流行的JavaScript框架，用于构建用户界面。以下是关于Vue的一些基础信息：\n\n1. **简介**：Vue (读音 /vjuː/, 类似于 view) 是一套用于构建用户界面的渐进式框架。与其他大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，也便于与第三方库或既有项目整合。\n\n2. **特点**：Vue是一个轻量级的框架，具有简单易学、灵活性和可扩展性等特点。它采用了数据驱动的方式，可以实现数据的双向绑定，让开发者更加专注于业务逻辑的实现，而不需要过多关心DOM操作。\n\n3. **核心概念**：Vue中有几个核心概念，包括组件、指令、模板和实例等。组件是Vue应用的构建块，可以扩展HTML元素，封装可重用的代码；指令是带有v-前缀的特殊标记，用于向Vue实例添加特殊的行为；模板是一种声明式的语法，用于描述如何将数据渲染成HTML结构；实例则是Vue应用的基础，每个Vue应用都是通过用`Vue`函数创建一个新的Vue实例开始的。\n\n4. **生态系统**：Vue的生态系统非常丰富，包括vue-router用于构建单页应用中的页面路由，vuex用于状态管理，以及许多其他的插件和库，可以帮助开发者更加高效地构建应用。\n\n希望这些信息能够帮助你更好地了解Vue哦！如果你需要更深入的学习资料或者教程，可以告诉我哦！', '2025-02-14 01:14:23');
INSERT INTO `pet_ai_chat` VALUES (19, 21, 6, '嘿嘿\n', '嘿嘿，你笑什么呀？是不是看到我觉得特别开心呀？我也很高兴能和你在一起呢！', '2025-02-14 01:15:41');
INSERT INTO `pet_ai_chat` VALUES (20, 21, 10, '喜喜介绍一下你自己吧！', '喵~我就是咪咪，一只超级可爱的1岁缅因猫。我的毛发柔软浓密，身材也是圆滚滚的，是不是很美呀？我特别喜欢玩毛线球，每次看到都会兴奋地扑过去。虽然我现在还小，但我已经很独立了哦，能自己找到舒服的地方睡觉，也能自己玩耍。你呢？你也喜欢我吗？喵~', '2025-02-14 01:18:06');
INSERT INTO `pet_ai_chat` VALUES (21, 21, 10, '南京\n有什么推荐的宠物店吗，介绍介绍', '作为一只缅因猫，我虽然不能亲自去探店，但可以根据铲屎官们提供的信息和网络上的评价，为你推荐一些南京的宠物店。以下是几家备受好评的宠物店：\n\n1. **Fairy Valley精灵谷宠物(伊珊娜洗护店)**：\n   - 地址：南京南站广场地区都芸南苑B-3幢1楼119室。\n   - 营业时间：09:30-21:00。\n   - 这家店提供宠物洗护服务，注重宠物的健康和美容。\n\n2. **柚子宠物(江东中路旗舰店)**：\n   - 地址：江东中路152-1号。\n   - 营业时间：09:00-20:30。\n   - 这家店不仅提供宠物美容和销售服务，还有较高的访问量，说明了其受欢迎程度。\n\n3. **有鱼宠物店**：\n   - 地址：招商街32号二招幢32室。\n   - 营业时间：24小时营业。\n   - 这家店提供全天候的服务，非常适合需要随时照顾宠物的铲屎官。\n\n4. **熊在家宠物俱乐部(君望墅店)**：\n   - 地址：紫云大道8-9号。\n   - 这家店可能更注重宠物的活动和社交，提供一个让宠物玩耍和交流的场所。\n\n5. **丫头宠物生活馆(招商依云华府店)**：\n   - 地址：江苏省南京市栖霞区怡静路1-35号。\n   - 营业时间：09:30-20:00。\n   - 这家店位于栖霞区，提供宠物相关的生活用品和服务。\n\n此外，南京还有许多宠物友好的商场，如南京水游城、南京景枫中心等，这些商场提供宠物推车租赁、宠物用品限量供应等服务，让你可以带着我一起逛街。如果你需要更具体的服务或产品推荐，可以根据自己的需求选择合适的宠物店进行探访。\n\n请注意，以上推荐仅供参考，具体服务质量和体验可能因店铺实际情况而异。在选择宠物店时，建议考虑店铺的卫生状况、服务人员的专业程度以及宠物用品的质量等因素。', '2025-02-14 01:19:50');
INSERT INTO `pet_ai_chat` VALUES (22, 21, 7, '南京有什么推荐的宠物店吗\n', '作为一只拉布拉多寻回犬，我虽然不能直接去宠物店考察，但根据我听到的信息，南京有一些非常不错的宠物店可以推荐给你。\n\n1. **Fairy Valley精灵谷宠物(伊珊娜洗护店)**：这家宠物店位于南京南站广场地区都芸南苑B-3幢1楼119室，他们提供专业的洗护服务，并且营业时间为09:30-21:00，非常适合需要专业护理的宠物。\n2. **柚子宠物(江东中路旗舰店)**：这家店位于江东中路152-1号，提供宠物美容和销售服务。他们的营业时间是09:00-20:30，如果你需要购买宠物用品或者给宠物做美容，这里是个不错的选择。\n3. **有鱼宠物店**：这家宠物店位于招商街32号二招幢32室，最大的特点是24小时营业，非常适合那些需要在非工作时间照顾宠物的主人。\n4. **熊在家宠物俱乐部(君望墅店)**：位于紫云大道8-9号的这家宠物店，虽然具体服务没有详细介绍，但根据名字推测，可能提供宠物寄养和俱乐部活动等服务。\n5. **丫头宠物生活馆(招商依云华府店)**：这家店位于江苏省南京市栖霞区怡静路1-35号，营业时间为09:30-20:00，提供宠物生活用品和可能的美容服务。\n\n此外，还有一家**宠沐宠物医院**，虽然主要是提供医疗服务，但他们也提供宠物驱虫等服务，并且环境优雅、服务热情，还有24小时服务，也是值得考虑的。\n\n以上就是我为你推荐的南京的宠物店，你可以根据自己的需求选择合适的店铺。希望这些信息能帮到你！', '2025-02-14 01:20:12');
INSERT INTO `pet_ai_chat` VALUES (23, 13, 7, '你好\n', '汪汪！你好呀！我是阿黄，一只6岁的公拉布拉多寻回犬。很高兴认识你！有什么我可以帮助你的吗？', '2025-04-15 22:58:21');
INSERT INTO `pet_ai_chat` VALUES (24, 13, 7, '喜喜\n', '汪汪！（尾巴摇得飞快）\n\n喜喜！（用鼻子蹭你，眼神中充满喜悦）', '2025-04-15 22:58:26');
INSERT INTO `pet_ai_chat` VALUES (25, 13, 7, '介绍一下你自己吧！\n', '汪！我是阿黄，一只6岁的公拉布拉多寻回犬。我有着一身浓密的金黄色毛发，像阳光一样温暖而耀眼。我的大眼睛总是闪烁着好奇和友好的光芒，让人忍不住想要靠近我。\n\n我的性格活泼开朗，喜欢和人类以及其他狗狗们玩耍。我总是充满活力，喜欢追逐蝴蝶、在草地上奔跑，或者和其他狗狗一起嬉戏。我也很聪明，能够理解主人的命令，并按照指示做出相应的行动。\n\n除了玩耍和运动，我也非常忠诚和友善。我总是愿意陪伴在主人身边，无论是在家里还是在外出时。我会用我的尾巴摇摆来表达喜悦，用鼻子轻触来表达亲昵，让主人感受到我的爱意。\n\n虽然我有时会有点调皮捣蛋，但我总是尽力保持规矩和秩序。我会听从主人的指令，遵守家规，确保家庭环境的和谐与安宁。\n\n总的来说，我是一只充满活力、聪明、忠诚和友善的狗狗。我期待与你一起度过快乐的时光，成为你忠实的朋友！', '2025-04-15 22:58:36');
INSERT INTO `pet_ai_chat` VALUES (26, 1, 6, '11', '花花：你好呀！11这个数字听起来好神秘哦，是不是有什么特别的故事要告诉我呢？快告诉我吧！', '2025-04-24 13:35:23');
INSERT INTO `pet_ai_chat` VALUES (27, 1, 8, 'hi', '嗨！我是小灰，一只2岁的母仓鼠。欢迎来到我的小世界！有什么我可以帮忙的吗？', '2025-05-18 13:48:48');
INSERT INTO `pet_ai_chat` VALUES (28, 1, 6, '你好', '你好呀！我是花花，一只3岁的公鹦鹉。今天心情很好，想和你一起玩耍和聊天呢！有什么新鲜事要分享吗？', '2025-05-21 14:50:48');
INSERT INTO `pet_ai_chat` VALUES (29, 1, 8, '你好！', '你好呀，主人！我是小灰，一只2岁的母仓鼠。我在这里等你哦，希望我们能一起度过愉快的时光！', '2025-05-21 14:52:43');
INSERT INTO `pet_ai_chat` VALUES (30, 1, 7, '介绍一下自己吧！', '汪汪！我是阿黄，一只6岁的公拉布拉多寻回犬。我有着浓密的金色毛发和一双明亮的大眼睛，看起来非常可爱。我性格活泼开朗，喜欢和其他狗狗玩耍，也喜欢和人类互动。我非常喜欢户外活动，喜欢在草地上奔跑、追逐小球或者和主人一起散步。我也很聪明，会做一些简单的指令，比如坐下、握手等。我希望能成为你最好的朋友，陪伴你度过快乐的时光。', '2025-07-01 10:14:07');
INSERT INTO `pet_ai_chat` VALUES (31, 1, 6, '你好', '你好呀！我是花花，一只3岁的公鹦鹉。今天心情很好，想和你聊天哦！有什么好玩的事要告诉我吗？', '2025-07-09 17:31:49');

-- ----------------------------
-- Table structure for pet_grooming_services
-- ----------------------------
DROP TABLE IF EXISTS `pet_grooming_services`;
CREATE TABLE `pet_grooming_services`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '服务的唯一标识符，自动递增',
  `pet_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物的名称',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约服务的用户名',
  `service_date` date NOT NULL COMMENT '服务进行的日期',
  `service_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '美容服务的类型',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间戳，默认为当前时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 548867 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '宠物美容服务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_grooming_services
-- ----------------------------
INSERT INTO `pet_grooming_services` VALUES (548866, '阿财', 'Sadmin', '2024-09-24', '剪指甲', '2024-09-07 00:00:00', '完成');

-- ----------------------------
-- Table structure for pet_medical_services
-- ----------------------------
DROP TABLE IF EXISTS `pet_medical_services`;
CREATE TABLE `pet_medical_services`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '服务的唯一标识符，自动递增',
  `pet_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物的名称',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约服务的用户名',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医疗服务的类型',
  `date` date NOT NULL COMMENT '服务日期',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '服务的描述信息',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间戳，默认为当前时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1934225411 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '宠物医疗服务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_medical_services
-- ----------------------------
INSERT INTO `pet_medical_services` VALUES (-1874202623, '小文111', 'Sadmin', '疫苗接种', '2024-09-16', NULL, '2024-09-07 00:00:00', '未开始');
INSERT INTO `pet_medical_services` VALUES (290058241, '小文', 'Sadmin', '疫苗接种', '2024-09-16', NULL, '2024-09-07 00:00:00', '未开始');
INSERT INTO `pet_medical_services` VALUES (1531572226, '小文', 'Sadmin', '疫苗接种', '2024-09-16', NULL, '2024-09-07 00:00:00', '未开始');
INSERT INTO `pet_medical_services` VALUES (1934225409, '小文', 'Sadmin', '疫苗接种', '2024-09-16', NULL, '2024-09-07 00:00:00', '未开始');
INSERT INTO `pet_medical_services` VALUES (1934225410, '小白', 'user11', '营养咨询', '2025-04-29', NULL, '2025-04-24 00:00:00', '未开始');

-- ----------------------------
-- Table structure for pet_notification
-- ----------------------------
DROP TABLE IF EXISTS `pet_notification`;
CREATE TABLE `pet_notification`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NOT NULL COMMENT '用户id',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推送消息',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread' COMMENT '状态（unread/read）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pet_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宠物推送通知表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_notification
-- ----------------------------
INSERT INTO `pet_notification` VALUES (103, 1, '11', '2025-06-11 22:14:54', 'read');
INSERT INTO `pet_notification` VALUES (104, 2, '11', '2025-06-11 22:14:54', 'unread');
INSERT INTO `pet_notification` VALUES (105, 3, '11', '2025-06-11 22:14:54', 'unread');
INSERT INTO `pet_notification` VALUES (106, 13, '11', '2025-06-11 22:14:54', 'unread');
INSERT INTO `pet_notification` VALUES (107, 20, '11', '2025-06-11 22:14:54', 'unread');
INSERT INTO `pet_notification` VALUES (108, 21, '11', '2025-06-11 22:14:54', 'unread');
INSERT INTO `pet_notification` VALUES (109, 23, '11', '2025-06-11 22:14:54', 'unread');
INSERT INTO `pet_notification` VALUES (110, 4, 'aaa', '2025-06-11 22:15:02', 'unread');
INSERT INTO `pet_notification` VALUES (111, 6, 'aaa', '2025-06-11 22:15:02', 'unread');
INSERT INTO `pet_notification` VALUES (112, 12, 'aaa', '2025-06-11 22:15:02', 'unread');
INSERT INTO `pet_notification` VALUES (113, 14, 'aaa', '2025-06-11 22:15:02', 'unread');
INSERT INTO `pet_notification` VALUES (114, 18, 'aaa', '2025-06-11 22:15:02', 'unread');
INSERT INTO `pet_notification` VALUES (115, 19, 'aaa', '2025-06-11 22:15:02', 'unread');

-- ----------------------------
-- Table structure for pet_training_services
-- ----------------------------
DROP TABLE IF EXISTS `pet_training_services`;
CREATE TABLE `pet_training_services`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '服务的唯一标识符，自动递增',
  `pet_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '\r\n宠物名称',
  `service_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '训练服务的类型',
  `end_date` date NULL DEFAULT NULL COMMENT '训练服务预计结束的日期，可以为空',
  `training_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练的级别',
  `training_goals` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '训练的目标或期望结果',
  `completion_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练完成的状态，如“完成”、“进行中”、“未开始”等',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2026422274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '宠物训练服务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_training_services
-- ----------------------------
INSERT INTO `pet_training_services` VALUES (-2067189759, '阿文', '高级服从训练', '2024-09-01', '121', '2121', '训练中', NULL);
INSERT INTO `pet_training_services` VALUES (-1995886590, '阿文', '服务犬训练', '2024-09-01', '121', '2121', '未开始', NULL);
INSERT INTO `pet_training_services` VALUES (-1354158078, '阿文', '高级服从训练', '2024-09-01', '121', '2121', '未开始', NULL);
INSERT INTO `pet_training_services` VALUES (-1274466302, '阿文', '高级服从训练', '2024-09-01', '121', '2121', '未开始', NULL);
INSERT INTO `pet_training_services` VALUES (-884396031, '阿文', '高级服从训练', '2024-09-01', '121', '2121', '未开始', NULL);
INSERT INTO `pet_training_services` VALUES (2026422273, '111', '高级服从训练', '2024-09-01', '122', '12', '未开始', 'Sadmin');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '房间编号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '房间状态',
  `animal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '寄养宠物',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房间信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '408', '使用中', '小白');
INSERT INTO `room` VALUES (2, '168', '使用中', '阿财');
INSERT INTO `room` VALUES (3, '1995', '使用中', '小黑');
INSERT INTO `room` VALUES (4, 'dialogForm2', '使用中', '小红');
INSERT INTO `room` VALUES (5, '1213', '闲置', NULL);
INSERT INTO `room` VALUES (6, '582', '闲置', '阿财');
INSERT INTO `room` VALUES (7, '822', '使用中', '阿财');
INSERT INTO `room` VALUES (9, '11111', '闲置', NULL);

-- ----------------------------
-- Table structure for submit
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上报说明',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上报图片',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上报时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '上报信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of submit
-- ----------------------------
INSERT INTO `submit` VALUES (18, '2五12の2', NULL, '2024-09-08 19:04:31', '已处理');

-- ----------------------------
-- Table structure for submit_img
-- ----------------------------
DROP TABLE IF EXISTS `submit_img`;
CREATE TABLE `submit_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `submit_id` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2110263337 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of submit_img
-- ----------------------------
INSERT INTO `submit_img` VALUES (2110263335, 18, 'submit/1725793472057-da65423e-cd16-4ab2-9d51-f0b0ca8e5d18.png');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `role` int NOT NULL COMMENT '菜单角色(0：未分配 2：普通用户：1：管理员：3：全部用户)',
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int NULL DEFAULT NULL COMMENT '菜单父id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 10, '宠物管理', '/animal', 'el-icon-menu', NULL, 68, 'Animal', 2);
INSERT INTO `sys_menu` VALUES (3, 26, '首页', '/showView', 'el-icon-s-data', '', NULL, 'ShowView', 1);
INSERT INTO `sys_menu` VALUES (3, 34, '个人中心', NULL, 'el-icon-user', NULL, NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (3, 35, '个人信息', '/personInfo', 'el-icon-info', NULL, 34, 'PersonInfo', 3);
INSERT INTO `sys_menu` VALUES (3, 36, '密码修改', '/password', 'el-icon-lock', NULL, 34, 'Password', 4);
INSERT INTO `sys_menu` VALUES (0, 42, '菜单管理', '/menu', 'el-icon-menu', NULL, 70, 'Menu', 10);
INSERT INTO `sys_menu` VALUES (1, 47, '通知管理', '/notices', 'el-icon-s-promotion', NULL, 70, 'NoticeList', 1);
INSERT INTO `sys_menu` VALUES (1, 51, '用户管理', '/userManager', 'el-icon-user-solid', NULL, 70, 'UserManager', 5);
INSERT INTO `sys_menu` VALUES (3, 52, '订单管理', '/orders', 'el-icon-s-order', NULL, 69, 'Orders', 4);
INSERT INTO `sys_menu` VALUES (0, 59, '图标字典', '/iconDict', 'el-icon-picture-outline-round', NULL, 40, 'IconDict', 77);
INSERT INTO `sys_menu` VALUES (3, 60, '领养管理', '/adopt', 'el-icon-lock', NULL, 68, 'Adopt', 4);
INSERT INTO `sys_menu` VALUES (1, 62, '宠物房间信息', '/room', 'el-icon-menu', NULL, 68, 'Room', 1);
INSERT INTO `sys_menu` VALUES (3, 63, '宠物寄养', '/foster', 'el-icon-s-promotion', NULL, 77, 'Foster', 1);
INSERT INTO `sys_menu` VALUES (1, 64, '商品管理', '/goods', 'el-icon-menu', NULL, 69, 'Goods', 1);
INSERT INTO `sys_menu` VALUES (1, 66, '流浪宠物上报', '/submit', 'el-icon-s-promotion', NULL, 77, 'Submit', 4);
INSERT INTO `sys_menu` VALUES (1, 67, '品种管理', '/breed', 'el-icon-goods', NULL, 68, 'Breed', 4);
INSERT INTO `sys_menu` VALUES (3, 68, '宠物中心', NULL, 'el-icon-house', NULL, NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (3, 69, '宠物用品', NULL, 'el-icon-s-goods', NULL, NULL, NULL, 2);
INSERT INTO `sys_menu` VALUES (1, 70, '系统管理', NULL, 'el-icon-setting', NULL, NULL, NULL, 3);
INSERT INTO `sys_menu` VALUES (1, 71, '宠物健康管理', '/healthRecord', 'el-icon-user', '宠物健康管理', 68, 'HealthRecord', 2);
INSERT INTO `sys_menu` VALUES (1, 72, '训练项目管理', '/trainingName', 'el-icon-info', NULL, 77, 'TrainingName', 3);
INSERT INTO `sys_menu` VALUES (3, 73, '训练申请', '/training', 'el-icon-info', NULL, 77, 'Training', 3);
INSERT INTO `sys_menu` VALUES (3, 74, '美容服务', '/petGrooming', 'el-icon-info', NULL, 77, 'PetGrooming', 3);
INSERT INTO `sys_menu` VALUES (3, 75, '医疗服务', '/petMedical', 'el-icon-info', NULL, 77, 'PetMedical', 3);
INSERT INTO `sys_menu` VALUES (3, 76, '首页轮播图管理', '/homeSlider', 'el-icon-camera-solid', NULL, 70, 'HomeSlider', 3);
INSERT INTO `sys_menu` VALUES (3, 77, '宠物服务', NULL, 'el-icon-service', NULL, NULL, NULL, 5);
INSERT INTO `sys_menu` VALUES (1, 79, '推送管理', '/petNotificationManagement', 'el-icon-info', '1', 70, 'PetNotificationManagement', 1);

-- ----------------------------
-- Table structure for training_names
-- ----------------------------
DROP TABLE IF EXISTS `training_names`;
CREATE TABLE `training_names`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `training_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 839483395 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of training_names
-- ----------------------------
INSERT INTO `training_names` VALUES (11, '基础服从训练', '训练宠物学会基本的服从命令，如坐下、停留、来等11');
INSERT INTO `training_names` VALUES (12, '高级服从训练', '在基础服从训练的基础上，训练宠物执行更复杂的命令和技巧');
INSERT INTO `training_names` VALUES (13, '敏捷性训练', '提高宠物的体能和协调性，通过各种障碍物进行训练');
INSERT INTO `training_names` VALUES (14, '服务犬训练', '训练宠物帮助残疾人士，如导盲犬、助听犬等');
INSERT INTO `training_names` VALUES (15, '治疗犬训练', '训练宠物为医院、养老院等提供情感支持和陪伴');
INSERT INTO `training_names` VALUES (16, '搜救犬训练', '训练宠物参与搜索和救援任务，如自然灾害后的搜救工作');
INSERT INTO `training_names` VALUES (17, '猎犬训练', '训练宠物协助打猎，追踪和捕获猎物');
INSERT INTO `training_names` VALUES (18, '护卫犬训练', '训练宠物保护财产和人员，如家庭、企业的安全防护');
INSERT INTO `training_names` VALUES (19, '展示犬训练', '训练宠物参加犬类展览和比赛，注重外观和表演技巧');
INSERT INTO `training_names` VALUES (20, '犬类好公民', '训练宠物成为社区中的模范成员，遵守公共秩序和礼仪');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `account` double UNSIGNED NULL DEFAULT 0 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user11', '123456', 'John Doe', '/img/1744989238850-c34045d3-197f-42b6-8b09-36e23b0f6a70.jpg', 'USER', '女', '15252393501', 'user1@example.com', '江苏省淮安市淮阴区', 9791.739999999998);
INSERT INTO `user` VALUES (2, 'user2', 'password2', 'Jane Smith', '/img/1722088987662-mike.png', 'USER', '女', '0987654321', 'user2@example.com', '江苏省南京市新街口地区', 0);
INSERT INTO `user` VALUES (3, 'user3', 'password3', 'Alice Johnson', '/img/1722088995086-rice.png', 'USER', '男', '1122334455', 'user3@example.com', '江苏省淮安市淮阴区', 0);
INSERT INTO `user` VALUES (4, 'user4', 'password4', 'Bob Brown', 'avatar4.jpg', 'ADMIN', '男', '5556667777', 'user4@example.com', '江苏省南京市新街口地区', 0);
INSERT INTO `user` VALUES (5, 'Sadmin', 'Sadmin', 'Charlie', '/img/1725250742919-52fce8dd-5be0-4b03-bd55-16fa9f9aec41.png', 'SUPER_ADMIN', '男', '15252393509', 'user5@example.com', '江苏省淮安市淮阴区111', 0);
INSERT INTO `user` VALUES (6, 'ftfx123', 'jx152523', 'jx', '', 'ADMIN', '男', '15252393509', '17961456081@qq.com', '江苏省淮安市淮阴区', 0);
INSERT INTO `user` VALUES (12, 'ftfxadmin', 'jx152523', '蒋响', 'blob:http://192.168.123.74:8083/c84c69f9-a113-4937-9729-9c2779dd1b6f', 'ADMIN', '男', '15252393509', '', '江苏省淮安市淮阴区', 0);
INSERT INTO `user` VALUES (13, 'ftfx111', 'jx152523', '1111', '/img/1725249939815-53663393-7cf7-4af8-8adf-a229a4f15de9.png', 'USER', '男', '15252311111', '17961456081@qq.com', '无', 0);
INSERT INTO `user` VALUES (14, 'admin', 'jx152523', '蒋响111', '/img/1722084631154-屏幕截图 2024-06-10 213027.png', 'ADMIN', '男', '15252393511', '', '江苏省南京市新街口地区', 0);
INSERT INTO `user` VALUES (18, '112321', '123456', NULL, NULL, 'ADMIN', NULL, NULL, '47489169@qq.com', '江苏省南京市新街口地区', 0);
INSERT INTO `user` VALUES (19, '1111', '123456', NULL, NULL, 'ADMIN', NULL, NULL, '11111@qq.com', '江苏省南京市新街口地区', 0);
INSERT INTO `user` VALUES (20, '123213', '123456', NULL, NULL, 'USER', NULL, NULL, '122312@qq.com', '江苏省苏州市金鸡湖地区', 0);
INSERT INTO `user` VALUES (21, 'ftfx', 'jx152523', '蒋响', '/img/1728220394606-5e80cf81-5f4a-48f0-933c-1a0ca1c7c0da.png', 'USER', '男', '15252393509', '15252393509@163.com', '江苏省苏州市金鸡湖地区', 0);
INSERT INTO `user` VALUES (23, 'bdfyuwbf', 'jx41412', NULL, NULL, 'USER', NULL, NULL, '15252393509@163.com', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
