/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2017-10-10 16:56:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_database
-- ----------------------------
DROP TABLE IF EXISTS `t_database`;
CREATE TABLE `t_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_database
-- ----------------------------
INSERT INTO `t_database` VALUES ('43', '1', '20170705171442.sql', '2017-07-05 17:14:42', 'E:\\SQLDB122\\20170705171442.sql', '1');

-- ----------------------------
-- Table structure for t_datadic
-- ----------------------------
DROP TABLE IF EXISTS `t_datadic`;
CREATE TABLE `t_datadic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datadicname` varchar(255) DEFAULT NULL,
  `datadicvalue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_datadic
-- ----------------------------
INSERT INTO `t_datadic` VALUES ('1', '数据库管理', '备份');
INSERT INTO `t_datadic` VALUES ('2', '数据库管理', '恢复');
INSERT INTO `t_datadic` VALUES ('3', '数据库管理', '初始化');
INSERT INTO `t_datadic` VALUES ('4', '数据库管理', '数据整理');
INSERT INTO `t_datadic` VALUES ('6', '支出类型', '税收');
INSERT INTO `t_datadic` VALUES ('7', '支出类型', '衣食住行');
INSERT INTO `t_datadic` VALUES ('8', '支出类型', '医疗');
INSERT INTO `t_datadic` VALUES ('9', '支出类型', '其他');
INSERT INTO `t_datadic` VALUES ('10', '收入类型', '工资');
INSERT INTO `t_datadic` VALUES ('11', '收入类型', '股票');
INSERT INTO `t_datadic` VALUES ('12', '收入类型', '分红');
INSERT INTO `t_datadic` VALUES ('13', '收入类型', '奖金');
INSERT INTO `t_datadic` VALUES ('14', '证券流水账类型', '买入');
INSERT INTO `t_datadic` VALUES ('15', '证券流水账类型', '卖出');
INSERT INTO `t_datadic` VALUES ('16', '证券类型', '证据证券');
INSERT INTO `t_datadic` VALUES ('17', '证券类型', '凭证证券');
INSERT INTO `t_datadic` VALUES ('18', '证券类型', '有价证券');

-- ----------------------------
-- Table structure for t_income
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `incomer` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `incometime` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('1', '1', 'admin', '1', '5000', '10', '无', '2017-07-03 10:25:03', '2017-07-03 10:25:06', '2017-07-04 21:15:08');
INSERT INTO `t_income` VALUES ('3', '1', 'admin', '2', '6000', '10', '无', '2017-07-04 10:25:03', '2017-07-03 10:29:20', '2017-07-04 21:15:20');
INSERT INTO `t_income` VALUES ('4', '1', 'admin', '2', '5000', '10', '无', '2017-07-05 10:25:03', '2017-07-03 10:48:23', '2017-07-04 21:15:35');
INSERT INTO `t_income` VALUES ('6', '2', 'Tom', '1', '10000', '11', '', '2017-07-03 10:25:03', '2017-07-03 15:24:33', '2017-07-04 21:16:07');
INSERT INTO `t_income` VALUES ('8', '2', 'Tom', '1', '4000', '10', '', '2017-07-04 10:25:03', '2017-07-03 15:39:45', '2017-07-04 21:16:29');
INSERT INTO `t_income` VALUES ('32', '2', 'Tom', '1', '3000', '10', '', '2017-07-05 10:25:03', '2017-07-04 13:54:07', '2017-07-04 21:17:39');
INSERT INTO `t_income` VALUES ('33', '2', 'Tom', '3', '1222', '13', '', '2017-07-06 10:25:03', '2017-07-04 13:54:29', '2017-07-04 21:16:58');
INSERT INTO `t_income` VALUES ('34', '7', '普通用户', '3', '1000', '11', '', '2017-07-03 10:25:03', '2017-07-04 22:18:59', null);
INSERT INTO `t_income` VALUES ('35', '7', '普通用户', '2', '2200', '12', null, '2017-07-04 10:25:03', '2017-07-04 22:20:01', null);
INSERT INTO `t_income` VALUES ('36', '7', '普通用户', '2', '3500', '13', '', '2017-07-05 10:25:03', '2017-07-04 22:20:34', '2017-07-04 22:21:00');
INSERT INTO `t_income` VALUES ('37', '7', '普通用户', '2', '7000', '12', '', '2017-07-06 10:25:03', '2017-07-04 22:20:53', null);
INSERT INTO `t_income` VALUES ('38', '1', 'admin', 'wu', '30000', '11', '', '2017-07-10 19:30:53', '2017-07-10 19:30:56', null);

-- ----------------------------
-- Table structure for t_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_pay`;
CREATE TABLE `t_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `tword` varchar(255) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `paytime` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay
-- ----------------------------
INSERT INTO `t_pay` VALUES ('1', '1', 'admin', '吃饭', '50000', '6', '1', '2017-07-04 11:10:41', '2017-07-03 11:10:45', '2017-07-08 15:25:49');
INSERT INTO `t_pay` VALUES ('2', '1', '1', '1', '222', '7', '2222', '2017-07-04 11:26:57', '2017-07-03 11:27:06', '2017-07-04 08:42:41');
INSERT INTO `t_pay` VALUES ('3', '1', '123', '1', '123', '6', '123', '2017-07-06 11:28:19', '2017-07-03 11:28:27', null);
INSERT INTO `t_pay` VALUES ('4', '1', '11', '3', '11', '6', '1', '2017-07-03 15:07:46', '2017-07-03 15:07:49', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '系统管理员');
INSERT INTO `t_role` VALUES ('2', '普通用户');

