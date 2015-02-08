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
-- Table structure for table `Goods`
--

DROP TABLE IF EXISTS `Goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goods` (
  `goods_id` int(9) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(45) DEFAULT NULL,
  `goods_type` int(2) DEFAULT NULL,
  `goods_price` float DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `goods_onsale` varchar(10) DEFAULT NULL COMMENT '可售数量',
  `goods_sale_count` int(11) DEFAULT '0' COMMENT '已售数量',
  `goods_describe` text,
  `goods_store` int(7) DEFAULT NULL,
  `goods_area` int(6) DEFAULT NULL,
  `goods_head` varchar(45) DEFAULT 'img/goods/default.jpg',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goods`
--

LOCK TABLES `Goods` WRITE;
/*!40000 ALTER TABLE `Goods` DISABLE KEYS */;
INSERT INTO `Goods` VALUES (65,'棕榈果',2,55.88,83,'onsale',0,'美国棕榈果，壮阳神药！',16,2,'img/goods/16141222125716.jpg'),(66,'江南小葱',3,12.28,999,'onsale',0,'江南小葱,清香扑鼻，适合各类菜肴作为辅料添加。',16,1,'img/goods/16141222010851.jpg'),(67,'甘肃潘苹果',2,45.88,2340,'onsale',0,'以“潘”之姓 冠苹果之名 无污染自然熟不打蜡',16,1,'img/goods/16141222065125.jpg'),(68,'农夫山泉17.5度橙',1,23.44,344,'onsale',0,'预售商品 第二批新鲜采摘后预计12月12日左右开始发货 不是好橙不出街 请亲耐心等待',16,1,'img/goods/16141222065237.jpg'),(69,'泰国金枕头冷冻榴莲',1,56.98,12340,'onsale',0,'新鲜金枕头榴莲果肉，-45℃ 直接冷冻，无需食品添加剂，纯澈果味，让您安心享用',16,1,'img/goods/16141222065401.jpg'),(70,'云南蒙自特级甜石榴',2,23.55,2434,'onsale',0,'肥沃沙质土壤孕育果实汁多味甜，皮薄好剥，肉厚籽软，清甜好滋味',16,1,'img/goods/16141222065437.jpg'),(71,'美国autumnred恐龙蛋',2,54.45,2323,'onsale',0,'【新品种首发 今年最后一批 肉质粉嫩】错过等明年',16,1,'img/goods/16141222065525.jpg'),(72,'墨西哥牛油果，鳄梨',1,65.4,2352,'onsale',0,'【宝宝和孕妇的日常必备辅食】清淡的油脂香味 营养丰盛',16,1,'img/goods/16141222065607.jpg'),(73,'菇 娘',2,16.87,2427,'onsale',0,'美味无需多言',16,3,'img/goods/16141222065645.jpg'),(74,'美国无籽黑提',1,43.65,2325,'onsale',0,'脆嫩果肉与纯澈果汁交错，甜蜜滋味在舌尖起舞，带来美味沁心享受',16,1,'img/goods/16141222065724.jpg'),(75,'棕榈果',2,55.88,-67,'onsale',0,'美国棕榈果，壮阳神药！',19,2,'img/goods/16141222125716.jpg'),(76,'江南小葱',3,12.28,999,'onsale',0,'江南小葱,清香扑鼻，适合各类菜肴作为辅料添加。',33,1,'img/goods/16141222010851.jpg'),(77,'甘肃潘苹果',2,45.88,2343,'onsale',0,'以“潘”之姓 冠苹果之名 无污染自然熟不打蜡',32,1,'img/goods/16141222065125.jpg'),(78,'农夫山泉17.5度橙',1,23.44,331,'onsale',0,'预售商品 第二批新鲜采摘后预计12月12日左右开始发货 不是好橙不出街 请亲耐心等待',19,1,'img/goods/16141222065237.jpg'),(79,'泰国金枕头冷冻榴莲',1,56.98,0,'onsale',0,'新鲜金枕头榴莲果肉，-45℃ 直接冷冻，无需食品添加剂，纯澈果味，让您安心享用',19,1,'img/goods/16141222065401.jpg'),(80,'云南蒙自特级甜石榴',2,23.55,2431,'onsale',0,'肥沃沙质土壤孕育果实汁多味甜，皮薄好剥，肉厚籽软，清甜好滋味',19,1,'img/goods/16141222065437.jpg'),(81,'美国autumnred恐龙蛋',2,54.45,2323,'onsale',0,'【新品种首发 今年最后一批 肉质粉嫩】错过等明年',33,1,'img/goods/16141222065525.jpg'),(82,'墨西哥牛油果，鳄梨',1,65.4,2352,'onsale',0,'【宝宝和孕妇的日常必备辅食】清淡的油脂香味 营养丰盛',33,1,'img/goods/16141222065607.jpg'),(83,'菇 娘',2,16.87,2443,'onsale',0,'美味无需多言',33,3,'img/goods/16141222065645.jpg'),(84,'美国无籽黑提',1,43.65,2331,'onsale',0,'脆嫩果肉与纯澈果汁交错，甜蜜滋味在舌尖起舞，带来美味沁心享受',32,1,'img/goods/16141222065724.jpg'),(85,'兔子',1,100,18,'onsale',0,'可爱',34,1,'img/goods/34150104012209.jpg'),(86,'阿萨德',1,122.21,12340,'onsale',0,'ASDG点高',36,1,'img/goods/36150104014425.png'),(88,'美国无籽黑提=',1,12.22,0,'onsale',0,'擦肩过',37,1,'img/goods/37150104021359.png'),(89,'hfg ',1,12.22,23,'onsale',0,'e ',39,1,'img/goods/39150104032531.png');
/*!40000 ALTER TABLE `Goods` ENABLE KEYS */;
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
