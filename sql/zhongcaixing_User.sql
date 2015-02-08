CREATE DATABASE  IF NOT EXISTS `zhongcaixing` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zhongcaixing`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: zhongcaixing
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(32) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_sex` varchar(5) DEFAULT '男',
  `user_head` varchar(45) DEFAULT 'img/head/default.png' COMMENT '用户头像',
  `user_address` int(11) DEFAULT '0',
  `user_phone` varchar(11) DEFAULT '11111111111',
  `user_account` varchar(45) DEFAULT '9999',
  `user_id_card_no` varchar(18) DEFAULT '111111111111111111',
  `user_birth` date DEFAULT '1992-09-26',
  `user_true_name` varchar(10) DEFAULT NULL,
  `user_store` int(7) DEFAULT '0',
  `user_type` varchar(10) DEFAULT 'User',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (0000001,'夏栋','summer','summer.okay@gmail.com','Man','img/head/default.png',0,'15757135741','99999',NULL,'1992-09-26',NULL,19,'User'),(0000003,'summer','summer','summer.okay@gmail.com','男','img/head/3.jpg',13,'15757135741','98069.37000000001','330621199209263517','1992-09-26','夏栋',16,'User'),(0000004,'GMCFUER','gmcfuer','gmc@gmail.com','男','img/head/default.png',0,'13802302303','9999','330343553544354353','1994-06-15','灌木丛',0,'User'),(0000005,'Linyutang','linyutang','linyutang@qq.com','男','img/head/5.jpg',15,'12323123123','8654.12','123123213213213123','1994-06-08','林语堂',32,'User'),(0000007,'cq123','cq123','cq123@126.com','男','img/head/default.png',0,'11111111111','9999','111111111111111111','1992-09-26',NULL,0,'User'),(0000008,'DZ123456','123456','774980952@qq.com','男','img/head/default.png',16,'15757135712','9999','210503199303171816','1990-01-01','dz',0,'User'),(0000009,'DZ1234567','123456','111@qq.com','男','img/head/default.png',20,'15757135712','9999','210503199303171816','1995-06-06','李彦宏',0,'User'),(0000010,'DZ123','123456','123@11.com','男','img/head/default.png',17,'15757135712','9999','210503199303171816','1990-01-01','奥巴马',0,'User'),(0000011,'DZ1234','123456','112@qq.com','男','img/head/default.png',18,'15757135712','9999','210503199303171816','1995-07-12','马云',0,'User'),(0000012,'DZ12345','123456','774980950@qq.com','男','img/head/default.png',19,'15757135712','9999','210503199303171816','1995-06-06','马化腾',0,'User'),(0000013,'我是一只小鸭子','wsyzxyz','729532949@qq.com','女','img/head/default.png',21,'12345678910','9999','123456789101112131','1994-09-01','许许许',34,'User'),(0000014,'我是一个暖宝宝','wsygnbb','270718859@qq.com','男','img/head/default.png',22,'12345678910','9999','123456789101112131','1990-01-01','徐徐徐',0,'User'),(0000015,'我是一只小陀螺','wsyzxtl','1234@qq.com','女','img/head/default.png',23,'12345678910','9999','123456789101112131','1991-06-05','慧慧慧',33,'User'),(0000016,'我是一朵牵牛花','wsydqnh','12345@qq.com','女','img/head/default.png',24,'12345678910','9999','123456789101112131','1993-05-17','敏敏敏',0,'User'),(0000017,'我是一个小豆比','wsygxdb','123456@qq.com','男','img/head/default.png',25,'15757135741','9999','123456789101112131','1992-09-26','许慧敏',0,'User'),(0000018,'dakuihua','12345','1@q.1','男','img/head/default.png',26,'15757135741','9999','330621199209263517','1990-01-01','',0,'User'),(0000019,'fhjgfkhfyj','zzzzzz','ykfky@dtkfkuy','男','img/head/default.png',0,'11111111111','9999','111111111111111111','1992-09-26',NULL,0,'User'),(0000020,'WR儿童个性的','aaaaaa','sdfs@dfg','男','img/head/default.png',0,'11111111111','9999','111111111111111111','1992-09-26',NULL,0,'User'),(0000021,'linxingxi','linxingxi','linxingxi@gmail.com','女','img/head/21.jpg',28,'15757135742','9999','330621199209263523','1995-06-22','林星希',34,'User'),(0000022,'michelle','123456','12@qq.com','男','img/head/22.jpg',29,'12345612345','9999','123123213213213123','1990-01-01','michelle',35,'User'),(0000023,'asdfgadsg','111111','adfg@as','男','img/head/23.png',30,'15757135741','9754.58','330621199209263517','1990-01-01','as\'d\'f',36,'User'),(0000024,'aaaaaa','111111111','aaaaaa.okay@gmail.com','男','img/head/24.png',31,'15757135741','9999','123123213213213123','1990-01-01','qqqqq',0,'User'),(0000025,'hhhhhhhh','1111111','hhhhhh.okay@gmail.com','男','img/head/25.png',32,'15757135741','9882.99','123123213213213123','1990-01-01','gdg',37,'User'),(0000026,'aaaaaaa','111111','aaaaaaaaa.okay@gmail.com','男','img/head/26.png',33,'15757135741','9999','123123213213213123','1990-01-01','1111111',0,'User'),(0000027,'asdfd','111111','asdf@sdrgf','男','img/head/27.png',34,'12345612345','9999','123123213213213123','1990-01-01','asdfadsf',38,'User'),(0000028,'11111','111111','123@qq.com','男','img/head/28.png',35,'15757135741','9672.06','123123213213213123','1990-01-01','qqqqq',39,'User'),(0000029,'111111','12345','7299@qq.com','男','img/head/default.png',0,'11111111111','9999','111111111111111111','1992-09-26',NULL,0,'User'),(0000030,'11111111','12345','1111111@qq.com','男','img/head/default.png',0,'11111111111','9999','111111111111111111','1992-09-26',NULL,0,'User'),(0000031,'summeroo','aaaaaa','fdbsgf@nbhvjh.vhv','男','img/head/31.jpg',36,'00000000000','9938.48','000000000000000000','1994-06-16','gtdty',0,'User');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-08 16:30:16