-- ----------------------------
-- Table structure for t_security
-- ----------------------------
DROP TABLE IF EXISTS `t_security`;
CREATE TABLE `t_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `securityname` varchar(255) DEFAULT NULL,
  `securitypassward` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security
-- ----------------------------
INSERT INTO `t_security` VALUES ('1', '2', '12323', '231232189', '赵鹏', '17', '2017-07-03 11:14:58', '2017-07-05 11:14:55', '2017-07-05 11:15:02', '2017-07-05 11:15:23');
INSERT INTO `t_security` VALUES ('2', '1', '789', '788', '4561', '16', '2017-07-05 13:52:30', '2017-07-05 13:52:27', '2017-07-05 13:52:47', null);

-- ----------------------------
-- Table structure for t_shares
-- ----------------------------
DROP TABLE IF EXISTS `t_shares`;
CREATE TABLE `t_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `securityid` int(11) NOT NULL,
  `sharesname` varchar(255) DEFAULT NULL,
  `holder` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shares
-- ----------------------------
INSERT INTO `t_shares` VALUES ('1', '1', '1', '赵鹏', 'admin', '2017-07-05 11:16:43', '2017-07-05 15:57:04');
INSERT INTO `t_shares` VALUES ('3', '1', '1', '我哦我我哦', 'Tom', '2017-07-05 15:15:33', null);

-- ----------------------------
-- Table structure for t_trade
-- ----------------------------
DROP TABLE IF EXISTS `t_trade`;
CREATE TABLE `t_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sharesid` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade
-- ----------------------------
INSERT INTO `t_trade` VALUES ('1', null, null, '69999', '12', '839988', '14', '激活附', '2017-07-04 15:22:21', '2017-07-05 15:22:36', null);
INSERT INTO `t_trade` VALUES ('2', '1', '1', '69999', '2', '139998', '15', '地方', '2017-07-07 15:34:14', '2017-07-05 15:34:24', '2017-07-05 19:43:49');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `isvalid` tinyint(2) NOT NULL DEFAULT '1',
  `createtime` datetime NOT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'MTIzNDU2', '管理员', '424107420@qq.com', '18713598785', '秦皇岛市海港区燕山大学', '1', '22', '父亲', '5000', '123456', '1', '2017-06-30 11:36:21', '2017-07-03 10:08:04');
INSERT INTO `t_user` VALUES ('2', 'Tom', 'MTIzNDU2', 'Tom', '424107420@qq.com', '22222', '秦皇岛市海港区燕大小区', '2', '35', '母亲', '9000', '623578956', '1', '2017-07-01 15:04:19', '2017-07-03 22:29:00');
INSERT INTO `t_user` VALUES ('3', '12455', 'MTIzNDU2', null, null, null, null, null, null, null, null, null, '0', '2017-07-06 15:13:09', null);
INSERT INTO `t_user` VALUES ('4', '12222', 'MTIzNDU2Nzg=', '2222', '424107420@qq.com', '222', '秦皇岛市海港区', '2', '22', '父亲', '5000111', '123456', '0', '2017-07-01 15:24:14', '2017-07-03 10:09:40');
INSERT INTO `t_user` VALUES ('5', '122', 'MTIzNDU2', '1', '1@qq.com', '1', '1', '1', '1', '1', '1', '1', '0', '2017-07-03 15:10:15', null);
INSERT INTO `t_user` VALUES ('6', '1', 'MQ==', '1', '1@qq.com', '1', '1', '1', '11', '1', '11', '1', '0', '2017-07-03 15:10:34', null);
INSERT INTO `t_user` VALUES ('7', '普通用户', 'MTIzNDU2', '王大爷', '18713598785@163.com', '123456789', '未知', '1', '60', '外祖父', '6000', '622234578', '1', '2017-07-03 22:24:20', '2017-07-03 22:30:44');
INSERT INTO `t_user` VALUES ('8', '田建璐', 'MTIzNDU2', null, null, null, null, null, null, null, null, null, '0', '2017-07-03 22:27:15', null);
INSERT INTO `t_user` VALUES ('9', 'lu', 'MTIz', null, null, null, null, null, null, null, null, null, '1', '2017-07-07 10:02:39', null);
INSERT INTO `t_user` VALUES ('10', '我是谁', 'MTIzNDU2', null, null, null, null, null, null, null, null, null, '1', '2017-07-08 15:36:04', null);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('4', '2', '2');
INSERT INTO `t_user_role` VALUES ('5', '3', '2');
INSERT INTO `t_user_role` VALUES ('6', '4', '2');
INSERT INTO `t_user_role` VALUES ('7', '5', '1');
INSERT INTO `t_user_role` VALUES ('8', '6', '1');
INSERT INTO `t_user_role` VALUES ('9', '7', '2');
INSERT INTO `t_user_role` VALUES ('10', '8', '2');
INSERT INTO `t_user_role` VALUES ('11', '9', '2');
INSERT INTO `t_user_role` VALUES ('12', '10', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `userpassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
