drop database if exists rbac1;
create database rbac1;
use rbac1;

drop table roles if exists roles;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_desc` varchar(100),
  `sub_rid` varchar(100),
  PRIMARY KEY (`role_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `roles` VALUES(1,'学生','最基础的角色','');
INSERT INTO `roles` VALUES(2,'计算机系学生','计算机系学生','1');
INSERT INTO `roles` VALUES(3,'机械系学生','机械系学生','1');
INSERT INTO `roles` VALUES(4,'计算机系老师','计算机系老师','2');
INSERT INTO `roles` VALUES(5,'教务处老师','教务处老师','2 3');
INSERT INTO `roles` VALUES(6,'机械系老师','机械系老师','3');
INSERT INTO `roles` VALUES(7,'校长','拥有最高权限','4 5 6');


drop table users if exists users;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `realName` varchar(50) NOT NULL,
  `rid` int(11) NOT NULL,
  FOREIGN  key(rid) REFERENCES roles(role_id),
  PRIMARY KEY (`user_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` VALUES(1,'stu1','123','男','张三',1);
INSERT INTO `users` VALUES(2,'stu2','123','女','李四',1);
INSERT INTO `users` VALUES(3,'stu3','123','男','王五',2);
INSERT INTO `users` VALUES(4,'stu4','123','女','赵六',2);
INSERT INTO `users` VALUES(5,'stu5','123','男','韩七',3);
INSERT INTO `users` VALUES(6,'stu6','123','女','周八',3);
INSERT INTO `users` VALUES(7,'tea1','123','男','蔡老师',6);
INSERT INTO `users` VALUES(8,'tea2','123','男','尚老师',6);
INSERT INTO `users` VALUES(9,'tea3','123','男','何老师',4);
INSERT INTO `users` VALUES(10,'tea4','123','女','林老师',4);
INSERT INTO `users` VALUES(11,'tea5','123','女','王老师',5);
INSERT INTO `users` VALUES(12,'pre1','123','男','柳校长',7);


DROP TABLE buildings if exists buildings;
CREATE TABLE `buildings` (
   `building_id` int(11) NOT NULL AUTO_INCREMENT,
   `building_name` varchar(50) NOT NULL,
   `building_desc` varchar(100),
   `open` bit NOT NULL,
   PRIMARY KEY (`building_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `buildings` VALUES(1,'逸夫图书馆','供师生读书与学习',1);
INSERT INTO `buildings` VALUES(2,'天天食堂','供师生用餐',0);
INSERT INTO `buildings` VALUES(3,'第一教学楼','供师生授课或听课',0);
INSERT INTO `buildings` VALUES(4,'信息楼实验室','供计算机系的师生做实验或办公',1);
INSERT INTO `buildings` VALUES(5,'基础楼实验室','供机械系的师生做实验或办公',1);
INSERT INTO `buildings` VALUES(6,'信息楼办公室','供计算机的老师办公',0);
INSERT INTO `buildings` VALUES(7,'基础楼办公室','供机械系的老师办公',1);
INSERT INTO `buildings` VALUES(8,'教务处','供教务处的老师办公',1);


DROP TABLE rights if exists rights;
CREATE TABLE `rights` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_name` varchar(50) NOT NULL,
  `right_desc` varchar(100),
  `rid` int(11) not null,
  `bid` int(11) not null,
  FOREIGN  key(rid) REFERENCES roles(role_id),
  FOREIGN  key(bid) REFERENCES buildings(building_id),
  PRIMARY KEY (`right_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

# 无权限的记录不存储
INSERT INTO `rights` VALUES(1,'进入 使用','可以进入和使用',1,1);
INSERT INTO `rights` VALUES(2,'进入 使用','可以进入和使用',1,2);
INSERT INTO `rights` VALUES(3,'进入 使用','可以进入和使用',1,3);
INSERT INTO `rights` VALUES(4,'进入 使用','可以进入和使用',2,4);
INSERT INTO `rights` VALUES(5,'进入','可以进入',2,6);
INSERT INTO `rights` VALUES(6,'进入 使用','可以进入和使用',3,5);
INSERT INTO `rights` VALUES(7,'进入','可以进入',3,7);
INSERT INTO `rights` VALUES(8,'关闭','可以关闭',4,4);
INSERT INTO `rights` VALUES(9,'使用','可以使用',4,6);
INSERT INTO `rights` VALUES(10,'进入 使用','可以进入和使用',5,8);
INSERT INTO `rights` VALUES(11,'关闭','可以关闭',6,5);
INSERT INTO `rights` VALUES(12,'使用','可以使用',6,7);
#校长
INSERT INTO `rights` VALUES(13,'关闭 设立','可以关闭和设立',7,1);
INSERT INTO `rights` VALUES(14,'关闭 设立','可以关闭和设立',7,2);
INSERT INTO `rights` VALUES(15,'关闭 设立','可以关闭和设立',7,3);
INSERT INTO `rights` VALUES(16,'设立','可以设立',7,4);
INSERT INTO `rights` VALUES(17,'设立','可以设立',7,5);
INSERT INTO `rights` VALUES(18,'关闭 设立','可以关闭和设立',7,6);
INSERT INTO `rights` VALUES(19,'关闭 设立','可以关闭和设立',7,7);
INSERT INTO `rights` VALUES(20,'关闭 设立','可以关闭和设立',7,8);