/*
 Navicat Premium Data Transfer

 Source Server         : oracle
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : 192.168.221.128:1521
 Source Schema         : LK

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 01/02/2022 19:46:50
*/


-- ----------------------------
-- Table structure for SYS_DEPT
-- ----------------------------
DROP TABLE "LK"."SYS_DEPT";
CREATE TABLE "LK"."SYS_DEPT" (
  "DEPT_ID" NUMBER(20,0) NOT NULL,
  "PARENT_ID" NUMBER(20,0) NOT NULL,
  "DEPT_NAME" VARCHAR2(30 BYTE) NOT NULL,
  "CREATE_BY" VARCHAR2(30 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_BY" VARCHAR2(30 BYTE),
  "UPDATE_TIME" DATE,
  "REMARK" VARCHAR2(30 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_DEPT
-- ----------------------------
INSERT INTO "LK"."SYS_DEPT" VALUES ('1', '0', '集团', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO "LK"."SYS_DEPT" VALUES ('10', '1', 'R1厂区', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "LK"."SYS_DEPT" VALUES ('11', '1', 'R2厂区', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "LK"."SYS_DEPT" VALUES ('21', '10', 'MIS', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for SYS_MENU
-- ----------------------------
DROP TABLE "LK"."SYS_MENU";
CREATE TABLE "LK"."SYS_MENU" (
  "MENU_ID" NUMBER(20,0) NOT NULL,
  "MENU_NAME" VARCHAR2(30 BYTE) NOT NULL,
  "PARENT_ID" NUMBER(20,0) NOT NULL,
  "URL" VARCHAR2(100 BYTE),
  "MENU_TYPE" VARCHAR2(30 BYTE) NOT NULL,
  "VISIBLE" NUMBER(2,0) DEFAULT 0 NOT NULL,
  "PERMS" VARCHAR2(35 BYTE),
  "ICON" VARCHAR2(30 BYTE) DEFAULT NULL,
  "LEVEL" NUMBER(10,0) DEFAULT 99,
  "ORDER_NUM" NUMBER(10,0),
  "CREATE_BY" VARCHAR2(30 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_BY" VARCHAR2(30 BYTE),
  "UPDATE_TIME" DATE,
  "REMARK" VARCHAR2(30 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_MENU"."MENU_ID" IS '菜单id';
COMMENT ON COLUMN "LK"."SYS_MENU"."MENU_NAME" IS '菜单名称';
COMMENT ON COLUMN "LK"."SYS_MENU"."PARENT_ID" IS '父节点';
COMMENT ON COLUMN "LK"."SYS_MENU"."URL" IS '地址';
COMMENT ON COLUMN "LK"."SYS_MENU"."MENU_TYPE" IS '菜单类型 M目录C菜单F按钮';
COMMENT ON COLUMN "LK"."SYS_MENU"."VISIBLE" IS '0为可见';
COMMENT ON COLUMN "LK"."SYS_MENU"."PERMS" IS '权限标识';
COMMENT ON COLUMN "LK"."SYS_MENU"."ICON" IS '图标';
COMMENT ON COLUMN "LK"."SYS_MENU"."LEVEL" IS '级别级别越小权限越高最大999';
COMMENT ON COLUMN "LK"."SYS_MENU"."ORDER_NUM" IS '排序';
COMMENT ON COLUMN "LK"."SYS_MENU"."CREATE_BY" IS '创建者';
COMMENT ON COLUMN "LK"."SYS_MENU"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "LK"."SYS_MENU"."UPDATE_BY" IS '更新者';
COMMENT ON COLUMN "LK"."SYS_MENU"."UPDATE_TIME" IS '更新时间';
COMMENT ON COLUMN "LK"."SYS_MENU"."REMARK" IS '备注';

-- ----------------------------
-- Records of SYS_MENU
-- ----------------------------
INSERT INTO "LK"."SYS_MENU" VALUES ('1', '系统管理', '0', NULL, 'M', '0', NULL, 'layui-icon-set', '1', '1', 'admin', TO_DATE('2021-11-26 15:28:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1001', '用户新增', '100', '/system/user/add', 'F', '0', 'system:user:add', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('100', '用户管理', '1', '/system/user', 'C', '0', 'system:user:view', 'layui-icon-username', '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1000', '用户查询', '100', '/system/user/list', 'F', '0', 'system:user:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1002', '用户修改', '100', '/system/user/edit', 'F', '0', 'system:user:edit', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1003', '用户删除', '100', '/system/user/del', 'F', '0', 'system:user:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('101', '角色管理', '1', '/system/role', 'C', '0', 'system:role:view', 'layui-icon-group', '1', '2', 'admin', TO_DATE('2021-12-08 10:01:50', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1010', '角色查询', '101', '/system/role/list', 'F', '0', 'system:role:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1011', '角色添加', '101', '/system/role/add', 'F', '0', 'system:role:add', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1012', '角色修改', '101', '/system/role/edit', 'F', '0', 'system:role:edit', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1013', '角色删除', '101', '/system/role/del', 'F', '0', 'system:role:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('102', '菜单管理', '1', '/system/menu', 'C', '0', 'system:menu:view', 'layui-icon-app', '1', '3', 'admin', TO_DATE('2021-12-10 18:49:23', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1020', '菜单查询', '102', '/system/menu/list', 'F', '0', 'system:menu:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1021', '菜单添加', '102', '/system/menu/add', 'F', '0', 'system:menu:add', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1022', '菜单修改', '102', '/system/menu/edit', 'F', '0', 'system:menu:edit', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1023', '菜单删除', '102', '/system/menu/del', 'F', '0', 'system:menu:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2', '系统监控', '0', NULL, 'M', '0', NULL, 'layui-icon-console', '1', '2', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('200', '在线用户', '2', '/monitor/online', 'C', '0', 'monitor:online:view', 'layui-icon-rss', '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2000', '在线用户查询', '200', '/monitor/online/list', 'F', '0', 'monitor:online:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2003', '在线用户删除', '200', '/monitor/online/remove', 'F', '0', 'monitor:online:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('201', '定时任务', '3', '/tool/timer', 'C', '0', 'tool:timer:view', 'layui-icon-time', '1', '2', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2010', '定时任务查询', '201', '/tool/timer/list', 'F', '0', 'tool:timer:list', NULL, '1', '1', NULL, NULL, 'like_ren', TO_DATE('2022-01-13 16:00:22', 'SYYYY-MM-DD HH24:MI:SS'), 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2011', '定时任务添加', '201', '/tool/timer/add', 'F', '0', 'tool:timer:add', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2012', '定时任务修改', '201', '/tool/timer/edit', 'F', '0', 'tool:timer:edit', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2013', '定时任务删除', '201', '/tool/timer/del', 'F', '0', 'tool:timer:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('202', '数据监控', '2', '/druid/', 'C', '0', 'monitor:data:view', 'layui-icon-senior', '1', '3', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('203', '服务监控', '2', '/monitor/server', 'C', '0', 'monitor:service:view', 'layui-icon-template-1', '1', '4', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('103', '部门管理', '1', '/system/dept', 'C', '0', 'system:dept:view', 'layui-icon-templeate-1', '1', '4', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1030', '部门查询', '103', '/system/dept/list', 'F', '0', 'system:dept:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1031', '部门新增', '103', '/system/dept/add', 'F', '0', 'system:dept:add', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1032', '部门修改', '103', '/system/dept/edit', 'F', '0', 'system:dept:edit', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1033', '部门删除', '103', '/system/dept/del', 'F', '0', 'system:dept:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('104', '通知管理', '1', '/system/notice', 'C', '0', 'system:notice:view', 'layui-icon-notice', '1', '5', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1040', '通知查询', '104', '/system/notice/list', 'F', '0', 'system:notice:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1041', '通知添加', '104', '/system/notice/add', 'F', '0', 'system:notice:add', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1042', '通知修改', '104', '/system/notice/edit', 'F', '0', 'system:notice:edit', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1043', '通知删除', '104', '/system/notice/del', 'F', '0', 'system:notice:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('105', '日志管理', '1', '/system/log', 'C', '0', 'system:log:view', 'layui-icon-log', '1', '6', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1050', '日志查询', '105', '/system/log/list', 'F', '0', 'system:log:list', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('1053', '日志删除', '105', '/system/log/del', 'F', '0', 'system:log:del', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2004', '批量强退', '200', '/monitor/online/batchForceLogout', 'F', '0', 'monitor:online:batchForceLogout', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('2005', '单条强退', '200', '/monitor/online/batchForceLogout', 'F', '0', 'monitor:online:forceLogout', NULL, '1', '1', NULL, NULL, NULL, NULL, 'sys');
INSERT INTO "LK"."SYS_MENU" VALUES ('204', '系统接口', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', 'layui-icon-app', '99', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "LK"."SYS_MENU" VALUES ('3', '系统工具', '0', NULL, 'M', '0', NULL, 'layui-icon-component', '99', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "LK"."SYS_MENU" VALUES ('300', '文件共享', '3', '/tool/share', 'C', '0', 'tool:share:view', 'layui-icon-file', '99', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for SYS_MESSAGE_READ
-- ----------------------------
DROP TABLE "LK"."SYS_MESSAGE_READ";
CREATE TABLE "LK"."SYS_MESSAGE_READ" (
  "USER_ID" NUMBER(10,0) NOT NULL,
  "NOTICE_ID" NUMBER(10,0) NOT NULL,
  "UPDATE_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_MESSAGE_READ"."USER_ID" IS '用户id';
COMMENT ON COLUMN "LK"."SYS_MESSAGE_READ"."NOTICE_ID" IS '通知id';

-- ----------------------------
-- Records of SYS_MESSAGE_READ
-- ----------------------------
INSERT INTO "LK"."SYS_MESSAGE_READ" VALUES ('1', '1', TO_DATE('2022-01-07 16:46:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_MESSAGE_READ" VALUES ('1', '2', TO_DATE('2022-01-07 18:16:10', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for SYS_MESSAGE_UNREAD
-- ----------------------------
DROP TABLE "LK"."SYS_MESSAGE_UNREAD";
CREATE TABLE "LK"."SYS_MESSAGE_UNREAD" (
  "USER_ID" NUMBER(10,0) NOT NULL,
  "NOTICE_ID" NUMBER(10,0) NOT NULL,
  "UPDATE_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_MESSAGE_UNREAD"."USER_ID" IS '用户id';
COMMENT ON COLUMN "LK"."SYS_MESSAGE_UNREAD"."NOTICE_ID" IS '通知id';

-- ----------------------------
-- Records of SYS_MESSAGE_UNREAD
-- ----------------------------
INSERT INTO "LK"."SYS_MESSAGE_UNREAD" VALUES ('1', '3', TO_DATE('2022-01-07 16:46:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_MESSAGE_UNREAD" VALUES ('1', '2', TO_DATE('2022-01-14 19:44:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_MESSAGE_UNREAD" VALUES ('1', '1', TO_DATE('2022-01-14 19:44:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_MESSAGE_UNREAD" VALUES ('2', '2', TO_DATE('2022-01-14 19:44:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_MESSAGE_UNREAD" VALUES ('2', '1', TO_DATE('2022-01-14 19:44:54', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for SYS_NOTICE
-- ----------------------------
DROP TABLE "LK"."SYS_NOTICE";
CREATE TABLE "LK"."SYS_NOTICE" (
  "NOTICE_ID" NUMBER(10,0) NOT NULL,
  "NAME" VARCHAR2(50 BYTE) NOT NULL,
  "TITLE" VARCHAR2(50 BYTE) NOT NULL,
  "CONTENT" VARCHAR2(512 BYTE) NOT NULL,
  "TYPE" VARCHAR2(1 BYTE) DEFAULT 0,
  "STATUS" VARCHAR2(1 BYTE) DEFAULT 1,
  "CREATE_BY" VARCHAR2(50 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_BY" VARCHAR2(50 BYTE),
  "UPDATE_TIME" DATE,
  "REMARK" VARCHAR2(255 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_NOTICE"."NOTICE_ID" IS 'id';
COMMENT ON COLUMN "LK"."SYS_NOTICE"."NAME" IS '名称';
COMMENT ON COLUMN "LK"."SYS_NOTICE"."TITLE" IS '标题';
COMMENT ON COLUMN "LK"."SYS_NOTICE"."CONTENT" IS '内容';
COMMENT ON COLUMN "LK"."SYS_NOTICE"."TYPE" IS '0不通知1启动后通知，2为实时通知';
COMMENT ON COLUMN "LK"."SYS_NOTICE"."STATUS" IS '0为启动，1停止';
COMMENT ON TABLE "LK"."SYS_NOTICE" IS '通知表';

-- ----------------------------
-- Records of SYS_NOTICE
-- ----------------------------
INSERT INTO "LK"."SYS_NOTICE" VALUES ('2', '测试通知', '测试', '123456这是你们的默认密码', '2', '0', 'admin', TO_DATE('2021-12-17 13:39:28', 'SYYYY-MM-DD HH24:MI:SS'), '程序猿', TO_DATE('2022-01-06 16:49:19', 'SYYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO "LK"."SYS_NOTICE" VALUES ('1', 'ce', 'ccc', 'cccccc', '2', '0', NULL, NULL, NULL, NULL, '2');
INSERT INTO "LK"."SYS_NOTICE" VALUES ('7', '特特', '通知他', '怎样的内同', '0', '1', NULL, TO_DATE('2022-01-15 09:01:28', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2022-01-15 09:03:39', 'SYYYY-MM-DD HH24:MI:SS'), '备 ');

-- ----------------------------
-- Table structure for SYS_OPER_LOG
-- ----------------------------
DROP TABLE "LK"."SYS_OPER_LOG";
CREATE TABLE "LK"."SYS_OPER_LOG" (
  "OPER_ID" NUMBER(20,0) NOT NULL,
  "TITLE" VARCHAR2(50 BYTE) DEFAULT '',
  "BUSINESS_TYPE" NUMBER(2,0) DEFAULT 0,
  "METHOD" VARCHAR2(100 BYTE) DEFAULT '',
  "REQUEST_METHOD" VARCHAR2(10 BYTE) DEFAULT '',
  "OPERATOR_TYPE" NUMBER(1,0) DEFAULT 0,
  "OPER_NAME" VARCHAR2(50 BYTE) DEFAULT '',
  "DEPT_NAME" VARCHAR2(50 BYTE) DEFAULT '',
  "OPER_URL" VARCHAR2(255 BYTE) DEFAULT '',
  "OPER_IP" VARCHAR2(128 BYTE) DEFAULT '',
  "OPER_LOCATION" VARCHAR2(255 BYTE) DEFAULT '',
  "OPER_PARAM" VARCHAR2(4000 BYTE) DEFAULT '',
  "JSON_RESULT" VARCHAR2(2000 BYTE) DEFAULT '',
  "STATUS" NUMBER(1,0) DEFAULT 0,
  "ERROR_MSG" VARCHAR2(2000 BYTE) DEFAULT '',
  "OPER_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_ID" IS '日志主键seq_sys_oper_log.nextval';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."TITLE" IS '模块标题';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."BUSINESS_TYPE" IS '业务类型（0其它 1新增 2修改 3删除）';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."METHOD" IS '方法名称';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."REQUEST_METHOD" IS '请求方式';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPERATOR_TYPE" IS '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_NAME" IS '操作人员';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."DEPT_NAME" IS '部门名称';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_URL" IS '请求URL';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_IP" IS '主机地址';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_LOCATION" IS '操作地点';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_PARAM" IS '请求参数';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."JSON_RESULT" IS '返回参数';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."STATUS" IS '操作状态（0正常 1异常）';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."ERROR_MSG" IS '错误消息';
COMMENT ON COLUMN "LK"."SYS_OPER_LOG"."OPER_TIME" IS '操作时间';
COMMENT ON TABLE "LK"."SYS_OPER_LOG" IS '操作日志记录';

-- ----------------------------
-- Records of SYS_OPER_LOG
-- ----------------------------
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('33', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 09:56:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('34', '在线用户', '7', 'com.lk.visitor.web.controller.monitor.SysUserOnlineController.batchForceLogout()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/monitor/online/batchForceLogout', '127.0.0.1', '内网IP', '{"ids":["432f8ff8-6789-4f35-a266-68a6b3726851"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 09:57:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('448', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 14:47:21', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('449', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 14:56:21', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('450', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 14:57:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('451', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 15:00:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('452', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 15:10:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('453', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 16:20:22', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('454', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 16:22:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('1', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 19:05:19', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('2', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 19:12:13', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('3', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 19:13:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('4', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 19:32:01', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('5', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-14 19:43:32', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('21', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 08:25:32', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('22', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 08:31:18', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('23', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 08:43:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('24', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 08:47:43', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('25', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 08:58:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('26', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 09:01:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('27', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 09:03:09', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('28', '登陆', '10', 'com.lk.visitor.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-15 09:17:03', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('41', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-17 23:57:37', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('42', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-18 00:14:36', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('32', '在线用户', '7', 'com.lk.visitor.web.controller.monitor.SysUserOnlineController.batchForceLogout()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/monitor/online/batchForceLogout', '127.0.0.1', '内网IP', '{"ids":["67b9b795-ae95-4181-a544-c08c3d93da09"]}', '{"code":-1,"count":0,"data":[],"msg":"当前登录用户无法强退"}', '0', NULL, TO_DATE('2022-01-15 09:55:49', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('6', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', NULL, NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":-1,"count":0,"data":[],"msg":"\r\n### Error querying database.  Cause: java.sql.SQLException: ORA-00904: \"D\".\"STATUS\": 标识符无效\n\r\n### The error may exist in file [F:\\IdeaProjects\\LK\\lk-system\\target\\classes\\mapper\\SysUserMapper.xml]\r\n### The error may involve com.lk.system.mapper.SysUserMapper.selectUserByLoginName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select  u.user_id, u.dept_id, u.login_name, u.user_name,r.\"LEVEL\",  u.sex, u.password, u.status, u.delete_flag, u.create_time, u.remark,              d.dept_id, d.parent_id, d.dept_name, d.status as dept_status,              r.role_id, r.role_name, r.role_key, r.status as role_status   from sys_user u     left join sys_dept d on u.dept_id = d.dept_id     left join sys_user_role ur on u.user_id = ur.user_id     left join sys_role r on r.role_id = ur.role_id         where u.login_name = ?\r\n### Cause: java.sql.SQLException: ORA-00904: \"D\".\"STATUS\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLException: ORA-00904: \"D\".\"STATUS\": 标识符无效\n"}', '0', NULL, TO_DATE('2022-01-21 22:29:23', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('7', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-21 22:31:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('8', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-21 22:34:30', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('9', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-21 22:39:17', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('43', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 22:44:30', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('44', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 22:47:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('61', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 23:32:15', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('62', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 23:35:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('63', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 23:37:28', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('64', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 23:40:46', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('65', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-22 23:58:31', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('66', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', NULL, NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xu_cheng"],"password":["123456"],"remember":["false"]}', '{"code":-1,"count":0,"data":[],"msg":"用户不存在/密码错误"}', '0', NULL, TO_DATE('2022-01-23 00:03:39', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('67', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', NULL, NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xu_cheng"],"password":["123456"],"remember":["false"]}', '{"code":-1,"count":0,"data":[],"msg":"用户不存在/密码错误"}', '0', NULL, TO_DATE('2022-01-23 00:07:15', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('68', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', NULL, NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xu_cheng"],"password":["123456"],"remember":["false"]}', '{"code":-1,"count":0,"data":[],"msg":"用户不存在/密码错误"}', '0', NULL, TO_DATE('2022-01-23 00:07:21', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('69', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:07:27', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('70', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:07:49', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('71', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:11:39', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('72', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:14:44', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('73', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:19:47', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('74', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', NULL, '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:30:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('75', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 00:45:20', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('76', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-23 01:59:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('81', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-24 17:17:42', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('82', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-24 22:11:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('83', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-24 22:14:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('101', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 21:48:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('102', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:08:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('103', '用户管理', '3', 'com.lk.web.controller.system.SysUserController.remove()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/remove', '127.0.0.1', '内网IP', '{"userid":["2"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:08:39', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('104', '用户管理', '3', 'com.lk.web.controller.system.SysUserController.remove()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/remove', '127.0.0.1', '内网IP', '{"userid":["3"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:08:42', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('105', '用户管理', '1', 'com.lk.web.controller.system.SysUserController.add()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/add', '127.0.0.1', '内网IP', '{"loginName":["daima_yuan"],"userName":["袁戴马"],"sex":["1"],"remark":[""]}', NULL, '1', '
### Error updating database.  Cause: java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)

### The error may exist in file [F:\IdeaProjects\LK\lk-system\target\classes\mapper\SysUserMapper.xml]
### The error may involve com.lk.system.mapper.SysUserMapper.insertUser-Inline
### The error occurred while setting parameters
### SQL: insert into sys_user(      user_id,       dept_id,       login_name,       user_name,       sex,       password,             create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,       ?,             ?,            sysdate    )
### Cause: java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)

; ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)
; nested exception is java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)
', TO_DATE('2022-01-28 22:10:35', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('106', '用户管理', '1', 'com.lk.web.controller.system.SysUserController.add()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/add', '127.0.0.1', '内网IP', '{"loginName":["daima_yuan"],"userName":["袁戴马"],"sex":["1"],"remark":[""]}', NULL, '1', '
### Error updating database.  Cause: java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)

### The error may exist in file [F:\IdeaProjects\LK\lk-system\target\classes\mapper\SysUserMapper.xml]
### The error may involve com.lk.system.mapper.SysUserMapper.insertUser-Inline
### The error occurred while setting parameters
### SQL: insert into sys_user(      user_id,       dept_id,       login_name,       user_name,       sex,       password,             create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,       ?,             ?,            sysdate    )
### Cause: java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)

; ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)
; nested exception is java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)
', TO_DATE('2022-01-28 22:10:47', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('107', '用户管理', '1', 'com.lk.web.controller.system.SysUserController.add()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/add', '127.0.0.1', '内网IP', '{"loginName":["daima_yuan"],"userName":["袁戴马"],"sex":["1"],"remark":[""]}', NULL, '1', '
### Error updating database.  Cause: java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)

### The error may exist in file [F:\IdeaProjects\LK\lk-system\target\classes\mapper\SysUserMapper.xml]
### The error may involve com.lk.system.mapper.SysUserMapper.insertUser-Inline
### The error occurred while setting parameters
### SQL: insert into sys_user(      user_id,       dept_id,       login_name,       user_name,       sex,       password,             create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,       ?,             ?,            sysdate    )
### Cause: java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)

; ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)
; nested exception is java.sql.SQLException: ORA-00001: 违反唯一约束条件 (LK.SYS_C0011457)
', TO_DATE('2022-01-28 22:10:57', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('108', '用户管理', '1', 'com.lk.web.controller.system.SysUserController.add()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/add', '127.0.0.1', '内网IP', '{"loginName":["daima_yuan"],"userName":["袁戴马"],"sex":["1"],"remark":[""]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:10:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('109', '用户管理', '2', 'com.lk.web.controller.system.SysUserController.changeRole()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/system/user/changeRole', '127.0.0.1', '内网IP', '{"userid":["4"],"roleIds[]":["2"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:11:10', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('110', '菜单管理', '1', 'com.lk.web.controller.system.SysMenuController.add()', 'GET', '1', 'xuyuan_cheng', 'R2厂区', '/system/menu/add', '127.0.0.1', '内网IP', '{"menus":[{"children":[],"createBy":"admin","createTime":1637911701000,"icon":"layui-icon-set","level":1,"menuId":1,"menuName":"系统管理","menuType":"M","orderNum":1,"params":{},"parentId":0,"perms":"","visible":"0"},{"children":[],"level":1,"menuId":1001,"menuName":"用户新增","menuType":"F","orderNum":1,"params":{},"parentId":100,"perms":"system:user:add","url":"/system/user/add","visible":"0"},{"children":[],"level":1,"menuId":2005,"menuName":"单条强退","menuType":"F","orderNum":1,"params":{},"parentId":200,"perms":"monitor:online:forceLogout","url":"/monitor/online/batchForceLogout","visible":"0"},{"children":[],"level":1,"menuId":2004,"menuName":"批量强退","menuType":"F","orderNum":1,"params":{},"parentId":200,"perms":"monitor:online:batchForceLogout","url":"/monitor/online/batchForceLogout","visible":"0"},{"children":[],"level":1,"menuId":1053,"menuName":"日志删除","menuType":"F","orderNum":1,"params":{},"parentId":105,"perms":"system:log:del","url":"/system/log/del","visible":"0"},{"children":[],"level":1,"menuId":1050,"menuName":"日志查询","menuType":"F","orderNum":1,"params":{},"parentId":105,"perms":"system:log:list","url":"/system/log/list","visible":"0"},{"children":[],"level":1,"menuId":1043,"menuName":"通知删除","menuType":"F","orderNum":1,"params":{},"parentId":104,"perms":"system:notice:del","url":"/system/notice/del","visible":"0"},{"children":[],"level":1,"menuId":1042,"menuName":"通知修改","menuType":"F","orderNum":1,"params":{},"parentId":104,"perms":"system:notice:edit","url":"/system/notice/edit","visible":"0"},{"children":[],"level":1,"menuId":1041,"menuName":"通知添加","menuType":"F","orderNum":1,"params":{},"parentId":104,"perms":"system:notice:add","url":"/system/notice/add","visible":"0"},{"children":[],"level":1,"menuId":1040,"menuName":"通知查询","menuType":"F","orderNum":1,"params":{},"parentId":104,"perms":"system:notice:list","url":"/system/notice/list","visible":"0"},{"children":[],"level":1,"menuId":1033,"menuName":"部门删除","menuType":"F","orderNum":1,"params":{},"parentId":', '"system/menu/add"', '0', NULL, TO_DATE('2022-01-28 22:13:48', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('111', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:16:22', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('112', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:17:48', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('113', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:21:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('114', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:33:17', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('115', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:36:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('116', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:37:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('117', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 22:42:32', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('118', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:33:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('119', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:37:22', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('120', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:37:23', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('121', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:40:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('122', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:42:29', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('123', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:46:17', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('124', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:47:21', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('125', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:49:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('126', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:49:55', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('127', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-28 23:51:35', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('141', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 10:42:24', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('161', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 13:47:15', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('162', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 13:58:48', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('163', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 14:52:15', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('164', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 14:53:47', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('165', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 14:55:47', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('166', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 14:57:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('167', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:00:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('168', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:01:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('169', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:08:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('170', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:12:17', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('171', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:16:06', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('172', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:36:27', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('173', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 15:39:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('174', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 16:03:25', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('175', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 16:39:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('176', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 16:43:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('177', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 16:46:24', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('178', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 16:47:29', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('179', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 16:49:17', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('181', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-01-30 22:10:50', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('201', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 15:05:20', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('202', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 15:14:31', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('203', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 15:18:58', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('204', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 15:29:09', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('205', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 15:47:36', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('206', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 15:59:01', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('207', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:04:46', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('208', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:08:38', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('209', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:15:34', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('210', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:23:18', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('211', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:29:30', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('212', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:40:22', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('213', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:42:16', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('214', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 16:59:52', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('221', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 19:28:39', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('222', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 19:31:11', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('223', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 19:36:55', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('224', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 19:37:34', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LK"."SYS_OPER_LOG" VALUES ('225', '登陆', '10', 'com.lk.web.controller.system.SysLoginController.ajaxLogin()', 'POST', '1', 'xuyuan_cheng', 'R2厂区', '/login', '127.0.0.1', '内网IP', '{"username":["xuyuan_cheng"],"password":["123456"],"remember":["false"]}', '{"code":0,"count":0,"data":[],"msg":""}', '0', NULL, TO_DATE('2022-02-01 19:39:53', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
DROP TABLE "LK"."SYS_ROLE";
CREATE TABLE "LK"."SYS_ROLE" (
  "ROLE_ID" NUMBER(20,0) NOT NULL,
  "ROLE_NAME" VARCHAR2(30 BYTE) NOT NULL,
  "ROLE_KEY" VARCHAR2(30 BYTE) NOT NULL,
  "LEVEL" NUMBER(10,0) DEFAULT 99,
  "STATUS" CHAR(1 BYTE) DEFAULT 0 NOT NULL,
  "DELETE_FLAG" CHAR(1 BYTE) DEFAULT 0 NOT NULL,
  "CREATE_BY" VARCHAR2(30 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_BY" VARCHAR2(30 BYTE),
  "UPDATE_TIME" DATE,
  "REMARK" VARCHAR2(30 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_ROLE"."LEVEL" IS '级别越小权限越大';

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO "LK"."SYS_ROLE" VALUES ('1', '超级管理员', 'admin', '1', '0', '0', NULL, TO_DATE('2021-12-08 10:34:22', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2021-12-08 10:58:08', 'SYYYY-MM-DD HH24:MI:SS'), '测试');
INSERT INTO "LK"."SYS_ROLE" VALUES ('2', '管理员', 'admin', '1', '0', '0', NULL, TO_DATE('2021-12-08 10:34:25', 'SYYYY-MM-DD HH24:MI:SS'), 'like_ren', TO_DATE('2022-01-13 10:03:16', 'SYYYY-MM-DD HH24:MI:SS'), '测试');
INSERT INTO "LK"."SYS_ROLE" VALUES ('22', '普通角色', 'common', '40', '0', '0', NULL, TO_DATE('2021-12-09 18:50:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '测试的');
INSERT INTO "LK"."SYS_ROLE" VALUES ('47', '测试', 'test', '4', '0', '0', 'like_ren', TO_DATE('2021-12-10 14:09:30', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '115');

-- ----------------------------
-- Table structure for SYS_ROLE_MENU
-- ----------------------------
DROP TABLE "LK"."SYS_ROLE_MENU";
CREATE TABLE "LK"."SYS_ROLE_MENU" (
  "ROLE_ID" NUMBER(20,0) NOT NULL,
  "MENU_ID" NUMBER(20,0) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_ROLE_MENU
-- ----------------------------
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1000');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1002');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1001');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1010');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1011');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1012');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '1013');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '101');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2005');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2004');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2000');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2003');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2010');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2011');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2012');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '2013');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '200');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '201');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '202');
INSERT INTO "LK"."SYS_ROLE_MENU" VALUES ('2', '203');

-- ----------------------------
-- Table structure for SYS_SHARE
-- ----------------------------
DROP TABLE "LK"."SYS_SHARE";
CREATE TABLE "LK"."SYS_SHARE" (
  "SHARE_ID" NUMBER(10,0) NOT NULL,
  "PARENT_ID" NUMBER(10,0) NOT NULL,
  "NAME" VARCHAR2(255 BYTE) NOT NULL,
  "TYPE" CHAR(1 BYTE) DEFAULT 0,
  "PATH" VARCHAR2(512 BYTE) NOT NULL,
  "LEVEL" NUMBER(10,0) DEFAULT 999,
  "SIZE" NUMBER(20,0) DEFAULT 0,
  "CREATE_BY" VARCHAR2(255 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_BY" VARCHAR2(255 BYTE),
  "UPDATE_TIME" DATE,
  "REMARK" VARCHAR2(255 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_SHARE"."PARENT_ID" IS '父Id';
COMMENT ON COLUMN "LK"."SYS_SHARE"."NAME" IS '名称';
COMMENT ON COLUMN "LK"."SYS_SHARE"."TYPE" IS '0目录1文件';
COMMENT ON COLUMN "LK"."SYS_SHARE"."PATH" IS '路径';
COMMENT ON COLUMN "LK"."SYS_SHARE"."LEVEL" IS '级别99任何人都可以使用';
COMMENT ON COLUMN "LK"."SYS_SHARE"."SIZE" IS '大小';

-- ----------------------------
-- Records of SYS_SHARE
-- ----------------------------
INSERT INTO "LK"."SYS_SHARE" VALUES ('1', '0', 'root', '0', '/root', '0', '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for SYS_USER
-- ----------------------------
DROP TABLE "LK"."SYS_USER";
CREATE TABLE "LK"."SYS_USER" (
  "USER_ID" NUMBER(20,0) NOT NULL,
  "DEPT_ID" NUMBER(20,0),
  "LOGIN_NAME" VARCHAR2(30 BYTE) NOT NULL,
  "USER_NAME" VARCHAR2(30 BYTE) NOT NULL,
  "PASSWORD" VARCHAR2(50 BYTE) NOT NULL,
  "SEX" CHAR(1 BYTE) DEFAULT 1,
  "STATUS" CHAR(1 BYTE) DEFAULT 0,
  "DELETE_FLAG" CHAR(1 BYTE) DEFAULT 0 NOT NULL,
  "CREATE_BY" VARCHAR2(30 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_BY" VARCHAR2(30 BYTE),
  "UPDATE_TIME" DATE,
  "REMARK" VARCHAR2(30 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_USER"."USER_ID" IS '用户ID';

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO "LK"."SYS_USER" VALUES ('3', '21', 'ren', 'Ren', 'c80d171b81624145618791d99107554a', '1', '0', '1', 'admin', TO_DATE('2021-12-08 16:38:50', 'SYYYY-MM-DD HH24:MI:SS'), NULL, TO_DATE('2021-12-17 15:51:50', 'SYYYY-MM-DD HH24:MI:SS'), '测试');
INSERT INTO "LK"."SYS_USER" VALUES ('2', '10', 'xu_cheng', '程序', '7b5eb3604ef385d6eef0076f1a024aeb', '1', '0', '1', 'like_ren', TO_DATE('2021-12-08 16:39:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "LK"."SYS_USER" VALUES ('1', '11', 'xuyuan_cheng', '程旭源', '33152b9e6798b0763da6fc2b10b25b52', '1', '0', '0', 'like_ren', TO_DATE('2022-01-14 10:17:39', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "LK"."SYS_USER" VALUES ('4', '0', 'daima_yuan', '袁戴马', 'b12270cb65f329f2b3369b7a48e46289', '1', '0', '0', 'xuyuan_cheng', TO_DATE('2022-01-28 22:10:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for SYS_USER_NOTICE
-- ----------------------------
DROP TABLE "LK"."SYS_USER_NOTICE";
CREATE TABLE "LK"."SYS_USER_NOTICE" (
  "USER_ID" NUMBER(10,0),
  "NOTICE_ID" NUMBER(10,0) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_USER_NOTICE
-- ----------------------------
INSERT INTO "LK"."SYS_USER_NOTICE" VALUES ('1', '1');

-- ----------------------------
-- Table structure for SYS_USER_ONLINE
-- ----------------------------
DROP TABLE "LK"."SYS_USER_ONLINE";
CREATE TABLE "LK"."SYS_USER_ONLINE" (
  "SESSIONID" VARCHAR2(50 BYTE) DEFAULT '' NOT NULL,
  "LOGIN_NAME" VARCHAR2(50 BYTE) DEFAULT '',
  "DEPT_NAME" VARCHAR2(50 BYTE) DEFAULT '',
  "IPADDR" VARCHAR2(128 BYTE) DEFAULT '',
  "LOGIN_LOCATION" VARCHAR2(255 BYTE) DEFAULT '',
  "BROWSER" VARCHAR2(50 BYTE) DEFAULT '',
  "OS" VARCHAR2(50 BYTE) DEFAULT '',
  "STATUS" VARCHAR2(10 BYTE) DEFAULT '',
  "START_TIMESTAMP" DATE,
  "LAST_ACCESS_TIME" DATE,
  "EXPIRE_TIME" NUMBER(10,0) DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."SESSIONID" IS '用户会话id';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."LOGIN_NAME" IS '登录账号';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."DEPT_NAME" IS '部门名称';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."IPADDR" IS '登录IP地址';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."LOGIN_LOCATION" IS '登录地点';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."BROWSER" IS '浏览器类型';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."OS" IS '操作系统';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."STATUS" IS '在线状态on_line在线off_line离线';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."START_TIMESTAMP" IS 'session创建时间';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."LAST_ACCESS_TIME" IS 'session最后访问时间';
COMMENT ON COLUMN "LK"."SYS_USER_ONLINE"."EXPIRE_TIME" IS '超时时间，单位为分钟';
COMMENT ON TABLE "LK"."SYS_USER_ONLINE" IS '在线用户记录';

-- ----------------------------
-- Records of SYS_USER_ONLINE
-- ----------------------------
INSERT INTO "LK"."SYS_USER_ONLINE" VALUES ('c3ada5f1-4b39-486b-8693-57f7ef7343c3', 'xuyuan_cheng', 'R2厂区', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', TO_DATE('2022-02-01 19:28:08', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-01 19:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1800000');

-- ----------------------------
-- Table structure for SYS_USER_ROLE
-- ----------------------------
DROP TABLE "LK"."SYS_USER_ROLE";
CREATE TABLE "LK"."SYS_USER_ROLE" (
  "USER_ID" NUMBER(20,0) NOT NULL,
  "ROLE_ID" NUMBER(20,0) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_USER_ROLE
-- ----------------------------
INSERT INTO "LK"."SYS_USER_ROLE" VALUES ('66', '2');
INSERT INTO "LK"."SYS_USER_ROLE" VALUES ('1', '1');
INSERT INTO "LK"."SYS_USER_ROLE" VALUES ('6', '2');
INSERT INTO "LK"."SYS_USER_ROLE" VALUES ('4', '2');

-- ----------------------------
-- Table structure for XXL_JOB_GROUP
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_GROUP";
CREATE TABLE "LK"."XXL_JOB_GROUP" (
  "ID" NUMBER(11,0) NOT NULL,
  "APP_NAME" NVARCHAR2(64) NOT NULL,
  "TITLE" NVARCHAR2(12) NOT NULL,
  "ADDRESS_TYPE" NUMBER(4,0) NOT NULL,
  "ADDRESS_LIST" NCLOB,
  "UPDATE_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."XXL_JOB_GROUP"."APP_NAME" IS '执行器AppName';
COMMENT ON COLUMN "LK"."XXL_JOB_GROUP"."TITLE" IS '执行器名称';
COMMENT ON COLUMN "LK"."XXL_JOB_GROUP"."ADDRESS_TYPE" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "LK"."XXL_JOB_GROUP"."ADDRESS_LIST" IS '执行器地址列表，多地址逗号分隔';

-- ----------------------------
-- Records of XXL_JOB_GROUP
-- ----------------------------
INSERT INTO "LK"."XXL_JOB_GROUP" VALUES ('1', 'xxl-job-executor-sample', '示例执行器', '1', 'http://192.168.221.1:9999/', TO_DATE('2022-02-01 16:11:38', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for XXL_JOB_INFO
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_INFO";
CREATE TABLE "LK"."XXL_JOB_INFO" (
  "ID" NUMBER(11,0) NOT NULL,
  "JOB_GROUP" NUMBER(11,0) NOT NULL,
  "JOB_DESC" NVARCHAR2(255) NOT NULL,
  "ADD_TIME" DATE,
  "UPDATE_TIME" DATE,
  "AUTHOR" NVARCHAR2(64),
  "ALARM_EMAIL" NVARCHAR2(255),
  "SCHEDULE_TYPE" NVARCHAR2(50) NOT NULL,
  "SCHEDULE_CONF" NVARCHAR2(128),
  "MISFIRE_STRATEGY" NVARCHAR2(50) NOT NULL,
  "EXECUTOR_ROUTE_STRATEGY" NVARCHAR2(50),
  "EXECUTOR_HANDLER" NVARCHAR2(255),
  "EXECUTOR_PARAM" NVARCHAR2(512),
  "EXECUTOR_BLOCK_STRATEGY" NVARCHAR2(50),
  "EXECUTOR_TIMEOUT" NUMBER(11,0) NOT NULL,
  "EXECUTOR_FAIL_RETRY_COUNT" NUMBER(11,0) NOT NULL,
  "GLUE_TYPE" NVARCHAR2(50) NOT NULL,
  "GLUE_SOURCE" NCLOB,
  "GLUE_REMARK" NVARCHAR2(128),
  "GLUE_UPDATETIME" DATE,
  "CHILD_JOBID" NVARCHAR2(255),
  "TRIGGER_STATUS" NUMBER(4,0) NOT NULL,
  "TRIGGER_LAST_TIME" NUMBER(20,0) NOT NULL,
  "TRIGGER_NEXT_TIME" NUMBER(20,0) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."JOB_GROUP" IS '执行器主键ID';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."AUTHOR" IS '作者';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."ALARM_EMAIL" IS '报警邮件';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."SCHEDULE_TYPE" IS '调度类型';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."SCHEDULE_CONF" IS '调度配置，值含义取决于调度类型';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."MISFIRE_STRATEGY" IS '调度过期策略';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."EXECUTOR_ROUTE_STRATEGY" IS '执行器路由策略';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."EXECUTOR_HANDLER" IS '执行器任务handler';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."EXECUTOR_PARAM" IS '执行器任务参数';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."EXECUTOR_BLOCK_STRATEGY" IS '阻塞处理策略';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."EXECUTOR_TIMEOUT" IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."EXECUTOR_FAIL_RETRY_COUNT" IS '失败重试次数';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."GLUE_TYPE" IS 'GLUE类型';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."GLUE_SOURCE" IS 'GLUE源代码';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."GLUE_REMARK" IS 'GLUE备注';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."GLUE_UPDATETIME" IS 'GLUE更新时间';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."CHILD_JOBID" IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."TRIGGER_STATUS" IS '调度状态：0-停止，1-运行';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."TRIGGER_LAST_TIME" IS '上次调度时间';
COMMENT ON COLUMN "LK"."XXL_JOB_INFO"."TRIGGER_NEXT_TIME" IS '下次调度时间';

-- ----------------------------
-- Records of XXL_JOB_INFO
-- ----------------------------
INSERT INTO "LK"."XXL_JOB_INFO" VALUES ('1', '1', '测试任务1', TO_DATE('2018-11-03 22:21:31', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-01 15:06:02', 'SYYYY-MM-DD HH24:MI:SS'), 'XXL', NULL, 'CRON', '0/5 0 0 * * ?', 'DO_NOTHING', 'FIRST', 'demoJobHandler', NULL, 'SERIAL_EXECUTION', '0', '0', 'BEAN', NULL, 'GLUE代码初始化', TO_DATE('2018-11-03 22:21:31', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0', '0', '0');

-- ----------------------------
-- Table structure for XXL_JOB_LOCK
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_LOCK";
CREATE TABLE "LK"."XXL_JOB_LOCK" (
  "LOCK_NAME" NVARCHAR2(50) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."XXL_JOB_LOCK"."LOCK_NAME" IS '锁名称';

-- ----------------------------
-- Records of XXL_JOB_LOCK
-- ----------------------------
INSERT INTO "LK"."XXL_JOB_LOCK" VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for XXL_JOB_LOG
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_LOG";
CREATE TABLE "LK"."XXL_JOB_LOG" (
  "ID" NUMBER(20,0) NOT NULL,
  "JOB_GROUP" NUMBER(11,0) NOT NULL,
  "JOB_ID" NUMBER(11,0) NOT NULL,
  "EXECUTOR_ADDRESS" NVARCHAR2(255),
  "EXECUTOR_HANDLER" NVARCHAR2(255),
  "EXECUTOR_PARAM" NVARCHAR2(512),
  "EXECUTOR_SHARDING_PARAM" NVARCHAR2(20),
  "EXECUTOR_FAIL_RETRY_COUNT" NUMBER(11,0),
  "TRIGGER_TIME" DATE,
  "TRIGGER_CODE" NUMBER(11,0) NOT NULL,
  "TRIGGER_MSG" NCLOB,
  "HANDLE_TIME" DATE,
  "HANDLE_CODE" NUMBER(11,0) NOT NULL,
  "HANDLE_MSG" NCLOB,
  "ALARM_STATUS" NUMBER(4,0)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."JOB_GROUP" IS '执行器主键ID';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."JOB_ID" IS '任务，主键ID';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."EXECUTOR_ADDRESS" IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."EXECUTOR_HANDLER" IS '执行器任务handler';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."EXECUTOR_PARAM" IS '执行器任务参数';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."EXECUTOR_SHARDING_PARAM" IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."EXECUTOR_FAIL_RETRY_COUNT" IS '失败重试次数';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."TRIGGER_TIME" IS '调度-时间';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."TRIGGER_CODE" IS '调度-结果';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."TRIGGER_MSG" IS '调度-日志';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."HANDLE_TIME" IS '执行-时间';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."HANDLE_CODE" IS '执行-状态';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."HANDLE_MSG" IS '执行-日志';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG"."ALARM_STATUS" IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';

-- ----------------------------
-- Records of XXL_JOB_LOG
-- ----------------------------
INSERT INTO "LK"."XXL_JOB_LOG" VALUES ('227', '1', '1', 'http://192.168.221.1:9999/', 'demoJobHandler', NULL, NULL, '0', TO_DATE('2022-02-01 19:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '200', '任务触发类型：手动触发<br>调度机器：192.168.221.1<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.221.1:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.221.1:9999/<br>code：200<br>msg：null', NULL, '0', NULL, NULL);

-- ----------------------------
-- Table structure for XXL_JOB_LOGGLUE
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_LOGGLUE";
CREATE TABLE "LK"."XXL_JOB_LOGGLUE" (
  "ID" NUMBER(11,0) NOT NULL,
  "JOB_ID" NUMBER(11,0) NOT NULL,
  "GLUE_TYPE" NVARCHAR2(50),
  "GLUE_SOURCE" NCLOB,
  "GLUE_REMARK" NVARCHAR2(128) NOT NULL,
  "ADD_TIME" DATE,
  "UPDATE_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."XXL_JOB_LOGGLUE"."JOB_ID" IS '任务，主键ID';
COMMENT ON COLUMN "LK"."XXL_JOB_LOGGLUE"."GLUE_TYPE" IS 'GLUE类型';
COMMENT ON COLUMN "LK"."XXL_JOB_LOGGLUE"."GLUE_SOURCE" IS 'GLUE源代码';
COMMENT ON COLUMN "LK"."XXL_JOB_LOGGLUE"."GLUE_REMARK" IS 'GLUE备注';

-- ----------------------------
-- Records of XXL_JOB_LOGGLUE
-- ----------------------------

-- ----------------------------
-- Table structure for XXL_JOB_LOG_REPORT
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_LOG_REPORT";
CREATE TABLE "LK"."XXL_JOB_LOG_REPORT" (
  "ID" NUMBER(11,0) NOT NULL,
  "TRIGGER_DAY" DATE,
  "RUNNING_COUNT" NUMBER(11,0) NOT NULL,
  "SUC_COUNT" NUMBER(11,0) NOT NULL,
  "FAIL_COUNT" NUMBER(11,0) NOT NULL,
  "UPDATE_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "LK"."XXL_JOB_LOG_REPORT"."TRIGGER_DAY" IS '调度-时间';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG_REPORT"."RUNNING_COUNT" IS '运行中-日志数量';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG_REPORT"."SUC_COUNT" IS '执行成功-日志数量';
COMMENT ON COLUMN "LK"."XXL_JOB_LOG_REPORT"."FAIL_COUNT" IS '执行失败-日志数量';

-- ----------------------------
-- Records of XXL_JOB_LOG_REPORT
-- ----------------------------
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('1', TO_DATE('2022-01-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('2', TO_DATE('2022-01-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('3', TO_DATE('2022-01-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('5', TO_DATE('2022-01-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('6', TO_DATE('2022-01-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('21', TO_DATE('2022-01-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('22', TO_DATE('2022-01-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('23', TO_DATE('2022-01-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('41', TO_DATE('2022-01-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('61', TO_DATE('2022-01-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);
INSERT INTO "LK"."XXL_JOB_LOG_REPORT" VALUES ('81', TO_DATE('2022-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '0', '0', '0', NULL);

-- ----------------------------
-- Table structure for XXL_JOB_REGISTRY
-- ----------------------------
DROP TABLE "LK"."XXL_JOB_REGISTRY";
CREATE TABLE "LK"."XXL_JOB_REGISTRY" (
  "ID" NUMBER(11,0) NOT NULL,
  "REGISTRY_GROUP" NVARCHAR2(50) NOT NULL,
  "REGISTRY_KEY" NVARCHAR2(255) NOT NULL,
  "REGISTRY_VALUE" NVARCHAR2(255) NOT NULL,
  "UPDATE_TIME" DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of XXL_JOB_REGISTRY
-- ----------------------------

-- ----------------------------
-- Sequence structure for SEQ_SYS_DEPT
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_SYS_DEPT";
CREATE SEQUENCE "LK"."SEQ_SYS_DEPT" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_MENU
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_SYS_MENU";
CREATE SEQUENCE "LK"."SEQ_SYS_MENU" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_NOTICE
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_SYS_NOTICE";
CREATE SEQUENCE "LK"."SEQ_SYS_NOTICE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_OPER_LOG
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_SYS_OPER_LOG";
CREATE SEQUENCE "LK"."SEQ_SYS_OPER_LOG" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_ROLE
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_SYS_ROLE";
CREATE SEQUENCE "LK"."SEQ_SYS_ROLE" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SYS_USER
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_SYS_USER";
CREATE SEQUENCE "LK"."SEQ_SYS_USER" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_XXL_JOB_INFO
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_XXL_JOB_INFO";
CREATE SEQUENCE "LK"."SEQ_XXL_JOB_INFO" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_XXL_JOB_LOG
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_XXL_JOB_LOG";
CREATE SEQUENCE "LK"."SEQ_XXL_JOB_LOG" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_XXL_LOG_REPORT
-- ----------------------------
DROP SEQUENCE "LK"."SEQ_XXL_LOG_REPORT";
CREATE SEQUENCE "LK"."SEQ_XXL_LOG_REPORT" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Primary Key structure for table SYS_DEPT
-- ----------------------------
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011303" PRIMARY KEY ("DEPT_ID");

-- ----------------------------
-- Checks structure for table SYS_DEPT
-- ----------------------------
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011273" CHECK ("DEPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011274" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011275" CHECK ("DEPT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011278" CHECK ("DEPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011279" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011280" CHECK ("DEPT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011283" CHECK ("DEPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011284" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011285" CHECK ("DEPT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011288" CHECK ("DEPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011289" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011290" CHECK ("DEPT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011293" CHECK ("DEPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011294" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011295" CHECK ("DEPT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011298" CHECK ("DEPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011299" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_DEPT" ADD CONSTRAINT "SYS_C0011300" CHECK ("DEPT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_MENU
-- ----------------------------
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011339" PRIMARY KEY ("MENU_ID");

-- ----------------------------
-- Checks structure for table SYS_MENU
-- ----------------------------
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011304" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011305" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011306" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011307" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011308" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011309" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011310" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011311" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011312" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011313" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011314" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011315" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011316" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011317" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011318" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011319" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011320" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011321" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011322" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011323" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011324" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011325" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011326" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011327" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011328" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011329" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011330" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011331" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011332" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011333" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011334" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011335" CHECK ("MENU_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011336" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011337" CHECK ("MENU_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MENU" ADD CONSTRAINT "SYS_C0011338" CHECK ("VISIBLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table SYS_MESSAGE_READ
-- ----------------------------
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011340" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011341" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011342" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011343" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011344" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011345" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011346" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011347" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011348" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_READ" ADD CONSTRAINT "SYS_C0011349" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table SYS_MESSAGE_UNREAD
-- ----------------------------
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011350" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011351" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011352" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011353" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011354" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011355" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011356" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_MESSAGE_UNREAD" ADD CONSTRAINT "SYS_C0011357" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_NOTICE
-- ----------------------------
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011378" PRIMARY KEY ("NOTICE_ID");

-- ----------------------------
-- Checks structure for table SYS_NOTICE
-- ----------------------------
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011358" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011359" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011360" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011361" CHECK ("CONTENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011362" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011363" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011364" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011365" CHECK ("CONTENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011366" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011367" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011368" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011369" CHECK ("CONTENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011370" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011371" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011372" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011373" CHECK ("CONTENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011374" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011375" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011376" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_NOTICE" ADD CONSTRAINT "SYS_C0011377" CHECK ("CONTENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_OPER_LOG
-- ----------------------------
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011385" PRIMARY KEY ("OPER_ID");

-- ----------------------------
-- Checks structure for table SYS_OPER_LOG
-- ----------------------------
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011379" CHECK ("OPER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011380" CHECK ("OPER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011381" CHECK ("OPER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011382" CHECK ("OPER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011383" CHECK ("OPER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_OPER_LOG" ADD CONSTRAINT "SYS_C0011384" CHECK ("OPER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_ROLE
-- ----------------------------
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011416" PRIMARY KEY ("ROLE_ID");

-- ----------------------------
-- Checks structure for table SYS_ROLE
-- ----------------------------
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011386" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011387" CHECK ("ROLE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011388" CHECK ("ROLE_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011389" CHECK ("STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011390" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011391" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011392" CHECK ("ROLE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011393" CHECK ("ROLE_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011394" CHECK ("STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011395" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011396" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011397" CHECK ("ROLE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011398" CHECK ("ROLE_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011399" CHECK ("STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011400" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011401" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011402" CHECK ("ROLE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011403" CHECK ("ROLE_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011404" CHECK ("STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011405" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011406" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011407" CHECK ("ROLE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011408" CHECK ("ROLE_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011409" CHECK ("STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011410" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011411" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011412" CHECK ("ROLE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011413" CHECK ("ROLE_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011414" CHECK ("STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011415" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table SYS_ROLE_MENU
-- ----------------------------
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011417" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011418" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011419" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011420" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011421" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011422" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011423" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011424" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011425" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011426" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011427" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_ROLE_MENU" ADD CONSTRAINT "SYS_C0011428" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_SHARE
-- ----------------------------
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011600" PRIMARY KEY ("SHARE_ID");

-- ----------------------------
-- Checks structure for table SYS_SHARE
-- ----------------------------
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011597" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011598" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011599" CHECK ("PATH" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011601" CHECK ("SHARE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011602" CHECK ("PARENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011603" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_SHARE" ADD CONSTRAINT "SYS_C0011604" CHECK ("PATH" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_USER
-- ----------------------------
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011457" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Checks structure for table SYS_USER
-- ----------------------------
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011429" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011430" CHECK ("LOGIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011431" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011432" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011433" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011434" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011435" CHECK ("LOGIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011436" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011437" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011438" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011439" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011440" CHECK ("LOGIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011441" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011442" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011443" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011444" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011445" CHECK ("LOGIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011446" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011447" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011448" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011449" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011450" CHECK ("LOGIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011451" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011452" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011453" CHECK ("LOGIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011454" CHECK ("USER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011455" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER" ADD CONSTRAINT "SYS_C0011456" CHECK ("DELETE_FLAG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table SYS_USER_NOTICE
-- ----------------------------
ALTER TABLE "LK"."SYS_USER_NOTICE" ADD CONSTRAINT "SYS_C0011458" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_NOTICE" ADD CONSTRAINT "SYS_C0011459" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_NOTICE" ADD CONSTRAINT "SYS_C0011460" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_NOTICE" ADD CONSTRAINT "SYS_C0011461" CHECK ("NOTICE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_USER_ONLINE
-- ----------------------------
ALTER TABLE "LK"."SYS_USER_ONLINE" ADD CONSTRAINT "SYS_C0011467" PRIMARY KEY ("SESSIONID");

-- ----------------------------
-- Checks structure for table SYS_USER_ONLINE
-- ----------------------------
ALTER TABLE "LK"."SYS_USER_ONLINE" ADD CONSTRAINT "SYS_C0011462" CHECK ("SESSIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ONLINE" ADD CONSTRAINT "SYS_C0011463" CHECK ("SESSIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ONLINE" ADD CONSTRAINT "SYS_C0011464" CHECK ("SESSIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ONLINE" ADD CONSTRAINT "SYS_C0011465" CHECK ("SESSIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ONLINE" ADD CONSTRAINT "SYS_C0011466" CHECK ("SESSIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table SYS_USER_ROLE
-- ----------------------------
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011468" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011469" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011470" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011471" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011472" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011473" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011474" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011475" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011476" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."SYS_USER_ROLE" ADD CONSTRAINT "SYS_C0011477" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_GROUP
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C0011531" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_GROUP
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C0011503" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C0011504" CHECK ("APP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C0011505" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_GROUP" ADD CONSTRAINT "SYS_C0011506" CHECK ("ADDRESS_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_INFO
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011532" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_INFO
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011492" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011493" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011494" CHECK ("JOB_DESC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011495" CHECK ("SCHEDULE_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011496" CHECK ("MISFIRE_STRATEGY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011497" CHECK ("EXECUTOR_TIMEOUT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011498" CHECK ("EXECUTOR_FAIL_RETRY_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011499" CHECK ("GLUE_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011500" CHECK ("TRIGGER_STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011501" CHECK ("TRIGGER_LAST_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_INFO" ADD CONSTRAINT "SYS_C0011502" CHECK ("TRIGGER_NEXT_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOCK
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOCK" ADD CONSTRAINT "SYS_C0011530" PRIMARY KEY ("LOCK_NAME");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOCK
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOCK" ADD CONSTRAINT "SYS_C0011514" CHECK ("LOCK_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOG
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C0011533" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOG
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C0011507" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C0011508" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C0011509" CHECK ("JOB_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C0011511" CHECK ("TRIGGER_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG" ADD CONSTRAINT "SYS_C0011512" CHECK ("HANDLE_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_LOG
-- ----------------------------
CREATE INDEX "LK"."I_handle_code"
  ON "LK"."XXL_JOB_LOG" ("HANDLE_CODE" ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "LK"."I_trigger_time"
  ON "LK"."XXL_JOB_LOG" ("TRIGGER_TIME" ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOGGLUE
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C0011535" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOGGLUE
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C0011519" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C0011520" CHECK ("JOB_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOGGLUE" ADD CONSTRAINT "SYS_C0011521" CHECK ("GLUE_REMARK" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C0011534" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C0011515" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C0011516" CHECK ("RUNNING_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C0011517" CHECK ("SUC_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_LOG_REPORT" ADD CONSTRAINT "SYS_C0011518" CHECK ("FAIL_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_LOG_REPORT
-- ----------------------------
CREATE UNIQUE INDEX "LK"."i_trigger_day"
  ON "LK"."XXL_JOB_LOG_REPORT" ("TRIGGER_DAY" ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table XXL_JOB_REGISTRY
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C0011536" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table XXL_JOB_REGISTRY
-- ----------------------------
ALTER TABLE "LK"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C0011522" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C0011523" CHECK ("REGISTRY_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C0011524" CHECK ("REGISTRY_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LK"."XXL_JOB_REGISTRY" ADD CONSTRAINT "SYS_C0011525" CHECK ("REGISTRY_VALUE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table XXL_JOB_REGISTRY
-- ----------------------------
CREATE INDEX "LK"."i_g_k_v"
  ON "LK"."XXL_JOB_REGISTRY" ("REGISTRY_GROUP" ASC, "REGISTRY_KEY" ASC, "REGISTRY_VALUE" ASC)
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  BUFFER_POOL DEFAULT
);
