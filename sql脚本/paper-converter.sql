/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : paper-converter

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-30 08:24:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for content_style_relationship
-- ----------------------------
DROP TABLE IF EXISTS `content_style_relationship`;
CREATE TABLE `content_style_relationship` (
  `id` int(11) NOT NULL,
  `indexTypeId` int(11) NOT NULL COMMENT '索引类型',
  `contentTypeId` int(11) NOT NULL COMMENT '内容类型',
  `rowSpace` int(255) DEFAULT NULL COMMENT '段落行距',
  `fontFamily` varchar(255) DEFAULT NULL COMMENT '字体类型',
  `fontColor` varchar(255) DEFAULT NULL COMMENT '字体颜色',
  `mustHave` int(255) DEFAULT NULL COMMENT '是否必填选项 0：否 1：是',
  `templateKeyId` int(11) DEFAULT NULL COMMENT '模板Id',
  PRIMARY KEY (`id`),
  KEY `FK_Index_Type_Id` (`indexTypeId`),
  CONSTRAINT `FK_Index_Type_Id` FOREIGN KEY (`indexTypeId`) REFERENCES `index_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_style_relationship
-- ----------------------------

-- ----------------------------
-- Table structure for content_type
-- ----------------------------
DROP TABLE IF EXISTS `content_type`;
CREATE TABLE `content_type` (
  `id` int(11) NOT NULL,
  `param` varchar(255) DEFAULT NULL COMMENT '内容类型字符串',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_type
-- ----------------------------

-- ----------------------------
-- Table structure for feedback_post
-- ----------------------------
DROP TABLE IF EXISTS `feedback_post`;
CREATE TABLE `feedback_post` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(300) NOT NULL,
  `addDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback_post
-- ----------------------------

-- ----------------------------
-- Table structure for index_type
-- ----------------------------
DROP TABLE IF EXISTS `index_type`;
CREATE TABLE `index_type` (
  `id` int(11) NOT NULL,
  `indexType` varchar(255) NOT NULL COMMENT '索引类型名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_type
-- ----------------------------

-- ----------------------------
-- Table structure for template_key
-- ----------------------------
DROP TABLE IF EXISTS `template_key`;
CREATE TABLE `template_key` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `school` varchar(255) NOT NULL DEFAULT '' COMMENT '学校名称',
  `department` varchar(255) NOT NULL DEFAULT '' COMMENT '系别名称',
  `special` int(11) NOT NULL DEFAULT '0' COMMENT '特殊模板 1:普通  other>1:特殊',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_key
-- ----------------------------

-- ----------------------------
-- Table structure for template_module
-- ----------------------------
DROP TABLE IF EXISTS `template_module`;
CREATE TABLE `template_module` (
  `id` int(11) NOT NULL COMMENT '模板Id',
  `templateKeyId` int(255) DEFAULT NULL COMMENT '模板keyId',
  `param` varchar(255) DEFAULT NULL COMMENT '占位符参数',
  `paramName` varchar(255) DEFAULT NULL COMMENT '点位符对应名称',
  `editable` int(11) DEFAULT NULL COMMENT '是否可编辑0：否 1：是',
  `block` int(11) DEFAULT NULL COMMENT '是否块级填入0：否 1：是',
  `templateLocation` varchar(255) DEFAULT NULL COMMENT 'word模板绝对地址',
  PRIMARY KEY (`id`),
  KEY `FK_Template_Key_Id` (`templateKeyId`),
  CONSTRAINT `FK_Template_Key_Id` FOREIGN KEY (`templateKeyId`) REFERENCES `template_key` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_module
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '用户id',
  `account` varchar(255) DEFAULT NULL COMMENT '账号',
  `passwd` varchar(255) DEFAULT NULL,
  `wordData` varchar(255) DEFAULT NULL COMMENT '进度',
  `registerTime` date DEFAULT NULL COMMENT '注册时间',
  `templateKeyId` int(11) DEFAULT NULL COMMENT '模板Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
