/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-09-05 16:58:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ns_cart`
-- ----------------------------
DROP TABLE IF EXISTS `ns_cart`;
CREATE TABLE `ns_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `total_price` decimal(10,0) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ns_cart
-- ----------------------------
INSERT INTO `ns_cart` VALUES ('1', '1', '20');
INSERT INTO `ns_cart` VALUES ('2', '2', '30');

-- ----------------------------
-- Table structure for `ns_cart_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ns_cart_goods`;
CREATE TABLE `ns_cart_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `num` int(11) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ns_cart_goods
-- ----------------------------
INSERT INTO `ns_cart_goods` VALUES ('1', '1', '4', '20', '20', '1000');

-- ----------------------------
-- Table structure for `ns_category`
-- ----------------------------
DROP TABLE IF EXISTS `ns_category`;
CREATE TABLE `ns_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `level` int(11) DEFAULT NULL COMMENT '级别',
  `category_pic` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ns_category
-- ----------------------------
INSERT INTO `ns_category` VALUES ('1', '衣服', '0', '1', 'www', '1');
INSERT INTO `ns_category` VALUES ('4', '大衣', '1', '2', '嗡嗡嗡', '2');
INSERT INTO `ns_category` VALUES ('3', '茶水', '0', '1', null, '4');
INSERT INTO `ns_category` VALUES ('5', '绿茶', '3', '2', '我', '5');
INSERT INTO `ns_category` VALUES ('6', '冰红茶', '3', '2', '王五', '4');
INSERT INTO `ns_category` VALUES ('7', '毛衣', '1', '2', '撒旦', '7');
INSERT INTO `ns_category` VALUES ('8', '皮衣', '1', '2', '我', '9');

-- ----------------------------
-- Table structure for `ns_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ns_goods`;
CREATE TABLE `ns_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `shop_id` int(11) DEFAULT NULL COMMENT '商铺id',
  `is_recommend` tinyint(11) DEFAULT '0' COMMENT '是否推荐',
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `goods_spec` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `original_price` decimal(10,0) DEFAULT NULL COMMENT '原价',
  `present_price` decimal(10,0) DEFAULT NULL COMMENT '现价',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(11) DEFAULT NULL COMMENT '商品添加时间',
  `category` int(10) unsigned DEFAULT '0' COMMENT '商品分类ID',
  `number` int(11) DEFAULT NULL COMMENT '商品数量',
  `description` text COMMENT '商品详情',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ns_goods
-- ----------------------------
INSERT INTO `ns_goods` VALUES ('1', '草帽', null, '1', null, '', '1', null, null, null, null, '7', null, null);
INSERT INTO `ns_goods` VALUES ('2', '啤酒', null, '0', null, '', '2', null, null, null, null, '8', null, null);
INSERT INTO `ns_goods` VALUES ('4', '羊皮', '22', '0', 'assets/images/2019/09/04/43c8253879c67ad9281fd40d6eece54b.jpeg', '20 12', '3', '100', null, null, null, '7', '100', '请求');
INSERT INTO `ns_goods` VALUES ('5', '皮鞋', '12', '0', 'assets/images/2019/09/04/7c02b2d8906babb8da73de04e3a4b311.jpg', '12 13 14', '12', '52', '10', '1567508655', '1567508655', '0', '100', '好的好');
INSERT INTO `ns_goods` VALUES ('8', '茶叶', '13', '0', 'assets/images/2019/09/05/timg.jpg', '12 14 18', '20', '100', '20', '1567671687', '1567671687', '3', '40', '好些虫子');

-- ----------------------------
-- Table structure for `ns_login`
-- ----------------------------
DROP TABLE IF EXISTS `ns_login`;
CREATE TABLE `ns_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` char(15) DEFAULT NULL COMMENT '手机号',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ns_login
-- ----------------------------
INSERT INTO `ns_login` VALUES ('1', 'wang', null, '192168@qq.com', '13193981498', '1567665342', '1567665342');
INSERT INTO `ns_login` VALUES ('2', 'xiaohong', '6aceba6ec3e09bf170c74fb0234cb286', '5564131@qq.com', '13193981498', null, null);

-- ----------------------------
-- Table structure for `ns_order`
-- ----------------------------
DROP TABLE IF EXISTS `ns_order`;
CREATE TABLE `ns_order` (
  ` order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型',
  `shop_id` int(11) DEFAULT NULL COMMENT '卖家ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `receiver_address` varchar(255) DEFAULT NULL COMMENT '收货人详细地址',
  `total_price` decimal(10,0) DEFAULT NULL COMMENT '总价',
  `order_money` decimal(10,0) DEFAULT NULL COMMENT '订单总价',
  `pay_status` decimal(10,0) DEFAULT NULL COMMENT '订单付款状态',
  `order_status` tinyint(4) DEFAULT NULL COMMENT '订单状态',
  `shipping_company_id` int(11) DEFAULT NULL COMMENT '配送物流公司ID',
  `pay_time` int(11) DEFAULT NULL COMMENT '订单付款时间',
  `create_time` int(11) DEFAULT NULL COMMENT '订单创建时间',
  PRIMARY KEY (` order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ns_order
-- ----------------------------

-- ----------------------------
-- Table structure for `pics`
-- ----------------------------
DROP TABLE IF EXISTS `pics`;
CREATE TABLE `pics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pics
-- ----------------------------
INSERT INTO `pics` VALUES ('6', '土狗', 'www.aidu.com', 'www.aaccc.com');
INSERT INTO `pics` VALUES ('10', '猫咪', 'http://www.baidu.com', 'assets/images/2019/09/02/微信图片_20190227185223.bmp');
INSERT INTO `pics` VALUES ('46', '美女', 'www.meinv .com', 'assets/images/2019/09/02/43c8253879c67ad9281fd40d6eece54b.jpeg');
INSERT INTO `pics` VALUES ('48', '吐舌猫', 'www.baidu.com', 'assets/images/2019/09/02/微信图片_20190227185123.bmp');
INSERT INTO `pics` VALUES ('51', '手机', 'qweqwe', 'assets/images/2019/09/01/7c02b2d8906babb8da73de04e3a4b311.jpg');
INSERT INTO `pics` VALUES ('52', '手机', 'qweqw', 'assets/images/2019/09/01/1.jpg');
INSERT INTO `pics` VALUES ('53', '手机', 'qweqweqw', 'assets/images/2019/09/01/7c02b2d8906babb8da73de04e3a4b311.jpg');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', 'wangscxiao', 'H4bDtcp9N0EKqHPDiQkPbeeRjIws4eCb', '$2y$13$FDP5LVN67YYu7ilFeiAAge/Oh.vgt7ytjLW0VZ2j/Pu6yS3xRlOaO', null, '2902169998@qq.com', '10', '10', '1566973350', '1566973350');
