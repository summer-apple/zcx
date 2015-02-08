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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `address_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `address_user_id` int(7) DEFAULT NULL,
  `address_name` varchar(20) DEFAULT NULL,
  `address_phone` varchar(20) DEFAULT NULL,
  `address_province` varchar(20) DEFAULT NULL,
  `address_city` varchar(20) DEFAULT NULL,
  `address_district` varchar(20) DEFAULT NULL,
  `address_detial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (00000000013,3,'夏栋','15757135741','浙江省','地级市','市、县级市、县','asdgregdfsg '),(00000000014,6,'小菊花','17637213133','浙江省','湖州市','南浔区','我而去吴青峰ASF'),(00000000015,5,'林语堂','12323123123','浙江省','湖州市','南浔区','ad\'s\'f'),(00000000016,8,'dz','15757135712','浙江省','地级市','市、县级市、县','123'),(00000000017,10,'奥巴马','15757135712','浙江省','湖州市','南浔区','123'),(00000000018,11,'马云','15757135712','浙江省','湖州市','南浔区','51#403'),(00000000019,12,'马化腾','15757135712','浙江省','绍兴市','嵊州市','51#'),(00000000020,9,'李彦宏','15757135712','浙江省','金华市','浦江县','51#'),(00000000021,13,'许许许','12345678910','浙江省','嘉兴市','南湖区','asdfasf'),(00000000022,14,'徐徐徐','12345678910','浙江省','杭州市','上城区','。。。'),(00000000023,15,'慧慧慧','12345678910','浙江省','湖州市','吴兴区','asdfaf '),(00000000024,16,'敏敏敏','12345678910','江苏省','南京市','雨花台区','。。。。'),(00000000025,17,'夏小栋','15757135741','浙江省','杭州市','萧山区','.。。。'),(00000000026,18,'马尔克斯','34235252553','江西省','景德镇市','乐平市','未确认去潍坊'),(00000000027,18,'','15757135741','浙江省','地级市','市、县级市、县','ewafr'),(00000000028,21,'林星希','15757135742','浙江省','台州市','温岭市','林星希大道250号'),(00000000029,22,'michelle','12345612345','浙江省','杭州市','拱墅区','gh ii'),(00000000030,23,'as\'d\'f','15757135741','浙江省','嘉兴市','海宁市','打工的啊 撒地方的'),(00000000031,24,'qqqqq','15757135741','浙江省','地级市','市、县级市、县','qqqq'),(00000000032,25,'gdg','15757135741','浙江省','地级市','市、县级市、县','hhh'),(00000000033,26,'1111111','15757135741','北京市','北京市','西城区','jjj'),(00000000034,27,'asdfadsf','12345612345','浙江省','地级市','市、县级市、县','sdv '),(00000000035,28,'qqqqq','15757135741','浙江省','湖州市','南浔区','hhh'),(00000000036,31,'gtdty','00000000000','浙江省','舟山市','普陀区','hjgvchj');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
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
