
CREATE DATABASE IF NOT EXISTS ApolloPortalDB;

Use ApolloPortalDB;

# Dump of table app
# ------------------------------------------------------------

DROP TABLE IF EXISTS `App`;

CREATE TABLE `App` (
                       `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
                       `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                       `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
                       `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
                       `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
                       `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
                       `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
                       `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                       `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                       `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                       `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                       `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                       `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                       PRIMARY KEY (`Id`),
                       UNIQUE KEY `UK_AppId_DeletedAt` (`AppId`,`DeletedAt`),
                       KEY `DataChange_LastTime` (`DataChange_LastTime`),
                       KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB  COMMENT='应用表';



# Dump of table appnamespace
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AppNamespace`;

CREATE TABLE `AppNamespace` (
                                `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                                `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
                                `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'app id',
                                `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
                                `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
                                `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_AppId_Name_DeletedAt` (`AppId`,`Name`,`DeletedAt`),
                                KEY `Name_AppId` (`Name`,`AppId`),
                                KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB  COMMENT='应用namespace定义';



# Dump of table consumer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Consumer`;

CREATE TABLE `Consumer` (
                            `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                            `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                            `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
                            `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
                            `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
                            `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
                            `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
                            `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                            `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                            `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                            `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `UK_AppId_DeletedAt` (`AppId`,`DeletedAt`),
                            KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB  COMMENT='开放API消费者';



# Dump of table consumeraudit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConsumerAudit`;

CREATE TABLE `ConsumerAudit` (
                                 `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                                 `ConsumerId` int unsigned DEFAULT NULL COMMENT 'Consumer Id',
                                 `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
                                 `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
                                 `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                                 PRIMARY KEY (`Id`),
                                 KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                 KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB  COMMENT='consumer审计表';



# Dump of table consumerrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConsumerRole`;

CREATE TABLE `ConsumerRole` (
                                `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                                `ConsumerId` int unsigned DEFAULT NULL COMMENT 'Consumer Id',
                                `RoleId` int unsigned DEFAULT NULL COMMENT 'Role Id',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_ConsumerId_RoleId_DeletedAt` (`ConsumerId`,`RoleId`,`DeletedAt`),
                                KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                KEY `IX_RoleId` (`RoleId`)
) ENGINE=InnoDB  COMMENT='consumer和role的绑定表';



# Dump of table consumertoken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConsumerToken`;

CREATE TABLE `ConsumerToken` (
                                 `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                                 `ConsumerId` int unsigned DEFAULT NULL COMMENT 'ConsumerId',
                                 `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
                                 `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
                                 `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                 `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                 `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                                 `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                                 `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                                 PRIMARY KEY (`Id`),
                                 UNIQUE KEY `UK_Token_DeletedAt` (`Token`,`DeletedAt`),
                                 KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB  COMMENT='consumer token表';

# Dump of table favorite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Favorite`;

CREATE TABLE `Favorite` (
                            `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
                            `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
                            `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                            `Position` int NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
                            `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                            `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                            `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                            `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `UK_UserId_AppId_DeletedAt` (`UserId`,`AppId`,`DeletedAt`),
                            KEY `AppId` (`AppId`(191)),
                            KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23  COMMENT='应用收藏表';

# Dump of table permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Permission`;

CREATE TABLE `Permission` (
                              `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                              `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
                              `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
                              `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                              `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                              `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                              `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                              `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                              PRIMARY KEY (`Id`),
                              UNIQUE KEY `UK_TargetId_PermissionType_DeletedAt` (`TargetId`,`PermissionType`,`DeletedAt`),
                              KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB  COMMENT='permission表';



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role` (
                        `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                        `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
                        `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                        `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                        `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                        `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                        `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                        PRIMARY KEY (`Id`),
                        UNIQUE KEY `UK_RoleName_DeletedAt` (`RoleName`,`DeletedAt`),
                        KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB  COMMENT='角色表';



# Dump of table rolepermission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RolePermission`;

CREATE TABLE `RolePermission` (
                                  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                                  `RoleId` int unsigned DEFAULT NULL COMMENT 'Role Id',
                                  `PermissionId` int unsigned DEFAULT NULL COMMENT 'Permission Id',
                                  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                  `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                                  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                                  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                                  PRIMARY KEY (`Id`),
                                  UNIQUE KEY `UK_RoleId_PermissionId_DeletedAt` (`RoleId`,`PermissionId`,`DeletedAt`),
                                  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB  COMMENT='角色和权限的绑定表';



# Dump of table serverconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ServerConfig`;

CREATE TABLE `ServerConfig` (
                                `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                                `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
                                `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
                                `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_Key_DeletedAt` (`Key`,`DeletedAt`),
                                KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB  COMMENT='配置服务自身配置';



# Dump of table userrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserRole`;

CREATE TABLE `UserRole` (
                            `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                            `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
                            `RoleId` int unsigned DEFAULT NULL COMMENT 'Role Id',
                            `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                            `DeletedAt` BIGINT NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                            `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
                            `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `UK_UserId_RoleId_DeletedAt` (`UserId`,`RoleId`,`DeletedAt`),
                            KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                            KEY `IX_RoleId` (`RoleId`)
) ENGINE=InnoDB  COMMENT='用户和role的绑定表';

# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
                         `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                         `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户登录账户',
                         `Password` varchar(512) NOT NULL DEFAULT 'default' COMMENT '密码',
                         `UserDisplayName` varchar(512) NOT NULL DEFAULT 'default' COMMENT '用户名称',
                         `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
                         `Enabled` tinyint DEFAULT NULL COMMENT '是否有效',
                         PRIMARY KEY (`Id`),
                         UNIQUE KEY `UK_Username` (`Username`)
) ENGINE=InnoDB  COMMENT='用户表';


# Dump of table Authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Authorities`;

CREATE TABLE `Authorities` (
                               `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
                               `Username` varchar(64) NOT NULL,
                               `Authority` varchar(50) NOT NULL,
                               PRIMARY KEY (`Id`)
) ENGINE=InnoDB ;


# Config
# ------------------------------------------------------------
INSERT INTO `ServerConfig` (`Key`, `Value`, `Comment`)
VALUES
    ('apollo.portal.envs', 'dev', '可支持的环境列表'),
    ('organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表'),
    ('superAdmin', 'apollo', 'Portal超级管理员'),
    ('api.readTimeout', '10000', 'http接口read timeout'),
    ('consumer.token.salt', 'someSalt', 'consumer token salt'),
    ('admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace'),
    ('configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔'),
    ('apollo.portal.meta.servers', '{}', '各环境Meta Service列表');

INSERT INTO `Users` (`Username`, `Password`, `UserDisplayName`, `Email`, `Enabled`)
VALUES
    ('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo', 'apollo@acme.com', 1);

INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('apollo', 'ROLE_user');

# Sample Data
# ------------------------------------------------------------
INSERT INTO `App` (`AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`)
VALUES
  ('SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com');

INSERT INTO `AppNamespace` (`Name`, `AppId`, `Format`, `IsPublic`, `Comment`)
VALUES
    ('application', 'SampleApp', 'properties', 0, 'default app namespace');

INSERT INTO `Permission` (`Id`, `PermissionType`, `TargetId`)
VALUES
    (1, 'CreateCluster', 'SampleApp'),
    (2, 'CreateNamespace', 'SampleApp'),
    (3, 'AssignRole', 'SampleApp'),
    (4, 'ModifyNamespace', 'SampleApp+application'),
    (5, 'ReleaseNamespace', 'SampleApp+application');

INSERT INTO `Role` (`Id`, `RoleName`)
VALUES
    (1, 'Master+SampleApp'),
    (2, 'ModifyNamespace+SampleApp+application'),
    (3, 'ReleaseNamespace+SampleApp+application');

INSERT INTO `RolePermission` (`RoleId`, `PermissionId`)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (3, 5);

INSERT INTO `UserRole` (`UserId`, `RoleId`)
VALUES
    ('apollo', 1),
    ('apollo', 2),
    ('apollo', 3);

-- spring session (https://github.com/spring-projects/spring-session/blob/faee8f1bdb8822a5653a81eba838dddf224d92d6/spring-session-jdbc/src/main/resources/org/springframework/session/jdbc/schema-mysql.sql)
CREATE TABLE SPRING_SESSION (
                                PRIMARY_ID CHAR(36) NOT NULL,
                                SESSION_ID CHAR(36) NOT NULL,
                                CREATION_TIME BIGINT NOT NULL,
                                LAST_ACCESS_TIME BIGINT NOT NULL,
                                MAX_INACTIVE_INTERVAL INT NOT NULL,
                                EXPIRY_TIME BIGINT NOT NULL,
                                PRINCIPAL_NAME VARCHAR(100),
                                CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE UNIQUE INDEX SPRING_SESSION_IX1 ON SPRING_SESSION (SESSION_ID);
CREATE INDEX SPRING_SESSION_IX2 ON SPRING_SESSION (EXPIRY_TIME);
CREATE INDEX SPRING_SESSION_IX3 ON SPRING_SESSION (PRINCIPAL_NAME);

CREATE TABLE SPRING_SESSION_ATTRIBUTES (
                                           SESSION_PRIMARY_ID CHAR(36) NOT NULL,
                                           ATTRIBUTE_NAME VARCHAR(200) NOT NULL,
                                           ATTRIBUTE_BYTES BLOB NOT NULL,
                                           CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
                                           CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES SPRING_SESSION(PRIMARY_ID) ON DELETE CASCADE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;