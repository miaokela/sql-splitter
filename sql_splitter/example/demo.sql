CREATE DATABASE demo;

CREATE TABLE
    `user` (
        `id` bigint(20) NOT NULL AUTO_INCREMENT,
        `account_id` varchar(40) DEFAULT NULL COMMENT '账号id',
        `account_name` varchar(255) DEFAULT NULL COMMENT '账号名称',
        `user_name` varchar(60) DEFAULT NULL COMMENT '用户名',
        `password` varchar(255) DEFAULT NULL COMMENT '密码',
        `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
        `is_delete` tinyint(1) DEFAULT 0 COMMENT '是否删除',
        `enable_flag` tinyint(1) DEFAULT NULL COMMENT '启用标识',
        `register_datetime` datetime DEFAULT current_timestamp() COMMENT '注册时间',
        `group_id` bigint(20) DEFAULT NULL COMMENT '用户组id',

PRIMARY KEY (`id`),
KEY `ix_sys_account_delete_flag` (`is_delete`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `group` (
        `id` bigint(20) NOT NULL AUTO_INCREMENT,
        `name` varchar(40) DEFAULT NULL COMMENT '用户组' PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO `group` (`name`) VALUES ('用户组1'), ('用户组2');

INSERT INTO
    `user` (
        `account_id`,
        `account_name`,
        `user_name`,
        `password`,
        `phone`,
        `is_delete`,
        `enable_flag`,
        `group_id`
    )
VALUES (
        '1',
        '账号1',
        '用户1',
        '密码1',
        '12345678901',
        0,
        1,
        1
    ), (
        '2',
        '账号2',
        '用户2',
        '密码2',
        '12345678902',
        0,
        1,
        1
    ), (
        '3',
        '账号3',
        '用户3',
        '密码3',
        '12345678903',
        0,
        1,
        2
    ), (
        '4',
        '账号4',
        '用户4',
        '密码4',
        '12345678904',
        0,
        1,
        2
    );
