/*
Navicat MySQL Data Transfer

Source Server         : jdh_mysql
Source Server Version : 50725
Source Host           : 118.89.26.198:3306
Source Database       : PyToolsIP

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-09-16 22:03:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tkey` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collect_uid_fk_user_id` (`uid`),
  KEY `collect_tkey_fk_tool_tkey` (`tkey`),
  CONSTRAINT `collect_tkey_fk_tool_tkey` FOREIGN KEY (`tkey`) REFERENCES `tool` (`tkey`),
  CONSTRAINT `collect_uid_fk_user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tkey` varchar(255) COLLATE utf8_bin NOT NULL,
  `score` float(2,1) NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_uid_fk_user_id` (`uid`),
  KEY `comment_tkey_fk_tool_tkey` (`tkey`),
  CONSTRAINT `comment_tkey_fk_tool_tkey` FOREIGN KEY (`tkey`) REFERENCES `tool` (`tkey`),
  CONSTRAINT `comment_uid_fk_user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for depend
-- ----------------------------
DROP TABLE IF EXISTS `depend`;
CREATE TABLE `depend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `file_key` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of depend
-- ----------------------------
INSERT INTO `depend` VALUES ('5', 'run', '/', 'release/depend/run_UqLMRLQ.zip', '5f874be386d7174b0462e491cf24a22d', 0xE696B0E5A29EE69BB4E696B0E8BF90E8A18CE8849AE69CACE38082, '2019-09-08 05:30:44');
INSERT INTO `depend` VALUES ('6', 'python', '/include', 'release/depend/python.zip', '', 0xE5889DE5A78B707974686F6EE78EAFE5A283E5BA93E38082, '2019-09-08 05:34:49');

-- ----------------------------
-- Table structure for exe
-- ----------------------------
DROP TABLE IF EXISTS `exe`;
CREATE TABLE `exe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `path` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exe
-- ----------------------------
INSERT INTO `exe` VALUES ('4', 'pytoolsip', '/');

-- ----------------------------
-- Table structure for exe_detail
-- ----------------------------
DROP TABLE IF EXISTS `exe_detail`;
CREATE TABLE `exe_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `base_version` varchar(255) COLLATE utf8_bin NOT NULL,
  `changelog` text COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eid_fk_exe_id` (`eid`),
  CONSTRAINT `eid_fk_exe_id` FOREIGN KEY (`eid`) REFERENCES `exe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exe_detail
-- ----------------------------
INSERT INTO `exe_detail` VALUES ('5', '4', '1.0.1', 'release/exe/pytoolsip/pytoolsip_1.0.1.exe', '1.0', 0xE69BB4E696B0E5B9B3E58FB0E585A5E58FA3E8BF90E8A18CE7A88BE5BA8FE38082, '2019-09-15 14:13:20');

-- ----------------------------
-- Table structure for installer
-- ----------------------------
DROP TABLE IF EXISTS `installer`;
CREATE TABLE `installer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  `changelog` varchar(255) COLLATE utf8_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `base_version` varchar(255) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of installer
-- ----------------------------
INSERT INTO `installer` VALUES ('5', '1.0.0', '初始版本。', 'release/installer/pytoolsip_installer_1.0.0.exe', '1.0', '2019-09-08 05:24:14');

-- ----------------------------
-- Table structure for ptip
-- ----------------------------
DROP TABLE IF EXISTS `ptip`;
CREATE TABLE `ptip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `changelog` text COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  `base_version` varchar(255) COLLATE utf8_bin NOT NULL,
  `update_version` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` int(1) unsigned zerofill NOT NULL,
  `exe_list` text COLLATE utf8_bin NOT NULL,
  `env_list` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ptip
-- ----------------------------
INSERT INTO `ptip` VALUES ('16', '1.0.2', 'release/ptip/script/1.0/ptip_1.0.2.zip', 0xE5AE8CE59684E5B9B3E58FB0E4B88BE8BDBDE5B7A5E585B7E58F8AE6A380E6B58BE69BB4E696B0E58A9FE883BDE38082, '2019-09-15 14:15:03', '1.0', '1.0', '1', 0x5B7B226E616D65223A20227079746F6F6C736970222C2022626173655F76657273696F6E223A2022312E30227D5D, 0x5B7B226E616D65223A2022707974686F6E227D2C207B226E616D65223A202272756E227D5D);

-- ----------------------------
-- Table structure for tool
-- ----------------------------
DROP TABLE IF EXISTS `tool`;
CREATE TABLE `tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tkey` varchar(255) COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `score` float(2,0) unsigned zerofill DEFAULT NULL,
  `download` int(11) unsigned zerofill DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`,`tkey`),
  KEY `uid_fk_user_id` (`uid`),
  KEY `key` (`tkey`),
  CONSTRAINT `uid_fk_user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tool
-- ----------------------------
INSERT INTO `tool` VALUES ('3', '6', '371d4a203f7256867bd25b56a09650cd', '娱乐工具/小游戏', '俄罗斯方块', 0xE59FBAE4BA8E7778507974686F6EE5BC80E58F91E79A84E4BF84E7BD97E696AFE696B9E59D97E6B8B8E6888FE38082, null, null, '2019-09-15 14:18:24');
INSERT INTO `tool` VALUES ('4', '6', '404dddc43c85b00eb0a87a17a29a3e24', '娱乐工具/小游戏', '贪吃蛇', 0xE59FBAE4BA8E7778507974686F6EE5BC80E58F91E79A84E8B4AAE59083E89B87E6B8B8E6888FE38082, null, null, '2019-09-15 14:16:55');

-- ----------------------------
-- Table structure for tool_detail
-- ----------------------------
DROP TABLE IF EXISTS `tool_detail`;
CREATE TABLE `tool_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkey` varchar(255) COLLATE utf8_bin NOT NULL,
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_base_version` varchar(255) COLLATE utf8_bin NOT NULL,
  `changelog` text COLLATE utf8_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tkey_fk_tool_tkey` (`tkey`),
  CONSTRAINT `tkey_fk_tool_tkey` FOREIGN KEY (`tkey`) REFERENCES `tool` (`tkey`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tool_detail
-- ----------------------------
INSERT INTO `tool_detail` VALUES ('4', '371d4a203f7256867bd25b56a09650cd', '1.0.0', '1.0', 0xE5889DE5A78BE78988E69CACE38082, 'release/tools/371d4a203f7256867bd25b56a09650cd/1.0/371d4a203f7256867bd25b56a09650cd_1.0.0.zip', '2019-09-15 14:18:24');
INSERT INTO `tool_detail` VALUES ('5', '404dddc43c85b00eb0a87a17a29a3e24', '1.0.0', '1.0', 0xE5889DE5A78BE78988E69CACE38082, 'release/tools/404dddc43c85b00eb0a87a17a29a3e24/1.0/404dddc43c85b00eb0a87a17a29a3e24_1.0.0.zip', '2019-09-15 14:16:55');

-- ----------------------------
-- Table structure for tool_examination
-- ----------------------------
DROP TABLE IF EXISTS `tool_examination`;
CREATE TABLE `tool_examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tkey` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_base_version` varchar(255) COLLATE utf8_bin NOT NULL,
  `changelog` text COLLATE utf8_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `te_uid_fk_user_id` (`uid`),
  CONSTRAINT `te_uid_fk_user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tool_examination
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `authority` int(1) unsigned zerofill NOT NULL,
  `salt` char(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', '梦心', 'ec3aab671954024b592f4fd26db483ff', '15602291936@163.com', '1', 'mDUw6GXp7euk2RBY3HlnSPqyTJCMiVdc');
