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
-- Table structure for table `Article_comment`
--

DROP TABLE IF EXISTS `Article_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article_comment` (
  `article_id` varchar(45) NOT NULL,
  `comment_user` varchar(45) NOT NULL,
  `comment_time` datetime NOT NULL,
  `comment_context` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`article_id`,`comment_user`,`comment_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article_comment`
--

LOCK TABLES `Article_comment` WRITE;
/*!40000 ALTER TABLE `Article_comment` DISABLE KEYS */;
INSERT INTO `Article_comment` VALUES ('201412251916253','3','2014-12-29 08:51:55','zdfgrgrgae'),('201412251916253','3','2014-12-29 08:51:59','asdfwaf'),('201412251916253','3','2014-12-30 12:52:03','dfgchkghvhkj'),('201412251916253','3','2014-12-30 13:06:20','快补补i'),('201412251916253','3','2015-01-05 08:37:19','zfgdsg'),('201412260005163','3','2015-02-06 20:29:39','fzgzddfzgzdfg'),('201412260005163','3','2015-02-06 20:29:47','dfgsdgsdgdgdf'),('201412260005203','5','2014-12-27 19:23:29','dgadgs'),('201412260005203','5','2014-12-27 19:23:50','dgadgs'),('201412260005203','5','2014-12-27 19:23:51','dgadgs'),('201412260005203','5','2014-12-27 19:24:04','dgadgs'),('201412260005203','5','2014-12-27 19:24:43','sdaf'),('201412260005203','5','2014-12-27 19:26:04','adsf'),('201412260005203','5','2014-12-27 19:26:11','adsf'),('201412260005203','5','2014-12-27 19:26:13','dsf'),('201412260005223','5','2014-12-27 20:08:54','asfasfda'),('201412260005283','3','2014-12-27 20:45:08','adsf f'),('201412260005283','5','2014-12-27 20:25:17','${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}'),('201412260005283','5','2014-12-27 20:25:25','${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}${comment.comment_time}'),('2014122600265918','5','2014-12-27 20:36:28','a class=\"btn btn-primary btn-lg btn-block\" class=\"btn btn-primary btn-lg btn-block\" class=\"btn btn-primary btn-lg btn-block\" class=\"btn btn-primary btn-lg btn-block\"'),('201412260031283','5','2014-12-27 19:12:25','adsfadf'),('201412260039003','5','2014-12-27 20:03:36','asdfasf'),('201412260047453','5','2014-12-27 20:06:28','adsfa'),('201412272156353','3','2014-12-27 21:56:51','Xiaojuhua chachacha'),('201412272157033','3','2014-12-27 21:57:08','Dhdhd'),('201501050858493','3','2015-01-05 08:58:58','ddd'),('201501050858583','3','2015-01-05 08:59:11','teytey\n'),('201501050859113','3','2015-01-05 08:59:34','dsafbsrf\n'),('201501051812543','3','2015-01-05 18:13:01','ASDF'),('201501051812543','3','2015-01-05 18:13:17','DASF'),('201501051812543','3','2015-01-05 18:13:20','ADFAFGSFDG'),('201501051812543','3','2015-01-05 18:13:23','SDFBSDB'),('201501052314063','3','2015-01-05 23:14:11','大师傅'),('201501061359033','3','2015-01-06 13:59:23','jdrttrdt\n'),('201501061359033','3','2015-01-06 14:00:54','gijijigjgjgj'),('201501061415203','3','2015-01-06 14:16:33','2015'),('201501061450353','5','2015-01-06 14:52:11','hjhjhj');
/*!40000 ALTER TABLE `Article_comment` ENABLE KEYS */;
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
