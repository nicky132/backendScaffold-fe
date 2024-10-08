/*
 Navicat Premium Data Transfer

 Source Server         : guns
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : guns

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 08/10/2024 21:14:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `script` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app` (
  `app_id` bigint(20) NOT NULL COMMENT '主键id',
  `app_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用名称',
  `app_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `app_icon` bigint(20) DEFAULT NULL COMMENT '应用图标，存fileId，上传的图片',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，2-禁用',
  `app_sort` decimal(10,2) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`app_id`) USING BTREE,
  UNIQUE KEY `APP_CODE_UNIQUE` (`app_code`) USING BTREE COMMENT 'app编码唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统应用';

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `area_id` bigint(20) NOT NULL COMMENT '区域id',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '区域编码',
  `area_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '区域全称',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上级区域编码',
  `area_level` int(11) DEFAULT NULL COMMENT '区域级别',
  `area_sort` decimal(20,2) DEFAULT '9999.00' COMMENT '排序码',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否删除',
  `area_pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所有的上级区域编码,用逗号分隔',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE,
  KEY `area_code` (`area_code`) USING BTREE,
  KEY `area_name` (`area_name`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='行政区域表';

-- ----------------------------
-- Table structure for sys_click_count
-- ----------------------------
DROP TABLE IF EXISTS `sys_click_count`;
CREATE TABLE `sys_click_count` (
  `click_count_id` bigint(20) NOT NULL COMMENT '主键id',
  `business_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务的分类标识',
  `business_key_id` bigint(20) DEFAULT NULL COMMENT '业务的主键id',
  `click_count` bigint(20) DEFAULT NULL COMMENT '点击次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`click_count_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户点击数量统计';

-- ----------------------------
-- Table structure for sys_click_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_click_status`;
CREATE TABLE `sys_click_status` (
  `click_status_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `business_key_id` bigint(20) DEFAULT NULL COMMENT '业务的主键id',
  `business_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务的分类标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`click_status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户点击状态';

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint(20) NOT NULL COMMENT '主键',
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `config_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性编码',
  `config_value` varchar(3500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性值',
  `sys_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '是否是系统参数：Y-是，N-否',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status_flag` tinyint(4) DEFAULT '1' COMMENT '状态：1-正常，2-停用',
  `group_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '常量所属分类的编码，来自于“常量的分类”字典',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否删除：Y-被删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE KEY `code_unique` (`config_code`) USING BTREE COMMENT '配置编码唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置';

-- ----------------------------
-- Table structure for sys_database_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_database_info`;
CREATE TABLE `sys_database_info` (
  `db_id` bigint(20) NOT NULL COMMENT '主键',
  `db_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据库名称（英文名称）',
  `jdbc_driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'jdbc的驱动类型',
  `jdbc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'jdbc的url',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据库连接的账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据库连接密码',
  `schema_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据库的schema名称，每种数据库的schema意义都不同',
  `status_flag` tinyint(4) DEFAULT NULL COMMENT '数据源状态：1-正常，2-无法连接',
  `error_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '连接失败原因',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注，摘要',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否删除，Y-被删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`db_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='多数据源信息';

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `dict_type_id` bigint(20) NOT NULL COMMENT '字典类型的id',
  `dict_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典编码',
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名称',
  `dict_name_pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典名称首字母',
  `dict_encode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典编码',
  `dict_short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典简称',
  `dict_short_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典简称的编码',
  `dict_parent_id` bigint(20) NOT NULL COMMENT '上级字典的id(如果没有上级字典id，则为-1)',
  `dict_pids` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '父id集合',
  `status_flag` tinyint(4) NOT NULL COMMENT '状态：(1-启用,2-禁用),参考 StatusEnum',
  `dict_sort` decimal(10,2) DEFAULT NULL COMMENT '排序，带小数点',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典';

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_type_id` bigint(20) NOT NULL COMMENT '字典类型id',
  `dict_type_class` int(11) DEFAULT NULL COMMENT '字典类型： 1-业务类型，2-系统类型，参考 DictTypeClassEnum',
  `dict_type_bus_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型业务编码',
  `dict_type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型编码',
  `dict_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型名称',
  `dict_type_name_pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型名称首字母拼音',
  `dict_type_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型描述',
  `status_flag` tinyint(4) DEFAULT NULL COMMENT '字典类型的状态：1-启用，2-禁用，参考 StatusEnum',
  `dict_type_sort` decimal(10,2) DEFAULT NULL COMMENT '排序，带小数点',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型';

-- ----------------------------
-- Table structure for sys_file_business
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_business`;
CREATE TABLE `sys_file_business` (
  `file_business_id` bigint(20) NOT NULL COMMENT '主键id',
  `business_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务的编码，业务自定义',
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务主键id',
  `file_id` bigint(20) DEFAULT NULL COMMENT '关联文件表的id',
  `download_count` int(11) DEFAULT '0' COMMENT '下载次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`file_business_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='业务关联的文件';

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info` (
  `file_id` bigint(20) NOT NULL COMMENT '文件主键id',
  `file_code` bigint(20) NOT NULL COMMENT '文件编码，本号升级的依据，解决一个文件多个版本问题，多次上传文件编码不变',
  `file_version` int(11) NOT NULL DEFAULT '1' COMMENT '文件版本，从1开始',
  `file_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '当前状态：0-历史版,1-最新版',
  `file_location` tinyint(4) NOT NULL COMMENT '文件存储位置：1-阿里云，2-腾讯云，3-minio，4-本地',
  `file_bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件仓库（文件夹）',
  `file_origin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名称（上传时候的文件全名）',
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件后缀，例如.txt',
  `file_size_kb` bigint(20) DEFAULT NULL COMMENT '文件大小kb为单位',
  `file_size_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件大小信息，计算后的',
  `file_object_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存储到bucket中的名称，主键id+.后缀',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '存储路径',
  `secret_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为机密文件，Y-是机密，N-不是机密',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否删除：Y-被删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='文件信息';

-- ----------------------------
-- Table structure for sys_file_storage
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_storage`;
CREATE TABLE `sys_file_storage` (
  `file_id` bigint(20) NOT NULL COMMENT '文件主键id，关联file_info表的主键',
  `file_bytes` longblob COMMENT '具体文件的字节信息',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='文件存储信息';

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `group_id` bigint(20) NOT NULL COMMENT '分组id',
  `group_biz_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属业务类别，例如：PROJECT',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组名称',
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务主键id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='业务分组';

-- ----------------------------
-- Table structure for sys_hr_org_approver
-- ----------------------------
DROP TABLE IF EXISTS `sys_hr_org_approver`;
CREATE TABLE `sys_hr_org_approver` (
  `org_approver_id` bigint(20) NOT NULL COMMENT '主键id',
  `org_approver_type` tinyint(4) DEFAULT NULL COMMENT '组织审批类型：1-负责人，2-部长，3-体系负责人，4-部门助理，5-资产助理（专员），6-考勤专员，7-HRBP，8-门禁员，9-办公账号员，10-转岗须知员',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织机构id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`org_approver_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织机构审批人';

-- ----------------------------
-- Table structure for sys_hr_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_hr_organization`;
CREATE TABLE `sys_hr_organization` (
  `org_id` bigint(20) NOT NULL COMMENT '主键',
  `org_parent_id` bigint(20) NOT NULL COMMENT '父id，一级节点父id是-1',
  `org_pids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父ids',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织名称',
  `org_short_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织机构简称',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `org_sort` decimal(10,2) NOT NULL COMMENT '排序',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，2-禁用',
  `org_type` tinyint(4) DEFAULT '1' COMMENT '组织机构类型：1-公司，2-部门',
  `tax_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '税号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `org_level` int(11) DEFAULT NULL COMMENT '组织机构层级',
  `master_org_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对接外部主数据的机构id',
  `master_org_parent_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对接外部主数据的父级机构id',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户号',
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织机构信息';

-- ----------------------------
-- Table structure for sys_hr_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_hr_position`;
CREATE TABLE `sys_hr_position` (
  `position_id` bigint(20) NOT NULL COMMENT '主键',
  `position_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职位名称',
  `position_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职位编码',
  `position_sort` decimal(10,2) NOT NULL COMMENT '排序',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，2-禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户号',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='职位信息';

-- ----------------------------
-- Table structure for sys_log_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_api`;
CREATE TABLE `sys_log_api` (
  `log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志记录的内容',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务名称，一般为spring.application.name',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当前用户请求的url',
  `request_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'http或方法的请求参数体',
  `request_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'http或方法的请求结果',
  `server_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当前服务器的ip',
  `client_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户端的ip',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_current_org_id` bigint(20) DEFAULT NULL COMMENT '用户请求时候的登录机构id',
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求http方法',
  `client_browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户浏览器标识',
  `client_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户操作系统',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='API接口日志记录';

-- ----------------------------
-- Table structure for sys_log_business
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_business`;
CREATE TABLE `sys_log_business` (
  `business_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志的业务分类的编码',
  `log_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志的标题，摘要信息',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当前用户请求的url',
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求http方法',
  `client_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户端的ip',
  `user_id` bigint(20) DEFAULT NULL COMMENT '业务操作的用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`business_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='业务日志记录';

-- ----------------------------
-- Table structure for sys_log_business_content
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_business_content`;
CREATE TABLE `sys_log_business_content` (
  `content_id` bigint(20) NOT NULL COMMENT '主键',
  `business_log_id` bigint(20) DEFAULT NULL COMMENT '对应主表主键id',
  `log_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '日志记录的内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='业务日志记录';

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `llg_id` bigint(20) NOT NULL COMMENT '主键',
  `llg_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志名称',
  `llg_succeed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否执行成功',
  `llg_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '具体消息',
  `llg_ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录ip',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`llg_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='登录记录';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '主键',
  `menu_parent_id` bigint(20) NOT NULL COMMENT '父id，顶级节点的父id是-1',
  `menu_pids` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父id集合，中括号包住，逗号分隔',
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单的名称',
  `menu_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单的编码',
  `app_id` bigint(20) NOT NULL COMMENT '所属应用id',
  `menu_sort` decimal(20,2) NOT NULL DEFAULT '100.00' COMMENT '排序',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，2-禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型：10-后台菜单，20-纯前台路由界面，30-内部链接，40-外部链接，50-应用设计',
  `antdv_router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址，浏览器显示的URL，例如/menu',
  `antdv_component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端组件名',
  `antdv_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'icon-default' COMMENT '图标编码',
  `antdv_link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外部链接地址',
  `antdv_active_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用于非菜单显示页面的重定向url设置',
  `antdv_visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y' COMMENT '是否可见(分离版用)：Y-是，N-否',
  `app_design_business_id` bigint(20) DEFAULT NULL COMMENT '应用设计的业务id',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统菜单';

-- ----------------------------
-- Table structure for sys_menu_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_options`;
CREATE TABLE `sys_menu_options` (
  `menu_option_id` bigint(20) NOT NULL COMMENT '主键',
  `app_id` bigint(20) DEFAULT NULL COMMENT '冗余字段，菜单所属的应用id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `option_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能或操作的名称',
  `option_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能或操作的编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`menu_option_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单下的功能操作';

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `message_id` bigint(20) NOT NULL COMMENT '主键',
  `receive_user_id` bigint(20) NOT NULL COMMENT '接收用户id',
  `send_user_id` bigint(20) DEFAULT NULL COMMENT '发送用户id',
  `message_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `message_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `message_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NORMAL' COMMENT '消息类型：NORMAL-普通类型，URL-带链接跳转',
  `message_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消息跳转的URL',
  `priority_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low' COMMENT '优先级：high-高优先级，middle-中，low-低',
  `message_send_time` datetime DEFAULT NULL COMMENT '消息发送时间',
  `business_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联业务id',
  `business_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务类型(根据业务id和业务类型可以确定业务数据)',
  `read_flag` tinyint(4) DEFAULT '0' COMMENT '阅读状态：0-未读，1-已读',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '是否删除：Y-被删除，N-未删除',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户号',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统消息';

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` bigint(20) NOT NULL COMMENT '主键',
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知标题',
  `notice_summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '通知摘要',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '通知内容',
  `priority_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优先级，来自字典：high-高优先级，middle-中，low-低',
  `notice_begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `notice_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `notice_user_scope` json DEFAULT NULL COMMENT '通知范围，存用户id集合',
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '是否发布：1-已发布，2-未发布',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '是否删除：Y-被删除，N-未删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户号',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知管理';

-- ----------------------------
-- Table structure for sys_portal_user_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_user_app`;
CREATE TABLE `sys_portal_user_app` (
  `app_link_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '冗余字段，菜单所属的应用id',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '关联的菜单id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`app_link_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户常用功能';

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `app_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用编码',
  `resource_code` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源编码',
  `resource_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源名称',
  `project_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目编码，一般为spring.application.name',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类名称',
  `method_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `modular_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源模块编码，一般为控制器类名排除Controller',
  `modular_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源初始化的服务器ip地址',
  `view_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否是视图类型：Y-是，N-否\r\n如果是视图类型，url需要以 ''/view'' 开头，\r\n视图类型的接口会渲染出html界面，而不是json数据，\r\n视图层一般会在前后端不分离项目出现',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源url',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'http请求方法',
  `resource_biz_type` tinyint(4) DEFAULT '1' COMMENT '资源的业务类型：1-业务类，2-系统类',
  `required_login_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否需要登录：Y-是，N-否',
  `required_permission_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
  `permission_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '需要鉴权的菜单或者功能编码',
  `validate_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '需要进行参数校验的分组',
  `param_field_descriptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '接口参数的字段描述',
  `response_field_descriptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '接口返回结果的字段描述',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`resource_id`) USING BTREE,
  KEY `RESOURCE_CODE_URL` (`resource_code`,`url`) USING BTREE COMMENT '资源code和url的联合索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='资源';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '主键id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
  `role_sort` decimal(10,2) NOT NULL COMMENT '序号',
  `data_scope_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据范围类型：10-仅本人数据，20-本部门数据，30-本部门及以下数据，40-指定部门数据，50-全部数据',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，2-禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `role_type` tinyint(4) NOT NULL DEFAULT '10' COMMENT '角色类型：10-系统角色，15-业务角色，20-公司角色',
  `role_company_id` bigint(20) DEFAULT NULL COMMENT '角色所属公司id，当角色类型为20时传此值',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户号',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统角色';

-- ----------------------------
-- Table structure for sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_data_scope`;
CREATE TABLE `sys_role_data_scope` (
  `role_data_scope_id` bigint(20) NOT NULL COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `organization_id` bigint(20) NOT NULL COMMENT '机构id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`role_data_scope_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色数据范围';

-- ----------------------------
-- Table structure for sys_role_limit
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_limit`;
CREATE TABLE `sys_role_limit` (
  `role_limit_id` bigint(20) NOT NULL COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `limit_type` tinyint(4) NOT NULL COMMENT '角色限制类型：1-角色可分配的菜单，2-角色可分配的功能',
  `business_id` bigint(20) NOT NULL COMMENT '业务id，为菜单id或菜单功能id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`role_limit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色权限限制';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_menu_id` bigint(20) NOT NULL COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '冗余字段，菜单所属的应用id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`role_menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联';

-- ----------------------------
-- Table structure for sys_role_menu_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_options`;
CREATE TABLE `sys_role_menu_options` (
  `role_menu_option_id` bigint(20) NOT NULL COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '冗余字段，菜单所属的应用id',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '冗余字段，功能所属的菜单id',
  `menu_option_id` bigint(20) NOT NULL COMMENT '菜单功能id，关联sys_menu_options主键id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`role_menu_option_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单下的功能关联';

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms` (
  `sms_id` bigint(20) NOT NULL COMMENT '主键',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `validate_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信验证码',
  `template_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信模板编号',
  `biz_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务id',
  `status_flag` tinyint(4) DEFAULT NULL COMMENT '发送状态：1-未发送，2-发送成功，3-发送失败，4-失效',
  `source` int(11) DEFAULT NULL COMMENT '来源：1-app，2-pc，3-其他',
  `invalid_time` datetime DEFAULT NULL COMMENT '短信失效截止时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sms_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='短信发送记录';

-- ----------------------------
-- Table structure for sys_table_width
-- ----------------------------
DROP TABLE IF EXISTS `sys_table_width`;
CREATE TABLE `sys_table_width` (
  `table_width_id` bigint(20) NOT NULL COMMENT '主键id',
  `field_business_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务标识的编码，例如：PROJECT_TABLE',
  `field_type` int(11) NOT NULL COMMENT '宽度记录的类型：1-全体员工，2-个人独有',
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  `table_width_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '自定义列是否显示、宽度、顺序和列的锁定，一段json',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`table_width_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='业务中表的宽度';

-- ----------------------------
-- Table structure for sys_theme
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme`;
CREATE TABLE `sys_theme` (
  `theme_id` bigint(20) NOT NULL COMMENT '主键',
  `theme_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题名称',
  `theme_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题属性，json格式',
  `template_id` bigint(20) NOT NULL COMMENT '主题模板id',
  `status_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否启用：Y-启用，N-禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`theme_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统主题';

-- ----------------------------
-- Table structure for sys_theme_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme_template`;
CREATE TABLE `sys_theme_template` (
  `template_id` bigint(20) NOT NULL COMMENT '主键',
  `template_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题名称',
  `template_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题编码',
  `template_type` tinyint(4) NOT NULL COMMENT '主题类型：1-系统类型，2-业务类型',
  `status_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '启用状态：Y-启用，N-禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统主题-模板';

-- ----------------------------
-- Table structure for sys_theme_template_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme_template_field`;
CREATE TABLE `sys_theme_template_field` (
  `field_id` bigint(20) NOT NULL COMMENT '主键',
  `field_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性名称',
  `field_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性编码',
  `field_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性展示类型（字典维护），例如：图片，文本等类型',
  `field_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填：Y-必填，N-非必填',
  `field_length` int(11) DEFAULT NULL COMMENT '属性值长度',
  `field_description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '属性描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统主题-模板属性';

-- ----------------------------
-- Table structure for sys_theme_template_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme_template_rel`;
CREATE TABLE `sys_theme_template_rel` (
  `relation_id` bigint(20) NOT NULL COMMENT '主键',
  `template_id` bigint(20) NOT NULL COMMENT '模板主键id',
  `field_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统主题-模板配置关联关系';

-- ----------------------------
-- Table structure for sys_timers
-- ----------------------------
DROP TABLE IF EXISTS `sys_timers`;
CREATE TABLE `sys_timers` (
  `timer_id` bigint(20) NOT NULL COMMENT '定时器id',
  `timer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `action_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行任务的class的类名（实现了TimerAction接口的类的全称）',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '定时任务表达式',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数',
  `job_status` int(11) DEFAULT NULL COMMENT '状态：1-运行，2-停止',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否删除：Y-被删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`timer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务';

-- ----------------------------
-- Table structure for sys_toc_customer
-- ----------------------------
DROP TABLE IF EXISTS `sys_toc_customer`;
CREATE TABLE `sys_toc_customer` (
  `customer_id` bigint(20) NOT NULL COMMENT '主键id',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码，BCrypt',
  `old_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '旧密码',
  `old_password_salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '旧的密码盐',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称（显示名称）',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `verify_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱或手机验证码',
  `verified_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否已经邮箱或手机验证通过：Y-通过，N-未通过',
  `avatar` bigint(20) DEFAULT NULL COMMENT '用户头像（文件表id）',
  `avatar_object_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像的文件全名',
  `score` int(11) DEFAULT NULL COMMENT '用户积分',
  `status_flag` tinyint(4) DEFAULT NULL COMMENT '用户状态：1-启用，2-禁用',
  `secret_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户秘钥，用在调用会员校验等',
  `member_expire_time` datetime DEFAULT NULL COMMENT '会员截止日期，到期时间',
  `last_login_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上次登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='C端用户表';

-- ----------------------------
-- Table structure for sys_translation
-- ----------------------------
DROP TABLE IF EXISTS `sys_translation`;
CREATE TABLE `sys_translation` (
  `tran_id` bigint(20) NOT NULL COMMENT '主键id',
  `tran_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `tran_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '多语言条例名称',
  `tran_language_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语种字典',
  `tran_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '翻译的值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tran_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='多语言';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `real_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码，加密方式为MD5',
  `password_salt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码盐',
  `avatar` bigint(20) DEFAULT NULL COMMENT '头像，存的为文件id',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别：M-男，F-女',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `super_admin_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否是超级管理员：Y-是，N-否',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-正常，2-冻结',
  `login_count` int(11) DEFAULT '1' COMMENT '登录次数',
  `last_login_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `user_sort` decimal(10,2) DEFAULT NULL COMMENT '用户的排序',
  `employee_number` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工号',
  `master_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对接外部主数据的用户id',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `version_flag` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标记：Y-已删除，N-未删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Table structure for sys_user_certificate
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_certificate`;
CREATE TABLE `sys_user_certificate` (
  `user_certificate_id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `certificate_type` bigint(20) NOT NULL COMMENT '证书类型，取字典id',
  `certificate_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证书编号',
  `issuing_authority` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发证机构名称',
  `date_issued` date DEFAULT NULL COMMENT '证书发证日期',
  `date_expires` date DEFAULT NULL COMMENT '证书到期日期，如果为空，则为长期',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否删除：Y-删除，N-未删除',
  PRIMARY KEY (`user_certificate_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户证书';

-- ----------------------------
-- Table structure for sys_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_data_scope`;
CREATE TABLE `sys_user_data_scope` (
  `user_data_scope_id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `org_id` bigint(20) NOT NULL COMMENT '机构id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`user_data_scope_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户数据范围';

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group` (
  `user_group_id` bigint(20) NOT NULL COMMENT '用户组id',
  `user_group_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户分组标题简称',
  `user_group_detail_name` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组内选择项的合并',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户组';

-- ----------------------------
-- Table structure for sys_user_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group_detail`;
CREATE TABLE `sys_user_group_detail` (
  `detail_id` bigint(20) NOT NULL COMMENT '详情id',
  `user_group_id` bigint(20) DEFAULT NULL COMMENT '所属用户组id',
  `select_type` tinyint(4) DEFAULT NULL COMMENT '授权对象类型：1-用户，2-部门，3-角色，4-职位，5-关系',
  `select_value` bigint(20) DEFAULT NULL COMMENT '授权对象id值，例如：用户id，部门id',
  `select_value_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权对象名称，例如：张三，研发部，管理员等',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户组详情';

-- ----------------------------
-- Table structure for sys_user_jump
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_jump`;
CREATE TABLE `sys_user_jump` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `sys_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统ID',
  `err_jump_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误跳转URL',
  `test_app_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '测试环境应用URL',
  `uat_app_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UAT环境应用URL',
  `prod_app_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产环境应用URL',
  `intranet_check_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内网检查URL',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  `version_flag` bigint(20) DEFAULT NULL,
  `expand_field` json DEFAULT NULL,
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_sys` (`user_id`,`sys_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户系统跳转配置表';

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org` (
  `user_org_id` bigint(20) NOT NULL COMMENT '企业员工主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `master_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对接外部主数据的用户id',
  `org_id` bigint(20) NOT NULL COMMENT '所属机构id',
  `master_org_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对接外部组织机构id',
  `position_id` bigint(20) DEFAULT NULL COMMENT '职位id',
  `main_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否是主部门：Y-是，N-不是',
  `status_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用：1-启用，2-禁用',
  `expand_field` json DEFAULT NULL COMMENT '拓展字段',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '添加人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`user_org_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户组织机构关联';

-- ----------------------------
-- Table structure for sys_user_password_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_password_record`;
CREATE TABLE `sys_user_password_record` (
  `record_id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `history_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '历史密码记录',
  `history_password_salt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '历史密码记录盐值',
  `update_password_time` datetime NOT NULL COMMENT '修改密码时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户历史密码记录';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_role_id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `role_type` tinyint(4) NOT NULL DEFAULT '10' COMMENT '角色类型：10-系统角色，15-业务角色，20-公司角色',
  `role_org_id` bigint(20) DEFAULT NULL COMMENT '用户所属机构id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关联';

SET FOREIGN_KEY_CHECKS = 1;
