/*
Navicat MySQL Data Transfer

Source Server         : ROOT
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : sshe

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2013-12-08 23:12:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_ent_online`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ent_online`;
CREATE TABLE `tb_ent_online` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `LOGINNAME` varchar(100) DEFAULT NULL,
  `TYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ent_online
-- ----------------------------
INSERT INTO `tb_ent_online` VALUES ('76dd9637-e21f-4e0f-be33-f99669e302e6', '2013-11-12 00:01:35', '本地', '孙宇', '1');

-- ----------------------------
-- Table structure for `tb_ent_org`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ent_org`;
CREATE TABLE `tb_ent_org` (
  `ID` varchar(36) NOT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `CODE` varchar(200) DEFAULT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `ICONCLS` varchar(100) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_acf7qlb04quthktalwx8c7q69` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ent_org
-- ----------------------------
INSERT INTO `tb_ent_org` VALUES ('0', '机构地址', null, '2013-11-11 23:58:45', 'ext-icon-brick', '一级机构', '0', '2013-11-11 23:58:45', null, null, null, null);

-- ----------------------------
-- Table structure for `tb_ent_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ent_resource`;
CREATE TABLE `tb_ent_resource` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `ICONCLS` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  `RESOURCETYPE_ID` varchar(36) DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_n8kk2inhw4y4gax3nra2etfup` (`PID`),
  KEY `FK_93qfpiiuk3rwb32gc5mcmmlgh` (`RESOURCETYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ent_resource
-- ----------------------------
INSERT INTO `tb_ent_resource` VALUES ('actionConfigBrowser', '2013-11-11 23:58:44', 'Action映射情况监控', 'ext-icon-monitor_lightning', 'Action映射监控', '3', '2013-11-11 23:58:44', '/config-browser/showConstants.sy', 'xtjk', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('appDemo', '2013-11-11 23:58:44', '桌面演示demo', 'ext-icon-award_star_gold_1', '桌面Demo', '4', '2013-11-11 23:58:44', '/demo/appDemo.jsp', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('demo', '2013-11-11 23:58:44', 'EasyUI还能做到更多，只有你想不到，没有做不到！', 'ext-icon-asterisk_orange', '其他示例', '3', '2013-11-11 23:58:44', '/welcome.jsp', null, '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('druid', '2013-11-11 23:58:44', '监控数据源', 'ext-icon-monitor_link', '数据源监控', '2', '2013-11-11 23:58:44', '/druid', 'xtjk', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('easyuiAPI', '2013-11-11 23:58:44', 'EasyUI官方API', 'ext-icon-medal_bronze_2', 'EasyUI官方API', '6', '2013-11-11 23:58:44', 'http://jeasyui.com/documentation/index.php', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('easyuiDemo', '2013-11-11 23:58:44', 'EasyUI官方Demo', 'ext-icon-medal_bronze_1', 'EasyUI官方Demo', '5', '2013-11-11 23:58:44', 'http://jeasyui.com/demo/main/index.php', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('easyuiDownload', '2013-11-11 23:58:44', 'EasyUI官方下载', 'ext-icon-medal_gold_1', 'EasyUI官方下载', '8', '2013-11-11 23:58:44', 'http://jeasyui.com/download/index.php', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('easyuiExtension', '2013-11-11 23:58:44', 'EasyUI其他扩展', 'ext-icon-medal_gold_2', 'EasyUI其他扩展', '9', '2013-11-11 23:58:44', 'http://jeasyui.com/extension/index.php', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('easyuiForum', '2013-11-11 23:58:44', 'EasyUI官方论坛', 'ext-icon-medal_gold_3', 'EasyUI官方论坛', '10', '2013-11-11 23:58:44', 'http://www.jeasyui.com/forum/index.php', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('easyuiTutorial', '2013-11-11 23:58:44', 'EasyUI辅导', 'ext-icon-medal_bronze_3', 'EasyUI进阶DEMO', '7', '2013-11-11 23:58:44', 'http://jeasyui.com/tutorial/index.php', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jgbj', '2013-11-11 23:58:44', '编辑机构', 'ext-icon-bullet_wrench', '编辑机构', '2', '2013-11-11 23:58:44', '/base/syorganization!update', 'jggl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jgck', '2013-11-11 23:58:44', '查看机构', 'ext-icon-bullet_wrench', '查看机构', '4', '2013-11-11 23:58:44', '/base/syorganization!getById', 'jggl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jggl', '2013-11-11 23:58:44', '管理系统中用户的机构', 'ext-icon-group_link', '机构管理', '3', '2013-11-11 23:58:44', '/securityJsp/base/Syorganization.jsp', 'xtgl', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jglb', '2013-11-11 23:58:44', '查询机构列表', 'ext-icon-bullet_wrench', '机构列表', '0', '2013-11-11 23:58:44', '/base/syorganization!treeGrid', 'jggl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jgsc', '2013-11-11 23:58:44', '删除机构', 'ext-icon-bullet_wrench', '删除机构', '3', '2013-11-11 23:58:44', '/base/syorganization!delete', 'jggl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jgsq', '2013-11-11 23:58:44', '机构授权', 'ext-icon-bullet_wrench', '机构授权', '5', '2013-11-11 23:58:44', '/base/syorganization!grant', 'jggl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jgtj', '2013-11-11 23:58:44', '添加机构', 'ext-icon-bullet_wrench', '添加机构', '1', '2013-11-11 23:58:44', '/base/syorganization!save', 'jggl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jsbj', '2013-11-11 23:58:44', '编辑角色', 'ext-icon-bullet_wrench', '编辑角色', '2', '2013-11-11 23:58:44', '/base/syrole!update', 'jsgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jsck', '2013-11-11 23:58:44', '查看角色', 'ext-icon-bullet_wrench', '查看角色', '4', '2013-11-11 23:58:44', '/base/syrole!getById', 'jsgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jsgl', '2013-11-11 23:58:44', '管理系统中用户的角色', 'ext-icon-tux', '角色管理', '2', '2013-11-11 23:58:44', '/roleController/manager', 'xtgl', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jslb', '2013-11-11 23:58:44', '查询角色列表', 'ext-icon-bullet_wrench', '角色列表', '0', '2013-11-11 23:58:44', '/base/syrole!grid', 'jsgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jssc', '2013-11-11 23:58:44', '删除角色', 'ext-icon-bullet_wrench', '删除角色', '3', '2013-11-11 23:58:44', '/base/syrole!delete', 'jsgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jssq', '2013-11-11 23:58:44', '角色授权', 'ext-icon-bullet_wrench', '角色授权', '5', '2013-11-11 23:58:44', '/base/syrole!grant', 'jsgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('jstj', '2013-11-11 23:58:44', '添加角色', 'ext-icon-bullet_wrench', '添加角色', '1', '2013-11-11 23:58:44', '/base/syrole!save', 'jsgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('lyDemo', '2013-11-11 23:58:44', '针对EasyUI二次开发的DEMO', 'ext-icon-award_star_bronze_1', '流云的Demo', '1', '2013-11-11 23:58:44', '/demo/lyDemo.jsp', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('monitoring', '2013-11-11 23:58:44', '监控项目', 'ext-icon-monitor_error', '项目监控', '1', '2013-11-11 23:58:44', '/monitoring', 'xtjk', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('online', '2013-11-11 23:58:44', '监控用户登录、注销', 'ext-icon-chart_line', '用户登录历史监控', '4', '2013-11-11 23:58:44', '/securityJsp/base/Syonline.jsp', 'xtjk', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('onlineGrid', '2013-11-11 23:58:44', '用户登录、注销历史记录列表', 'ext-icon-bullet_wrench', '用户登录历史列表', '0', '2013-11-11 23:58:44', '/base/syonline!grid', 'online', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('phpDemo', '2013-11-11 23:58:44', '夏悸的php demo', 'ext-icon-award_star_bronze_3', 'phpDemo', '3', '2013-11-11 23:58:44', '/demo/phpDemo.jsp', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('syproDemo', '2013-11-11 23:58:44', 'SpringMvc+Spring3+Hibernate4+Maven', 'ext-icon-award_star_bronze_2', 'SyProDemo', '2', '2013-11-11 23:58:44', '/demo/syproDemo.jsp', 'demo', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('userCreateDatetimeChart', '2013-11-11 23:58:44', '用户注册时间分布报表', 'ext-icon-chart_bar', '注册时间分布', '1', '2013-11-11 23:58:44', '/securityJsp/base/chart/userCreateDatetimeChart.jsp', 'xtbb', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('userRoleChart', '2013-11-11 23:58:44', '用户角色分布', 'ext-icon-chart_pie', '用户角色分布', '2', '2013-11-11 23:58:44', '/securityJsp/base/chart/userRoleChart.jsp', 'xtbb', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('xtbb', '2013-11-11 23:58:44', '查看系统相关报表图标', 'ext-icon-chart_curve', '系统报表', '2', '2013-11-11 23:58:44', '/welcome.jsp', null, '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('xtgl', '2013-11-11 23:58:44', '管理系统的资源、角色、机构、用户等信息', 'ext-icon-application_view_tile', '系统管理', '0', '2013-11-11 23:58:44', '/welcome.jsp', null, '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('xtjk', '2013-11-11 23:58:44', '监控系统运行情况等信息', 'ext-icon-monitor', '系统监控', '1', '2013-11-11 23:58:44', '/welcome.jsp', null, '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhbj', '2013-11-11 23:58:44', '编辑用户', 'ext-icon-bullet_wrench', '编辑用户', '2', '2013-11-11 23:58:44', '/base/syuser!update', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhck', '2013-11-11 23:58:44', '查看用户', 'ext-icon-bullet_wrench', '查看用户', '4', '2013-11-11 23:58:44', '/base/syuser!getById', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhgl', '2013-11-11 23:58:44', '管理系统中用户的用户', 'ext-icon-user_suit', '用户管理', '4', '2013-11-11 23:58:44', '/userController/manager', 'xtgl', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhjg', '2013-11-11 23:58:44', '编辑用户机构', 'ext-icon-bullet_wrench', '用户机构', '6', '2013-11-11 23:58:44', '/base/syuser!grantOrganization', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhjs', '2013-11-11 23:58:44', '编辑用户角色', 'ext-icon-bullet_wrench', '用户角色', '5', '2013-11-11 23:58:44', '/userController/grantPage', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhlb', '2013-11-11 23:58:44', '查询用户列表', 'ext-icon-bullet_wrench', '用户列表', '0', '2013-11-11 23:58:44', '/userController/dataGrid', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhsc', '2013-11-11 23:58:44', '删除用户', 'ext-icon-bullet_wrench', '删除用户', '3', '2013-11-11 23:58:44', '/userController/delete', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('yhtj', '2013-11-11 23:58:44', '添加用户', 'ext-icon-bullet_wrench', '添加用户', '1', '2013-11-11 23:58:44', '/userController/addPage', 'yhgl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('zybj', '2013-11-11 23:58:44', '编辑资源', 'ext-icon-bullet_wrench', '编辑资源', '2', '2013-11-11 23:58:44', '/base/syresource!update', 'zygl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('zyck', '2013-11-11 23:58:44', '查看资源', 'ext-icon-bullet_wrench', '查看资源', '4', '2013-11-11 23:58:44', '/base/syresource!getById', 'zygl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('zygl', '2013-11-11 23:58:44', '管理系统的资源', 'ext-icon-newspaper_link', '资源管理', '1', '2013-11-11 23:58:44', '/securityJsp/base/Syresource.jsp', 'xtgl', '0', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('zylb', '2013-11-11 23:58:44', '查询资源', 'ext-icon-bullet_wrench', '资源列表', '0', '2013-11-11 23:58:44', '/base/syresource!treeGrid', 'zygl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('zysc', '2013-11-11 23:58:44', '删除资源', 'ext-icon-bullet_wrench', '删除资源', '3', '2013-11-11 23:58:44', '/base/syresource!delete', 'zygl', '1', null, null, null);
INSERT INTO `tb_ent_resource` VALUES ('zytj', '2013-11-11 23:58:44', '添加资源', 'ext-icon-bullet_wrench', '添加资源', '1', '2013-11-11 23:58:44', '/base/syresource!save', 'zygl', '1', null, null, null);

-- ----------------------------
-- Table structure for `tb_ent_resource_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ent_resource_type`;
CREATE TABLE `tb_ent_resource_type` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ent_resource_type
-- ----------------------------
INSERT INTO `tb_ent_resource_type` VALUES ('0', '2013-11-11 23:58:44', '菜单类型会显示在系统首页左侧菜单中', '菜单', '2013-11-11 23:58:44', null, null, null);
INSERT INTO `tb_ent_resource_type` VALUES ('1', '2013-11-11 23:58:44', '功能类型不会显示在系统首页左侧菜单中', '功能', '2013-11-11 23:58:44', null, null, null);

-- ----------------------------
-- Table structure for `tb_ent_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ent_role`;
CREATE TABLE `tb_ent_role` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `ICONCLS` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ent_role
-- ----------------------------
INSERT INTO `tb_ent_role` VALUES ('0', '2013-11-11 23:58:44', '拥有系统所有权限', null, '超管', '0', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('0ff3e2f7-ff31-43f7-a341-ac76f4fc0819', '2013-11-30 01:18:51', 'BeanUtils!', null, '超管用户', '100', '2013-11-30 01:18:51', '0', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('1', '2013-11-11 23:58:44', '只有查看权限', null, 'Guest', '1', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('1d62e578-fdfe-48ef-8ae5-b30ce670ba9b', '2013-12-08 22:24:45', '', null, '12111', '100', '2013-12-08 22:24:45', '840edd58-448a-47f1-a1d5-e52eb93dcda0', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('2', '2013-11-11 23:58:44', '只有资源管理权限', null, 'admin1', '2', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('3', '2013-11-11 23:58:44', '只有角色管理权限', null, 'admin2', '3', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('4', '2013-11-11 23:58:44', '只有机构管理权限', null, 'admin3', '4', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('40cf9b11-5173-4906-b19f-a33b27d2ec0a', '2013-11-30 01:17:05', '超管角色', null, '超管角色', '100', '2013-11-30 01:17:05', '0', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('43bc9c58-8153-461f-8345-4b3ccc55c8ee', '2013-12-08 22:34:25', '', null, '333', '100', '2013-12-08 22:34:25', '1d62e578-fdfe-48ef-8ae5-b30ce670ba9b', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('4e77fcf1-9d19-49c2-935a-ac8686b83c57', '2013-12-08 22:24:25', '', null, '1222', '100', '2013-12-08 22:24:25', '840edd58-448a-47f1-a1d5-e52eb93dcda0', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('5', '2013-11-11 23:58:44', '只有用户管理权限', null, 'admin4', '5', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('6', '2013-11-11 23:58:44', '只有系统监控权限', null, 'admin5', '6', '2013-11-11 23:58:44', null, null, null, null);
INSERT INTO `tb_ent_role` VALUES ('840edd58-448a-47f1-a1d5-e52eb93dcda0', '2013-11-30 01:28:59', '超管资源', null, '超管资源', '100', '2013-11-30 01:28:59', '0', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('a212682f-f01f-415f-b67a-0403653acd6e', '2013-12-08 22:34:17', '', null, '2222', '100', '2013-12-08 22:34:17', '1d62e578-fdfe-48ef-8ae5-b30ce670ba9b', null, null, null);
INSERT INTO `tb_ent_role` VALUES ('f440076c-db82-4ec0-a348-ff9c7e7cb493', '2013-12-05 22:14:25', '', null, '1121', '100', '2013-12-05 22:14:25', '840edd58-448a-47f1-a1d5-e52eb93dcda0', null, null, null);

-- ----------------------------
-- Table structure for `tb_ent_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ent_user`;
CREATE TABLE `tb_ent_user` (
  `ID` varchar(36) NOT NULL,
  `AGE` int(11) DEFAULT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `LOGINNAME` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PHOTO` varchar(200) DEFAULT NULL,
  `PWD` varchar(100) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `UPDATEDATETIME` datetime DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ent_user
-- ----------------------------
INSERT INTO `tb_ent_user` VALUES ('0', '30', '2013-11-11 23:58:45', '孙宇', '孙宇', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '2013-11-11 23:58:45', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('1', '30', '2013-11-11 23:58:46', 'guest', 'guest', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('11', '33', '2013-11-11 23:58:46', 'guest11', 'guest11', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('12', '34', '2013-11-11 23:58:46', 'admin111', 'admin111', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('13', '35', '2013-11-11 23:58:46', 'admin211', 'admin211', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('14', '36', '2013-11-11 23:58:46', 'admin311', 'admin311', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('15', '37', '2013-11-11 23:58:46', 'admin411', 'admin411', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('16', '38', '2013-11-11 23:58:46', 'admin511', 'admin511', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('18b138bf-0baa-453b-bfca-ccdbec89df64', null, '2013-11-24 18:08:59', 'snipe', '苏群', null, '96e79218965eb72c92a549dd5a330112', null, '2013-11-24 22:01:55', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('2', '30', '2013-11-11 23:58:46', 'admin1', 'admin1', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('3', '30', '2013-11-11 23:58:46', 'admin2', 'admin2', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('4', '30', '2013-11-11 23:58:46', 'admin3', 'admin3', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('5', '30', '2013-11-11 23:58:46', 'admin4', 'admin4', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('6', '30', '2013-11-11 23:58:46', 'admin5', 'admin5', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2013-11-11 23:58:46', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('7', '30', '2013-11-17 12:33:09', 'guest1', 'guest1', null, 'e10adc3949ba59abbe56e057f20f883e', null, '2013-11-29 12:35:14', null, null, null);
INSERT INTO `tb_ent_user` VALUES ('8', '30', '2013-11-17 12:34:29', 'guest2', 'guest2', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '2013-11-17 12:34:44', null, null, null);

-- ----------------------------
-- Table structure for `tb_rel_org_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_rel_org_resource`;
CREATE TABLE `tb_rel_org_resource` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `ORG_ID` varchar(36) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`,`RESOURCE_ID`),
  KEY `FK_acpjp8a7fjo0cnn02eb0ia6uf` (`ORG_ID`),
  KEY `FK_m4mfglk7odi78d8pk9pif44vc` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rel_org_resource
-- ----------------------------
INSERT INTO `tb_rel_org_resource` VALUES ('jgck', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('jggl', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('jglb', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('jsck', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('jsgl', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('jslb', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('xtgl', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('yhck', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('yhgl', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('yhlb', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('zyck', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('zygl', '0', null, null, null, null, null);
INSERT INTO `tb_rel_org_resource` VALUES ('zylb', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `tb_rel_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_rel_role_resource`;
CREATE TABLE `tb_rel_role_resource` (
  `ROLE_ID` varchar(36) NOT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `CAREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`ROLE_ID`),
  KEY `FK_kkrartsovl2frhfvriqdi7jwl` (`RESOURCE_ID`),
  KEY `FK_r139h669pg4ts6mbvn3ip5472` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rel_role_resource
-- ----------------------------
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'actionConfigBrowser', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('6', 'actionConfigBrowser', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'appDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'appDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'demo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'demo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'druid', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('6', 'druid', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'easyuiAPI', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'easyuiAPI', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'easyuiDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'easyuiDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'easyuiDownload', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'easyuiDownload', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'easyuiExtension', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'easyuiExtension', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'easyuiForum', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'easyuiForum', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'easyuiTutorial', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'easyuiTutorial', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jgbj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jgbj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jgck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'jgck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jgck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jggl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'jggl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jggl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jglb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'jglb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jglb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jgsc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jgsc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jgsq', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jgsq', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jgtj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('4', 'jgtj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jsbj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jsbj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jsck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'jsck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jsck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jsgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'jsgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jsgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jslb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'jslb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jslb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jssc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jssc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jssq', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jssq', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'jstj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('3', 'jstj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'lyDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'lyDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'monitoring', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('6', 'monitoring', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'online', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('6', 'online', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'onlineGrid', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('6', 'onlineGrid', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'phpDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'phpDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'syproDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'syproDemo', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'userCreateDatetimeChart', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'userRoleChart', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'xtbb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'xtgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'xtgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'xtjk', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('6', 'xtjk', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhbj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhbj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'yhck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'yhgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhgl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhjg', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhjg', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhjs', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhjs', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhlb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'yhlb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhlb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhsc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhsc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'yhtj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('5', 'yhtj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'zybj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('2', 'zybj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'zyck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'zyck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('2', 'zyck', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'zygl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'zygl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('2', 'zygl', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'zylb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('1', 'zylb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('2', 'zylb', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'zysc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('2', 'zysc', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('0', 'zytj', null, null, null, null, null);
INSERT INTO `tb_rel_role_resource` VALUES ('2', 'zytj', null, null, null, null, null);

-- ----------------------------
-- Table structure for `tb_rel_user_org`
-- ----------------------------
DROP TABLE IF EXISTS `tb_rel_user_org`;
CREATE TABLE `tb_rel_user_org` (
  `USER_ID` varchar(36) NOT NULL,
  `ORG_ID` varchar(36) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`,`USER_ID`),
  KEY `FK_14ewqc5wtscac0dd5rswrm5j2` (`ORG_ID`),
  KEY `FK_63bdmtxwlk259id13rp4iryy` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rel_user_org
-- ----------------------------
INSERT INTO `tb_rel_user_org` VALUES ('0', '0', null, null, null, null, null);
INSERT INTO `tb_rel_user_org` VALUES ('1', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `tb_rel_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_rel_user_role`;
CREATE TABLE `tb_rel_user_role` (
  `USER_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `CREATEUSERID` varchar(36) DEFAULT NULL,
  `UPDATEUSERID` varchar(36) DEFAULT NULL,
  `DATASTATE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `FK_j7iwtgslc2esrjx0ptieleoko` (`ROLE_ID`),
  KEY `FK_1pi4p5h4y5ghbs5f4gdlgn620` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rel_user_role
-- ----------------------------
INSERT INTO `tb_rel_user_role` VALUES ('0', '0', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '1', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('1', '1', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '1d62e578-fdfe-48ef-8ae5-b30ce670ba9b', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '2', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('2', '2', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '3', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('3', '3', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '4', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('4', '4', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '43bc9c58-8153-461f-8345-4b3ccc55c8ee', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '4e77fcf1-9d19-49c2-935a-ac8686b83c57', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '5', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('5', '5', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '6', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('6', '6', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', '840edd58-448a-47f1-a1d5-e52eb93dcda0', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', 'a212682f-f01f-415f-b67a-0403653acd6e', null, null, null, null, null);
INSERT INTO `tb_rel_user_role` VALUES ('0', 'f440076c-db82-4ec0-a348-ff9c7e7cb493', null, null, null, null, null);
