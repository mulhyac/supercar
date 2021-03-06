/*
Navicat MySQL Data Transfer

Source Server         : localhost_conn
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : supercar

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-07-09 16:13:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `seq_name` varchar(50) NOT NULL,
  `current_val` int(11) NOT NULL,
  `increment_val` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('in_workorder_no', '7', '1');
INSERT INTO `sequence` VALUES ('out_workorder_no', '9', '1');
INSERT INTO `sequence` VALUES ('repair_workorder', '6', '1');

-- ----------------------------
-- Table structure for tb_client
-- ----------------------------
DROP TABLE IF EXISTS `tb_client`;
CREATE TABLE `tb_client` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `c_name` varchar(32) NOT NULL COMMENT '客户姓名',
  `c_sex` tinyint(4) DEFAULT NULL COMMENT '客户性别（true为男，false为女）',
  `c_idcard` varchar(32) DEFAULT NULL COMMENT '客户身份证',
  `c_level` varchar(32) NOT NULL COMMENT '客户级别，数据字典外键',
  `c_type` varchar(32) NOT NULL COMMENT '客户类别，数据字典外键',
  `c_email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `c_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `c_address` varchar(20) DEFAULT NULL COMMENT '地址',
  `c_company` varchar(32) DEFAULT NULL COMMENT '所属门店',
  `description` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isdeleted` tinyint(4) DEFAULT '0',
  `car_no` varchar(32) NOT NULL COMMENT '车牌号',
  `car_brand` varchar(32) NOT NULL COMMENT '车品牌，外键',
  `car_model` varchar(32) DEFAULT NULL,
  `car_chassis` varchar(32) DEFAULT NULL COMMENT '底盘号',
  `extend2` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend3` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `car_color` varchar(32) DEFAULT NULL COMMENT '车身颜色',
  `car_engine` varchar(32) DEFAULT NULL COMMENT '发动机号',
  `car_insurer` varchar(32) DEFAULT NULL COMMENT '保险公司',
  `car_insurance_endtime` datetime DEFAULT NULL COMMENT '保险到期时间',
  `car_registration_time` datetime DEFAULT NULL COMMENT '上牌日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `c_idcard` (`c_idcard`),
  KEY `c_type` (`c_type`),
  KEY `c_level` (`c_level`),
  KEY `car_model_fk` (`car_brand`),
  KEY `cp_company_fk` (`c_company`),
  CONSTRAINT `c_level_fk` FOREIGN KEY (`c_level`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `c_type_fk` FOREIGN KEY (`c_type`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `car_model_fk` FOREIGN KEY (`car_brand`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `cp_company_fk` FOREIGN KEY (`c_company`) REFERENCES `tb_company` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_client
-- ----------------------------
INSERT INTO `tb_client` VALUES ('1', 'wsz', '1', '42102366262266', '5713DCD00601409187CF0F975E92213C', '5', '842803829@qq.com', '18782252525', '广发银行总部99楼', '1', '此用户是大客户', '2017-06-17 17:51:41', '2017-06-30 08:12:40', '0', '甘P82585', '1', '99x', '1111', null, null, '红', '12312', '天天保险', '2017-06-23 17:49:59', '2017-06-29 17:50:03');
INSERT INTO `tb_client` VALUES ('A69C44EAAB8A4967A2D139CA88C7DFD9', 'name', null, 'idcard', '700886ED4ECE4DAC8BBB908DF7553894', '3', 'email', 'mobile', 'address', '1', 'description', '2017-06-27 22:35:03', '2017-06-30 08:12:28', '1', 'carNo', '1', 'carModel', 'carVIN', null, null, 'carColor', 'engineNo', 'insurer', null, null);

-- ----------------------------
-- Table structure for tb_company
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company` (
  `ID` varchar(32) NOT NULL,
  `CP_NAME` varchar(50) NOT NULL COMMENT '公司名称',
  `CP_CODE` varchar(50) DEFAULT NULL COMMENT '公司code',
  `CP_BRAND` varchar(50) DEFAULT NULL COMMENT '公司品牌',
  `CP_TYPE` varchar(32) NOT NULL COMMENT '公司类别',
  `CP_MOBILE` varchar(50) DEFAULT NULL COMMENT '售后热线',
  `CP_CARNO` varchar(50) DEFAULT NULL COMMENT '默认车牌',
  `CP_EMAIL` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `CP_ADDRESS` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `CP_DESCRIPTION` varchar(50) DEFAULT NULL COMMENT '备注',
  `ISDELETED` smallint(6) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `cp_type_fk2` (`CP_TYPE`),
  KEY `CP_EMAIL_fk2` (`CP_EMAIL`),
  CONSTRAINT `cp_type_fk` FOREIGN KEY (`CP_TYPE`) REFERENCES `tb_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES ('1', '深圳门店', 'shenzhen', '辉门冠军', 'E2221CCC83404FAEB89A882D5E112E15', '111', '深A', null, null, null, '0', '2017-06-18 14:37:28', '2017-06-18 14:37:28');
INSERT INTO `tb_company` VALUES ('2', '兰州门店', 'lanzhou', '辉门冠军', 'E2221CCC83404FAEB89A882D5E112E15', '222', '甘A', null, null, null, '0', '2017-06-18 14:37:28', '2017-06-18 14:37:28');

-- ----------------------------
-- Table structure for tb_inventory
-- ----------------------------
DROP TABLE IF EXISTS `tb_inventory`;
CREATE TABLE `tb_inventory` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `p_id` varchar(32) NOT NULL COMMENT '配件id',
  `p_count` int(11) DEFAULT '0' COMMENT '配件库存数目',
  `p_cost` decimal(10,2) DEFAULT NULL COMMENT '进货价',
  `p_supplier` varchar(32) NOT NULL COMMENT '供应商，数据字典外键',
  `p_company` varchar(32) DEFAULT NULL COMMENT '所属门店',
  `r_code` varchar(32) DEFAULT NULL COMMENT '库位号code，数据字典外键',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id_fk` (`p_id`),
  KEY `p_supplier_fk` (`p_supplier`),
  KEY `r_code_fk` (`r_code`),
  KEY `inventory_p_company_fk` (`p_company`),
  CONSTRAINT `inventory_p_company_fk` FOREIGN KEY (`p_company`) REFERENCES `tb_company` (`ID`),
  CONSTRAINT `p_id_fk` FOREIGN KEY (`p_id`) REFERENCES `tb_part` (`id`),
  CONSTRAINT `p_supplier_fk` FOREIGN KEY (`p_supplier`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `r_code_fk` FOREIGN KEY (`r_code`) REFERENCES `tb_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存';

-- ----------------------------
-- Records of tb_inventory
-- ----------------------------
INSERT INTO `tb_inventory` VALUES ('87c4ce9461e511e7a848704d7bbc2105', '3A9A0BE24BD14C5999C3F74533D8C769', '5', null, '1', '1', '1', '0', null, null, null);
INSERT INTO `tb_inventory` VALUES ('936c6b7a621d11e7b44d0c5b8f279a64', '6EE27FCCC34C4C86ABB2B6FAD3FA9BC9', '-3', null, '1', '1', '1', '0', null, null, null);
INSERT INTO `tb_inventory` VALUES ('ee9ee9f3646111e7a848704d7bbc2105', '475980DBF3FC4EC48B63C7C04156B5FC', '2', '2.00', '1', '1', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_in_part
-- ----------------------------
DROP TABLE IF EXISTS `tb_in_part`;
CREATE TABLE `tb_in_part` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `in_workorder_no` varchar(32) DEFAULT NULL COMMENT '入库单号',
  `in_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `in_pay_method` varchar(32) DEFAULT NULL COMMENT '结算方式，数据字典',
  `in_sum` double DEFAULT NULL COMMENT '合计金额',
  `p_supplier` varchar(32) NOT NULL COMMENT '供应商，数据字典外键',
  `company` varchar(32) DEFAULT NULL COMMENT '所属门店，门店外键',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `in_workorder_no` (`in_workorder_no`),
  KEY `pin_pay_method_fk` (`in_pay_method`),
  KEY `in_p_supplier_fk` (`p_supplier`),
  KEY `p_company_fk` (`company`),
  CONSTRAINT `in_p_supplier_fk` FOREIGN KEY (`p_supplier`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `p_company_fk` FOREIGN KEY (`company`) REFERENCES `tb_company` (`ID`),
  CONSTRAINT `pin_pay_method_fk` FOREIGN KEY (`in_pay_method`) REFERENCES `tb_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_in_part
-- ----------------------------
INSERT INTO `tb_in_part` VALUES ('08F22782833749F9AB39B33DFC5C81C8', '7', '2017-07-09 12:51:10', '1', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part` VALUES ('26C8896F698146A0A10FA37A8B3977C3', '3', '2017-07-06 08:52:58', '1', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part` VALUES ('509E155EA0954190AF5CDA1A5539BB14', '4', '2017-07-06 15:34:42', '1', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part` VALUES ('6124ECF86A1145ACB74BE27357F2E8FF', '6', '2017-07-09 12:48:23', '1', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part` VALUES ('7995AD2F17C9490BBAA937C7F5364ADC', '5', '2017-07-06 15:36:06', '1', null, '1', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_in_part_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_in_part_info`;
CREATE TABLE `tb_in_part_info` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `in_workorder_no` varchar(32) DEFAULT NULL COMMENT '入库单号',
  `p_id` varchar(32) DEFAULT NULL COMMENT '配件id',
  `in_count` int(11) DEFAULT NULL COMMENT '配件入库数目',
  `p_cost` decimal(10,2) DEFAULT NULL COMMENT '进货价',
  `p_supplier` varchar(32) NOT NULL COMMENT '供应商，数据字典外键',
  `r_code` varchar(32) DEFAULT NULL COMMENT '库位号code，数据字典外键',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_p_id_fk` (`p_id`),
  KEY `info_p_supplier_fk` (`p_supplier`),
  KEY `info_r_code_fk` (`r_code`),
  CONSTRAINT `info_p_id_fk` FOREIGN KEY (`p_id`) REFERENCES `tb_part` (`id`),
  CONSTRAINT `info_p_supplier_fk` FOREIGN KEY (`p_supplier`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `info_r_code_fk` FOREIGN KEY (`r_code`) REFERENCES `tb_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_in_part_info
-- ----------------------------
INSERT INTO `tb_in_part_info` VALUES ('3432182AEBFE490BA076C867F15C101C', '4', '3A9A0BE24BD14C5999C3F74533D8C769', '2', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('59E8C884A5F64459855C5491087F1253', '3', '3A9A0BE24BD14C5999C3F74533D8C769', '1', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('977179C80F0648DBB7D0CF30F87A3A68', '5', '6EE27FCCC34C4C86ABB2B6FAD3FA9BC9', '2', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('979700FB9737428D8B5D3E322FCD7D50', '6', '475980DBF3FC4EC48B63C7C04156B5FC', '1', '2.00', '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('BA180EDB61454C17A765FC646DE81B13', '4', '6EE27FCCC34C4C86ABB2B6FAD3FA9BC9', '2', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('BC93EC86FA8E48239D957F16320C78AA', '5', '3A9A0BE24BD14C5999C3F74533D8C769', '2', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('C8DCAF92EA704C41BA14B8C47D0F10A7', '6', '3A9A0BE24BD14C5999C3F74533D8C769', '1', '1.00', '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('D453501ADA044E70B682E9647E9A2037', '7', '3A9A0BE24BD14C5999C3F74533D8C769', '1', '1.10', '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('DC88B8762AAA41CAA5D387FE59D7E5E0', '3', '3A9A0BE24BD14C5999C3F74533D8C769', '1', null, '1', '1', '0', null, null, null);
INSERT INTO `tb_in_part_info` VALUES ('F4A707BB702649C6B5948F07D1B3DE46', '7', '475980DBF3FC4EC48B63C7C04156B5FC', '1', '2.20', '1', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_lookup
-- ----------------------------
DROP TABLE IF EXISTS `tb_lookup`;
CREATE TABLE `tb_lookup` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `LKD_ID` varchar(32) NOT NULL COMMENT '数据字典定义id，外键',
  `LK_CODE` varchar(32) NOT NULL COMMENT '数据字典code',
  `LK_VALUE` varchar(32) NOT NULL COMMENT '数据字典value',
  `LK_ADDITIONAL` varchar(100) DEFAULT NULL COMMENT '附加内容',
  `LK_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '数据字典描述',
  `LK_LEVEL` int(10) DEFAULT '1' COMMENT '节点层级',
  `LK_PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父节点id',
  `LK_IS_LEAF` smallint(10) DEFAULT '1' COMMENT '是否叶子节点',
  `LK_LEVEL1_ID` varchar(32) DEFAULT NULL COMMENT '一级父节点',
  `LK_LEVEL2_ID` varchar(32) DEFAULT NULL COMMENT '二级父节点',
  `LK_LEVEL3_ID` varchar(32) DEFAULT NULL COMMENT '三级父节点',
  `LK_LEVEL4_ID` varchar(32) DEFAULT NULL COMMENT '四级父节点',
  `LK_LEVEL5_ID` varchar(32) DEFAULT NULL COMMENT '五级父节点',
  `LK_LEVEL6_ID` varchar(32) DEFAULT NULL COMMENT '六级父节点',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`LK_CODE`),
  KEY `lookup_definition_fk` (`LKD_ID`),
  CONSTRAINT `lookup_definition_fk` FOREIGN KEY (`LKD_ID`) REFERENCES `tb_lookup_df` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lookup
-- ----------------------------
INSERT INTO `tb_lookup` VALUES ('049C1B34F160472EB0712A6427292F14', '1', 'AUTO', '奥迪', null, null, '1', null, '1', '049C1B34F160472EB0712A6427292F14', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('0A764AB31DA746A7A89815F5958C20D0', '88B2BCF91A124C119D9AFD47EC872E87', '2000', '电器相关', null, null, '1', null, '0', '0A764AB31DA746A7A89815F5958C20D0', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('1', '1', 'BYD', '比亚迪', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('192E16F8EA434E029E7911BF9770A504', '88B2BCF91A124C119D9AFD47EC872E87', '1000', '发动机相关', null, null, '1', null, '0', '192E16F8EA434E029E7911BF9770A504', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('2', '1', 'Ben-Z', '奔驰', null, 'AAA', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('200A24BA0A0C4EF5B19E0244931BA954', '88B2BCF91A124C119D9AFD47EC872E87', '30001', '前悬架', null, null, '2', 'E232A1884DCD4E668E29860C202F088A', '1', 'E232A1884DCD4E668E29860C202F088A', '200A24BA0A0C4EF5B19E0244931BA954', null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('287A959F16BC423BA27D1AC3D99BA752', '0040694F322542C9B98A09712DC346D6', 'code002', '002', null, null, '1', null, '1', '287A959F16BC423BA27D1AC3D99BA752', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('3', '2', 'normal', '普通用户', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('349DBB62003E4CB7A29F7A0D19790682', '35D65110D3164208B1F303842DAF661D', 'barrel', '桶', null, null, '1', null, '1', '349DBB62003E4CB7A29F7A0D19790682', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('389FA81D83D849EBAFB21AC4C6E932EF', '88B2BCF91A124C119D9AFD47EC872E87', '00001', '发动机润滑油', null, '测试子节点1', '2', '7FA179BA0BAF4CA4874DA57DD6393861', '1', '7FA179BA0BAF4CA4874DA57DD6393861', '389FA81D83D849EBAFB21AC4C6E932EF', null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('4', '2', 'silver', '银牌用户', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('5', '2', 'gold', '金牌用户', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('53D57671F37F464F8D30734A53F2DEEC', '0040694F322542C9B98A09712DC346D6', 'code001', '001', null, null, '1', null, '1', '53D57671F37F464F8D30734A53F2DEEC', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('5713DCD00601409187CF0F975E92213C', 'D2D734CFEDFF4CEBA87AE954E8DE9AE3', 'persion', '个人', null, null, '1', null, '1', '5713DCD00601409187CF0F975E92213C', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('6', '1', 'lbjl', '兰博基尼', null, null, '0', null, '0', null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('63518C625471443AA8DDB03BE0447BB5', '35D65110D3164208B1F303842DAF661D', 'individual', '个', null, null, '1', null, '1', '63518C625471443AA8DDB03BE0447BB5', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('700886ED4ECE4DAC8BBB908DF7553894', 'D2D734CFEDFF4CEBA87AE954E8DE9AE3', 'unit', '单位', null, null, '1', null, '1', '700886ED4ECE4DAC8BBB908DF7553894', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('73251BB95A2444AE9A65A758314B6E08', '1', 'BMW', '宝马', null, null, '1', null, '1', '73251BB95A2444AE9A65A758314B6E08', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('73C970D8567A4833B554D6EECE5BBFF5', '33B849B72D644304B7CC2B6CAEF6D0DE', 'buckets', '一整桶', null, null, '1', null, '1', '73C970D8567A4833B554D6EECE5BBFF5', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('7E66A5AEF4BC46AA91D9174EE861DA12', '88B2BCF91A124C119D9AFD47EC872E87', '10001', '发动机及附件', null, '测试子节点2', '2', '192E16F8EA434E029E7911BF9770A504', '1', '192E16F8EA434E029E7911BF9770A504', '7E66A5AEF4BC46AA91D9174EE861DA12', null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('7FA179BA0BAF4CA4874DA57DD6393861', '88B2BCF91A124C119D9AFD47EC872E87', '0000', '保养', null, null, '1', null, '0', '7FA179BA0BAF4CA4874DA57DD6393861', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('A072D82A6AE14146B47A70E4C58AA28D', 'E3F9A726B2434B219EDEE2E23734EA4B', 'admin', '管理员', null, '最高权限的角色，可查看所有门店账号、客户、维修工单', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('ACA48F72F47A4F698699167FFA09FD5E', '35D65110D3164208B1F303842DAF661D', 'peace', '只', null, null, '1', null, '1', 'ACA48F72F47A4F698699167FFA09FD5E', null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('C1145C53367340D4969A0B682FD53AC8', '88B2BCF91A124C119D9AFD47EC872E87', '20001', '空调及暖风', null, null, '2', '0A764AB31DA746A7A89815F5958C20D0', '1', '0A764AB31DA746A7A89815F5958C20D0', 'C1145C53367340D4969A0B682FD53AC8', null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('E2221CCC83404FAEB89A882D5E112E15', '1253114623E54642A38112E4142E0D5A', 'repair_shop', '快修门店', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_lookup` VALUES ('E232A1884DCD4E668E29860C202F088A', '88B2BCF91A124C119D9AFD47EC872E87', '3000', '底盘相关', null, null, '1', null, '0', 'E232A1884DCD4E668E29860C202F088A', null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_lookup_df
-- ----------------------------
DROP TABLE IF EXISTS `tb_lookup_df`;
CREATE TABLE `tb_lookup_df` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `LKD_CODE` varchar(32) NOT NULL COMMENT '数据字典定义code',
  `LKD_NAME` varchar(32) NOT NULL COMMENT '数据字典定义名称',
  `LKD_TYPE` varchar(32) DEFAULT NULL COMMENT '数据字典定义类型，0为普通，1为树结构',
  `LKD_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '数据字典定义描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`LKD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lookup_df
-- ----------------------------
INSERT INTO `tb_lookup_df` VALUES ('0040694F322542C9B98A09712DC346D6', 'repCode', '库位号', '0', '测试库位号', '2017-06-29 09:43:03', '2017-06-29 09:43:03', '0');
INSERT INTO `tb_lookup_df` VALUES ('1', 'car_brand', '车辆品牌', '0', null, '2017-06-28 21:25:51', '2017-06-28 21:28:28', '0');
INSERT INTO `tb_lookup_df` VALUES ('1253114623E54642A38112E4142E0D5A', 'company_type', '公司类型', '0', null, '2017-06-18 14:24:56', '2017-06-28 21:28:30', '0');
INSERT INTO `tb_lookup_df` VALUES ('2', 'client_level', '客户级别', '0', '不同级别客户享受的优惠不一样', null, '2017-06-28 21:28:31', '0');
INSERT INTO `tb_lookup_df` VALUES ('33B849B72D644304B7CC2B6CAEF6D0DE', 'part_specification', '商品规格', '0', null, '2017-06-29 10:16:18', '2017-06-29 10:16:18', '0');
INSERT INTO `tb_lookup_df` VALUES ('35D65110D3164208B1F303842DAF661D', 'unit', '单位', '0', '测试数据', '2017-06-28 21:11:13', '2017-06-28 21:11:13', '0');
INSERT INTO `tb_lookup_df` VALUES ('88B2BCF91A124C119D9AFD47EC872E87', 'part_type', '配件分类', '1', '树结构', '2017-06-27 21:24:18', '2017-06-28 08:21:16', '0');
INSERT INTO `tb_lookup_df` VALUES ('D2D734CFEDFF4CEBA87AE954E8DE9AE3', 'client_type', '客户类型', '0', null, '2017-06-25 09:38:38', '2017-06-28 21:28:38', '0');
INSERT INTO `tb_lookup_df` VALUES ('E3F9A726B2434B219EDEE2E23734EA4B', 'user_role', '账号角色', '0', '账号角色，不同角色权限不一', '2017-06-18 16:18:32', '2017-06-28 21:28:41', '0');

-- ----------------------------
-- Table structure for tb_out_part
-- ----------------------------
DROP TABLE IF EXISTS `tb_out_part`;
CREATE TABLE `tb_out_part` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `out_workorder_no` varchar(32) DEFAULT NULL COMMENT '出库单号',
  `out_type` varchar(32) DEFAULT NULL COMMENT '出库类型，0-维修领料，1-配件销售，2-配件内耗',
  `out_client_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `out_receiver` varchar(32) DEFAULT NULL COMMENT '领料人，用户外键',
  `out_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `out_sum` decimal(10,2) DEFAULT NULL COMMENT '合计金额',
  `repair_workorder_no` varchar(50) DEFAULT NULL COMMENT '维修工单号。出库类型：维修领料时使用',
  `car_no` varchar(32) DEFAULT NULL COMMENT '车牌号。出库类型：配件销售时使用',
  `department` varchar(32) DEFAULT NULL COMMENT '部门，数据字典外键。出库类型：配件内耗时使用',
  `company` varchar(32) DEFAULT NULL COMMENT '所属门店，公司外键',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_workorder_no` (`out_workorder_no`),
  KEY `out_type_fk` (`out_type`),
  KEY `out_p_company_fk` (`company`),
  KEY `out_receiver_fk` (`out_receiver`),
  CONSTRAINT `out_p_company_fk` FOREIGN KEY (`company`) REFERENCES `tb_company` (`ID`),
  CONSTRAINT `out_receiver_fk` FOREIGN KEY (`out_receiver`) REFERENCES `tb_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库工单';

-- ----------------------------
-- Records of tb_out_part
-- ----------------------------
INSERT INTO `tb_out_part` VALUES ('1EE48C82837B4AE484839F3C10C394C2', '9', '1', 'clientName', '1', '2017-07-07 16:54:37', '11.00', '6', 'carNo', '1', '1', '0', null, null, null);
INSERT INTO `tb_out_part` VALUES ('213AB1D129944073A8160C33766FD0F7', '2', '0', 'clientName', '1', '2017-07-06 17:20:35', null, 'repairWorkorderNo', 'carNo', '1', '1', '1', null, null, null);
INSERT INTO `tb_out_part` VALUES ('4E3AC9AA1B8C4C92A61B6994F256C78C', '4', '1', 'clientName', '1', '2017-07-06 17:43:06', null, 'repairWorkorderNo', 'carNo', '1', '1', '1', null, null, null);
INSERT INTO `tb_out_part` VALUES ('A50C7514B3E54182BF0139DF0181B9B4', '3', '1', 'clientName', '1', '2017-07-06 17:43:06', null, 'repairWorkorderNo', 'carNo', '1', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for tb_out_part_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_out_part_info`;
CREATE TABLE `tb_out_part_info` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `out_workorder_no` varchar(50) DEFAULT NULL COMMENT '出库单号',
  `inventory_id` varchar(32) DEFAULT NULL COMMENT '库存配件id，外键',
  `p_sale` decimal(10,2) DEFAULT NULL COMMENT '配件销售价',
  `out_count` int(11) DEFAULT NULL COMMENT '配件出库数目',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_id_fk` (`inventory_id`),
  CONSTRAINT `inventory_id_fk` FOREIGN KEY (`inventory_id`) REFERENCES `tb_inventory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库工单配件信息';

-- ----------------------------
-- Records of tb_out_part_info
-- ----------------------------
INSERT INTO `tb_out_part_info` VALUES ('065A88C84BEB414E86D425C43D47B801', '4', '936c6b7a621d11e7b44d0c5b8f279a64', '22.00', '3', '1', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('121C04A4E8C64765A39FB99E2C2993E2', '7', '936c6b7a621d11e7b44d0c5b8f279a64', '22.00', '3', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('277008D1937147D789236FF1B802F2F8', '4', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '2', '1', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('33840FE28DFE4E2792F115BF2A9C5DB3', '3', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '2', '1', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('3D432077FF9543B4BD2BF8203E0B03FD', '9', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '1', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('6001055E6CC149FB90B32E75CB0AA5B2', '8', '936c6b7a621d11e7b44d0c5b8f279a64', '12.00', '3', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('7784D0D7F3604BB9BDF53F0B46B31FAD', '3', '936c6b7a621d11e7b44d0c5b8f279a64', '22.00', '3', '1', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('8C78B59CE16A468CA2369B74B901AEE4', '6', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '2', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('9B059535B23A4C0E8726E1C7C1382BE3', '7', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '2', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('AA3D28F937054C2B9BF2FCCBAFCEA85C', '9', '936c6b7a621d11e7b44d0c5b8f279a64', '12.00', '3', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('B824E862DDB44E0E89B7AB498404195E', '6', '936c6b7a621d11e7b44d0c5b8f279a64', '22.00', '3', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('D976096EAAA6482A94D9B0072D3BC227', '8', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '1', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('EF8E4A1062114B4CB7BC76543B0ED0AA', '5', '87c4ce9461e511e7a848704d7bbc2105', '11.00', '1', '0', null, null, null);
INSERT INTO `tb_out_part_info` VALUES ('FDFF0B2242E042C8AFB102141439E206', '5', '936c6b7a621d11e7b44d0c5b8f279a64', '12.00', '3', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_part
-- ----------------------------
DROP TABLE IF EXISTS `tb_part`;
CREATE TABLE `tb_part` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `p_code` varchar(32) NOT NULL COMMENT '配件编号',
  `p_name` varchar(50) NOT NULL COMMENT '配件名称',
  `p_unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `p_sale` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `p_wholesale` decimal(10,2) DEFAULT NULL COMMENT '批发价',
  `p_produce_area` varchar(32) DEFAULT '' COMMENT '产地',
  `p_specification` varchar(32) DEFAULT NULL COMMENT '规格',
  `p_car_model` varchar(32) DEFAULT NULL COMMENT '适用车型',
  `p_category` varchar(32) DEFAULT NULL COMMENT '分类',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  `isdisable` tinyint(4) DEFAULT '0' COMMENT '禁用标志',
  `extend1` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend2` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend3` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `p_code` (`p_code`),
  KEY `p_unit_fk` (`p_unit`),
  KEY `p_category_fk` (`p_category`),
  CONSTRAINT `p_category_fk` FOREIGN KEY (`p_category`) REFERENCES `tb_lookup` (`id`),
  CONSTRAINT `p_unit_fk` FOREIGN KEY (`p_unit`) REFERENCES `tb_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配件';

-- ----------------------------
-- Records of tb_part
-- ----------------------------
INSERT INTO `tb_part` VALUES ('2D953EE846DB4B2EA00B6A324BEB8450', 'NO000001', '机油', '349DBB62003E4CB7A29F7A0D19790682', '100.00', '100.00', '美国', '73C970D8567A4833B554D6EECE5BBFF5', '奥迪、宝马、奔驰', '7E66A5AEF4BC46AA91D9174EE861DA12', '2017-06-29 16:00:01', '2017-06-29 20:40:24', '0', '0', null, null, null);
INSERT INTO `tb_part` VALUES ('3A9A0BE24BD14C5999C3F74533D8C769', 'code', 'name', '349DBB62003E4CB7A29F7A0D19790682', '120.00', '10.00', 'produceArea', '73C970D8567A4833B554D6EECE5BBFF5', 'carmodel', '7FA179BA0BAF4CA4874DA57DD6393861', null, '2017-07-05 22:05:25', '0', '0', null, null, null);
INSERT INTO `tb_part` VALUES ('475980DBF3FC4EC48B63C7C04156B5FC', 'NO000005', '润滑油1', '349DBB62003E4CB7A29F7A0D19790682', '10.00', '1.00', '佛山', '73C970D8567A4833B554D6EECE5BBFF5', '奔驰', '389FA81D83D849EBAFB21AC4C6E932EF', '2017-06-29 12:50:53', '2017-07-02 21:16:19', '0', '1', null, null, null);
INSERT INTO `tb_part` VALUES ('6EE27FCCC34C4C86ABB2B6FAD3FA9BC9', 'NO000007', '润滑油', '349DBB62003E4CB7A29F7A0D19790682', '12.00', '1.00', '澳大利亚', '73C970D8567A4833B554D6EECE5BBFF5', '比亚迪', '389FA81D83D849EBAFB21AC4C6E932EF', '2017-06-29 16:07:30', '2017-06-29 19:50:43', '0', '1', null, null, null);
INSERT INTO `tb_part` VALUES ('8E65E1B022C84C15B902FA6F8997D414', 'NO000003', '润滑油', '349DBB62003E4CB7A29F7A0D19790682', '120.00', '120.00', '美国', '73C970D8567A4833B554D6EECE5BBFF5', '宝马X5', 'E232A1884DCD4E668E29860C202F088A', '2017-06-29 11:30:01', '2017-06-29 20:26:34', '0', '0', null, null, null);
INSERT INTO `tb_part` VALUES ('A42125248E2141CCB4CACAF26479DB92', 'NO000006', '机油2', '349DBB62003E4CB7A29F7A0D19790682', '123.00', '12.00', '广东广州', '73C970D8567A4833B554D6EECE5BBFF5', '宝马、奔驰', '7FA179BA0BAF4CA4874DA57DD6393861', '2017-06-29 16:04:46', '2017-06-29 17:40:37', '1', '1', null, null, null);
INSERT INTO `tb_part` VALUES ('B68DCC061C654B688591EED2CD00FC97', 'NO000004', '润滑油2', '349DBB62003E4CB7A29F7A0D19790682', '100.00', '10.00', '广东', '73C970D8567A4833B554D6EECE5BBFF5', '奔驰', '389FA81D83D849EBAFB21AC4C6E932EF', '2017-06-29 12:48:43', '2017-06-29 14:50:21', '1', '0', null, null, null);
INSERT INTO `tb_part` VALUES ('C4BCFA08FCD442DFB5FE4ECF12660146', 'NO000002', '美孚机油', '349DBB62003E4CB7A29F7A0D19790682', '100.00', '10.00', '广东', '73C970D8567A4833B554D6EECE5BBFF5', '奥迪A4', '7FA179BA0BAF4CA4874DA57DD6393861', null, '2017-06-29 14:50:21', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_repair_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_repair_item`;
CREATE TABLE `tb_repair_item` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `ri_type` varchar(32) NOT NULL COMMENT '项目类型，数据字典外键',
  `ri_code` varchar(255) NOT NULL COMMENT '项目代码',
  `ri_name` varchar(255) NOT NULL COMMENT '项目名称',
  `ri_working_hour` double DEFAULT NULL COMMENT '工时数',
  `ri_work_type` varchar(32) DEFAULT NULL COMMENT '工种，数据字典外键',
  `ri_desc` varchar(255) DEFAULT NULL COMMENT '备注',
  `ri_sum` decimal(10,0) NOT NULL COMMENT '金额',
  `extend1` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend2` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend3` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修服务项目';

-- ----------------------------
-- Records of tb_repair_item
-- ----------------------------
INSERT INTO `tb_repair_item` VALUES ('331EC8A236D34F7AA5B8FDBB516937A0', '1', 'code', 'name', null, '1', 'description', '11', null, null, null);

-- ----------------------------
-- Table structure for tb_repair_workorder
-- ----------------------------
DROP TABLE IF EXISTS `tb_repair_workorder`;
CREATE TABLE `tb_repair_workorder` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `rw_workorder_no` varchar(32) DEFAULT NULL COMMENT '维修工单号',
  `rw_workorder_state` varchar(32) DEFAULT NULL COMMENT '工单状态。0-待派工，1-已派工',
  `rw_repair_type` varchar(32) DEFAULT NULL COMMENT '修理性质，数据字典外键',
  `rw_sum` decimal(10,0) DEFAULT NULL COMMENT '结算金额',
  `rw_clerk` varchar(32) DEFAULT NULL COMMENT '服务顾问，用户表外键',
  `rw_client_id` varchar(32) DEFAULT NULL COMMENT '客户id，外键',
  `rw_car_mileage` int(11) DEFAULT NULL COMMENT '车进店里程',
  `rw_car_oilmeter` int(11) DEFAULT NULL COMMENT '车进店油表',
  `rw_clent_remind` varchar(255) DEFAULT NULL COMMENT '客户提醒',
  `rw_send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rw_end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交车时间',
  `extend1` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend2` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  `extend3` varchar(20) DEFAULT NULL COMMENT '预留拓展字段',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修工单';

-- ----------------------------
-- Records of tb_repair_workorder
-- ----------------------------
INSERT INTO `tb_repair_workorder` VALUES ('115712086D94407F96A11AE92382BB5E', '6', '1', '1', '11', '1', '1', '1', '1', '维修提醒修改2', '2017-07-07 16:54:37', '2017-07-07 20:46:35', null, null, null);
INSERT INTO `tb_repair_workorder` VALUES ('F289A81A27B041A88040682644F0FA10', '3', '0', '1', '11', '1', '1', '1', '1', '你好呀\r\n', '2017-07-07 11:05:31', null, null, null, null);
INSERT INTO `tb_repair_workorder` VALUES ('FDA77040146847069EFD70CB5E0E4400', '2', '0', '1', '11', '1', '1', '1', '1', '你好呀\r\n', null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_repair_workorder_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_repair_workorder_item`;
CREATE TABLE `tb_repair_workorder_item` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `rwi_workorder_id` varchar(32) DEFAULT NULL COMMENT '维修工单id，外键',
  `rwi_item_id` varchar(32) DEFAULT NULL COMMENT '维修项目id，外键',
  `rwi_mechanic` varchar(32) DEFAULT NULL COMMENT '维修工，外键',
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修工单-服务项目';

-- ----------------------------
-- Records of tb_repair_workorder_item
-- ----------------------------
INSERT INTO `tb_repair_workorder_item` VALUES ('2F5E1A5627AE4E07A934AA91D47CB35D', '', '1', 'DA67698177BB4118BBB23079A6CA9BFA', null, null);
INSERT INTO `tb_repair_workorder_item` VALUES ('4328C4185B894A6B878B6DF150464315', '', '1', 'DA67698177BB4118BBB23079A6CA9BFA', null, null);
INSERT INTO `tb_repair_workorder_item` VALUES ('4A3514446E604268A416094F7CE2F4CD', '115712086D94407F96A11AE92382BB5E', '331EC8A236D34F7AA5B8FDBB516937A0', 'DA67698177BB4118BBB23079A6CA9BFA', null, null);
INSERT INTO `tb_repair_workorder_item` VALUES ('E7E3623CD47842ACBF53B19621168660', '', '331EC8A236D34F7AA5B8FDBB516937A0', 'DA67698177BB4118BBB23079A6CA9BFA', null, null);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `U_USERNAME` varchar(50) NOT NULL COMMENT '用户名',
  `U_FULLNAME` varchar(50) DEFAULT NULL COMMENT '全名',
  `U_PASSWORD` varchar(200) NOT NULL COMMENT '密码',
  `U_EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `U_MOBILE` varchar(50) DEFAULT NULL COMMENT '手机',
  `U_ROLE` varchar(32) DEFAULT NULL COMMENT '角色，数据字典外键',
  `U_COMPANY` varchar(32) DEFAULT NULL COMMENT '公司，外键',
  `U_DESCRIPTION` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ISDISABLE` tinyint(4) DEFAULT '0' COMMENT '禁用标志',
  `ISDELETED` tinyint(4) DEFAULT '0' COMMENT '软删除标志',
  PRIMARY KEY (`ID`),
  KEY `u_role_fk` (`U_ROLE`),
  KEY `u_company_fk` (`U_COMPANY`),
  CONSTRAINT `u_company_fk` FOREIGN KEY (`U_COMPANY`) REFERENCES `tb_company` (`ID`),
  CONSTRAINT `u_role_fk` FOREIGN KEY (`U_ROLE`) REFERENCES `tb_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'wsz', '王树政', 'e10adc3949ba59abbe56e057f20f883e', null, null, 'A072D82A6AE14146B47A70E4C58AA28D', '1', null, '2017-06-18 16:20:52', '2017-06-28 21:00:38', '0', '0');
INSERT INTO `tb_user` VALUES ('DA67698177BB4118BBB23079A6CA9BFA', 'kim', '谢顶金', '123456', '1134771121@qq.com', '18378311282', 'A072D82A6AE14146B47A70E4C58AA28D', '1', '12341234324', '2017-06-28 21:01:52', '2017-06-28 21:01:52', '0', '0');
INSERT INTO `tb_user` VALUES ('DC7A00CD45B0438AA38DED7223166FE1', 'username', 'fullname', 'password', 'email', 'mobile', '1', '1', 'description', '2017-06-25 21:25:08', '2017-06-25 21:25:08', '0', '0');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(v_seq_name VARCHAR(50)) RETURNS int(11)
begin     
    declare value integer;       
    set value = 0;       
    select current_val into value  from sequence where seq_name = v_seq_name; 
   return value; 
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(v_seq_name VARCHAR(50)) RETURNS int(11)
begin
    update sequence set current_val = current_val + increment_val  where seq_name = v_seq_name;
    return currval(v_seq_name);
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `workorderNo`;
DELIMITER ;;
CREATE TRIGGER `workorderNo` BEFORE INSERT ON `tb_in_part` FOR EACH ROW BEGIN
set NEW.in_workorder_no = nextval('in_workorder_no');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertInPartInfo`;
DELIMITER ;;
CREATE TRIGGER `insertInPartInfo` AFTER INSERT ON `tb_in_part_info` FOR EACH ROW BEGIN
		 set @count = (select count(*) from tb_inventory where p_id = new.p_id and p_supplier = new.p_supplier);
		 set @company = (select company from tb_in_part where in_workorder_no = new.in_workorder_no);
		 if @count > 0 then
				update tb_inventory set p_count = p_count + new.in_count where tb_inventory.p_id = new.p_id and tb_inventory.p_supplier = new.p_supplier;
		 elseif @count <= 0 then
				insert into tb_inventory(id,p_id,p_count,p_cost,p_supplier,p_company,r_code,isdeleted)
				VALUES (  replace(uuid(),"-","") ,new.p_id,new.in_count ,new.p_cost,new.p_supplier,@company,new.r_code,default);
		 end if; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteInPartInfo`;
DELIMITER ;;
CREATE TRIGGER `deleteInPartInfo` AFTER UPDATE ON `tb_in_part_info` FOR EACH ROW BEGIN
		 if (new.isdeleted = 1 && old.isdeleted = 0) then
		 update tb_inventory set p_count = p_count- old.in_count where tb_inventory.p_id = old.p_id and tb_inventory.p_supplier = old.p_supplier;
		 end IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `out_workorder_no`;
DELIMITER ;;
CREATE TRIGGER `out_workorder_no` BEFORE INSERT ON `tb_out_part` FOR EACH ROW BEGIN
set NEW.out_workorder_no = nextval('out_workorder_no');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertOutPartInfo`;
DELIMITER ;;
CREATE TRIGGER `insertOutPartInfo` AFTER INSERT ON `tb_out_part_info` FOR EACH ROW BEGIN
		 update tb_inventory set p_count = p_count- new.out_count where tb_inventory.id = new.inventory_id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteOutPartInfo`;
DELIMITER ;;
CREATE TRIGGER `deleteOutPartInfo` AFTER UPDATE ON `tb_out_part_info` FOR EACH ROW BEGIN
if (new.isdeleted = 1 && old.isdeleted = 0) then
update tb_inventory set p_count = p_count + old.out_count where tb_inventory.id = old.inventory_id;
end IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertRepairWorkorder`;
DELIMITER ;;
CREATE TRIGGER `insertRepairWorkorder` BEFORE INSERT ON `tb_repair_workorder` FOR EACH ROW BEGIN
		 set NEW.rw_workorder_no = nextval('repair_workorder');
END
;;
DELIMITER ;
