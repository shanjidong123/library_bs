/*
Navicat MySQL Data Transfer

Source Server         : host
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : library_bs

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-03-15 17:38:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bd_countryzone
-- ----------------------------
DROP TABLE IF EXISTS `bd_countryzone`;
CREATE TABLE `bd_countryzone` (
  `code` varchar(40) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `pk_timezone` varchar(20) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `phonecode` varchar(20) DEFAULT NULL,
  `wholename` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pk_lang` varchar(50) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `pk_country` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`pk_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd_countryzone
-- ----------------------------

-- ----------------------------
-- Table structure for bookborrow
-- ----------------------------
DROP TABLE IF EXISTS `bookborrow`;
CREATE TABLE `bookborrow` (
  `booktype_name` varchar(100) DEFAULT NULL,
  `def3` varchar(50) DEFAULT NULL,
  `login_user` varchar(50) DEFAULT NULL,
  `price_rent` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `pk_booktype` varchar(50) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `provisions_back` varchar(50) DEFAULT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `def2` varchar(50) DEFAULT NULL,
  `def4` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `def1` varchar(100) DEFAULT NULL,
  `timeout_length` varchar(50) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookborrow
-- ----------------------------
INSERT INTO `bookborrow` VALUES ('数理', null, 'admin', '2', '0011', 'fe0418ee-45a8-4fa3-9ee3-1cdfd692f6a6', 'cb47d720-f82b-4712-b1d1-29cd013637ab', '已归还', '2019-02-22 15:17:29', '清华大学出版社', '2019-02-19 15:17:29', null, '高数', '0', '2', '2019-02-19 15:17:30', '0');
INSERT INTO `bookborrow` VALUES ('数理', null, 'user', '2', '0011', 'fe0418ee-45a8-4fa3-9ee3-1cdfd692f6a6', 'f8c1e771-c59c-4655-af12-38f07fd6225d', '已归还', '2019-02-23 12:55:38', '清华大学出版社', '2019-02-20 12:55:38', null, '高数', '0', '7', '2019-02-20 12:55:38', '0');

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `code` varchar(100) NOT NULL,
  `id` char(36) NOT NULL,
  `booktype_name` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `pk_booktype` varchar(50) DEFAULT NULL,
  `price_rent` varchar(100) DEFAULT NULL,
  `def2` varchar(50) DEFAULT NULL,
  `def1` varchar(100) DEFAULT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('0011', '9a21a24a-7a53-4850-86fb-a83c2c76f781', '数理', '高数', 'fe0418ee-45a8-4fa3-9ee3-1cdfd692f6a6', '2', null, '0', '清华大学出版社', '2019-02-16 09:20:46', '0');
INSERT INTO `bookinfo` VALUES ('0003', 'f3b51fab-fa27-4460-801f-8ab283b80d22', '野史', '元史', 'c84b6824-6137-4fb0-b3d0-e39a6a4c82c4', '1', 'admin', '0', '河北师范大学出版社', '2019-02-16 14:02:44', '0');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `def3` varchar(50) DEFAULT NULL,
  `def2` varchar(50) DEFAULT NULL,
  `book_num` varchar(50) DEFAULT NULL,
  `def1` varchar(50) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `add_person` varchar(50) DEFAULT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sort` varchar(50) DEFAULT NULL,
  `parent_id_name` varchar(50) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES (null, null, '2', null, null, '小单', '0001', '图书类别', '1', null, '3323abd2-4df2-4e58-bc08-128376cb93a9', '2019-01-17 10:41:38', '0');
INSERT INTO `booktype` VALUES (null, null, '1', null, '3323abd2-4df2-4e58-bc08-128376cb93a9', '琪琪', '0011', '野史', '1', '图书类别', 'c84b6824-6137-4fb0-b3d0-e39a6a4c82c4', '2019-01-17 11:33:12', '0');
INSERT INTO `booktype` VALUES (null, null, '1', null, '3323abd2-4df2-4e58-bc08-128376cb93a9', 'xxxddd', '0012', '数理', '2', '图书类别', 'fe0418ee-45a8-4fa3-9ee3-1cdfd692f6a6', '2019-02-15 10:05:45', '0');

-- ----------------------------
-- Table structure for cardtable
-- ----------------------------
DROP TABLE IF EXISTS `cardtable`;
CREATE TABLE `cardtable` (
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `pk_system` varchar(50) NOT NULL,
  `i18n` varchar(50) DEFAULT NULL,
  `gateway` varchar(100) DEFAULT NULL,
  `radiodatacontroller` varchar(50) DEFAULT NULL,
  `radiodataassociate` varchar(50) DEFAULT NULL,
  `combodatamodel` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `system` varchar(50) DEFAULT NULL,
  `tenant` varchar(50) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT NULL,
  `secretkey` varchar(50) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardtable
-- ----------------------------
INSERT INTO `cardtable` VALUES ('考评系统', '005', '2fa142a7-2107-40fc-a3c4-2b5bd9a3643e', null, '172.20.8.18', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:58');
INSERT INTO `cardtable` VALUES ('决策系统', '002', '37caed5b-0ff9-4ff1-9663-5e399fe8c88b', null, '172.20.8.15', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:15');
INSERT INTO `cardtable` VALUES ('报销系统', '004', '6d106901-c737-4bd1-b238-f2251923e5ad', null, '172.20.8.17', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:41');
INSERT INTO `cardtable` VALUES ('邮件系统', '001', '70e27aa7-c4a7-4aa7-a330-b7ec441a8313', null, '172.20.8.14', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:22:54');
INSERT INTO `cardtable` VALUES ('门户系统', '006', '963ae96f-2de6-425e-bbb0-2c1eef89ce08', null, '172.20.8.19', 'N', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:24:24');
INSERT INTO `cardtable` VALUES ('测试系统', '003', 'af527c77-5893-43a6-94f5-efd27deb9b42', null, '172.20.8.16', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:27');

-- ----------------------------
-- Table structure for cardtablemeta
-- ----------------------------
DROP TABLE IF EXISTS `cardtablemeta`;
CREATE TABLE `cardtablemeta` (
  `radiodataassociate` varchar(50) DEFAULT NULL,
  `radiodatacontroller` varchar(50) DEFAULT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `combodatamodel` varchar(50) DEFAULT NULL,
  `gateway` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `pk_system` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`pk_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardtablemeta
-- ----------------------------
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '001', '邮件系统', 'Y', '172.20.8.14', null, null, '07ff6b9c-3496-49f2-8958-307439abc5d4', '2016-12-15 10:36:01', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '006', '门户系统', 'Y', '172.20.8.19', null, null, '76ce0e72-0dfb-49d8-9c32-80713b6a9488', '2016-12-15 10:37:28', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '002', '决策系统', 'Y', '172.20.8.15', null, null, 'b9cd70a0-f46c-43bc-9fd2-967c948c3ef6', '2016-12-15 10:36:36', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '005', '考评系统', 'Y', '172.20.8.18', null, null, 'cb636c1b-6f83-45b8-bde0-d07de3c1b608', '2016-12-15 10:37:17', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '004', '报销系统', 'Y', '172.20.8.17', null, null, 'f7362fe4-8d4a-4c50-9e8c-f5208dbe262f', '2016-12-15 10:37:03', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '003', '测试系统', 'Y', '172.20.8.16', null, null, 'ffafedc6-19bc-4ecb-80a9-1054009f38f5', '2016-12-15 10:36:51', '0');

-- ----------------------------
-- Table structure for collegeinfo
-- ----------------------------
DROP TABLE IF EXISTS `collegeinfo`;
CREATE TABLE `collegeinfo` (
  `def2` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `collegetype_name` varchar(100) DEFAULT NULL,
  `login_status` varchar(50) DEFAULT NULL,
  `def1` varchar(100) DEFAULT NULL,
  `pk_collegetype` varchar(50) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collegeinfo
-- ----------------------------
INSERT INTO `collegeinfo` VALUES (null, '2015015190', '邢旭东', '软件学院', '已授权', null, '7ae69fb4-5741-4246-9fbb-d8b024a31f87', '9b1bd5e7-8e2b-4f5d-a497-49d4b4ce4cf0', '2019-03-15 10:39:33', '0');

-- ----------------------------
-- Table structure for collegetype
-- ----------------------------
DROP TABLE IF EXISTS `collegetype`;
CREATE TABLE `collegetype` (
  `id` char(36) NOT NULL,
  `name` varchar(200) NOT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `code` varchar(200) NOT NULL,
  `parent_id_name` varchar(50) DEFAULT NULL,
  `student_num` varchar(50) DEFAULT NULL,
  `def3` varchar(50) DEFAULT NULL,
  `def2` varchar(50) DEFAULT NULL,
  `sort` varchar(50) DEFAULT NULL,
  `def1` varchar(50) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collegetype
-- ----------------------------
INSERT INTO `collegetype` VALUES ('7ae69fb4-5741-4246-9fbb-d8b024a31f87', '软件学院', 'e49224df-77fb-4796-9bf7-763e42c17cce', '00010', '河北师范大学', '1', null, null, '0', null, '2019-03-14 16:49:44', '0');
INSERT INTO `collegetype` VALUES ('e49224df-77fb-4796-9bf7-763e42c17cce', '河北师范大学', null, '0001', null, '1', null, null, '0', null, '2019-03-14 16:48:44', '0');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `parent_id` varchar(36) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `dept_type` varchar(20) DEFAULT NULL,
  `org_id` varchar(50) NOT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `dept_code` varchar(40) NOT NULL,
  `deptcanceldate` datetime DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `pk_dept` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`pk_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '同江区域组', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '李国志', '北京区域组', '40506', '2016-11-17 10:21:32', '2016-11-17 10:21:24', '2016-11-17 10:21:15', '18aa2958-60bb-436f-8e64-0343e8f108f7', '2016-11-17 10:21:34', '0');
INSERT INTO `dept` VALUES (null, '小贷业务部', '1', '857cc73f-1a08-4053-b717-09404168f081', '徐杰春', 'IUAP运维部', '40801', '2016-11-17 10:24:18', '2016-11-17 10:24:10', '2016-11-17 10:24:02', '29b6597a-5727-405f-b9c6-c72c381d8d8f', '2016-11-17 10:24:20', '0');
INSERT INTO `dept` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', '富锦风险管理部', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '王长林', '风险管理部', '40502', '2016-11-17 10:22:38', '2016-11-17 10:22:29', '2016-11-17 10:22:20', '383a50d4-5a78-4004-8fa0-932945cc0949', '2016-11-17 10:22:41', '0');
INSERT INTO `dept` VALUES (null, null, '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '王仰波', '北京高管', '40509', '2016-11-17 10:23:31', '2016-11-17 10:23:25', '2016-11-17 10:23:18', '56b5e6e8-2656-46f8-b1a8-f42a42140c88', '2016-11-17 10:23:33', '0');
INSERT INTO `dept` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '绥滨区域组', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '宋广民', '上海区域组', '40505', '2016-11-17 10:20:50', '2016-11-17 10:20:11', '2016-11-17 10:19:56', 'aa38692e-7398-436a-b2b8-a1440821774c', '2016-11-17 10:20:53', '0');
INSERT INTO `dept` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '富锦区域组', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '徐立国', 'IUAP平台部', '40503', '2016-09-23 10:35:40', '2016-09-23 10:35:40', '2016-09-23 10:35:40', 'b676078b-a786-4c76-ab80-f5a9b7418e98', '2016-09-23 10:35:40', '0');
INSERT INTO `dept` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', '富锦单证部', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '刘馥嘉', '单证部', '40504', '2016-11-17 10:19:29', '2016-11-17 10:19:20', '2016-11-17 10:19:10', 'ead53046-cf02-44ac-8ed1-23cee26f6159', '2016-11-17 10:19:32', '0');

-- ----------------------------
-- Table structure for ext_bookborrow
-- ----------------------------
DROP TABLE IF EXISTS `ext_bookborrow`;
CREATE TABLE `ext_bookborrow` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_bookborrow
-- ----------------------------

-- ----------------------------
-- Table structure for ext_bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `ext_bookinfo`;
CREATE TABLE `ext_bookinfo` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_bookinfo
-- ----------------------------

-- ----------------------------
-- Table structure for ext_booktype
-- ----------------------------
DROP TABLE IF EXISTS `ext_booktype`;
CREATE TABLE `ext_booktype` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_booktype
-- ----------------------------

-- ----------------------------
-- Table structure for ext_collegeinfo
-- ----------------------------
DROP TABLE IF EXISTS `ext_collegeinfo`;
CREATE TABLE `ext_collegeinfo` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_collegeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for ext_collegetype
-- ----------------------------
DROP TABLE IF EXISTS `ext_collegetype`;
CREATE TABLE `ext_collegetype` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_collegetype
-- ----------------------------

-- ----------------------------
-- Table structure for ext_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `ext_loginlog`;
CREATE TABLE `ext_loginlog` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_loginlog
-- ----------------------------

-- ----------------------------
-- Table structure for ext_payfine
-- ----------------------------
DROP TABLE IF EXISTS `ext_payfine`;
CREATE TABLE `ext_payfine` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_payfine
-- ----------------------------

-- ----------------------------
-- Table structure for instit
-- ----------------------------
DROP TABLE IF EXISTS `instit`;
CREATE TABLE `instit` (
  `parent_id` varchar(36) DEFAULT NULL,
  `instit_code` varchar(200) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `instit_type` varchar(10) DEFAULT NULL,
  `instit_name` varchar(200) NOT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `institid` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`institid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instit
-- ----------------------------
INSERT INTO `instit` VALUES (null, '100', null, '象屿集团', null, '用友网络集团有限公司', 'Admin', '2016-09-22 09:56:57', '3f362161-e32b-4e59-b703-df11d871244e', '2016-09-22 09:56:57', '0');
INSERT INTO `instit` VALUES ('3f362161-e32b-4e59-b703-df11d871244e', '002', null, '测试部门', null, '用友网络测试部门', null, '2016-09-22 09:56:57', '46c6129e-05f0-43f3-997f-bc672aebec7c', '2016-12-14 09:55:43', '0');
INSERT INTO `instit` VALUES ('3f362161-e32b-4e59-b703-df11d871244e', '200', null, '象屿股份', null, '用友网络IUAP开发平台', 'Admin', '2016-09-22 09:56:57', '761dc79a-69ac-490b-8868-4e1e4f42d039', '2016-09-22 09:56:57', '0');
INSERT INTO `instit` VALUES ('46c6129e-05f0-43f3-997f-bc672aebec7c', '003', null, '测试小组', null, '用友网络IUAP开发测试小组', null, '2016-09-22 09:56:57', '98d0c98d-24f3-49e3-9343-df6c4d2b6cd5', '2016-12-15 10:29:23', '0');

-- ----------------------------
-- Table structure for loginlog
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `login_ip` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `def2` varchar(50) DEFAULT NULL,
  `def1` varchar(100) DEFAULT NULL,
  `login_time` varchar(100) NOT NULL,
  `id` char(36) NOT NULL,
  `login_type` varchar(100) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES ('10.6.211.60', 'Admin', null, null, '2019-03-15 15:43:33', '4f1e84f5-9e1e-47ea-8972-b6b5190d9932', 'PC', '2019-03-15 15:43:34', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', 'Admin', null, null, '2019-03-15 15:18:10', '58e03bc3-caa6-4efb-ae77-376950f4a904', 'PC', '2019-03-15 15:18:11', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', '邢旭东', null, null, '2019-03-15 16:55:07', '5c8f24d6-bfee-4318-9e70-0e134b34eda7', 'PC', '2019-03-15 16:55:08', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', '邢旭东', null, null, '2019-03-15 15:44:16', '68986f2e-b623-4587-b43d-b9d57191699e', 'PC', '2019-03-15 15:44:17', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', '邢旭东', null, null, '2019-03-15 16:57:53', 'bc8ab1f7-74c7-4541-a31a-0b2f7099f8a5', 'PC', '2019-03-15 16:57:54', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', '邢旭东', null, null, '2019-03-15 16:33:46', 'd54d40ce-e11d-4032-a8c3-db7bd40fa664', 'PC', '2019-03-15 16:33:47', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', '邢旭东', null, null, '2019-03-15 17:24:31', 'df93e66f-47ca-433a-87aa-a3e3194ca45c', 'PC', '2019-03-15 17:24:32', '0');
INSERT INTO `loginlog` VALUES ('10.6.211.60', '邢旭东', null, null, '2019-03-15 16:34:15', 'e95ab1eb-0c9c-46f6-9f79-4fc7934ef46c', 'PC', '2019-03-15 16:34:16', '0');

-- ----------------------------
-- Table structure for md_accessorpara
-- ----------------------------
DROP TABLE IF EXISTS `md_accessorpara`;
CREATE TABLE `md_accessorpara` (
  `id` varchar(128) NOT NULL,
  `assosequence` smallint(6) NOT NULL,
  `paravalue` varchar(512) DEFAULT NULL,
  `versiontype` smallint(6) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`assosequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_accessorpara
-- ----------------------------

-- ----------------------------
-- Table structure for md_association
-- ----------------------------
DROP TABLE IF EXISTS `md_association`;
CREATE TABLE `md_association` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(60) NOT NULL,
  `componentid` varchar(50) DEFAULT NULL,
  `startbeanid` varchar(50) NOT NULL,
  `startelementid` varchar(50) NOT NULL,
  `endelementid` varchar(50) NOT NULL,
  `startcardinality` varchar(10) DEFAULT NULL,
  `endcardinality` varchar(10) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `cascadeupdate` char(1) DEFAULT NULL,
  `cascadedelete` char(1) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_association
-- ----------------------------
INSERT INTO `md_association` VALUES ('5e351a05-5430-4163-a4b2-8cdbdcc10678', '0', 'dept_parentid', 'a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', '17ffb644-c70c-48de-a47f-c5b53f75460f', 'b1b3407c-71a9-4944-ac3e-2e4f1f4a03c4', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_association` VALUES ('61113bce-c0f6-4dc7-aa6c-311b2d4e4925', '0', 'sysUserJob_orgid', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'e37eed0f-507c-4c84-92f5-7c83644844f8', '073683a2-12c5-4fc2-9008-be234c27c43f', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_association` VALUES ('6acda406-7230-4156-8eff-3629864e3134', '0', 'org_parentid', 'f7adbc5a-fc68-40bb-a18c-3a7fc4dbd606', '8254a6a2-5933-422e-b4bb-f13d1d22108a', 'de44d0af-7538-41dd-8efd-a5b11940ba25', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_association` VALUES ('81ace1f6-f0a3-48b8-a806-07d1edb26e1c', '0', 'telbook_countryzone', '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '4bdf8034-83f4-48d4-8e2c-04aca3693586', '16df9de7-2ac7-4458-a95d-185619fe66a4', '08ffeabe-e01d-4072-a4c3-025345386ebb', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_association` VALUES ('863c3d6b-92b1-4597-a236-62fcf6a4661c', '0', 'sysUser_orgid', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'af352b2f-4281-4f55-92e5-fdd095bbdff5', '7fc16fb0-71ee-4daf-951b-e524a0051bc7', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_association` VALUES ('8b1762aa-5c3c-48a3-b240-bfb8f39207a5', '0', 'Aggregation Relation', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'af352b2f-4281-4f55-92e5-fdd095bbdff5', '61c291c3-506c-4673-81da-b1e718e56fbc', 'e37eed0f-507c-4c84-92f5-7c83644844f8', '1', '1..n', '1', null, null, null, null, null, '2016-11-08 09:45:49', '2016-11-08 09:45:49', '0', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_association` VALUES ('a99555b2-c8ba-4dba-9b2f-419ac3872384', '0', 'Aggregation Relation', '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1462bbcc-84be-46df-bde4-03037203216b', '4bdf8034-83f4-48d4-8e2c-04aca3693586', '1', '1..n', '1', null, null, null, null, null, '2016-12-13 13:12:28', '2016-12-13 13:12:28', '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_association` VALUES ('abc14967-3709-465b-9a71-55175aca03ad', '0', 'instit_parentid', '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '2c3c1f2b-2c3c-49f9-b7fe-fcff773f4749', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_association` VALUES ('caab159b-b894-44a6-abc9-91cf8fbe74fb', '0', 'sysUserJob_deptid', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'e37eed0f-507c-4c84-92f5-7c83644844f8', 'f564d08b-04d2-49d2-8c44-dafa11ec758b', '17ffb644-c70c-48de-a47f-c5b53f75460f', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:06', '0');

-- ----------------------------
-- Table structure for md_bizitfmap
-- ----------------------------
DROP TABLE IF EXISTS `md_bizitfmap`;
CREATE TABLE `md_bizitfmap` (
  `bizinterfaceid` varchar(50) NOT NULL,
  `intattrid` varchar(50) NOT NULL,
  `classid` varchar(50) NOT NULL,
  `classattrid` varchar(50) DEFAULT NULL,
  `bizitfimpclassname` varchar(256) DEFAULT NULL,
  `classattrpath` varchar(512) DEFAULT NULL,
  `versiontype` smallint(6) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`intattrid`,`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_bizitfmap
-- ----------------------------
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', '5dd3c721-22ad-42b1-9c10-4351c236bc77', '08ffeabe-e01d-4072-a4c3-025345386ebb', 'a38c429f-caeb-413f-8b1f-a3727a75ce4e', null, null, null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', '89578a97-42fe-439b-827c-8eabd9e3604c', '08ffeabe-e01d-4072-a4c3-025345386ebb', '449282ce-da9c-44c3-9f97-75dec757519b', null, null, null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', 'c8334364-7ab9-4266-8d4b-e74537935e46', '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', 'd32cc17b-f415-415a-923f-0764443eb102', '08ffeabe-e01d-4072-a4c3-025345386ebb', '2702b115-ae64-471f-a12a-0ffb85d5a61c', null, null, null, null, null, '2016-12-15 09:49:19', '0');

-- ----------------------------
-- Table structure for md_class
-- ----------------------------
DROP TABLE IF EXISTS `md_class`;
CREATE TABLE `md_class` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `parentclassid` varchar(50) DEFAULT NULL,
  `componentid` varchar(50) DEFAULT NULL,
  `keyattribute` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `fullclassname` varchar(256) DEFAULT NULL,
  `classtype` smallint(6) DEFAULT NULL,
  `accessorclassname` varchar(256) DEFAULT NULL,
  `fixedlength` char(1) DEFAULT NULL,
  `precise` smallint(6) DEFAULT NULL,
  `refmodelname` varchar(768) DEFAULT NULL,
  `returntype` varchar(50) DEFAULT NULL,
  `isprimary` char(1) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `isauthen` char(1) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `bizitfimpclassname` varchar(256) DEFAULT NULL,
  `modinfoclassname` varchar(256) DEFAULT NULL,
  `iscreatesql` char(1) DEFAULT NULL,
  `defaulttablename` varchar(50) DEFAULT NULL,
  `isextendbean` char(1) DEFAULT NULL,
  `userdefclassname` varchar(256) DEFAULT NULL,
  `stereotype` varchar(256) DEFAULT NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_class
-- ----------------------------
INSERT INTO `md_class` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '0', null, '7ab0a8fc-d04b-4ac5-811d-5d19fa67c174', 'a38c429f-caeb-413f-8b1f-a3727a75ce4e', 'countryzone', '国家地区', null, null, 'com.yonyou.iuap.example.entity.meta.Countryzone', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-16 11:11:17', '2016-12-13 14:58:33', 'Y', null, null, null, 'Y', 'bd_countryzone', null, null, null, '0', null, '2016-12-15 09:49:18', '0');
INSERT INTO `md_class` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '0', null, 'a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', '03fd3103-1d97-43ea-a122-9e0cc1196359', 'dept', '部门', null, null, 'com.yonyou.iuap.example.entity.meta.Dept', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-16 10:53:23', '2016-12-14 14:00:00', 'Y', null, null, null, 'Y', 'dept', null, null, null, '0', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_class` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '0', null, '2ffbee6a-001e-4459-a7ba-8f14e45a41b8', 'f1c3dfb6-2d26-4f85-8173-efa3a1a412be', 'cardTableMeta', '卡片列表', null, null, 'com.yonyou.iuap.example.entity.meta.CardTableMeta', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-12-12 15:03:23', '2016-12-13 14:58:29', 'Y', null, null, null, 'Y', 'cardTableMeta', null, null, null, '0', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_class` VALUES ('4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '0', null, 'a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', null, 'DeptType', '部门类型', null, null, 'com.yonyou.iuap.example.entity.meta.DeptType', '203', null, null, null, null, 'BS000010000100001001', 'N', null, null, null, '2016-11-16 11:00:09', '2016-12-14 13:58:18', null, null, null, null, null, 'DeptType', null, null, null, '0', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_class` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '0', null, '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '45259f0e-2d6e-4fd2-bc56-51a322860eed', 'telbook', '通讯录', null, null, 'com.yonyou.iuap.example.entity.meta.Telbook', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'N', null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', 'Y', null, null, null, 'Y', 'telbook', null, null, null, '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_class` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '0', null, '69e130c8-466b-45a6-8eb2-8de1804ac6da', 'fbe1071e-267d-40ce-b7bc-4f9c31be98bf', 'bookType', '图书类别', null, null, 'com.yonyou.iuap.bookManagement.pojo.BookType', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-01-16 14:36:21', '2019-01-16 15:13:46', 'Y', null, null, null, 'Y', 'bookType', null, null, null, '0', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_class` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '0', null, '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '2b8fdeeb-577c-417d-8e90-627b8fed67e6', 'instit', '机构', null, null, 'com.yonyou.iuap.example.entity.meta.Instit', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', 'Y', null, null, null, 'Y', 'instit', null, null, null, '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_class` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '0', null, 'c71a9a96-2d46-4694-8f9c-1f78a9571602', '8dd33bc5-25cf-41e6-b586-85b6be484dd3', 'loginLog', '登录日志', null, null, 'com.yonyou.iuap.system.entity.LoginLog', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-03-15 14:19:32', '2019-03-15 14:38:23', 'Y', null, null, null, 'Y', 'loginLog', null, null, null, '0', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_class` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', '0', null, 'aa1e1c21-6241-4134-a71a-05624e14140f', null, 'IBDObject', 'IBDObject', null, null, 'com.yonyou.iuap.example.entity.meta.IBDObject', '206', null, null, null, null, null, 'N', null, null, null, '2008-02-20 13:38:36', '2016-11-16 15:20:12', null, null, null, null, null, 'IBDObject', null, null, null, '0', null, '2016-12-15 09:49:23', '0');
INSERT INTO `md_class` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '0', null, 'f7adbc5a-fc68-40bb-a18c-3a7fc4dbd606', 'bc9aa608-9761-450a-a718-7feaa0df2429', 'org', '组织', null, null, 'com.yonyou.iuap.example.entity.meta.Org', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-07 13:30:47', '2016-12-14 13:59:45', 'Y', null, null, null, 'Y', 'org', null, null, null, '0', null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_class` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', '0', null, '72dcb4ff-d80b-47db-9472-2b35ab0a41b6', 'fc314a39-47a5-4a88-ba48-4bb307d56879', 'CollegeInfo', '学生信息', null, null, 'com.yonyou.iuap.collegeManagement.pojo.CollegeInfo', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-03-14 17:02:24', '2019-03-15 09:36:27', 'Y', null, null, null, 'Y', 'CollegeInfo', null, null, null, '0', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_class` VALUES ('90c3c346-8efe-4e48-b892-23e7b2d5f096', '0', null, '65579d3f-110c-4fdf-8d0b-63ba24007a3d', null, 'Sex', '性别', null, null, 'com.yonyou.iuap.example.entity.meta.Sex', '203', null, null, null, null, 'BS000010000100001001', 'N', null, null, null, '2016-12-13 13:12:51', '2016-12-14 09:58:47', null, null, null, null, null, 'Sex', null, null, null, '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_class` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '0', null, '0f1d958f-39a5-41f8-b977-551f360f40a3', '01a74741-fa52-477a-a58e-5565db36de0b', 'sysUser', '用户管理表', null, null, 'com.yonyou.iuap.example.entity.meta.SysUser', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-08 09:18:08', '2016-12-14 14:15:14', 'Y', null, null, null, 'Y', 'sys_user', null, null, null, '0', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001001', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'String', '字符串', 'String', 'String', 'java.lang.String', '1', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000015', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001004', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Integer', '整数', 'Integer', 'Integer', 'java.lang.Integer', '4', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000002', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001015', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'BigInteger', '长整数', 'BigInteger', 'BigInteger', 'java.math.BigInteger', '15', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000002', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001030', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'MEMO', '备注', '备注', 'MEMO', 'java.lang.String', '30', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000003', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001031', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Double', '数值', 'Double', 'Double', 'java.lang.Double', '31', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000012', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001032', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Boolean', '布尔类型', 'Boolean', 'Boolean', 'java.lang.Boolean', '32', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000016', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001033', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Date', '日期', 'Date', 'Date', 'java.util.Date', '33', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000007', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001034', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'DateTime', '日期时间', 'DateTime', 'DateTime', 'java.util.Date', '34', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000010', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001036', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Time', '时间', 'Time', 'Time', 'java.util.Date', '36', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000011', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001037', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'DateBegin', '日期(开始)', 'DateBegin', 'DateBegin', 'java.util.Date', '37', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000009', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001038', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'DateEnd', '日期(结束)', 'DateEnd', 'DateEnd', 'java.util.Date', '38', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000008', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001039', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'LiteralDate', '模糊日期', 'LiteralDate', 'LiteralDate', 'java.util.Date', '39', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000006', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001040', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'BigDecimal', 'BigDecimal', 'BigDecimal', 'BigDecimal', 'java.math.BigDecimal', '40', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', null, null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001051', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'ID', '主键', 'ID', 'ID', 'java.lang.String', '51', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000017', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001052', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Money', '金额', 'Money', 'Money', 'java.math.BigDecimal', '52', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000005', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001053', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'BLOB', 'BLOB', 'BLOB', 'BLOB', 'java.lang.Object', '53', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', null, null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001054', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'CLOB', 'CLOB', 'CLOB', 'CLOB', 'java.lang.String', '54', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', null, null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001055', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'IMAGE', '图片类型', '图片类型', 'IMAGE', 'java.lang.Object', '55', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000018', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001056', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'CUSTOM', '自定义项', '自定义项', 'CUSTOM', 'java.lang.String', '56', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000013', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001058', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'MULTILANGTEXT', '多语文本', '多语文本', 'MULTILANGTEXT', 'java.lang.String', '58', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000004', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001059', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'CUSTOM', '自由项', '自由项', 'FREEDOM', 'java.lang.String', '59', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000014', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001070', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'ConversionRate', '换算率', '换算率', 'ConversionRate', 'java.lang.String', '70', null, null, null, null, null, null, 'Y', 'dingxm', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000020', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '0', null, '168ffa92-56c5-4c60-a7d8-3cf0b7f4734b', '636b7e2d-7d10-4dcb-802f-3bd8f3f399de', 'sysDictTypeMeta', '档案', null, null, 'com.yonyou.iuap.example.entity.meta.SysDictTypeMeta', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-12-12 15:28:29', '2016-12-13 11:10:33', 'Y', null, null, null, 'Y', 'sys_dict_type_meta', null, null, null, '0', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_class` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '0', null, '8caae9cf-c296-416e-b800-89c5d6911c8a', '029130e3-9b62-4672-97c1-49ce7b8182b1', 'collegeType', '学院类别', null, null, 'com.yonyou.iuap.collegeManagement.pojo.CollegeType', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-03-14 15:16:26', '2019-03-14 15:45:14', 'Y', null, null, null, 'Y', 'collegeType', null, null, null, '0', null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_class` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', '0', null, 'b5883b94-0a10-46c4-ba0f-497e2a8f29e2', '4d312b87-2599-4481-b811-ebe7b4110de8', 'BookInfo', '图书信息', null, null, 'com.yonyou.iuap.bookManagement.pojo.BookInfo', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-01-17 14:24:19', '2019-01-17 14:51:09', 'Y', null, null, null, 'Y', 'bookinfo', null, null, null, '0', null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_class` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '0', null, '0f1d958f-39a5-41f8-b977-551f360f40a3', 'c626af22-65ed-4d02-ac21-9e99ee465a96', 'sysUserJob', '用户任职表', null, null, 'com.yonyou.iuap.example.entity.meta.SysUserJob', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'N', null, null, null, '2016-11-08 09:33:28', '2016-12-14 14:15:14', 'Y', null, null, null, 'Y', 'sys_user_job', null, null, null, '0', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_class` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '0', null, 'a480f47c-e24c-4abb-b62e-588f0d99b87f', '603269e1-6a2a-4e5a-8ddf-4b01483912b1', 'BookBorrow', '图书借阅', null, null, 'com.yonyou.iuap.bookBorrow.pojo.BookBorrow', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-02-16 17:06:47', '2019-02-19 13:57:30', 'Y', null, null, null, 'Y', 'bookborrow', null, null, null, '0', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_class` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '0', null, 'e7b60122-e233-4f8b-a758-1d9a7cf22a7a', '47c7edf6-d33b-4b77-8ce9-ad7a9dead326', 'PayFine', '缴纳罚款', null, null, 'com.yonyou.iuap.bookBorrow.pojo.PayFine', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2019-02-19 17:38:06', '2019-02-20 09:29:24', 'Y', null, null, null, 'Y', 'payFine', null, null, null, '0', null, '2019-02-20 09:29:51', '0');

-- ----------------------------
-- Table structure for md_column
-- ----------------------------
DROP TABLE IF EXISTS `md_column`;
CREATE TABLE `md_column` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `tableid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `sqldatetype` varchar(50) DEFAULT NULL,
  `pkey` char(1) DEFAULT NULL,
  `identitied` char(1) DEFAULT NULL,
  `incrementstep` smallint(6) DEFAULT NULL,
  `incrementseed` smallint(6) DEFAULT NULL,
  `nullable` char(1) DEFAULT NULL,
  `precise` smallint(6) DEFAULT NULL,
  `columnlength` smallint(6) DEFAULT NULL,
  `defaultvalue` varchar(512) DEFAULT NULL,
  `columnsequence` smallint(6) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `columntype` smallint(6) DEFAULT NULL,
  `forlocale` char(1) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_column
-- ----------------------------
INSERT INTO `md_column` VALUES ('bd_countryzone@@@code', '0', 'bd_countryzone', 'code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@creationtime', '0', 'bd_countryzone', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@creator', '0', 'bd_countryzone', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@description', '0', 'bd_countryzone', 'description', '描述', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@modifiedtime', '0', 'bd_countryzone', 'modifiedtime', '最后修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '11', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@modifier', '0', 'bd_countryzone', 'modifier', '最后修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@name', '0', 'bd_countryzone', 'name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@phonecode', '0', 'bd_countryzone', 'phonecode', '电话代码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@pk_lang', '0', 'bd_countryzone', 'pk_lang', '语种', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@pk_timezone', '0', 'bd_countryzone', 'pk_timezone', '时区', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@wholename', '0', 'bd_countryzone', 'wholename', '全称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '200', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@PK@@', '0', 'bd_countryzone', 'pk_country', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@booktype_name', '0', 'bookborrow', 'booktype_name', '类别名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@code', '0', 'bookborrow', 'code', '图书编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@def1', '0', 'bookborrow', 'def1', '预留字段1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '11', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@def2', '0', 'bookborrow', 'def2', '预留字段2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '12', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@def3', '0', 'bookborrow', 'def3', '预留字段3', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '13', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@def4', '0', 'bookborrow', 'def4', '预留字段4', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '14', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@login_user', '0', 'bookborrow', 'login_user', '登录用户名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@name', '0', 'bookborrow', 'name', '图书名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@pk_booktype', '0', 'bookborrow', 'pk_booktype', '类别pk', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@price_rent', '0', 'bookborrow', 'price_rent', '租用价格', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '4', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@provisions_back', '0', 'bookborrow', 'provisions_back', '规定归还日期', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '9', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@publish', '0', 'bookborrow', 'publish', '出版社', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '3', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@state', '0', 'bookborrow', 'state', '借阅状态', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@@timeout_length', '0', 'bookborrow', 'timeout_length', '超时时长', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '10', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookborrow@@PK@@', '0', 'bookborrow', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@booktype_name', '0', 'bookinfo', 'booktype_name', '类别名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@code', '0', 'bookinfo', 'code', '图书编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@def1', '0', 'bookinfo', 'def1', '预留字段1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '7', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@def2', '0', 'bookinfo', 'def2', '预留字段2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@name', '0', 'bookinfo', 'name', '图书名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@pk_booktype', '0', 'bookinfo', 'pk_booktype', '类别pk', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@price_rent', '0', 'bookinfo', 'price_rent', '租用价格', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '4', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@@publish', '0', 'bookinfo', 'publish', '出版社', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '3', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookinfo@@PK@@', '0', 'bookinfo', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_column` VALUES ('bookType@@@add_person', '0', 'bookType', 'add_person', '添加人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_column` VALUES ('bookType@@@book_num', '0', 'bookType', 'book_num', '包含图书数量', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@code', '0', 'cardTableMeta', 'code', '系统编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@combodatamodel', '0', 'cardTableMeta', 'combodatamodel', '认证模式', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@createtime', '0', 'cardTableMeta', 'createtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@gateway', '0', 'cardTableMeta', 'gateway', '网管地址', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@name', '0', 'cardTableMeta', 'name', '系统名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@radiodataassociate', '0', 'cardTableMeta', 'radiodataassociate', '用户自关联', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@radiodatacontroller', '0', 'cardTableMeta', 'radiodatacontroller', '需要授权', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@tag', '0', 'cardTableMeta', 'tag', 'tag', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@PK@@', '0', 'cardTableMeta', 'pk_system', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@code', '0', 'CollegeInfo', 'code', '学生学号', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@collegetype_name', '0', 'CollegeInfo', 'collegetype_name', '类别名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '4', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@def1', '0', 'CollegeInfo', 'def1', '预留字段1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@def2', '0', 'CollegeInfo', 'def2', '预留字段2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@login_status', '0', 'CollegeInfo', 'login_status', '登录授权状态', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@name', '0', 'CollegeInfo', 'name', '学生姓名', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@@pk_collegetype', '0', 'CollegeInfo', 'pk_collegetype', '类别pk', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('CollegeInfo@@PK@@', '0', 'CollegeInfo', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@code', '0', 'collegeType', 'code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '1', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@def1', '0', 'collegeType', 'def1', '预留字段1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@def2', '0', 'collegeType', 'def2', '预留字段2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@def3', '0', 'collegeType', 'def3', '预留字段3', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '9', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@name', '0', 'collegeType', 'name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@parent_id', '0', 'collegeType', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@parent_id_name', '0', 'collegeType', 'parent_id_name', '上级名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '4', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@sort', '0', 'collegeType', 'sort', '排序', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@@student_num', '0', 'collegeType', 'student_num', '学生数量', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('collegeType@@PK@@', '0', 'collegeType', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_column` VALUES ('dept@@@createdate', '0', 'dept', 'createdate', '部门成立时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@creationtime', '0', 'dept', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@creator', '0', 'dept', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@deptcanceldate', '0', 'dept', 'deptcanceldate', '部门撤销日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@dept_code', '0', 'dept', 'dept_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '40', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@dept_name', '0', 'dept', 'dept_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@dept_type', '0', 'dept', 'dept_type', '部门类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@org_id', '0', 'dept', 'org_id', '组织ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@parent_id', '0', 'dept', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '36', '*~', '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@@short_name', '0', 'dept', 'short_name', '简称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_column` VALUES ('dept@@PK@@', '0', 'dept', 'pk_dept', '部门主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('instit@@@creationtime', '0', 'instit', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('instit@@@creator', '0', 'instit', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('instit@@@email', '0', 'instit', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('instit@@@instit_code', '0', 'instit', 'instit_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '200', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('instit@@@instit_name', '0', 'instit', 'instit_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('instit@@@instit_type', '0', 'instit', 'instit_type', '类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '10', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('instit@@@parent_id', '0', 'instit', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '36', '*~', '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('instit@@@short_name', '0', 'instit', 'short_name', '简称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('instit@@PK@@', '0', 'instit', 'institid', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_column` VALUES ('loginLog@@@def1', '0', 'loginLog', 'def1', '预留字段1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '5', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('loginLog@@@def2', '0', 'loginLog', 'def2', '预留字段2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('loginLog@@@login_ip', '0', 'loginLog', 'login_ip', '登录ip', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '4', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('loginLog@@@login_time', '0', 'loginLog', 'login_time', '登录时间', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('loginLog@@@login_type', '0', 'loginLog', 'login_type', '登录类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '3', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('loginLog@@@name', '0', 'loginLog', 'name', '用户姓名', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('loginLog@@PK@@', '0', 'loginLog', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_column` VALUES ('org@@@creationtime', '0', 'org', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@creator', '0', 'org', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@email', '0', 'org', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@org_code', '0', 'org', 'org_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '200', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@org_name', '0', 'org', 'org_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@org_type', '0', 'org', 'org_type', '类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '10', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@parent_id', '0', 'org', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '36', '*~', '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@@short_name', '0', 'org', 'short_name', '简称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('org@@PK@@', '0', 'org', 'org_id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_column` VALUES ('payFine@@@code', '0', 'payFine', 'code', '图书编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '1', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@def1', '0', 'payFine', 'def1', '备用字段1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@def2', '0', 'payFine', 'def2', '备用字段2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '9', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@def3', '0', 'payFine', 'def3', '备用字段3', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '10', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@name', '0', 'payFine', 'name', '图书名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@payfine_state', '0', 'payFine', 'payfine_state', '缴纳罚款状态', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@pay_fine', '0', 'payFine', 'pay_fine', '应缴纳罚款', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@price_timeoutrent', '0', 'payFine', 'price_timeoutrent', '租用超时价格', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '4', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@timeout_length', '0', 'payFine', 'timeout_length', '超时时长', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@@user_name', '0', 'payFine', 'user_name', '用户名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('payFine@@PK@@', '0', 'payFine', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@create_time', '0', 'sys_dict_type_meta', 'create_time', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@creator', '0', 'sys_dict_type_meta', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@creator_id', '0', 'sys_dict_type_meta', 'creator_id', '创建人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@dict_type_code', '0', 'sys_dict_type_meta', 'dict_type_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@dict_type_name', '0', 'sys_dict_type_meta', 'dict_type_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@is_fixed', '0', 'sys_dict_type_meta', 'is_fixed', '系统预制', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@modifier', '0', 'sys_dict_type_meta', 'modifier', '修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@modifier_id', '0', 'sys_dict_type_meta', 'modifier_id', '修改人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@modify_time', '0', 'sys_dict_type_meta', 'modify_time', '修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@remark', '0', 'sys_dict_type_meta', 'remark', '评论', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '512', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@PK@@', '0', 'sys_dict_type_meta', 'dict_id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@birthdate', '0', 'sys_user', 'birthdate', '出生日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '13', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@certificate_code', '0', 'sys_user', 'certificate_code', '证件号码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '32', null, '12', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@certificate_id', '0', 'sys_user', 'certificate_id', '证件类型ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@certificate_name', '0', 'sys_user', 'certificate_name', '证件类型名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '11', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@create_time', '0', 'sys_user', 'create_time', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '25', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@creator', '0', 'sys_user', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '24', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@creator_id', '0', 'sys_user', 'creator_id', '创建人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '23', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@image_url', '0', 'sys_user', 'image_url', '电子印章图片地址或头像', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '19', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@level_id', '0', 'sys_user', 'level_id', '用户级别ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '17', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@level_name', '0', 'sys_user', 'level_name', '用户级别名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '18', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@login_name', '0', 'sys_user', 'login_name', '登录名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@modifier', '0', 'sys_user', 'modifier', '修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '27', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@modifier_id', '0', 'sys_user', 'modifier_id', '修改人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '26', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@modify_time', '0', 'sys_user', 'modify_time', '修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '28', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@org_id', '0', 'sys_user', 'org_id', '所属组织ID', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@org_name', '0', 'sys_user', 'org_name', '所属组织名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@platform_id', '0', 'sys_user', 'platform_id', '所属平台ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '15', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@platform_name', '0', 'sys_user', 'platform_name', '所属平台名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '16', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@register_date', '0', 'sys_user', 'register_date', '系统注册日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '14', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@remark', '0', 'sys_user', 'remark', '备注', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '512', null, '22', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@sex_id', '0', 'sys_user', 'sex_id', '性别ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@status_id', '0', 'sys_user', 'status_id', '状态ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '20', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@status_name', '0', 'sys_user', 'status_name', '状态姓名', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '21', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_code', '0', 'sys_user', 'user_code', '用户编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '32', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_email', '0', 'sys_user', 'user_email', '用户邮件', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_mobile', '0', 'sys_user', 'user_mobile', '用户手机号', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_name', '0', 'sys_user', 'user_name', '用户名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_password', '0', 'sys_user', 'user_password', '登录密码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@PK@@', '0', 'sys_user', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@create_time', '0', 'sys_user_job', 'create_time', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'N', '0', '0', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@creator', '0', 'sys_user_job', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '20', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@creator_id', '0', 'sys_user_job', 'creator_id', '创建人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '40', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@dept_id', '0', 'sys_user_job', 'dept_id', '部门ID', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@fk_id_sys_user_job', '0', 'sys_user_job', 'fk_id_sys_user_job', '用户管理表_主键', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, null, null, null, null, null, '2UC000-000003', null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@is_active', '0', 'sys_user_job', 'is_active', '启用状态', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@is_default', '0', 'sys_user_job', 'is_default', '是否默认职责', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@modifier', '0', 'sys_user_job', 'modifier', '修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '12', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@modifier_id', '0', 'sys_user_job', 'modifier_id', '修改人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '11', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@modify_time', '0', 'sys_user_job', 'modify_time', '修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '13', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@org_id', '0', 'sys_user_job', 'org_id', '组织ID', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@user_id', '0', 'sys_user_job', 'user_id', '用户ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '40', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@user_job_note', '0', 'sys_user_job', 'user_job_note', '说明', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '256', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@user_name', '0', 'sys_user_job', 'user_name', '用户名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '24', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@PK@@', '0', 'sys_user_job', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('telbook@@@countryzone', '0', 'telbook', 'countryzone', '国家地区', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '36', '*~', '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@email', '0', 'telbook', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@institid', '0', 'telbook', 'institid', '机构_主键', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, null, null, null, null, null, '2UC000-000003', null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@office', '0', 'telbook', 'office', '办公室', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@peocode', '0', 'telbook', 'peocode', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@peoname', '0', 'telbook', 'peoname', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@sex', '0', 'telbook', 'sex', '性别', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@tel', '0', 'telbook', 'tel', '电话', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@@worktel', '0', 'telbook', 'worktel', '工作电话', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_column` VALUES ('telbook@@PK@@', '0', 'telbook', 'id', 'id', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:12', '0');

-- ----------------------------
-- Table structure for md_component
-- ----------------------------
DROP TABLE IF EXISTS `md_component`;
CREATE TABLE `md_component` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `namespace` varchar(512) DEFAULT NULL,
  `ownmodule` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `version` varchar(512) DEFAULT NULL,
  `resmodule` varchar(90) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `preload` char(1) DEFAULT NULL,
  `isbizmodel` char(1) DEFAULT NULL,
  `fromsourcebmf` char(1) DEFAULT NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_component
-- ----------------------------
INSERT INTO `md_component` VALUES ('0f1d958f-39a5-41f8-b977-551f360f40a3', '0', 'metadata', 'metadata', 'userManagement', 'userManagement', null, null, null, null, '2016-11-08 09:18:02', '2016-12-14 13:56:23', '78', 'userManagement', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_component` VALUES ('168ffa92-56c5-4c60-a7d8-3cf0b7f4734b', '0', 'metadata', 'metadata', 'sys_dict_type', 'sys_dict_type', null, null, null, null, '2016-12-12 15:28:28', '2016-12-13 10:51:25', '11', 'sys_dict_type', null, null, 'N', 'Y', '0', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_component` VALUES ('2ffbee6a-001e-4459-a7ba-8f14e45a41b8', '0', 'metadata', 'metadata', 'cardtable', 'cardtable', null, null, null, null, '2016-12-12 15:03:21', '2016-12-13 14:57:55', '13', 'cardtable', null, null, 'N', 'Y', '0', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_component` VALUES ('65579d3f-110c-4fdf-8d0b-63ba24007a3d', '0', 'metadata', 'metadata', 'address', 'address', null, null, null, null, '2016-12-13 13:12:19', '2016-12-14 09:58:47', '14', 'address', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_component` VALUES ('69e130c8-466b-45a6-8eb2-8de1804ac6da', '0', 'iuap-quickstart', 'iuap-quickstart', 'book_type', 'book_type', null, null, null, null, '2019-01-16 14:36:10', '2019-01-16 14:36:21', '16', 'book_type', null, null, 'N', 'Y', '0', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_component` VALUES ('72dcb4ff-d80b-47db-9472-2b35ab0a41b6', '0', 'iuap-quickstart', 'iuap-quickstart', 'college_info', 'college_info', null, null, null, null, '2019-03-14 17:02:18', '2019-03-15 09:34:22', '11', 'college_info', null, null, 'N', 'Y', '0', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_component` VALUES ('7ab0a8fc-d04b-4ac5-811d-5d19fa67c174', '0', 'uap', 'metadata', 'countryzone', '国家地区', null, null, null, null, '2016-11-16 11:11:12', '2016-12-13 14:57:32', '41', 'countryzone', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:18', '0');
INSERT INTO `md_component` VALUES ('8caae9cf-c296-416e-b800-89c5d6911c8a', '0', 'iuap-quickstart', 'iuap-quickstart', 'college_type', 'college_type', null, null, null, null, '2019-03-14 15:15:27', '2019-03-14 15:16:26', '7', 'college_type', null, null, 'N', 'Y', '0', null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_component` VALUES ('a480f47c-e24c-4abb-b62e-588f0d99b87f', '0', 'iuap-quickstart', 'iuap-quickstart', 'book_borrow', 'book_borrow', null, null, null, null, '2019-02-16 17:06:27', '2019-02-19 13:50:10', '14', 'book_borrow', null, null, 'N', 'Y', '0', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_component` VALUES ('a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', '0', 'metadata', 'metadata', 'dept', '部门', null, null, null, null, '2016-11-16 10:53:19', '2016-12-14 13:58:18', '43', 'dept', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_component` VALUES ('aa1e1c21-6241-4134-a71a-05624e14140f', '0', 'uap', 'baseapp', 'public', 'public', null, null, null, null, '2008-02-20 13:38:20', '2016-11-16 15:18:32', '24', 'public', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:23', '0');
INSERT INTO `md_component` VALUES ('b5883b94-0a10-46c4-ba0f-497e2a8f29e2', '0', 'iuap-quickstart', 'iuap-quickstart', 'book_info', 'book_info', null, null, null, null, '2019-01-17 14:24:08', '2019-01-17 14:24:19', '23', 'book_info', null, null, 'N', 'Y', '0', null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_component` VALUES ('c71a9a96-2d46-4694-8f9c-1f78a9571602', '0', 'iuap-quickstart', 'iuap-quickstart', 'login_log', 'login_log', null, null, null, null, '2019-03-15 14:19:13', '2019-03-15 14:19:32', '10', 'login_log', null, null, 'N', 'Y', '0', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_component` VALUES ('e7b60122-e233-4f8b-a758-1d9a7cf22a7a', '0', 'iuap-quickstart', 'iuap-quickstart', 'book_payfine', 'book_payfine', null, null, null, null, '2019-02-19 17:37:45', '2019-02-20 09:11:47', '15', 'book_payfine', null, null, 'N', 'Y', '0', null, '2019-02-20 09:29:50', '0');
INSERT INTO `md_component` VALUES ('f7adbc5a-fc68-40bb-a18c-3a7fc4dbd606', '0', 'metadata', 'metadata', 'org', '组织', null, null, null, null, '2016-11-07 13:23:42', '2016-12-14 13:59:18', '28', 'org', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:03', '0');

-- ----------------------------
-- Table structure for md_comp_busimodule
-- ----------------------------
DROP TABLE IF EXISTS `md_comp_busimodule`;
CREATE TABLE `md_comp_busimodule` (
  `componentid` varchar(50) NOT NULL,
  `busimodulecode` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_comp_busimodule
-- ----------------------------

-- ----------------------------
-- Table structure for md_db
-- ----------------------------
DROP TABLE IF EXISTS `md_db`;
CREATE TABLE `md_db` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `isactive` char(1) NOT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_db
-- ----------------------------

-- ----------------------------
-- Table structure for md_db_relation
-- ----------------------------
DROP TABLE IF EXISTS `md_db_relation`;
CREATE TABLE `md_db_relation` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(90) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `starttableid` varchar(50) NOT NULL,
  `startfieldid` varchar(50) NOT NULL,
  `startattrid` varchar(50) DEFAULT NULL,
  `startcardinality` varchar(10) DEFAULT NULL,
  `endtableid` varchar(50) NOT NULL,
  `endfieldid` varchar(50) NOT NULL,
  `endcardinality` varchar(10) DEFAULT NULL,
  `asstype` smallint(6) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `isforeignkey` char(1) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_db_relation
-- ----------------------------
INSERT INTO `md_db_relation` VALUES ('9a26ddb6-a41b-4ce6-9283-957305fb36f1', '0', 'sys_user_job->sys_user', 'sys_user_job->sys_user', null, null, 'sys_user_job', 'sys_user_job@@@fk_id_sys_user_job', '61c291c3-506c-4673-81da-b1e718e56fbc', null, 'sys_user', 'sys_user@@PK@@', null, '1', null, null, null, null, null, 'Y', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_db_relation` VALUES ('9e4307ff-b752-493d-9755-1811b3f482b9', '0', 'telbook->instit', 'telbook->instit', null, null, 'telbook', 'telbook@@@institid', '1462bbcc-84be-46df-bde4-03037203216b', null, 'instit', 'instit@@PK@@', null, '1', null, null, null, null, null, 'Y', null, '2016-12-15 09:49:12', '0');

-- ----------------------------
-- Table structure for md_enumvalue
-- ----------------------------
DROP TABLE IF EXISTS `md_enumvalue`;
CREATE TABLE `md_enumvalue` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `value` varchar(128) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `enumsequence` smallint(6) DEFAULT NULL,
  `hidden` char(1) DEFAULT NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`,`value`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_enumvalue
-- ----------------------------
INSERT INTO `md_enumvalue` VALUES ('4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '0', '0', '普通部门', null, null, '0', 'N', '0', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_enumvalue` VALUES ('4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '0', '1', '虚拟部门', null, null, '1', 'N', '0', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_enumvalue` VALUES ('90c3c346-8efe-4e48-b892-23e7b2d5f096', '0', '0', '男', null, null, '0', 'N', '0', null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_enumvalue` VALUES ('90c3c346-8efe-4e48-b892-23e7b2d5f096', '0', '1', '女', null, null, '1', 'N', '0', null, '2016-12-15 09:49:11', '0');

-- ----------------------------
-- Table structure for md_module
-- ----------------------------
DROP TABLE IF EXISTS `md_module`;
CREATE TABLE `md_module` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `parentmoduleid` varchar(50) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `resmodule` varchar(90) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_module
-- ----------------------------
INSERT INTO `md_module` VALUES ('baseapp', '0', 'baseapp', 'baseapp', null, null, null, null, null, null, null, null, null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_module` VALUES ('iuap-quickstart', '0', 'iuap-quickstart', 'iuap-quickstart', null, null, null, null, null, null, null, null, null, null, null, '2019-01-16 15:14:54', '0');
INSERT INTO `md_module` VALUES ('metadata', '0', 'metadata', 'metadata', null, null, null, null, null, null, null, null, null, null, null, '2016-12-15 09:48:38', '0');

-- ----------------------------
-- Table structure for md_opinterface
-- ----------------------------
DROP TABLE IF EXISTS `md_opinterface`;
CREATE TABLE `md_opinterface` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `componentid` varchar(50) NOT NULL,
  `fullclassname` varchar(256) DEFAULT NULL,
  `isservice` char(1) DEFAULT NULL,
  `visibility` smallint(6) DEFAULT NULL,
  `remote` char(1) DEFAULT NULL,
  `singleton` char(1) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `implstrategy` varchar(256) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `authorizable` char(1) DEFAULT NULL,
  `ownertype` varchar(50) DEFAULT NULL,
  `defaultimplclassname` varchar(256) DEFAULT NULL,
  `isbusioperation` char(1) DEFAULT NULL,
  `isbusiactivity` char(1) DEFAULT NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_opinterface
-- ----------------------------

-- ----------------------------
-- Table structure for md_ormap
-- ----------------------------
DROP TABLE IF EXISTS `md_ormap`;
CREATE TABLE `md_ormap` (
  `classid` varchar(50) NOT NULL,
  `attributeid` varchar(50) NOT NULL,
  `tableid` varchar(50) NOT NULL,
  `columnid` varchar(50) NOT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`attributeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_ormap
-- ----------------------------
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '0059ad75-9454-44df-ac06-cb1b7c28dc33', 'sys_user', 'sys_user@@@user_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '01a74741-fa52-477a-a58e-5565db36de0b', 'sys_user', 'sys_user@@PK@@', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '029130e3-9b62-4672-97c1-49ce7b8182b1', 'collegeType', 'collegeType@@PK@@', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '03a83b5f-22ac-4f21-8141-9812e6788705', 'payFine', 'payFine@@@user_name', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '03fd3103-1d97-43ea-a122-9e0cc1196359', 'dept', 'dept@@PK@@', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '064841b3-cd0c-4194-a810-5a0936993b74', 'bd_countryzone', 'bd_countryzone@@@creator', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '068b348f-a088-4b83-be65-e68472c48ae6', 'bookborrow', 'bookborrow@@@booktype_name', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '06975c0a-351d-4a1f-b3b1-8e4c89ff3955', 'collegeType', 'collegeType@@@name', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '073683a2-12c5-4fc2-9008-be234c27c43f', 'sys_user_job', 'sys_user_job@@@org_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '07a56fb1-3a38-4ed8-a059-5b8701b59491', 'sys_user_job', 'sys_user_job@@@modifier', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '0867d50c-a60d-4a20-a42c-b4781f9fc627', 'payFine', 'payFine@@@timeout_length', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '092c94ba-807f-471c-9507-ef8f995fb602', 'cardTableMeta', 'cardTableMeta@@@name', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '0c102a47-833e-4081-93f2-75992450e344', 'sys_user_job', 'sys_user_job@@@is_default', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '0e1332c0-7048-4ba2-b411-77c925f87476', 'sys_user', 'sys_user@@@image_url', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '0ee9fe63-bc29-4d9a-b41c-567329b86453', 'loginLog', 'loginLog@@@login_ip', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '0fbe1b85-a4f4-4f74-886d-e6c90d412a84', 'bookborrow', 'bookborrow@@@def3', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1462bbcc-84be-46df-bde4-03037203216b', 'telbook', 'telbook@@@institid', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '15c7b85a-c745-4c67-b4c9-cb6cb0636aee', 'dept', 'dept@@@org_id', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '16df9de7-2ac7-4458-a95d-185619fe66a4', 'telbook', 'telbook@@@countryzone', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '178ef85b-3293-4c91-81f2-ed02c8db707d', 'sys_dict_type_meta', 'sys_dict_type_meta@@@modifier', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '18c04349-b4a0-47b6-985d-01bd42447ab5', 'sys_user', 'sys_user@@@level_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '18fbc4db-c862-4fef-a570-75781d83aaa6', 'bookborrow', 'bookborrow@@@login_user', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '199d907a-f6c3-4143-82ec-3b4a1d49d35d', 'bd_countryzone', 'bd_countryzone@@@modifier', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '1a90d15e-9500-41e8-a105-2bb953dfd41e', 'sys_user', 'sys_user@@@sex_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1b1d0fdd-ece0-40ca-8702-133a6c6f99f4', 'instit', 'instit@@@email', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '1bd9c911-de4f-447b-8174-7b1cf7b99bc9', 'sys_user', 'sys_user@@@platform_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '1d2bf6da-8442-45f6-9f38-163b8508f7a3', 'dept', 'dept@@@dept_code', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '1e24422a-9f3a-4bd3-b132-859c3c971e58', 'loginLog', 'loginLog@@@name', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', '21a9b286-3cc3-48f6-b009-1523f90b3f8a', 'CollegeInfo', 'CollegeInfo@@@def2', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '21d10890-c10e-4fb8-84eb-5a52b7b837b6', 'telbook', 'telbook@@@peocode', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '229817f7-6810-4f85-ac65-19410cb2fdc5', 'sys_user', 'sys_user@@@modifier', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '24acc470-cfd0-485e-bd68-bc7976f57c46', 'sys_user_job', 'sys_user_job@@@creator', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', '24da6fc1-d9c5-40f1-a62f-5dc13b6ffc08', 'CollegeInfo', 'CollegeInfo@@@code', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '25e6baab-befa-4f21-ad8a-02b86447987d', 'sys_user', 'sys_user@@@birthdate', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '2702b115-ae64-471f-a12a-0ffb85d5a61c', 'bd_countryzone', 'bd_countryzone@@@code', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '283224cd-4613-47bc-aee2-021086bcf0e0', 'telbook', 'telbook@@@office', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '296cd7f9-c21d-4245-b0c0-155787f1ed73', 'cardTableMeta', 'cardTableMeta@@@code', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '2acf6d81-abfe-4e69-994e-677077811aaf', 'org', 'org@@@creationtime', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '2b8fdeeb-577c-417d-8e90-627b8fed67e6', 'instit', 'instit@@PK@@', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '2bca9d99-8962-47f0-9c7d-cb5d3a9f87f7', 'sys_user', 'sys_user@@@certificate_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '2c3c1f2b-2c3c-49f9-b7fe-fcff773f4749', 'instit', 'instit@@@parent_id', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '2f019658-5914-47d7-87b0-2f3e07db35bd', 'cardTableMeta', 'cardTableMeta@@@radiodataassociate', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '2faa7a0a-b047-45af-b248-da29b6bf1d03', 'sys_dict_type_meta', 'sys_dict_type_meta@@@creator_id', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '31173e85-64f2-4194-af68-6a39f0fbcc1a', 'loginLog', 'loginLog@@@def2', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '32f02351-e175-40b6-9a36-f07ed4b7a5fe', 'bookType', 'bookType@@@def3', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '340fde41-7dac-4006-9ad4-ad1115203ee7', 'sys_dict_type_meta', 'sys_dict_type_meta@@@dict_type_name', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '3410b161-35bc-4cc6-9192-c22a8fbeb362', 'loginLog', 'loginLog@@@def1', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '36b393d0-a21b-45cc-914e-7cb595634c6f', 'sys_user', 'sys_user@@@user_code', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '36c98631-8ab2-4128-87db-d399db66441b', 'sys_dict_type_meta', 'sys_dict_type_meta@@@create_time', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '38027b4b-bf97-45d2-a304-605f1de4affd', 'cardTableMeta', 'cardTableMeta@@@tag', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '38254213-08e2-44fe-b99c-4fb2b623dcff', 'sys_user_job', 'sys_user_job@@@modify_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '3910c261-d517-4588-b777-1b9f0e50db50', 'instit', 'instit@@@instit_name', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '3b9daffc-4b2b-43f5-ac61-c300096d535e', 'org', 'org@@@org_name', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '3c7da34b-6479-4050-865e-cba9d2537c10', 'bd_countryzone', 'bd_countryzone@@@pk_lang', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '3c83b007-8b19-4d7a-a2b1-3890ed9e46a2', 'bookborrow', 'bookborrow@@@price_rent', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '3c985562-9508-49d3-bac9-c9e4e67c5992', 'sys_user', 'sys_user@@@status_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '3d4a2c45-4188-4ad8-b756-01a264d35930', 'org', 'org@@@org_code', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '3e4c96c5-dc67-4bbc-bb59-434ad6d24154', 'sys_user', 'sys_user@@@register_date', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '3e5cf1cc-0185-48cd-8ac6-f94ce54b9654', 'sys_user', 'sys_user@@@platform_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '3eb389dd-08bb-4fbc-bbfd-ca7a48330387', 'sys_dict_type_meta', 'sys_dict_type_meta@@@creator', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '40cca0cc-3c5c-433c-88bb-9a3019039677', 'sys_user_job', 'sys_user_job@@@user_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '411a555d-06c3-42d6-a13d-cdbfa9b54492', 'bookborrow', 'bookborrow@@@code', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', '41d65039-329f-4492-be43-b2f5e7d4dce9', 'CollegeInfo', 'CollegeInfo@@@name', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '436564d3-0668-41d7-82c2-7d7581eb89c2', 'dept', 'dept@@@createdate', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '43bd6df6-011a-4a2a-ad97-8dfe49777fab', 'sys_dict_type_meta', 'sys_dict_type_meta@@@remark', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '449282ce-da9c-44c3-9f97-75dec757519b', 'bd_countryzone', 'bd_countryzone@@@name', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '45259f0e-2d6e-4fd2-bc56-51a322860eed', 'telbook', 'telbook@@PK@@', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '4585e1d8-3f8f-4220-91db-47e6af487fe5', 'bookType', 'bookType@@@def2', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '476aa1bb-79da-4e15-868f-c716ddb8be7d', 'sys_user_job', 'sys_user_job@@@user_job_note', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '47c7edf6-d33b-4b77-8ce9-ad7a9dead326', 'payFine', 'payFine@@PK@@', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', '48316805-b584-4c51-b367-6f24da4ceb61', 'bookinfo', 'bookinfo@@@code', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '486596c3-96b1-4cdc-b2e4-b7773a23cf14', 'payFine', 'payFine@@@payfine_state', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '4b13d325-c5b3-46c0-a9f3-74cfa74e3c6e', 'sys_user', 'sys_user@@@user_email', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '4b5a5c4d-d097-487b-9e6c-10f2c660c674', 'telbook', 'telbook@@@worktel', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', '4d312b87-2599-4481-b811-ebe7b4110de8', 'bookinfo', 'bookinfo@@PK@@', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '4ebc2d73-fbf7-4138-85b9-0138434dae24', 'bd_countryzone', 'bd_countryzone@@@modifiedtime', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '4fab2a08-3ac2-4c8c-b2c3-2a44828ebf75', 'bookType', 'bookType@@@book_num', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '508ac55d-9bf3-442e-8d99-8fe5bf7a027a', 'bookborrow', 'bookborrow@@@pk_booktype', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '520f90df-42d4-4d85-888d-e38f915d6adf', 'bd_countryzone', 'bd_countryzone@@@phonecode', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '53c25e75-5354-4038-8a22-f33565f01c46', 'telbook', 'telbook@@@email', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '53d00481-86ae-40f2-a127-c84ea87d4ff0', 'payFine', 'payFine@@@def2', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '583e4adc-8337-479f-b9fa-3bbef0092d8e', 'sys_user_job', 'sys_user_job@@@modifier_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '58a39057-473f-41c1-b5c3-7ea443f4c21c', 'sys_user', 'sys_user@@@org_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '5a5d4bc2-ec88-4993-96bd-b50b94d03ef6', 'collegeType', 'collegeType@@@parent_id', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '5b5a6192-7d99-4aa8-aa0a-0d7f2aec57a4', 'sys_user_job', 'sys_user_job@@@is_active', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '5d378a6c-1ffb-4af1-8472-a69496a79ba9', 'collegeType', 'collegeType@@@code', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '5d917a4c-7880-434f-8717-28fb03687cf8', 'sys_user_job', 'sys_user_job@@@creator_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '603269e1-6a2a-4e5a-8ddf-4b01483912b1', 'bookborrow', 'bookborrow@@PK@@', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '6113a3d4-143c-4db7-837d-cdd748dca62b', 'cardTableMeta', 'cardTableMeta@@@createtime', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '61c291c3-506c-4673-81da-b1e718e56fbc', 'sys_user_job', 'sys_user_job@@@fk_id_sys_user_job', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '61f33f2c-802e-4b7a-b5a6-17ad552cd6e3', 'instit', 'instit@@@instit_type', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '629d2af4-1037-48a9-b118-9111a3df1bea', 'bookType', 'bookType@@@def1', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '636b7e2d-7d10-4dcb-802f-3bd8f3f399de', 'sys_dict_type_meta', 'sys_dict_type_meta@@PK@@', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', '667c5b75-80af-4f3d-8981-4b54b58d707b', 'CollegeInfo', 'CollegeInfo@@@collegetype_name', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '6a2da3cd-ede9-413d-94e5-ca6b1e0ac125', 'collegeType', 'collegeType@@@parent_id_name', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '6af78e6b-21b5-4c7b-8e93-fd1213644b87', 'sys_user', 'sys_user@@@certificate_code', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '6d90bc4b-a95c-4679-9aee-f38a374403ec', 'sys_user', 'sys_user@@@user_mobile', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '6e476c13-f740-46f0-83bd-19aacd43d6aa', 'sys_dict_type_meta', 'sys_dict_type_meta@@@is_fixed', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', '6ef0caa4-0f0f-4dba-9873-6b5d598d31ec', 'collegeType', 'collegeType@@@student_num', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', '7002b7e5-7352-47b2-8f95-37855e1bdfc6', 'bookinfo', 'bookinfo@@@booktype_name', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '739eb675-c24f-4ba9-bef8-7ae7e573c9a5', 'bd_countryzone', 'bd_countryzone@@@pk_timezone', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '7434baba-33f6-46a5-b5bd-08b6255566ae', 'bookborrow', 'bookborrow@@@state', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', '79895dde-0208-4879-87f8-63ba927ed67d', 'bookinfo', 'bookinfo@@@name', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '7dc4f139-c0e3-4478-bf1e-f6b0bb7d5fa0', 'bd_countryzone', 'bd_countryzone@@@creationtime', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '7fc16fb0-71ee-4daf-951b-e524a0051bc7', 'sys_user', 'sys_user@@@org_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '84f91a16-1236-4778-82f8-d4148828249c', 'sys_dict_type_meta', 'sys_dict_type_meta@@@dict_type_code', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '8509e6d2-b30a-4d6c-aff7-5864052c2ff4', 'loginLog', 'loginLog@@@login_time', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '86fc9174-50ac-4198-9261-1e3773b2f35c', 'bookType', 'bookType@@@parent_id', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '88175e24-3324-4cb5-8b2b-f8663e70585c', 'payFine', 'payFine@@@code', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', '8904093e-ef49-47e4-aeb8-939b9cc4dd7a', 'bookType', 'bookType@@@add_person', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '8a40f0d6-0caa-4040-9e13-e37fa8888089', 'cardTableMeta', 'cardTableMeta@@@gateway', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '8a925aa7-ad6c-4c78-9897-91490049c54b', 'bookborrow', 'bookborrow@@@provisions_back', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '8c9097b4-ca4c-4514-83f1-fe2516e0e0b7', 'sys_user', 'sys_user@@@login_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '8dd33bc5-25cf-41e6-b586-85b6be484dd3', 'loginLog', 'loginLog@@PK@@', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '91aeb35e-ed3b-408a-ad3b-de0df96bf343', 'instit', 'instit@@@creationtime', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '939704b6-4131-4f4e-9c33-951b3fb355c3', 'payFine', 'payFine@@@name', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', '956269c6-6a21-4f40-884e-9aad3824bb03', 'payFine', 'payFine@@@price_timeoutrent', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', '959b7c48-2f0f-4afd-aee3-e396231ad5da', 'bookinfo', 'bookinfo@@@pk_booktype', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '97a389a7-e8c0-4d0f-9cc3-f1fdfa6ad6e2', 'dept', 'dept@@@dept_type', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '98b3975e-872a-40e4-8496-3c9b965ad609', 'sys_user', 'sys_user@@@creator_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '98e9364b-abc3-4b10-8b32-89c7d295d21d', 'sys_user', 'sys_user@@@create_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('678aba24-1d93-442d-aaf7-ebc7d1f996fa', '9a59b296-bb52-46f0-b663-b676d7b7290e', 'loginLog', 'loginLog@@@login_type', null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', '9ab7e1ed-f92b-4a88-bdc8-35c9240f93cb', 'bookborrow', 'bookborrow@@@publish', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', 'a192f197-0cc3-4397-9533-c0cbeccb6e7c', 'payFine', 'payFine@@@pay_fine', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', 'a38c429f-caeb-413f-8b1f-a3727a75ce4e', 'bd_countryzone', 'bd_countryzone@@PK@@', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'a523ce91-796f-41a7-bf3a-6b4fc752e3fc', 'org', 'org@@@org_type', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'a6776e2c-c998-4b2e-80df-f140cde809a8', 'sys_user', 'sys_user@@@modify_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', 'aee586f2-2bfd-453a-84d7-178b9fb3f14d', 'CollegeInfo', 'CollegeInfo@@@login_status', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', 'aff467e2-1d37-47af-8104-2fb9707609d7', 'instit', 'instit@@@short_name', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', 'b15e8882-4d03-4a80-9b0c-f7715f1f0608', 'bookborrow', 'bookborrow@@@def2', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'b1b3407c-71a9-4944-ac3e-2e4f1f4a03c4', 'dept', 'dept@@@parent_id', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', 'b1f3b2c3-8139-4135-bb4e-4430540404d2', 'instit', 'instit@@@instit_code', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', 'b495daab-aa61-42d0-9a17-48a5a489b02a', 'bookinfo', 'bookinfo@@@price_rent', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', 'b60c582f-e5ef-4ca5-a4a4-b644e1ce903f', 'payFine', 'payFine@@@def3', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', 'b6e2c1d2-cb32-4ed4-9c8b-b7be1d42ba06', 'CollegeInfo', 'CollegeInfo@@@def1', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'b791309c-0acf-4689-81ed-1b9fa2273126', 'dept', 'dept@@@creationtime', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'b9c2a196-8696-41e0-b829-933a1baeeef6', 'org', 'org@@@creator', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'bb25fbc1-7528-45e7-801d-ae413fa1e445', 'sys_user', 'sys_user@@@creator', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', 'bb85cc0c-b6ce-43ce-84ac-f043e808a6c6', 'CollegeInfo', 'CollegeInfo@@@pk_collegetype', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'bc9aa608-9761-450a-a718-7feaa0df2429', 'org', 'org@@PK@@', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', 'bca70997-d972-442b-a7ef-1025946f9746', 'collegeType', 'collegeType@@@def3', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'bdc6bca4-4884-487f-838f-addc10d33f64', 'sys_user', 'sys_user@@@remark', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', 'be3333c8-e3e5-45a3-abba-dd1f8e8aa737', 'bookinfo', 'bookinfo@@@def2', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', 'bffc4f72-4bfc-4353-a0a3-a0414563b101', 'bookType', 'bookType@@@code', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', 'c0405348-05ff-4f3e-b9ce-9917eb2c27c4', 'collegeType', 'collegeType@@@def2', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'c0cf284b-9fe7-4620-bc4b-71eb4afb7a7a', 'sys_user_job', 'sys_user_job@@@create_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'c28b13d4-d7ff-4d21-944b-554b02f1e247', 'sys_user', 'sys_user@@@status_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', 'c2fd8b19-61c6-440b-beb7-6bf3ce9cab93', 'bookType', 'bookType@@@name', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('f7330b88-d425-4f4e-9a2f-82584105d584', 'c3ce6791-fc2f-4d90-aea8-3bf4e977157a', 'payFine', 'payFine@@@def1', null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', 'c44a1085-6598-454a-b9e6-f77e7875c119', 'bd_countryzone', 'bd_countryzone@@@description', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', 'c5ed8edf-5f04-4a5c-9064-59ea26f40299', 'sys_dict_type_meta', 'sys_dict_type_meta@@@modify_time', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'c626af22-65ed-4d02-ac21-9e99ee465a96', 'sys_user_job', 'sys_user_job@@PK@@', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', 'c66b6d38-9406-4cc9-843b-ab3509e77b93', 'bookinfo', 'bookinfo@@@def1', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'c80f1798-ce8e-43c4-9cd4-ba2e2c4950d1', 'dept', 'dept@@@deptcanceldate', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', 'd028afd2-12f1-4668-b4ac-fce669edd72e', 'instit', 'instit@@@creator', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', 'd03f50b7-3778-4c16-9bde-5d0b38b4bb61', 'cardTableMeta', 'cardTableMeta@@@combodatamodel', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', 'd1bbb871-65d8-417d-ac80-dda7e4237e28', 'sys_dict_type_meta', 'sys_dict_type_meta@@@modifier_id', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'd1c99f13-0e46-458e-94c9-65451b55724e', 'org', 'org@@@short_name', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'd29f3254-56dc-47cf-81a4-513c9923bb1e', 'sys_user', 'sys_user@@@level_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'd5d9c875-0578-4c85-a1cd-c0c2b7f7de90', 'sys_user', 'sys_user@@@user_password', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', 'dba22392-42c5-4cd8-a203-6eaa3bd9d292', 'telbook', 'telbook@@@tel', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'dbcb31c7-fb04-41d9-ae97-0e100dc3a6c4', 'org', 'org@@@email', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', 'dd8e7307-46f9-48f7-a1ee-cba951edfdf2', 'bookType', 'bookType@@@sort', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'de44d0af-7538-41dd-8efd-a5b11940ba25', 'org', 'org@@@parent_id', null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', 'e078997f-0db8-4f7d-901e-73eeaab2f542', 'bookborrow', 'bookborrow@@@def4', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', 'e1fb15aa-08a9-4279-9d8c-043e6f4e4d82', 'bookborrow', 'bookborrow@@@name', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', 'e3291603-936f-48e4-a778-017071ac9e85', 'bookType', 'bookType@@@parent_id_name', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'e45cb75f-a4f8-4b8e-a64e-15dc61333510', 'sys_user', 'sys_user@@@certificate_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'e4f79765-f9b9-45c2-b3cc-420d67d16687', 'sys_user_job', 'sys_user_job@@@user_name', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', 'e62f95a0-0b1e-4438-8a65-64b965bac29c', 'telbook', 'telbook@@@sex', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'eae1d63c-46e4-4823-af45-81e75002e245', 'sys_user', 'sys_user@@@modifier_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', 'ec6e812f-cc91-415f-8c41-4aae5fcfe187', 'bookborrow', 'bookborrow@@@def1', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'ef571efd-9627-48c9-b603-a53f022e4fac', 'dept', 'dept@@@short_name', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('d9a4b2df-fc9b-45ba-9d2d-3955e386e01d', 'efbc47f6-8b23-4a6b-8775-9dc3963276b9', 'bookinfo', 'bookinfo@@@publish', null, '2019-01-17 14:51:38', '0');
INSERT INTO `md_ormap` VALUES ('f51311d1-9035-4f38-9b73-40fd5aa150f7', 'f0396f83-1892-4adf-a14f-72ea2897f28c', 'bookborrow', 'bookborrow@@@timeout_length', null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', 'f1027a2c-75bb-4876-a51c-137f9d2c8c65', 'collegeType', 'collegeType@@@sort', null, '2019-03-14 15:45:40', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', 'f1b5fae8-796c-4c5e-a834-0aca9f5f6fe8', 'telbook', 'telbook@@@peoname', null, '2016-12-15 09:49:12', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', 'f1c3dfb6-2d26-4f85-8173-efa3a1a412be', 'cardTableMeta', 'cardTableMeta@@PK@@', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', 'f23af737-d7fa-4e57-bbce-88273ee6a01f', 'cardTableMeta', 'cardTableMeta@@@radiodatacontroller', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'f3af0453-4899-43de-8f12-a22d64d2dd64', 'dept', 'dept@@@dept_name', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'f462f724-4591-45a5-9a38-6394b565be21', 'dept', 'dept@@@creator', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'f564d08b-04d2-49d2-8c44-dafa11ec758b', 'sys_user_job', 'sys_user_job@@@dept_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', 'f5b4da25-a7ed-40bb-84a5-caecc57de577', 'bd_countryzone', 'bd_countryzone@@@wholename', null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_ormap` VALUES ('55c9033b-ba8a-42de-8382-4c7067ee43c6', 'fbe1071e-267d-40ce-b7bc-4f9c31be98bf', 'bookType', 'bookType@@PK@@', null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_ormap` VALUES ('8d5a036d-2522-4687-aa9f-91c7ef7b80ff', 'fc314a39-47a5-4a88-ba48-4bb307d56879', 'CollegeInfo', 'CollegeInfo@@PK@@', null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_ormap` VALUES ('d0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', 'fd3ba9ab-1219-4ffd-85cd-b83d8f5e7d60', 'collegeType', 'collegeType@@@def1', null, '2019-03-14 15:45:40', '0');

-- ----------------------------
-- Table structure for md_parameter
-- ----------------------------
DROP TABLE IF EXISTS `md_parameter`;
CREATE TABLE `md_parameter` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `operationid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `datatype` varchar(50) NOT NULL,
  `datatypestyle` smallint(6) NOT NULL,
  `parasequence` smallint(6) NOT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `paramdefclassname` varchar(50) DEFAULT NULL,
  `isaggvo` char(1) DEFAULT NULL,
  `paramtypeforlog` varchar(10) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for md_property
-- ----------------------------
DROP TABLE IF EXISTS `md_property`;
CREATE TABLE `md_property` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `classid` varchar(50) DEFAULT NULL,
  `defaultvalue` varchar(512) DEFAULT NULL,
  `attrminvalue` varchar(50) DEFAULT NULL,
  `attrmaxvalue` varchar(50) DEFAULT NULL,
  `fixedlength` char(1) DEFAULT NULL,
  `attrlength` smallint(6) DEFAULT NULL,
  `precise` smallint(6) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `datatypestyle` smallint(6) DEFAULT NULL,
  `nullable` char(1) DEFAULT NULL,
  `customattr` char(1) DEFAULT NULL,
  `calculation` char(1) DEFAULT NULL,
  `readonly` char(1) DEFAULT NULL,
  `visibility` smallint(6) DEFAULT NULL,
  `accessorclassname` varchar(256) DEFAULT NULL,
  `attrsequence` smallint(6) DEFAULT NULL,
  `hided` char(1) DEFAULT NULL,
  `refmodelname` varchar(256) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `isauthen` char(1) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `dynamicattr` char(1) DEFAULT NULL,
  `notserialize` char(1) DEFAULT NULL,
  `accesspower` char(1) DEFAULT NULL,
  `accesspowergroup` varchar(256) DEFAULT NULL,
  `industry` varchar(50) NOT NULL,
  `createindustry` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `dynamictable` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_property
-- ----------------------------
INSERT INTO `md_property` VALUES ('0059ad75-9454-44df-ac06-cb1b7c28dc33', '0', 'username', '用户名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('01a74741-fa52-477a-a58e-5565db36de0b', '0', 'id', '主键', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('029130e3-9b62-4672-97c1-49ce7b8182b1', '0', 'id', '主键', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('03a83b5f-22ac-4f21-8141-9812e6788705', '0', 'user_name', '用户名称', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('03fd3103-1d97-43ea-a122-9e0cc1196359', '0', 'pk_dept', '部门主键', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('064841b3-cd0c-4194-a810-5a0936993b74', '0', 'creator', '创建人', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('068b348f-a088-4b83-be65-e68472c48ae6', '0', 'booktype_name', '类别名称', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('06975c0a-351d-4a1f-b3b1-8e4c89ff3955', '0', 'name', '名称', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('073683a2-12c5-4fc2-9008-be234c27c43f', '0', 'orgid', '组织ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '36', '0', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('07a56fb1-3a38-4ed8-a059-5b8701b59491', '0', 'modifier', '修改人', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '12', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('0867d50c-a60d-4a20-a42c-b4781f9fc627', '0', 'timeout_length', '超时时长', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('092c94ba-807f-471c-9507-ef8f995fb602', '0', 'name', '系统名称', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('0c102a47-833e-4081-93f2-75992450e344', '0', 'isdefault', '是否默认职责', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('0e1332c0-7048-4ba2-b411-77c925f87476', '0', 'imageurl', '电子印章图片地址或头像', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '19', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('0ee9fe63-bc29-4d9a-b41c-567329b86453', '0', 'login_ip', '登录ip', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('0fbe1b85-a4f4-4f74-886d-e6c90d412a84', '0', 'def3', '预留字段3', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '13', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('1462bbcc-84be-46df-bde4-03037203216b', '0', 'fktelbook', 'fkTelbook', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '36', '0', '4bdf8034-83f4-48d4-8e2c-04aca3693586', '302', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('15c7b85a-c745-4c67-b4c9-cb6cb0636aee', '0', 'orgid', '组织ID', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('16df9de7-2ac7-4458-a95d-185619fe66a4', '0', 'countryzone', '国家地区', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '36', '0', '08ffeabe-e01d-4072-a4c3-025345386ebb', '305', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('178ef85b-3293-4c91-81f2-ed02c8db707d', '0', 'modifier', '修改人', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('18c04349-b4a0-47b6-985d-01bd42447ab5', '0', 'levelname', '用户级别名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '18', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('18fbc4db-c862-4fef-a570-75781d83aaa6', '0', 'login_user', '登录用户名称', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('199d907a-f6c3-4143-82ec-3b4a1d49d35d', '0', 'modifier', '最后修改人', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('1a90d15e-9500-41e8-a105-2bb953dfd41e', '0', 'sexid', '性别ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '50', '0', '90c3c346-8efe-4e48-b892-23e7b2d5f096', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('1b1d0fdd-ece0-40ca-8702-133a6c6f99f4', '0', 'email', '邮箱', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('1bd9c911-de4f-447b-8174-7b1cf7b99bc9', '0', 'platformname', '所属平台名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '16', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('1d2bf6da-8442-45f6-9f38-163b8508f7a3', '0', 'deptcode', '编码', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('1e24422a-9f3a-4bd3-b132-859c3c971e58', '0', 'name', '用户姓名', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('21a9b286-3cc3-48f6-b009-1523f90b3f8a', '0', 'def2', '预留字段2', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('21d10890-c10e-4fb8-84eb-5a52b7b837b6', '0', 'peocode', '编码', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('229817f7-6810-4f85-ac65-19410cb2fdc5', '0', 'modifier', '修改人', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '27', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('24acc470-cfd0-485e-bd68-bc7976f57c46', '0', 'creator', '创建人', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('24da6fc1-d9c5-40f1-a62f-5dc13b6ffc08', '0', 'code', '学生学号', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('25e6baab-befa-4f21-ad8a-02b86447987d', '0', 'birthdate', '出生日期', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001033', '300', 'Y', 'N', 'N', 'N', '0', null, '13', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('2702b115-ae64-471f-a12a-0ffb85d5a61c', '0', 'code', '编码', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:18', '0');
INSERT INTO `md_property` VALUES ('283224cd-4613-47bc-aee2-021086bcf0e0', '0', 'office', '办公室', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('296cd7f9-c21d-4245-b0c0-155787f1ed73', '0', 'code', '系统编码', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('2acf6d81-abfe-4e69-994e-677077811aaf', '0', 'creationtime', '创建时间', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('2b8fdeeb-577c-417d-8e90-627b8fed67e6', '0', 'institid', '主键', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('2bca9d99-8962-47f0-9c7d-cb5d3a9f87f7', '0', 'certificateid', '证件类型ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('2c3c1f2b-2c3c-49f9-b7fe-fcff773f4749', '0', 'parentid', '上级ID', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '36', '0', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '305', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('2f019658-5914-47d7-87b0-2f3e07db35bd', '0', 'radiodataassociate', '用户自关联', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('2faa7a0a-b047-45af-b248-da29b6bf1d03', '0', 'creatorid', '创建人ID', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('31173e85-64f2-4194-af68-6a39f0fbcc1a', '0', 'def2', '预留字段2', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('32f02351-e175-40b6-9a36-f07ed4b7a5fe', '0', 'def3', 'attrDisplayName10', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('340fde41-7dac-4006-9ad4-ad1115203ee7', '0', 'dicttypename', '名称', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('3410b161-35bc-4cc6-9192-c22a8fbeb362', '0', 'def1', '预留字段1', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('36b393d0-a21b-45cc-914e-7cb595634c6f', '0', 'usercode', '用户编码', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '32', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('36c98631-8ab2-4128-87db-d399db66441b', '0', 'createtime', '创建时间', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('38027b4b-bf97-45d2-a304-605f1de4affd', '0', 'tag', 'tag', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('38254213-08e2-44fe-b99c-4fb2b623dcff', '0', 'modifytime', '修改时间', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '13', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3910c261-d517-4588-b777-1b9f0e50db50', '0', 'institname', '名称', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '200', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('3b9daffc-4b2b-43f5-ac61-c300096d535e', '0', 'orgname', '名称', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '200', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('3c7da34b-6479-4050-865e-cba9d2537c10', '0', 'pklang', '语种', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('3c83b007-8b19-4d7a-a2b1-3890ed9e46a2', '0', 'price_rent', '租用价格', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('3c985562-9508-49d3-bac9-c9e4e67c5992', '0', 'statusid', '状态ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '20', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3d4a2c45-4188-4ad8-b756-01a264d35930', '0', 'orgcode', '编码', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '200', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('3e4c96c5-dc67-4bbc-bb59-434ad6d24154', '0', 'registerdate', '系统注册日期', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '14', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3e5cf1cc-0185-48cd-8ac6-f94ce54b9654', '0', 'platformid', '所属平台ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '15', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3eb389dd-08bb-4fbc-bbfd-ca7a48330387', '0', 'creator', '创建人', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('40cca0cc-3c5c-433c-88bb-9a3019039677', '0', 'userid', '用户ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('411a555d-06c3-42d6-a13d-cdbfa9b54492', '0', 'code', '图书编码', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('41d65039-329f-4492-be43-b2f5e7d4dce9', '0', 'name', '学生姓名', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('436564d3-0668-41d7-82c2-7d7581eb89c2', '0', 'createdate', '部门成立时间', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('43bd6df6-011a-4a2a-ad97-8dfe49777fab', '0', 'remark', '评论', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '512', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('449282ce-da9c-44c3-9f97-75dec757519b', '0', 'name', '名称', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '200', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('45259f0e-2d6e-4fd2-bc56-51a322860eed', '0', 'id', 'id', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('4585e1d8-3f8f-4220-91db-47e6af487fe5', '0', 'def2', 'attrDisplayName8', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('476aa1bb-79da-4e15-868f-c716ddb8be7d', '0', 'userjobnote', '说明', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '256', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('47c7edf6-d33b-4b77-8ce9-ad7a9dead326', '0', 'id', '主键', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('48316805-b584-4c51-b367-6f24da4ceb61', '0', 'code', '图书编码', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('486596c3-96b1-4cdc-b2e4-b7773a23cf14', '0', 'payfine_state', '缴纳罚款状态', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('4b13d325-c5b3-46c0-a9f3-74cfa74e3c6e', '0', 'useremail', '用户邮件', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('4b5a5c4d-d097-487b-9e6c-10f2c660c674', '0', 'worktel', '工作电话', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('4d312b87-2599-4481-b811-ebe7b4110de8', '0', 'id', '主键', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('4ebc2d73-fbf7-4138-85b9-0138434dae24', '0', 'modifiedtime', '最后修改时间', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('4fab2a08-3ac2-4c8c-b2c3-2a44828ebf75', '0', 'book_num', '包含图书数量', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('508ac55d-9bf3-442e-8d99-8fe5bf7a027a', '0', 'pk_booktype', '类别pk', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('520f90df-42d4-4d85-888d-e38f915d6adf', '0', 'phonecode', '电话代码', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('53c25e75-5354-4038-8a22-f33565f01c46', '0', 'email', '邮箱', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('53d00481-86ae-40f2-a127-c84ea87d4ff0', '0', 'def2', '备用字段2', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('583e4adc-8337-479f-b9fa-3bbef0092d8e', '0', 'modifierid', '修改人ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('58a39057-473f-41c1-b5c3-7ea443f4c21c', '0', 'orgname', '所属组织名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('5a5d4bc2-ec88-4993-96bd-b50b94d03ef6', '0', 'parent_id', '上级ID', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('5b5a6192-7d99-4aa8-aa0a-0d7f2aec57a4', '0', 'isactive', '启用状态', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('5d378a6c-1ffb-4af1-8472-a69496a79ba9', '0', 'code', '编码', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('5d917a4c-7880-434f-8717-28fb03687cf8', '0', 'creatorid', '创建人ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('5dd3c721-22ad-42b1-9c10-4351c236bc77', '0', 'id', 'id', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, null, null, null, null, null, 'Y', null, 'N', 'Y', null, null, '0', null, null, null, '2016-12-15 09:49:23', '0');
INSERT INTO `md_property` VALUES ('603269e1-6a2a-4e5a-8ddf-4b01483912b1', '0', 'id', '主键', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('6113a3d4-143c-4db7-837d-cdd748dca62b', '0', 'createtime', '创建时间', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('61c291c3-506c-4673-81da-b1e718e56fbc', '0', 'idsysuserjob', 'idSysUserJob', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '36', '0', 'e37eed0f-507c-4c84-92f5-7c83644844f8', '302', 'Y', 'N', 'N', 'N', '0', null, '29', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('61f33f2c-802e-4b7a-b5a6-17ad552cd6e3', '0', 'instittype', '类型', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '10', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('629d2af4-1037-48a9-b118-9111a3df1bea', '0', 'def1', 'attrDisplayName7', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('636b7e2d-7d10-4dcb-802f-3bd8f3f399de', '0', 'dictid', '主键', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('667c5b75-80af-4f3d-8981-4b54b58d707b', '0', 'collegetype_name', '类别名称', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('6a2da3cd-ede9-413d-94e5-ca6b1e0ac125', '0', 'parent_id_name', '上级名称', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('6af78e6b-21b5-4c7b-8e93-fd1213644b87', '0', 'certificatecode', '证件号码', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '32', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '12', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('6d90bc4b-a95c-4679-9aee-f38a374403ec', '0', 'usermobile', '用户手机号', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('6e476c13-f740-46f0-83bd-19aacd43d6aa', '0', 'isfixed', '系统预制', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('6ef0caa4-0f0f-4dba-9873-6b5d598d31ec', '0', 'student_num', '学生数量', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('7002b7e5-7352-47b2-8f95-37855e1bdfc6', '0', 'booktype_name', '类别名称', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('739eb675-c24f-4ba9-bef8-7ae7e573c9a5', '0', 'pktimezone', '时区', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('7434baba-33f6-46a5-b5bd-08b6255566ae', '0', 'state', '借阅状态', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('79895dde-0208-4879-87f8-63ba927ed67d', '0', 'name', '图书名称', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('7dc4f139-c0e3-4478-bf1e-f6b0bb7d5fa0', '0', 'creationtime', '创建时间', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('7fc16fb0-71ee-4daf-951b-e524a0051bc7', '0', 'orgid', '所属组织ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '36', '0', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('84f91a16-1236-4778-82f8-d4148828249c', '0', 'dicttypecode', '编码', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('8509e6d2-b30a-4d6c-aff7-5864052c2ff4', '0', 'login_time', '登录时间', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('86fc9174-50ac-4198-9261-1e3773b2f35c', '0', 'parent_id', '上级ID', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('88175e24-3324-4cb5-8b2b-f8663e70585c', '0', 'code', '图书编码', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('8904093e-ef49-47e4-aeb8-939b9cc4dd7a', '0', 'add_person', '添加人', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('89578a97-42fe-439b-827c-8eabd9e3604c', '0', 'name', 'name', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, null, null, null, null, null, 'Y', null, 'N', 'Y', null, null, '0', null, null, null, '2016-12-15 09:49:23', '0');
INSERT INTO `md_property` VALUES ('8a40f0d6-0caa-4040-9e13-e37fa8888089', '0', 'gateway', '网管地址', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('8a925aa7-ad6c-4c78-9897-91490049c54b', '0', 'provisions_back', '规定归还日期', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('8c9097b4-ca4c-4514-83f1-fe2516e0e0b7', '0', 'loginname', '登录名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('8dd33bc5-25cf-41e6-b586-85b6be484dd3', '0', 'id', '主键', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('91aeb35e-ed3b-408a-ad3b-de0df96bf343', '0', 'creationtime', '创建时间', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('939704b6-4131-4f4e-9c33-951b3fb355c3', '0', 'name', '图书名称', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('956269c6-6a21-4f40-884e-9aad3824bb03', '0', 'price_timeoutrent', '租用超时价格', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('959b7c48-2f0f-4afd-aee3-e396231ad5da', '0', 'pk_booktype', '类别pk', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('97a389a7-e8c0-4d0f-9cc3-f1fdfa6ad6e2', '0', 'depttype', '部门类型', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '20', '0', '4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('98b3975e-872a-40e4-8496-3c9b965ad609', '0', 'creatorid', '创建人ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '23', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('98e9364b-abc3-4b10-8b32-89c7d295d21d', '0', 'createtime', '创建时间', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '25', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('9a59b296-bb52-46f0-b663-b676d7b7290e', '0', 'login_type', '登录类型', null, null, '678aba24-1d93-442d-aaf7-ebc7d1f996fa', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 14:38:44', '0');
INSERT INTO `md_property` VALUES ('9ab7e1ed-f92b-4a88-bdc8-35c9240f93cb', '0', 'publish', '出版社', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('a192f197-0cc3-4397-9533-c0cbeccb6e7c', '0', 'pay_fine', '应缴纳罚款', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('a38c429f-caeb-413f-8b1f-a3727a75ce4e', '0', 'pkcountry', '主键', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:18', '0');
INSERT INTO `md_property` VALUES ('a523ce91-796f-41a7-bf3a-6b4fc752e3fc', '0', 'orgtype', '类型', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '10', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('a6776e2c-c998-4b2e-80df-f140cde809a8', '0', 'modifytime', '修改时间', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '28', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('aee586f2-2bfd-453a-84d7-178b9fb3f14d', '0', 'login_status', '登录授权状态', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('aff467e2-1d37-47af-8104-2fb9707609d7', '0', 'shortname', '简称', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('b15e8882-4d03-4a80-9b0c-f7715f1f0608', '0', 'def2', '预留字段2', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '12', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('b1b3407c-71a9-4944-ac3e-2e4f1f4a03c4', '0', 'parentid', '上级ID', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '36', '0', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('b1f3b2c3-8139-4135-bb4e-4430540404d2', '0', 'institcode', '编码', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '200', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('b495daab-aa61-42d0-9a17-48a5a489b02a', '0', 'price_rent', '租用价格', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('b60c582f-e5ef-4ca5-a4a4-b644e1ce903f', '0', 'def3', '备用字段3', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('b6e2c1d2-cb32-4ed4-9c8b-b7be1d42ba06', '0', 'def1', '预留字段1', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('b791309c-0acf-4689-81ed-1b9fa2273126', '0', 'creationtime', '创建时间', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('b9c2a196-8696-41e0-b829-933a1baeeef6', '0', 'creator', '创建人', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('bb25fbc1-7528-45e7-801d-ae413fa1e445', '0', 'creator', '创建人', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '24', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('bb85cc0c-b6ce-43ce-84ac-f043e808a6c6', '0', 'pk_collegetype', '类别pk', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('bc9aa608-9761-450a-a718-7feaa0df2429', '0', 'orgid', '主键', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('bca70997-d972-442b-a7ef-1025946f9746', '0', 'def3', '预留字段3', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('bdc6bca4-4884-487f-838f-addc10d33f64', '0', 'remark', '备注', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '512', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '22', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('be3333c8-e3e5-45a3-abba-dd1f8e8aa737', '0', 'def2', '预留字段2', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('bffc4f72-4bfc-4353-a0a3-a0414563b101', '0', 'code', '编码', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('c0405348-05ff-4f3e-b9ce-9917eb2c27c4', '0', 'def2', '预留字段2', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('c0cf284b-9fe7-4620-bc4b-71eb4afb7a7a', '0', 'createtime', '创建时间', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'N', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('c28b13d4-d7ff-4d21-944b-554b02f1e247', '0', 'statusname', '状态姓名', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '21', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('c2fd8b19-61c6-440b-beb7-6bf3ce9cab93', '0', 'name', '名称', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('c3ce6791-fc2f-4d90-aea8-3bf4e977157a', '0', 'def1', '备用字段1', null, null, 'f7330b88-d425-4f4e-9a2f-82584105d584', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-20 09:29:51', '0');
INSERT INTO `md_property` VALUES ('c44a1085-6598-454a-b9e6-f77e7875c119', '0', 'description', '描述', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('c5ed8edf-5f04-4a5c-9064-59ea26f40299', '0', 'modifytime', '修改时间', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('c626af22-65ed-4d02-ac21-9e99ee465a96', '0', 'id', '主键', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('c66b6d38-9406-4cc9-843b-ab3509e77b93', '0', 'def1', '预留字段1', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('c80f1798-ce8e-43c4-9cd4-ba2e2c4950d1', '0', 'deptcanceldate', '部门撤销日期', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('c8334364-7ab9-4266-8d4b-e74537935e46', '0', 'pid', 'pid', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, null, null, null, null, null, 'Y', null, 'N', 'Y', null, null, '0', null, null, null, '2016-12-15 09:49:23', '0');
INSERT INTO `md_property` VALUES ('d028afd2-12f1-4668-b4ac-fce669edd72e', '0', 'creator', '创建人', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('d03f50b7-3778-4c16-9bde-5d0b38b4bb61', '0', 'combodatamodel', '认证模式', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('d1bbb871-65d8-417d-ac80-dda7e4237e28', '0', 'modifierid', '修改人ID', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('d1c99f13-0e46-458e-94c9-65451b55724e', '0', 'shortname', '简称', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('d29f3254-56dc-47cf-81a4-513c9923bb1e', '0', 'levelid', '用户级别ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '17', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('d32cc17b-f415-415a-923f-0764443eb102', '0', 'code', 'code', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, null, null, null, null, null, 'Y', null, 'N', 'Y', null, null, '0', null, null, null, '2016-12-15 09:49:23', '0');
INSERT INTO `md_property` VALUES ('d5d9c875-0578-4c85-a1cd-c0c2b7f7de90', '0', 'userpassword', '登录密码', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('dba22392-42c5-4cd8-a203-6eaa3bd9d292', '0', 'tel', '电话', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('dbcb31c7-fb04-41d9-ae97-0e100dc3a6c4', '0', 'email', '邮箱', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('dd8e7307-46f9-48f7-a1ee-cba951edfdf2', '0', 'sort', '排序', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('de44d0af-7538-41dd-8efd-a5b11940ba25', '0', 'parentid', '上级ID', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '36', '0', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:03', '0');
INSERT INTO `md_property` VALUES ('e078997f-0db8-4f7d-901e-73eeaab2f542', '0', 'def4', '预留字段4', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '14', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('e1fb15aa-08a9-4279-9d8c-043e6f4e4d82', '0', 'name', '图书名称', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('e3291603-936f-48e4-a778-017071ac9e85', '0', 'parent_id_name', '上级名称', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('e45cb75f-a4f8-4b8e-a64e-15dc61333510', '0', 'certificatename', '证件类型名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('e4f79765-f9b9-45c2-b3cc-420d67d16687', '0', 'username', '用户名称', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '24', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('e62f95a0-0b1e-4438-8a65-64b965bac29c', '0', 'sex', '性别', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '50', '0', '90c3c346-8efe-4e48-b892-23e7b2d5f096', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('eae1d63c-46e4-4823-af45-81e75002e245', '0', 'modifierid', '修改人ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '26', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('ec6e812f-cc91-415f-8c41-4aae5fcfe187', '0', 'def1', '预留字段1', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('ef571efd-9627-48c9-b603-a53f022e4fac', '0', 'shortname', '简称', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '50', '0', '4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('efbc47f6-8b23-4a6b-8775-9dc3963276b9', '0', 'publish', '出版社', null, null, 'd9a4b2df-fc9b-45ba-9d2d-3955e386e01d', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-17 14:51:37', '0');
INSERT INTO `md_property` VALUES ('f0396f83-1892-4adf-a14f-72ea2897f28c', '0', 'timeout_length', '超时时长', null, null, 'f51311d1-9035-4f38-9b73-40fd5aa150f7', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-02-19 14:44:13', '0');
INSERT INTO `md_property` VALUES ('f1027a2c-75bb-4876-a51c-137f9d2c8c65', '0', 'sort', '排序', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');
INSERT INTO `md_property` VALUES ('f1b5fae8-796c-4c5e-a834-0aca9f5f6fe8', '0', 'peoname', '名称', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:11', '0');
INSERT INTO `md_property` VALUES ('f1c3dfb6-2d26-4f85-8173-efa3a1a412be', '0', 'pksystem', '主键', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('f23af737-d7fa-4e57-bbce-88273ee6a01f', '0', 'radiodatacontroller', '需要授权', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('f3af0453-4899-43de-8f12-a22d64d2dd64', '0', 'deptname', '名称', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('f462f724-4591-45a5-9a38-6394b565be21', '0', 'creator', '创建人', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:04', '0');
INSERT INTO `md_property` VALUES ('f564d08b-04d2-49d2-8c44-dafa11ec758b', '0', 'deptid', '部门ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '36', '0', '17ffb644-c70c-48de-a47f-c5b53f75460f', '305', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('f5b4da25-a7ed-40bb-84a5-caecc57de577', '0', 'wholename', '全称', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '200', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:19', '0');
INSERT INTO `md_property` VALUES ('fbe1071e-267d-40ce-b7bc-4f9c31be98bf', '0', 'id', '主键', null, null, '55c9033b-ba8a-42de-8382-4c7067ee43c6', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-01-16 15:15:04', '0');
INSERT INTO `md_property` VALUES ('fc314a39-47a5-4a88-ba48-4bb307d56879', '0', 'id', '主键', null, null, '8d5a036d-2522-4687-aa9f-91c7ef7b80ff', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-15 09:36:46', '0');
INSERT INTO `md_property` VALUES ('fd3ba9ab-1219-4ffd-85cd-b83d8f5e7d60', '0', 'def1', '预留字段1', null, null, 'd0d8a8f9-d214-41e0-a8fe-cbb93dd623cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2019-03-14 15:45:39', '0');

-- ----------------------------
-- Table structure for md_sysmoduleconfig
-- ----------------------------
DROP TABLE IF EXISTS `md_sysmoduleconfig`;
CREATE TABLE `md_sysmoduleconfig` (
  `tablename` varchar(50) DEFAULT NULL,
  `codefield` varchar(50) DEFAULT NULL,
  `namefield` varchar(50) DEFAULT NULL,
  `resmodulefield` varchar(50) DEFAULT NULL,
  `resmodulevalue` varchar(50) DEFAULT NULL,
  `residfield` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_sysmoduleconfig
-- ----------------------------
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');

-- ----------------------------
-- Table structure for md_table
-- ----------------------------
DROP TABLE IF EXISTS `md_table`;
CREATE TABLE `md_table` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `displayname` varchar(90) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `databaseid` varchar(50) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `isactive` char(1) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modifier` varchar(30) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  `modifytime` char(19) DEFAULT NULL,
  `resid` varchar(90) DEFAULT NULL,
  `parenttable` varchar(50) DEFAULT NULL,
  `isextendtable` char(1) DEFAULT NULL,
  `fromsourcebmf` char(1) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `tenantid` varchar(50) DEFAULT NULL,
  `resmodule` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_table
-- ----------------------------
INSERT INTO `md_table` VALUES ('bd_countryzone', '0', '国家地区', 'bd_countryzone', null, null, null, null, null, null, '2016-11-16 11:11:17', '2016-12-13 14:58:33', null, null, null, 'Y', '0', null, 'countryzone', '2016-12-15 09:49:19', '0');
INSERT INTO `md_table` VALUES ('bookborrow', '0', '图书借阅', 'bookborrow', null, null, null, null, null, null, '2019-02-16 17:06:47', '2019-02-19 13:57:30', null, null, 'N', 'Y', '0', null, 'book_borrow', '2019-02-19 14:44:13', '0');
INSERT INTO `md_table` VALUES ('bookinfo', '0', '图书信息', 'bookinfo', null, null, null, null, null, null, '2019-01-17 14:24:19', '2019-01-17 14:51:09', null, null, 'N', 'Y', '0', null, 'book_info', '2019-01-17 14:51:37', '0');
INSERT INTO `md_table` VALUES ('cardTableMeta', '0', '卡片列表', 'cardTableMeta', null, null, null, null, null, null, '2016-12-12 15:03:23', '2016-12-13 14:58:29', null, null, null, 'Y', '0', null, 'cardtable', '2016-12-15 09:48:57', '0');
INSERT INTO `md_table` VALUES ('CollegeInfo', '0', '学生信息', 'CollegeInfo', null, null, null, null, null, null, '2019-03-14 17:02:24', '2019-03-15 09:36:27', null, null, 'N', 'Y', '0', null, 'college_info', '2019-03-15 09:36:46', '0');
INSERT INTO `md_table` VALUES ('collegeType', '0', '学院类别', 'collegeType', null, null, null, null, null, null, '2019-03-14 15:16:26', '2019-03-14 15:45:14', null, null, 'N', 'Y', '0', null, 'college_type', '2019-03-14 15:45:40', '0');
INSERT INTO `md_table` VALUES ('dept', '0', '部门', 'dept', null, null, null, null, null, null, '2016-11-16 10:53:23', '2016-12-14 14:00:00', null, null, null, 'Y', '0', null, 'dept', '2016-12-15 09:49:04', '0');
INSERT INTO `md_table` VALUES ('instit', '0', '机构', 'instit', null, null, null, null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', null, null, null, 'Y', '0', null, 'address', '2016-12-15 09:49:11', '0');
INSERT INTO `md_table` VALUES ('loginLog', '0', '登录日志', 'loginLog', null, null, null, null, null, null, '2019-03-15 14:19:32', '2019-03-15 14:38:23', null, null, 'N', 'Y', '0', null, 'login_log', '2019-03-15 14:38:44', '0');
INSERT INTO `md_table` VALUES ('org', '0', '组织', 'org', null, null, null, null, null, null, '2016-11-07 13:30:47', '2016-12-14 13:59:45', null, null, null, 'Y', '0', null, 'org', '2016-12-15 09:49:03', '0');
INSERT INTO `md_table` VALUES ('payFine', '0', '缴纳罚款', 'payFine', null, null, null, null, null, null, '2019-02-19 17:38:06', '2019-02-20 09:29:24', null, null, 'N', 'Y', '0', null, 'book_payfine', '2019-02-20 09:29:51', '0');
INSERT INTO `md_table` VALUES ('sys_dict_type_meta', '0', '档案', 'sys_dict_type_meta', null, null, null, null, null, null, '2016-12-12 15:28:29', '2016-12-13 11:10:33', null, null, null, 'Y', '0', null, 'sys_dict_type', '2016-12-15 09:48:38', '0');
INSERT INTO `md_table` VALUES ('sys_user', '0', '用户管理表', 'sys_user', null, null, null, null, null, null, '2016-11-08 09:18:08', '2016-12-14 14:15:14', null, null, null, 'Y', '0', null, 'userManagement', '2016-12-15 09:49:06', '0');
INSERT INTO `md_table` VALUES ('sys_user_job', '0', '用户任职表', 'sys_user_job', null, null, null, null, null, null, '2016-11-08 09:33:28', '2016-12-14 14:15:14', null, null, null, 'Y', '0', null, 'userManagement', '2016-12-15 09:49:06', '0');
INSERT INTO `md_table` VALUES ('telbook', '0', '通讯录', 'telbook', null, null, null, null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', null, null, null, 'Y', '0', null, 'address', '2016-12-15 09:49:11', '0');

-- ----------------------------
-- Table structure for mgr_user
-- ----------------------------
DROP TABLE IF EXISTS `mgr_user`;
CREATE TABLE `mgr_user` (
  `id` varchar(64) NOT NULL,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `money` double(20,1) DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgr_user
-- ----------------------------
INSERT INTO `mgr_user` VALUES ('1', 'admin', 'Admin', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'admin', '2012-06-04 01:00:00', '47.5');
INSERT INTO `mgr_user` VALUES ('2', 'user', 'Calvin', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'user', '2012-06-04 02:00:00', '36.0');
INSERT INTO `mgr_user` VALUES ('ff71975c-7b81-4780-8179-71bbeb2a35d6', '2015015190', '邢旭东', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'user', '2019-03-15 13:46:05', '0.0');

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `parent_id` varchar(36) DEFAULT NULL,
  `org_name` varchar(200) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `org_type` varchar(10) DEFAULT NULL,
  `org_code` varchar(200) NOT NULL,
  `creationtime` datetime DEFAULT NULL,
  `org_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES (null, '用友集团', null, '集团', 'Admin', null, '100', '2016-09-22 09:56:57', '3f362161-e32b-4e59-b703-df11d871244e', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络能源部', null, '用友能源', 'Admin', null, '1212', null, '40acd2f1-bb94-47ca-8854-0487f20b9697', '2016-12-13 15:41:16', '0');
INSERT INTO `org` VALUES ('3f362161-e32b-4e59-b703-df11d871244e', '用友网络科技股份有限公司', null, '用友网络', 'Admin', null, '200', '2016-09-22 10:02:35', '761dc79a-69ac-490b-8868-4e1e4f42d039', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络大客户事业部', null, '用友大客户', 'Admin', null, '408', null, '857cc73f-1a08-4053-b717-09404168f081', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友创新投资中心', null, '用友创新', 'Admin', null, '401', '2016-09-22 10:06:23', 'a559822e-23a0-44b8-b64e-6a75f4d47848', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '用友云采', null, '云彩', 'Admin', null, '221', null, 'aa39e858-06ca-4dfa-89aa-e2fac2ead2b3', '2016-12-13 16:07:44', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友汽车', null, '用友汽车', 'Admin', null, '404', '2016-09-22 10:13:07', 'b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络建筑业务部', null, '用友建筑', 'Admin', null, '405', '2016-09-22 10:21:22', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友新道科技公司', null, '用友新道', 'Admin', null, '406', '2016-09-22 10:22:24', 'b96107c0-db63-4220-b8a2-4ba22846fb33', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络上海分公司', null, '用友上分', 'Admin', null, '402', '2016-09-22 10:07:37', 'c367c969-c676-4a6e-9254-23ff9444c3d4', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('761dc79a-69ac-490b-8868-4e1e4f42d039', '用友网络金融部', null, '用友金融', 'Admin', null, '300', '2016-09-22 10:04:18', 'f158a95d-59d3-4a19-8007-a13d10ee7705', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络北京分公司', null, '用友北分', 'Admin', null, '407', '2016-09-22 10:23:16', 'f7ff9099-3230-4a13-83a9-a494e1e2c11b', '2016-12-12 10:05:28', '0');

-- ----------------------------
-- Table structure for payfine
-- ----------------------------
DROP TABLE IF EXISTS `payfine`;
CREATE TABLE `payfine` (
  `user_name` varchar(50) DEFAULT NULL,
  `timeout_length` varchar(50) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `payfine_state` varchar(50) DEFAULT NULL,
  `def2` varchar(50) DEFAULT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price_timeoutrent` varchar(50) DEFAULT NULL,
  `pay_fine` varchar(50) DEFAULT NULL,
  `def3` varchar(50) DEFAULT NULL,
  `def1` varchar(50) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payfine
-- ----------------------------
INSERT INTO `payfine` VALUES ('admin', '2', '00827de0-9939-4fa3-9e62-4bfb99ceb5ea', '已缴纳', null, '0011', '高数', '2', '4.0', null, '2019-03-02 11:00:51', '2019-02-20 15:51:34', '0');
INSERT INTO `payfine` VALUES ('user', '7', '34f87408-6a3a-4100-aaa5-74fce0c8795c', '已缴纳', null, '0011', '高数', '2', '14.0', null, '2019-03-02 11:00:00', '2019-03-02 09:43:51', '0');

-- ----------------------------
-- Table structure for pub_multilang
-- ----------------------------
DROP TABLE IF EXISTS `pub_multilang`;
CREATE TABLE `pub_multilang` (
  `CHARSETNAME` varchar(50) DEFAULT NULL,
  `DISLPAYNAME` char(75) DEFAULT NULL,
  `dr` decimal(10,0) DEFAULT '0',
  `LANGCODE` varchar(50) DEFAULT NULL,
  `LANGDIRPATH` varchar(50) DEFAULT NULL,
  `LANGSEQ` decimal(10,0) DEFAULT NULL,
  `LOCALCOUNTRY` varchar(50) DEFAULT NULL,
  `LOCALLANG` varchar(50) DEFAULT NULL,
  `PK_MULTILANG` varchar(50) NOT NULL,
  `TRANSCLASSNAME` varchar(50) DEFAULT NULL,
  `ts` char(19) DEFAULT NULL,
  PRIMARY KEY (`PK_MULTILANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_multilang
-- ----------------------------
INSERT INTO `pub_multilang` VALUES (null, 'English', '0', 'english', null, '2', null, 'EN', 'enGB0000000000000000', null, '2016-01-10 23:07:56');
INSERT INTO `pub_multilang` VALUES (null, '简体中文', '0', 'simpchn', null, '3', null, 'ZH', 'zhCN0000000000000000', null, '2016-01-10 23:07:56');
INSERT INTO `pub_multilang` VALUES (null, '繁體中文', '0', 'tradchn', null, '1', null, 'ZF', 'zhTW0000000000000000', null, '2016-01-10 23:07:56');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` varchar(40) NOT NULL,
  `dict_type_code` varchar(100) NOT NULL,
  `dict_type_name` varchar(100) NOT NULL,
  `is_fixed` char(1) NOT NULL DEFAULT 'N',
  `remark` varchar(512) DEFAULT NULL,
  `creator_id` varchar(40) NOT NULL,
  `creator` varchar(20) NOT NULL,
  `create_time` date NOT NULL,
  `modifier_id` varchar(40) DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `modify_time` date DEFAULT NULL,
  `Dr` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('0b827953-96ca-46a1-80dd-d8fbb58282f1', '0x00C', '表外科目', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('1890045e-480d-4148-8002-750d1a880dc6', '0x00E', '结算方式', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('23374bb5-6c84-4114-8972-7ec0288275f9', '0x00B', '科目', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('3da4826b-e012-44ed-bee3-63fd5789e68f', '0x00D', '现金流量', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('51e97a33-7a14-4a73-ac66-0aa547b1fc20', '0x00A', '科目方案', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('5944d266-1356-408c-b2ce-97062c8ed3d4', '0x001', '公司目录', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('661d2f57-4d57-4792-b197-a14f5ee1a203', '0x007', '会计主体账簿', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('dea61165-2f79-44d5-83ca-9e672a6ec8d6', '0x009', '科目类型', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('e3014bf0-7a71-4001-93a2-cc3f8581a78d', '0x008', '常用摘要', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('e8c486ed-fdbc-4b0c-ae0d-d1643f82ee50', '0x004', '币种', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('e9059b2a-cf48-480a-9e44-4e9aba803f8c', '0x003', '行政区划', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('ecf4562d-12f4-4f13-9b7f-b661f0b72634', '0x002', '联系人', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('f5aad43c-b347-43fe-8996-ec5973624c55', '0x006', '核算账簿', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');

-- ----------------------------
-- Table structure for sys_dict_type_meta
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type_meta`;
CREATE TABLE `sys_dict_type_meta` (
  `dict_type_code` varchar(100) DEFAULT NULL,
  `creator_id` varchar(40) DEFAULT NULL,
  `is_fixed` varchar(50) DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `modifier_id` varchar(40) DEFAULT NULL,
  `dict_type_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `dict_id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_type_meta
-- ----------------------------
INSERT INTO `sys_dict_type_meta` VALUES ('0x00C', 'test', 'N', null, '', 'admin', null, '表外科目', '2016-12-21 00:00:00', null, '0b827953-96ca-46a1-80dd-d8fbb58282f1', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00E', 'test', 'N', null, '', 'admin', null, '结算方式', '2016-12-21 00:00:00', null, '1890045e-480d-4148-8002-750d1a880dc6', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00B', 'test', 'N', null, '', 'admin', null, '科目', '2016-12-21 00:00:00', null, '23374bb5-6c84-4114-8972-7ec0288275f9', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00D', 'test', 'N', null, '', 'admin', null, '现金流量', '2016-12-21 00:00:00', null, '3da4826b-e012-44ed-bee3-63fd5789e68f', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00A', 'test', 'N', null, '', 'admin', null, '科目方案', '2016-12-21 00:00:00', null, '51e97a33-7a14-4a73-ac66-0aa547b1fc20', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x001', 'test', 'N', null, '', 'admin', null, '公司目录', '2016-12-21 00:00:00', null, '5944d266-1356-408c-b2ce-97062c8ed3d4', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x007', 'test', 'N', null, '', 'admin', null, '会计主体账簿', '2016-12-21 00:00:00', null, '661d2f57-4d57-4792-b197-a14f5ee1a203', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x009', 'test', 'N', null, '', 'admin', null, '科目类型', '2016-12-21 00:00:00', null, 'dea61165-2f79-44d5-83ca-9e672a6ec8d6', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x008', 'test', 'N', null, '', 'admin', null, '常用摘要', '2016-12-21 00:00:00', null, 'e3014bf0-7a71-4001-93a2-cc3f8581a78d', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x004', 'test', 'N', null, '', 'admin', null, '币种', '2016-12-21 00:00:00', null, 'e8c486ed-fdbc-4b0c-ae0d-d1643f82ee50', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x003', 'test', 'N', null, '', 'admin', null, '行政区划', '2016-12-21 00:00:00', null, 'e9059b2a-cf48-480a-9e44-4e9aba803f8c', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x002', 'test', 'N', null, '', 'admin', null, '联系人', '2016-12-21 00:00:00', null, 'ecf4562d-12f4-4f13-9b7f-b661f0b72634', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x006', 'test', 'N', null, '', 'admin', null, '核算账簿', '2016-12-21 00:00:00', null, 'f5aad43c-b347-43fe-8996-ec5973624c55', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x005', 'test', 'N', null, '', 'admin', null, '会计主体', '2016-12-21 00:00:00', null, 'fafd6667-dad6-460f-b94a-35043b98cbf7', null, '0');

-- ----------------------------
-- Table structure for sys_prompt
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompt`;
CREATE TABLE `sys_prompt` (
  `moudle` varchar(32) NOT NULL,
  `error_code` varchar(32) NOT NULL,
  `error_version` varchar(32) NOT NULL,
  `error_desc` varchar(32) DEFAULT NULL,
  `error_cause` varchar(255) DEFAULT NULL,
  `error_solution` varchar(255) DEFAULT NULL,
  `locale` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`moudle`,`error_code`,`error_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_prompt
-- ----------------------------
INSERT INTO `sys_prompt` VALUES ('dict', '100001', '0', '字典异常', '异常测试', '请删除异常测试代码', 'zh_CN');
INSERT INTO `sys_prompt` VALUES ('test', '100001', '0', '异常测试描述', '在{0,date,yyyy-MM-dd HH:mm:ss}发生了{1}个异常,造成损失{2,number,currency}元。', '异常测试解决方法如下：...', 'zh_CN');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `org_id` char(36) NOT NULL,
  `sex_id` varchar(50) DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `platform_id` varchar(1) DEFAULT NULL,
  `login_name` varchar(64) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `platform_name` varchar(16) DEFAULT NULL,
  `modifier_id` varchar(40) DEFAULT NULL,
  `status_id` varchar(1) DEFAULT NULL,
  `certificate_name` varchar(16) DEFAULT NULL,
  `user_mobile` varchar(16) DEFAULT NULL,
  `level_name` varchar(16) DEFAULT NULL,
  `user_code` varchar(32) DEFAULT NULL,
  `user_password` varchar(64) DEFAULT NULL,
  `certificate_code` varchar(32) DEFAULT NULL,
  `image_url` varchar(64) DEFAULT NULL,
  `certificate_id` varchar(1) DEFAULT NULL,
  `level_id` varchar(1) DEFAULT NULL,
  `org_name` varchar(64) DEFAULT NULL,
  `status_name` varchar(16) DEFAULT NULL,
  `user_email` varchar(64) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `creator_id` varchar(40) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('a559822e-23a0-44b8-b64e-6a75f4d47848', '0', null, null, null, 'jl', 'Admin', null, null, '1', '身份证', '13121966697', '运营用户', '122404', '000', '370702197901020065', null, '1', '1', '用友创新投资中心', '正常', 'sj@163.com', '松江', '123', '2016-11-22 00:00:00', '2016-11-22 09:22:35', null, '2016-11-22 09:22:35', '17dd5627-f0c8-45b3-add3-bee0c3672975', '2016-12-21 14:37:09', '0');
INSERT INTO `sys_user` VALUES ('032', '0', 'admin', null, '1', 'cdzh', 'admin', '运营', '', '1', '身份证', '15501003788', '金融用户', '001233', '44a8a7d56b422e5658ebce6d3b2cc6ce67f90a10', '371102198901250566', null, '1', '2', '黑龙江投资中心', '正常', 'CDZhen@xiangyu.cn', '陈代臻', 'e23d708d-7767-449a-941a-86d6d31601e9', '2016-11-17 10:54:20', '2016-11-17 10:53:39', '2016-11-17 10:59:08', '2016-11-17 10:54:22', '1cdc7067-a293-4b6d-8db0-ba59235601cc', '2016-12-21 14:29:45', '0');
INSERT INTO `sys_user` VALUES ('761dc79a-69ac-490b-8868-4e1e4f42d039', '0', null, null, null, 'kangx', 'Admin', null, null, '1', '身份证', '15801259625', '运营用户', '122104', null, '652323198402141755', null, '1', '1', '用友网络科技股份有限公司', '正常', '23w3@163.com', '康星', 'test', null, '2016-12-12 16:18:55', null, '2016-12-12 16:18:55', '30de0199-e8c7-445e-b957-056de6773b40', '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user` VALUES ('a559822e-23a0-44b8-b64e-6a75f4d47848', '1', null, null, null, 'szj', 'Admin', null, null, '1', '身份证', '15801350172 ', '运营用户', '121201', null, '220000197501201250', null, '1', '1', '用友创新投资中心', '正常', 'li@163.com', '宋仲基', 'test', '2016-12-12 00:00:00', '2016-12-12 00:00:00', null, '2016-12-12 15:50:26', '400013ed-91b2-481b-ad6d-591092c8f157', '2016-12-21 14:27:07', '0');
INSERT INTO `sys_user` VALUES ('a559822e-23a0-44b8-b64e-6a75f4d47848', '1', null, null, null, 'pyq', 'Admin', null, null, '1', '身份证', '15901170256', '运营用户', '122101', null, '130183189092349099', null, '1', '1', '用友创新投资中心', '正常', 'abc@sina.com', '裴元庆', 'test', '2016-11-27 00:00:00', '2016-12-15 00:00:00', null, '2016-12-15 10:09:12', '5b512ac5-fe2e-4bac-bd00-7f45af7a3bb6', '2016-12-21 14:23:27', '0');
INSERT INTO `sys_user` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '0', null, null, null, 'yqi', 'Admin', null, null, '1', '身份证', '13121956780', '运营用户', '112404', null, null, null, '1', '1', '用友网络金融部', '正常', 'yqy@163.com', '玉麒麟', '123', '2016-11-24 00:00:00', '2016-11-24 10:10:24', null, '2016-11-24 10:10:24', '78844170-717d-4282-a690-a4adc26e60ce', '2016-12-21 14:27:41', '0');
INSERT INTO `sys_user` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '1', null, null, null, 'ljy', 'Admin', null, null, '1', '身份证', '13845344567', '运营用户', '112403', null, null, null, '1', '1', '黑龙江投资管理中心', '正常', 'lju@163.com', '卢俊义', null, '2016-11-24 00:00:00', '2016-11-24 10:09:32', null, '2016-11-24 10:09:32', '90aaaf78-9f8e-496d-a125-e69c6eef6648', '2016-12-08 13:21:26', '0');
INSERT INTO `sys_user` VALUES ('b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '1', null, null, null, 'fanrj', 'Admin', null, null, '1', '身份证', '15801351327', '运营用户', '122103', null, '42108319830528155X', null, '1', '1', '用友汽车', '正常', 'frj@163.com', '樊汝钰', 'test', '2016-12-13 00:00:00', '2016-12-13 00:00:00', null, '2016-12-13 13:50:55', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user` VALUES ('031', '0', 'admin', null, '1', 'liufj', 'admin', '运营', null, '1', '身份证', '15501002866', '金融用户', '000192', '83b944b3e9bbde533886f2ef1eb32b56cf165fce', '421224197811178789', null, '1', '2', '黑龙江投资中心', '正常', 'lfjia@xiangyu.cn', '刘馥嘉', 'e23d708d-7767-449a-941a-86d6d31601e9', '2016-11-17 11:06:17', '2016-11-17 11:06:21', '2016-11-17 11:06:29', '2016-11-17 11:06:27', 'a82dd979-a300-44a2-bcc9-f701a0a60b59', '2016-12-21 14:37:32', '0');
INSERT INTO `sys_user` VALUES ('1cdc7067-a293-4b6d-8db0-ba59235601cc', '1', null, null, null, 'lzs', 'Admin', null, null, '1', '身份证', '13121966609', '运营用户', '112402', null, null, null, '1', '1', '黑龙江投资管理中心', '正常', 'fakeemail@yonyou.com', '鲁智花', '123', '2016-11-24 00:00:00', '2016-11-24 10:07:38', null, '2016-11-24 10:07:38', 'bcaed99d-e04e-45af-9f0d-dd07199a0c15', '2016-12-21 14:27:53', '0');
INSERT INTO `sys_user` VALUES ('031', '0', 'admin', null, '1', 'ludl', 'admin', '运营', '', '2', '身份证', '13554543244', '商户用户', '000212', '44a8a7d56b422e5658ebce6d3b2cc6ce67f90a10', null, null, '1', '3', '黑龙江投资中心', '冻结', 'fakeemail@yonyou.com', '鲁达林', 'e23d708d-7767-449a-941a-86d6d31601e9', '2016-11-17 10:54:20', '2016-11-17 10:53:39', '2016-11-17 10:59:08', '2016-11-17 10:54:22', 'c7385f57-44fb-4d75-ac50-b27269458f26', '2016-12-21 14:37:25', '0');
INSERT INTO `sys_user` VALUES ('f7ff9099-3230-4a13-83a9-a494e1e2c11b', '1', null, null, null, 'qsb', 'Admin', null, null, '1', '身份证', '13434545678', '运营用户', '122102', null, '371626198804152868', null, '1', '1', '用友网络北京分公司', '正常', 'qsb@163.com', '秦叔宝', 'test', '2016-12-13 00:00:00', '2016-12-13 00:00:00', null, '2016-12-13 16:43:50', 'f1da0f87-dc51-470a-9d72-acbe75010ec5', '2016-12-21 14:24:48', '0');
INSERT INTO `sys_user` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '1', null, null, null, 'bzt', 'Admin', null, null, '1', '身份证', '13456787653', '运营用户', '112401', null, null, null, '1', '1', '黑龙江投资管理中心', '正常', 'lc@163.com', '林冲从', '123', '2016-11-24 00:00:00', '2016-11-24 10:06:54', null, '2016-11-24 10:06:54', 'f3d0cd37-f6ac-4c95-97bb-29a70b81c24d', null, '0');

-- ----------------------------
-- Table structure for sys_user_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_job`;
CREATE TABLE `sys_user_job` (
  `dept_id` char(36) NOT NULL,
  `org_id` char(36) NOT NULL,
  `user_job_note` varchar(256) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL,
  `creator` varchar(20) NOT NULL,
  `creator_id` varchar(40) NOT NULL,
  `is_default` varchar(50) NOT NULL,
  `is_active` varchar(50) DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `modifier_id` varchar(40) DEFAULT NULL,
  `user_name` varchar(24) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `id` char(36) NOT NULL,
  `fk_id_sys_user_job` char(36) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk__job__job557408` (`fk_id_sys_user_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_job
-- ----------------------------
INSERT INTO `sys_user_job` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', 'f158a95d-59d3-4a19-8007-a13d10ee7705', null, '400013ed-91b2-481b-ad6d-591092c8f157', 'admin', 'test', 'Y', 'Y', '宋仲基', '400013ed-91b2-481b-ad6d-591092c8f157', '宋仲基', '2016-12-12 16:22:23', '2016-12-21 14:27:07', '032babe8-de59-4faa-9682-c0cc859292d7', null, '2016-12-21 14:27:07', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fbf7b09a-e347-4a0c-9670-ec0b6152b985', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', '王志鹏', '2016-11-17 11:11:43', '2016-11-17 11:11:40', '04b6fc6a-7568-48c8-8cb2-636900af3fe7', null, '2016-11-17 11:11:37', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', '40acd2f1-bb94-47ca-8854-0487f20b9697', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '168fafad-e129-4888-a7bc-f870888c7b90', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', 'f7ff9099-3230-4a13-83a9-a494e1e2c11b', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'Y', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '1f592da6-8254-473e-a225-8cd224ee8cd1', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', '857cc73f-1a08-4053-b717-09404168f081', null, '879bc53f-1ed8-40d2-9c2f-745c54bf3549', 'Admin', '123', 'Y', 'Y', null, null, '易中天', '2016-11-24 10:13:58', null, '26266297-360f-4761-a51b-44d2ef24e625', null, '2016-12-02 09:20:42', '0');
INSERT INTO `sys_user_job` VALUES ('ead53046-cf02-44ac-8ed1-23cee26f6159', '857cc73f-1a08-4053-b717-09404168f081', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '3b8abcab-6946-492d-9ee2-5ebfe028d4b3', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', 'a559822e-23a0-44b8-b64e-6a75f4d47848', null, '2a1a2d3c-d3a1-4a60-a44a-ffea251281bb', 'admin', 'e23d708d-7767-449a-941a-86d6d31601e9', 'Y', 'Y', null, null, '肖亚军', '2016-11-17 11:02:59', null, '3e2c7742-a277-483d-922d-340ce48150fe', null, null, '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', 'f7ff9099-3230-4a13-83a9-a494e1e2c11b', null, '30de0199-e8c7-445e-b957-056de6773b40', 'Admin', 'test', 'N', 'Y', '康星', '30de0199-e8c7-445e-b957-056de6773b40', '康星', '2016-12-21 14:38:29', '2016-12-21 14:42:27', '42583a7e-ad55-45e8-847c-7c6407e70fb6', '30de0199-e8c7-445e-b957-056de6773b40', '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user_job` VALUES ('研发', 'a559822e-23a0-44b8-b64e-6a75f4d47848', null, '17dd5627-f0c8-45b3-add3-bee0c3672975', 'Admin', '123', 'Y', 'Y', '松江', '17dd5627-f0c8-45b3-add3-bee0c3672975', '松江', '2016-11-22 09:22:35', '2016-12-21 14:37:09', '495b6e35-b205-4cb6-8146-cbcb60c5d957', null, '2016-12-21 14:37:09', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', '857cc73f-1a08-4053-b717-09404168f081', null, '17dd5627-f0c8-45b3-add3-bee0c3672975', 'Admin', '123', 'Y', 'Y', '松江', '17dd5627-f0c8-45b3-add3-bee0c3672975', '松江', '2016-11-22 09:22:35', '2016-12-21 14:37:09', '4fc0688b-e501-4b69-9fad-bf6b55014e1c', null, '2016-12-21 14:37:09', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', '502972cc-56a6-4938-8b90-056bef71b5a4', null, '2016-12-13 17:08:38', '0');
INSERT INTO `sys_user_job` VALUES ('aa38692e-7398-436a-b2b8-a1440821774c', 'b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', null, null, '樊汝钰', '2016-12-21 14:40:37', null, '536ebbd4-8f56-4b43-9139-f4b3afa843c2', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:40:37', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '761dc79a-69ac-490b-8868-4e1e4f42d039', null, 'f1da0f87-dc51-470a-9d72-acbe75010ec5', 'admin', 'test', 'Y', 'Y', '秦叔宝', 'f1da0f87-dc51-470a-9d72-acbe75010ec5', 'weaa', '2016-12-13 16:43:50', '2016-12-21 14:24:48', '5fe73a3d-f0eb-461a-9cc1-1dbb2b66bc32', null, '2016-12-21 14:24:49', '0');
INSERT INTO `sys_user_job` VALUES ('b34a3c95-2511-418c-afa5-cbd800c3283c', 'ba9a7efe-1dc3-4670-a42e-89451afe4117', null, '119eb1bc-b412-41c3-907e-3ef44f8dc3f4', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', null, '付佳丽', '2016-11-17 11:13:19', '2016-11-17 11:13:16', '601256d2-9583-4944-96a4-942c8d6a6ac6', null, '2016-11-17 11:13:14', '0');
INSERT INTO `sys_user_job` VALUES ('b676078b-a786-4c76-ab80-f5a9b7418e98', 'b96107c0-db63-4220-b8a2-4ba22846fb33', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '6648490d-2b48-4bf5-9c15-57ba5e97ebcc', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', 'f158a95d-59d3-4a19-8007-a13d10ee7705', null, '30de0199-e8c7-445e-b957-056de6773b40', 'Admin', 'test', 'N', 'Y', '康星', '30de0199-e8c7-445e-b957-056de6773b40', '康星', '2016-12-21 14:38:29', '2016-12-21 14:42:27', '7ad7f3dd-e062-45c7-ad48-4a184d7ec923', '30de0199-e8c7-445e-b957-056de6773b40', '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', '93769ac8-f98e-448b-bd58-3c2f6d266d92', null, '2016-12-12 16:17:47', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '761dc79a-69ac-490b-8868-4e1e4f42d039', null, 'd2b68cba-0e0b-4ae8-af4f-f17ce25c90ce', 'admin', 'e23d708d-7767-449a-941a-86d6d31601e9', 'N', 'Y', '周双印', 'd2b68cba-0e0b-4ae8-af4f-f17ce25c90ce', '周双印', '2016-11-17 11:04:36', '2016-12-08 13:29:22', 'a68cda4d-10cc-49ab-8518-9af49eafdf9a', null, '2016-12-08 13:29:22', '0');
INSERT INTO `sys_user_job` VALUES ('b676078b-a786-4c76-ab80-f5a9b7418e98', '857cc73f-1a08-4053-b717-09404168f081', 'sss', '2f661043-8858-4b44-a984-403e0e42853a', 'admin', 'test', 'Y', 'Y', 'zxs', '2f661043-8858-4b44-a984-403e0e42853a', 'zxs', '2016-12-05 09:33:54', '2016-12-05 09:34:11', 'ac203b15-4ec2-4867-9cbc-bbf3b12705a3', null, '2016-12-05 09:34:11', '0');
INSERT INTO `sys_user_job` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', 'b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', null, '30de0199-e8c7-445e-b957-056de6773b40', 'admin', 'test', 'Y', 'Y', '康星', '30de0199-e8c7-445e-b957-056de6773b40', '111', '2016-12-12 16:18:55', '2016-12-21 14:42:27', 'b851ddf5-e215-4ec7-ae9e-b46982b7d70a', null, '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', 'bb6a1fde-5055-4331-88e5-b177c1576f7c', null, '2016-12-13 16:52:38', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '总体设计师', '2257adbf-d509-4509-8a66-b57aac7008c0', 'admin', 'e23d708d-7767-449a-941a-86d6d31601e9', 'Y', 'Y', null, null, '严伟', '2016-11-17 11:05:32', null, 'cff19f3d-1bbc-4b9a-a39b-2994436f2f29', null, null, '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', 'd52f4345-1cd1-405c-84f6-894312509e21', null, '2016-12-13 15:59:01', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', 'f3cc4211-dbd3-4595-9d16-7526c3a7e480', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');

-- ----------------------------
-- Table structure for telbook
-- ----------------------------
DROP TABLE IF EXISTS `telbook`;
CREATE TABLE `telbook` (
  `countryzone` varchar(36) DEFAULT NULL,
  `institid` char(36) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `worktel` varchar(100) DEFAULT NULL,
  `office` varchar(100) DEFAULT NULL,
  `peoname` varchar(50) NOT NULL,
  `peocode` varchar(100) NOT NULL,
  `id` char(36) NOT NULL,
  `ts` datetime DEFAULT NULL,
  `dr` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_book_itid39472` (`institid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of telbook
-- ----------------------------
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'liujm@yonyou.com', '18627394713', null, '刘建民', '014', '05053283-3c2b-4890-954a-86107a2692be', '2016-12-21 14:36:00', '0');
INSERT INTO `telbook` VALUES (null, '46c6129e-05f0-43f3-997f-bc672aebec7c', null, null, 'sunxf@yonyou.com', '18678765436', null, '孙旭峰', '010', '0e2490aa-d7d9-462e-bc45-9aa8c6577d29', '2016-12-15 10:28:32', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'zhangyang@yonyou.com', '18678765436', null, '张洋', '001', '0f7de08e-817f-442f-9697-fff299ec1b98', '2016-12-15 10:25:23', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'guyz@yonyou.com', '18645362185', null, '谷艳召', '015', '8287a3f8-9aba-4caa-9dc3-8b3d1663fc69', '2016-12-21 14:36:25', '0');
INSERT INTO `telbook` VALUES (null, '98d0c98d-24f3-49e3-9343-df6c4d2b6cd5', null, null, 'liumg@yonyou.com', '18725371084', null, '刘铭刚', '011', '896e1777-ce0f-403e-9860-470519fb08b3', '2016-12-21 14:17:34', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'wangqj@yonyou.com', '18678765436', null, '王庆江', '003', '90884c41-a23b-41f8-8977-c827f89b9775', '2016-12-15 10:26:01', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'zhukai@yonou.com', '18652438765', null, '朱恺', '0012', 'ae691b6c-1175-4812-a52d-bb6928e3ff64', '2016-12-21 14:37:29', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'dingqm@yonyou.com', '18678765436', null, '丁其明', '005', 'c2b0c07e-9de8-4a91-bc2e-aa06308c9114', '2016-12-15 10:26:20', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'wuxj@yonyou.com', '18678765436', null, '吴学军', '007', 'e086dcd3-c7e7-4c83-8ee1-866f3047c3ab', '2016-12-15 10:27:39', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'lihao@yonyou.com', '18678765436', null, '李浩', '002', 'e558850a-f159-44bb-93a4-f04fdf89e143', '2016-12-15 10:25:39', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'zhengkai@yonyou.com', '18678765436', null, '郑凯', '008', 'e6c821fc-d310-4069-813d-c14894464079', '2016-12-15 10:28:02', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'denghx@yonyou.com', '18678765436', null, '邓红霞', '006', 'f6c57f28-efd9-4278-bbde-3dd79340d1d1', '2016-12-15 10:26:53', '0');
