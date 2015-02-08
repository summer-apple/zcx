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
-- Table structure for table `Order_goods`
--

DROP TABLE IF EXISTS `Order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_goods` (
  `order_id` varchar(28) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_goods_count` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_goods`
--

LOCK TABLES `Order_goods` WRITE;
/*!40000 ALTER TABLE `Order_goods` DISABLE KEYS */;
INSERT INTO `Order_goods` VALUES ('20141224155149-16-3',74,16),('20141224212747-16-3',66,1),('20141227172335-16-5',72,7),('20141227172358-16-5',72,1),('20141228163529-16-3',66,2),('20141228163529-16-3',67,17),('20141228163529-16-3',73,1),('20141228165828-16-3',65,1),('20141228165905-16-3',65,900),('20141229005129-16-3',66,1),('20141230182932-16-3',74,1),('20141230190314-16-3',67,1),('20141230190314-16-3',74,6),('20141230190314-33-3',82,2),('20150104132436-34-21',85,1),('20150104132842-19-3',79,12342),('20150104133608-19-3',79,12342),('20150104133923-16-3',65,1),('20150104134751-16-23',65,6),('20150104134751-16-23',68,1),('20150104134751-36-23',86,2),('20150104135542-16-23',65,7),('20150104135542-16-23',73,12),('20150104135542-19-23',78,14),('20150104141739-16-25',72,1),('20150104141739-16-25',73,3),('20150104141739-37-25',88,12),('20150104152307-16-28',67,1),('20150104152314-16-28',67,1),('20150104153103-16-28',67,1),('20150104153103-16-28',90,23),('20150104153103-19-28',80,1),('20150106195726-16-5',72,1),('20150106195726-32-5',77,1),('20150106195726-32-5',84,1),('20150106200038-16-3',65,1),('20150202162812-16-3',65,1),('20150202162812-16-3',69,2),('20150207201035-16-31',73,1),('20150207201035-16-31',74,1),('20150207201035-19-31',75,166),('20150207201235-19-31',79,-12342),('20150207201243-19-31',80,1),('20150207201259-19-31',80,1);
/*!40000 ALTER TABLE `Order_goods` ENABLE KEYS */;
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
