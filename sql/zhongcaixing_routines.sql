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
-- Temporary table structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_view` (
  `order_id` tinyint NOT NULL,
  `order_time` tinyint NOT NULL,
  `order_user_id` tinyint NOT NULL,
  `order_user_name` tinyint NOT NULL,
  `order_store_id` tinyint NOT NULL,
  `order_store_name` tinyint NOT NULL,
  `order_carriage` tinyint NOT NULL,
  `order_amount` tinyint NOT NULL,
  `order_address_id` tinyint NOT NULL,
  `order_state` tinyint NOT NULL,
  `address_name` tinyint NOT NULL,
  `address_phone` tinyint NOT NULL,
  `address_province` tinyint NOT NULL,
  `address_city` tinyint NOT NULL,
  `address_district` tinyint NOT NULL,
  `address_detial` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `article_view`
--

DROP TABLE IF EXISTS `article_view`;
/*!50001 DROP VIEW IF EXISTS `article_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `article_view` (
  `article_id` tinyint NOT NULL,
  `article_title` tinyint NOT NULL,
  `article_time` tinyint NOT NULL,
  `article_context` tinyint NOT NULL,
  `article_head` tinyint NOT NULL,
  `article_tag` tinyint NOT NULL,
  `article_type` tinyint NOT NULL,
  `article_user_id` tinyint NOT NULL,
  `article_user_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `cart_view`
--

DROP TABLE IF EXISTS `cart_view`;
/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `cart_view` (
  `cart_user` tinyint NOT NULL,
  `goods_id` tinyint NOT NULL,
  `cart_goods_count` tinyint NOT NULL,
  `goods_name` tinyint NOT NULL,
  `goods_price` tinyint NOT NULL,
  `store_id` tinyint NOT NULL,
  `goods_head` tinyint NOT NULL,
  `store_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goods_view`
--

DROP TABLE IF EXISTS `goods_view`;
/*!50001 DROP VIEW IF EXISTS `goods_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `goods_view` (
  `goods_id` tinyint NOT NULL,
  `goods_name` tinyint NOT NULL,
  `goods_price` tinyint NOT NULL,
  `goods_count` tinyint NOT NULL,
  `goods_onsale` tinyint NOT NULL,
  `goods_sale_count` tinyint NOT NULL,
  `goods_describe` tinyint NOT NULL,
  `goods_store` tinyint NOT NULL,
  `store_name` tinyint NOT NULL,
  `goods_head` tinyint NOT NULL,
  `goods_type` tinyint NOT NULL,
  `goods_type_name` tinyint NOT NULL,
  `goods_area` tinyint NOT NULL,
  `goods_ware` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `store_view`
--

DROP TABLE IF EXISTS `store_view`;
/*!50001 DROP VIEW IF EXISTS `store_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `store_view` (
  `store_name` tinyint NOT NULL,
  `user_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `article_comment_view`
--

DROP TABLE IF EXISTS `article_comment_view`;
/*!50001 DROP VIEW IF EXISTS `article_comment_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `article_comment_view` (
  `article_id` tinyint NOT NULL,
  `article_title` tinyint NOT NULL,
  `comment_user_id` tinyint NOT NULL,
  `comment_user_name` tinyint NOT NULL,
  `comment_user_head` tinyint NOT NULL,
  `comment_time` tinyint NOT NULL,
  `comment_context` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_goods_view`
--

DROP TABLE IF EXISTS `order_goods_view`;
/*!50001 DROP VIEW IF EXISTS `order_goods_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_goods_view` (
  `order_id` tinyint NOT NULL,
  `goods_id` tinyint NOT NULL,
  `goods_name` tinyint NOT NULL,
  `goods_price` tinyint NOT NULL,
  `order_goods_count` tinyint NOT NULL,
  `goods_head` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP TABLE IF EXISTS `order_view`*/;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_view` AS select `o`.`order_id` AS `order_id`,`o`.`order_time` AS `order_time`,`o`.`order_user` AS `order_user_id`,`u`.`user_name` AS `order_user_name`,`o`.`order_store` AS `order_store_id`,`s`.`store_name` AS `order_store_name`,`o`.`order_carriage` AS `order_carriage`,`o`.`order_amount` AS `order_amount`,`o`.`order_address` AS `order_address_id`,`o`.`order_state` AS `order_state`,`a`.`address_name` AS `address_name`,`a`.`address_phone` AS `address_phone`,`a`.`address_province` AS `address_province`,`a`.`address_city` AS `address_city`,`a`.`address_district` AS `address_district`,`a`.`address_detial` AS `address_detial` from (((`orders` `o` join `user` `u` on((`o`.`order_user` = `u`.`user_id`))) join `store` `s` on((`o`.`order_store` = `s`.`store_id`))) join `address` `a` on((`o`.`order_address` = `a`.`address_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `article_view`
--

/*!50001 DROP TABLE IF EXISTS `article_view`*/;
/*!50001 DROP VIEW IF EXISTS `article_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `article_view` AS select `a`.`article_id` AS `article_id`,`a`.`article_title` AS `article_title`,`a`.`article_time` AS `article_time`,`a`.`article_context` AS `article_context`,`a`.`article_head` AS `article_head`,`a`.`article_tag` AS `article_tag`,`a`.`article_type` AS `article_type`,`a`.`article_user` AS `article_user_id`,`u`.`user_name` AS `article_user_name` from (`article` `a` join `user` `u` on((`a`.`article_user` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cart_view`
--

/*!50001 DROP TABLE IF EXISTS `cart_view`*/;
/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_view` AS select `c`.`cart_user` AS `cart_user`,`c`.`goods_id` AS `goods_id`,`c`.`cart_goods_count` AS `cart_goods_count`,`g`.`goods_name` AS `goods_name`,`g`.`goods_price` AS `goods_price`,`g`.`goods_store` AS `store_id`,`g`.`goods_head` AS `goods_head`,`s`.`store_name` AS `store_name` from ((`cart_goods` `c` join `goods` `g` on((`c`.`goods_id` = `g`.`goods_id`))) join `store` `s` on((`g`.`goods_store` = `s`.`store_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_view`
--

/*!50001 DROP TABLE IF EXISTS `goods_view`*/;
/*!50001 DROP VIEW IF EXISTS `goods_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_view` AS select `g`.`goods_id` AS `goods_id`,`g`.`goods_name` AS `goods_name`,`g`.`goods_price` AS `goods_price`,`g`.`goods_count` AS `goods_count`,`g`.`goods_onsale` AS `goods_onsale`,`g`.`goods_sale_count` AS `goods_sale_count`,`g`.`goods_describe` AS `goods_describe`,`g`.`goods_store` AS `goods_store`,`s`.`store_name` AS `store_name`,`g`.`goods_head` AS `goods_head`,`g`.`goods_type` AS `goods_type`,`gt`.`goods_type_name` AS `goods_type_name`,`g`.`goods_area` AS `goods_area`,`wa`.`ware_id` AS `goods_ware` from (((`goods` `g` join `goods_type` `gt` on((`g`.`goods_type` = `gt`.`goods_type_id`))) join `ware_area` `wa` on((`g`.`goods_area` = `wa`.`area_id`))) join `store` `s` on((`g`.`goods_store` = `s`.`store_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `store_view`
--

/*!50001 DROP TABLE IF EXISTS `store_view`*/;
/*!50001 DROP VIEW IF EXISTS `store_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `store_view` AS select `s`.`store_name` AS `store_name`,`u`.`user_name` AS `user_name` from (`store` `s` join `user` `u` on((`s`.`store_owner` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `article_comment_view`
--

/*!50001 DROP TABLE IF EXISTS `article_comment_view`*/;
/*!50001 DROP VIEW IF EXISTS `article_comment_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `article_comment_view` AS select `a`.`article_id` AS `article_id`,`a`.`article_title` AS `article_title`,`ac`.`comment_user` AS `comment_user_id`,`u`.`user_name` AS `comment_user_name`,`u`.`user_head` AS `comment_user_head`,`ac`.`comment_time` AS `comment_time`,`ac`.`comment_context` AS `comment_context` from ((`article_comment` `ac` join `article` `a` on((`ac`.`article_id` = `a`.`article_id`))) join `user` `u` on((`ac`.`comment_user` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_goods_view`
--

/*!50001 DROP TABLE IF EXISTS `order_goods_view`*/;
/*!50001 DROP VIEW IF EXISTS `order_goods_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_goods_view` AS select `og`.`order_id` AS `order_id`,`og`.`goods_id` AS `goods_id`,`goods`.`goods_name` AS `goods_name`,`goods`.`goods_price` AS `goods_price`,`og`.`order_goods_count` AS `order_goods_count`,`goods`.`goods_head` AS `goods_head` from (`order_goods` `og` join `goods` on((`og`.`goods_id` = `goods`.`goods_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-08 16:30:16
