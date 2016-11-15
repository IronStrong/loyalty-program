/*
Navicat MySQL Data Transfer

Source Server         : 192.168.103.35
Source Server Version : 50716
Source Host           : 192.168.103.35:3306
Source Database       : points

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-11-15 14:02:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻�ID',
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻������û�ID',
  `account_balance` int(11) NOT NULL COMMENT '�˻�����ʣ������',
  `account_type_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻�����ID',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�˻���';

-- ----------------------------
-- Table structure for account_type
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `account_type_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻�����ID',
  `describe` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻�����˵��',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�˻����ͱ�';

-- ----------------------------
-- Table structure for configure_category
-- ----------------------------
DROP TABLE IF EXISTS `configure_category`;
CREATE TABLE `configure_category` (
  `category_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻�����ID',
  `category_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '�˻�����˵��',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='������Ϣ����';

-- ----------------------------
-- Table structure for configure_detail
-- ----------------------------
DROP TABLE IF EXISTS `configure_detail`;
CREATE TABLE `configure_detail` (
  `detail_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�����ϸID',
  `detail_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '�����ϸ����',
  `category_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ID',
  `describe` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '����',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`detail_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='������Ϣ��ϸ��';

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `countryname` varchar(255) DEFAULT NULL COMMENT '����',
  `countrycode` varchar(255) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Table structure for points_transation
-- ----------------------------
DROP TABLE IF EXISTS `points_transation`;
CREATE TABLE `points_transation` (
  `trans_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ֽ���ID',
  `roll_out_account` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ת���˻�',
  `roll_in_account` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ת���˻�',
  `trans_amount` int(11) NOT NULL COMMENT '���׻�������',
  `describe` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer_time` datetime NOT NULL COMMENT '����ʱ��',
  `transfer_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�������� ���ţ�����',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���ֽ��ױ�';

-- ----------------------------
-- Table structure for points_transation_detail
-- ----------------------------
DROP TABLE IF EXISTS `points_transation_detail`;
CREATE TABLE `points_transation_detail` (
  `detail_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�����ϸ��ˮ��',
  `source_detail_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '��Դ��ˮ��',
  `trans_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ֽ���ID',
  `expire_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `ext_ref` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '�ⲿ����',
  `status` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '״̬  0.����,1.����',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  `roll_out_account` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ת���˻�',
  `roll_in_account` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ת���˻�',
  `trans_amount` int(11) NOT NULL COMMENT '���׻�������',
  `cur_balance` int(11) NOT NULL COMMENT '���ʻ���ʣ������',
  `credit_party` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '���ŷ��˻�',
  `merchant` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�̻��˻�',
  `credit_create_time` datetime NOT NULL COMMENT '���Ŵ���ʱ��',
  `transfer_time` datetime NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='���ֽ��������ϸ��';

-- ----------------------------
-- Table structure for points_user
-- ----------------------------
DROP TABLE IF EXISTS `points_user`;
CREATE TABLE `points_user` (
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�û�ID',
  `user_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '�û�����',
  `user_password` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '�û�����',
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '�ֻ���',
  `user_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�û����� 0.���ţ�1.�̻�,2.�û�',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='�û���';
SET FOREIGN_KEY_CHECKS=1;
