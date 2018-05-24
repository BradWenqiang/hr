-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.40 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 bishe 的数据库结构
CREATE DATABASE IF NOT EXISTS `bishe` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bishe`;


-- 导出  表 bishe.departments 结构
CREATE TABLE IF NOT EXISTS `departments` (
  `number` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `manager` varchar(20) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  bishe.departments 的数据：~6 rows (大约)
DELETE FROM `departments`;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`number`, `name`, `manager`, `telephone`) VALUES
	('007', '123', '123', '123'),
	('1', 'java', '张三', '123123123'),
	('1244', '北京大学', '小天与', ''),
	('3', '齐齐哈尔医学院', '哈哈', '123455'),
	('4', '哈工大', '张乐', '5123'),
	('6', '自如业务部', '李大美人', '111111111');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;


-- 导出  表 bishe.employee 结构
CREATE TABLE IF NOT EXISTS `employee` (
  `eid` varchar(20) NOT NULL,
  `ename` varchar(20) NOT NULL,
  `eage` varchar(20) NOT NULL,
  `education` varchar(20) NOT NULL,
  `job` varchar(20) NOT NULL,
  `sendtime` date NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.employee 的数据：~1 rows (大约)
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`eid`, `ename`, `eage`, `education`, `job`, `sendtime`) VALUES
	('001', '123213', '12', '本科', '销售', '2018-01-01');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- 导出  表 bishe.news 结构
CREATE TABLE IF NOT EXISTS `news` (
  `title` varchar(50) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `text` text,
  `kind` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.news 的数据：~3 rows (大约)
DELETE FROM `news`;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`title`, `author`, `text`, `kind`, `picture`) VALUES
	('11', '22', '33', '3', '/WEB-ROOT/upload/1.png'),
	('12', '44', '55123', '2', '/WEB-ROOT/upload/3.png'),
	('哈哈一号', '博文', '撒旦发射点发阿斯蒂芬阿斯蒂芬撒旦发射点发', '1', '/WEB-ROOT/upload/3.png');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- 导出  表 bishe.pay 结构
CREATE TABLE IF NOT EXISTS `pay` (
  `account` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `paytime` date NOT NULL,
  `basewage` varchar(20) NOT NULL,
  `paywage` varchar(20) NOT NULL,
  `booleanpay` varchar(20) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.pay 的数据：~2 rows (大约)
DELETE FROM `pay`;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` (`account`, `username`, `paytime`, `basewage`, `paywage`, `booleanpay`) VALUES
	('001', '123', '2008-01-01', '123', '123', '123'),
	('111', '123', '2018-01-03', '123123', '123123', '是');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;


-- 导出  表 bishe.project 结构
CREATE TABLE IF NOT EXISTS `project` (
  `title` varchar(50) NOT NULL,
  `p1` varchar(100) DEFAULT NULL,
  `p2` varchar(100) DEFAULT NULL,
  `p3` varchar(100) DEFAULT NULL,
  `p4` varchar(100) DEFAULT NULL,
  `p5` varchar(100) DEFAULT NULL,
  `p6` varchar(100) DEFAULT NULL,
  `p7` varchar(100) DEFAULT NULL,
  `p8` varchar(100) DEFAULT NULL,
  `p9` varchar(100) DEFAULT NULL,
  `p10` varchar(50) DEFAULT NULL,
  `p11` varchar(50) DEFAULT NULL,
  `p12` varchar(50) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `kind` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.project 的数据：~2 rows (大约)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`title`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `p10`, `p11`, `p12`, `text`, `kind`, `time`) VALUES
	('123214', '/WEB-ROOT/upload/19906b4c195146aaa9b8afcc92433d81.png', '/WEB-ROOT/upload/eb6e2824c4d346909be38131f367eaf8.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2134123123', '123123', '12512'),
	('哈哈3号', '/WEB-ROOT/upload/428fcd47cec544e6a502c6fb2485a1c3.png', '/WEB-ROOT/upload/f0a801184344412794cf40e9aa69e4ea.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12312312', '3123123', '123');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


-- 导出  表 bishe.train 结构
CREATE TABLE IF NOT EXISTS `train` (
  `tid` varchar(20) NOT NULL,
  `ttitle` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `time` date NOT NULL,
  `address` varchar(20) NOT NULL,
  `participants` varchar(20) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.train 的数据：~1 rows (大约)
DELETE FROM `train`;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` (`tid`, `ttitle`, `name`, `purpose`, `time`, `address`, `participants`) VALUES
	('123', '123', '123', '123', '2018-01-01', '123', '123');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;


-- 导出  表 bishe.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `account` varchar(16) NOT NULL COMMENT '账号也是员工编号',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `authority` int(1) NOT NULL DEFAULT '0' COMMENT '权限',
  `username` varchar(25) NOT NULL COMMENT '姓名',
  `depNumber` varchar(20) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`account`),
  UNIQUE KEY `username` (`username`,`account`),
  KEY `FK_user_departments` (`depNumber`),
  CONSTRAINT `FK_user_departments` FOREIGN KEY (`depNumber`) REFERENCES `departments` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.user 的数据：~8 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`account`, `password`, `authority`, `username`, `depNumber`) VALUES
	('001', '123456', 0, '李大贱人', '1'),
	('009', '123123', 0, '144', '1244'),
	('1141', '123123', 0, '415123', '6'),
	('1161', '123123', 0, '123', '1244'),
	('123', '123123', 0, '曲文强', '4'),
	('5123', '123123', 0, '123', '007'),
	('admin', 'admin', 1, 'lijian', '1'),
	('uiuiuiuiu', 'uiuiu', 0, 'uiuiuiui', '1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 bishe.userinfo 结构
CREATE TABLE IF NOT EXISTS `userinfo` (
  `usernumber` varchar(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `card` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL,
  `wedding` varchar(10) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `worktime` date DEFAULT NULL,
  `depnumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息表';

-- 正在导出表  bishe.userinfo 的数据：~2 rows (大约)
DELETE FROM `userinfo`;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`usernumber`, `name`, `age`, `sex`, `card`, `birthday`, `nation`, `wedding`, `phonenumber`, `address`, `school`, `education`, `worktime`, `depnumber`) VALUES
	('001', '123', '123', '123', NULL, NULL, '123', '123', '12312312312', NULL, '123', '123', '2009-01-01', '123'),
	('002', '张乐', '12', '男', NULL, NULL, '汉', '是', '18745233906', NULL, '哈尔滨工业大学', '博士', '2018-02-02', 'java');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;


-- 导出  表 bishe.wage 结构
CREATE TABLE IF NOT EXISTS `wage` (
  `account` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `departments` varchar(20) NOT NULL,
  `bsalary` varchar(20) NOT NULL,
  `premium` varchar(20) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  bishe.wage 的数据：~2 rows (大约)
DELETE FROM `wage`;
/*!40000 ALTER TABLE `wage` DISABLE KEYS */;
INSERT INTO `wage` (`account`, `username`, `departments`, `bsalary`, `premium`) VALUES
	('001', '4123', '123123', '1231', '3123'),
	('123', '123', '123', '11111', '123');
/*!40000 ALTER TABLE `wage` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
