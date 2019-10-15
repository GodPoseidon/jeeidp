/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.137
Source Server Version : 50633
Source Host           : 192.168.0.137:3306
Source Database       : jeeidp

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2017-06-07 18:05:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cg_column_config
-- ----------------------------
DROP TABLE IF EXISTS `cg_column_config`;
CREATE TABLE `cg_column_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_id` bigint(20) NOT NULL COMMENT '表ID',
  `column_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列名',
  `column_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列类型',
  `column_length` int(11) DEFAULT NULL COMMENT '列长度',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段名',
  `field_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段类型',
  `nullable` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表名',
  `relation_column_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表关联ID',
  `relation_column_text` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联表显示字段',
  `sort` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '排序',
  `is_key` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否主键',
  `show_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '页面显示类型',
  `is_query` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否查询',
  `query_model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询模式',
  `query_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询类型',
  `is_show_list` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '列表是否显示',
  `is_show_form` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单是否显示',
  `form_valid_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单验证类型',
  `order_num` int(11) DEFAULT NULL COMMENT '字段顺序',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39215 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for cg_data_source
-- ----------------------------
DROP TABLE IF EXISTS `cg_data_source`;
CREATE TABLE `cg_data_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `database_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库类型',
  `database_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库名称',
  `server` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器IP',
  `port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '端口号',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for cg_table_config
-- ----------------------------
DROP TABLE IF EXISTS `cg_table_config`;
CREATE TABLE `cg_table_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `data_id` bigint(20) DEFAULT NULL COMMENT '数据库编号',
  `table_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表名',
  `table_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表说明',
  `class_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `is_checkbox` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否多选框',
  `is_page` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否分页',
  `is_tree` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否树',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人员',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `projectPath` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '代码生成目录',
  `packageStyle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '代码分层风格',
  `sourceBasePackage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '代码基础包',
  `entityPackage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '包名',
  `webBasePackage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '页面基础目录',
  `flags` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生成代码类',
  `pageModel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '页面风格',
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3289 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单路径',
  `menu_icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单ID',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `org_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单ID',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `user_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标识',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
