-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: northwind
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts` (
  `AccountID` varchar(5) NOT NULL,
  `AccountName` varchar(40) NOT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `CompanyName` (`AccountName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('B0','خزينه رئيسي','0'),('B1','خزينه - فرعي 1','0'),('B2','خزينه- فرعي 2','0'),('B3','خزينه - فرعي 3','0'),('C1','نقدي','0');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation details`
--

DROP TABLE IF EXISTS `operation details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation details` (
  `OperationID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `OperationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DebitID` varchar(5) NOT NULL,
  `CreditID` varchar(5) NOT NULL,
  `DebitValue` decimal(10,0) unsigned NOT NULL,
  `CreditValue` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`OperationID`,`UserID`),
  KEY `1_idx` (`DebitID`),
  KEY `2_idx` (`CreditID`),
  KEY `5_idx` (`UserID`),
  KEY `6_idx` (`UserID`),
  CONSTRAINT `3` FOREIGN KEY (`DebitID`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `4` FOREIGN KEY (`CreditID`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `6` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation details`
--

LOCK TABLES `operation details` WRITE;
/*!40000 ALTER TABLE `operation details` DISABLE KEYS */;
INSERT INTO `operation details` VALUES (117,20,'2019-02-05 23:51:34','B3','B0',3500,3500),(118,20,'2019-02-05 23:51:38','B3','B0',270,270),(119,14,'2019-02-05 23:52:53','B0','B3',3770,3770),(120,20,'2019-02-06 16:53:01','B3','B0',2500,2500),(121,14,'2019-02-06 16:53:27','B0','B3',2500,2500),(122,20,'2019-02-06 19:27:39','B3','B0',721,721),(123,20,'2019-02-06 21:46:18','B3','B0',149,149),(124,20,'2019-02-06 21:48:25','B3','B0',348,348),(125,14,'2019-02-06 21:55:25','B0','B3',1218,1218),(126,20,'2019-02-06 22:20:53','B3','B0',281,281),(127,20,'2019-02-06 22:25:37','B3','B0',1910,1910),(128,20,'2019-02-06 22:28:43','B3','B0',4323,4323),(129,20,'2019-02-06 22:30:19','B3','B0',3929,3929),(130,20,'2019-02-06 22:35:08','B3','B0',552,552),(131,20,'2019-02-06 22:37:53','B3','B0',30,30),(132,20,'2019-02-06 22:38:03','B3','B0',1431,1431),(133,14,'2019-02-06 22:39:07','B0','B3',12456,12456);
/*!40000 ALTER TABLE `operation details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order details`
--

DROP TABLE IF EXISTS `order details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UnitPrice` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `Price2` varchar(45) NOT NULL DEFAULT '0',
  `Price3` varchar(45) NOT NULL DEFAULT '0',
  `Discount` double(8,0) NOT NULL DEFAULT '0',
  `Quantity` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `FK_Order_Details_Products` (`ProductID`),
  CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order details`
--

LOCK TABLES `order details` WRITE;
/*!40000 ALTER TABLE `order details` DISABLE KEYS */;
INSERT INTO `order details` VALUES (11209,108,7.0000,'0','0',0,500),(11210,109,4.5000,'0','0',0,60),(11211,103,5.0000,'0','0',0,500),(11212,110,33.0000,'0','0',0,1),(11212,111,41.0000,'0','0',0,1),(11212,112,12.0000,'0','0',0,1),(11212,113,2.0000,'0','0',0,1),(11212,114,3.0000,'0','0',0,1),(11212,115,1.0000,'0','0',0,1),(11212,116,4.0000,'0','0',0,1),(11213,103,5.0000,'0','0',0,6),(11213,108,7.0000,'0','0',0,10),(11213,109,4.5000,'0','0',0,10),(11213,110,33.0000,'0','0',0,8),(11213,111,41.0000,'0','0',0,4),(11213,112,12.0000,'0','0',0,6),(11213,113,2.0000,'0','0',0,21),(11213,114,3.0000,'0','0',0,7),(11213,115,1.0000,'0','0',0,1),(11213,116,4.0000,'0','0',0,3),(11214,110,33.0000,'0','0',0,1),(11214,111,41.0000,'0','0',0,2),(11214,112,12.0000,'0','0',0,2),(11214,113,2.0000,'0','0',0,1),(11214,114,3.0000,'0','0',0,1),(11214,115,1.0000,'0','0',0,1),(11214,116,4.0000,'0','0',0,1),(11215,103,5.0000,'0','0',0,1),(11215,108,7.0000,'0','0',0,1),(11215,109,4.5000,'0','0',0,1),(11215,110,33.0000,'0','0',0,2),(11215,111,41.0000,'0','0',0,3),(11215,112,12.0000,'0','0',0,1),(11215,113,2.0000,'0','0',0,5),(11215,114,3.0000,'0','0',0,1),(11215,115,1.0000,'0','0',0,1),(11215,116,4.0000,'0','0',0,2),(11215,117,5.0000,'0','0',0,2),(11215,118,42.0000,'0','0',0,1),(11215,119,21.0000,'0','0',0,1),(11215,120,12.0000,'0','0',0,3),(11216,103,5.0000,'0','0',0,1),(11216,108,7.0000,'0','0',0,1),(11216,109,4.5000,'0','0',0,1),(11216,110,33.0000,'0','0',0,1),(11216,111,41.0000,'0','0',0,5),(11216,112,12.0000,'0','0',0,1),(11216,113,2.0000,'0','0',0,1),(11216,114,3.0000,'0','0',0,1),(11216,115,1.0000,'0','0',0,2),(11216,116,4.0000,'0','0',0,2),(11217,103,5.0000,'0','0',0,1),(11217,108,7.0000,'0','0',0,1),(11217,110,33.0000,'0','0',0,1),(11217,111,41.0000,'0','0',0,1),(11217,112,12.0000,'0','0',0,1),(11217,113,2.0000,'0','0',0,1),(11217,114,3.0000,'0','0',0,2),(11217,115,1.0000,'0','0',0,11),(11217,116,4.0000,'0','0',0,3),(11217,117,5.0000,'0','0',0,1),(11217,118,42.0000,'0','0',0,1),(11217,119,21.0000,'0','0',0,1),(11217,120,12.0000,'0','0',0,1),(11217,121,10.0000,'0','0',0,1),(11217,122,10.0000,'0','0',0,1),(11217,123,70.0000,'0','0',0,23),(11217,124,70.0000,'0','0',0,1),(11217,125,1.0000,'0','0',0,1),(11218,103,5.0000,'0','0',0,6),(11218,108,7.0000,'0','0',0,2),(11218,111,41.0000,'0','0',0,45),(11218,112,12.0000,'0','0',0,1),(11218,114,3.0000,'0','0',0,44),(11218,115,1.0000,'0','0',0,112),(11218,116,4.0000,'0','0',0,44),(11218,119,21.0000,'0','0',0,22),(11218,123,70.0000,'0','0',0,22),(11219,103,5.0000,'0','0',0,2),(11219,108,7.0000,'0','0',0,6),(11219,109,4.5000,'0','0',0,1),(11219,111,41.0000,'0','0',0,3),(11219,112,12.0000,'0','0',0,4),(11219,113,2.0000,'0','0',0,1),(11219,121,10.0000,'0','0',0,20),(11219,123,70.0000,'0','0',0,50),(11220,103,5.0000,'0','0',0,7),(11220,115,1.0000,'0','0',0,8),(11220,116,4.0000,'0','0',0,1),(11220,119,21.0000,'0','0',0,23),(11220,120,12.0000,'0','0',0,1),(11220,121,10.0000,'0','0',0,1),(11221,103,5.0000,'0','0',0,3),(11221,115,1.0000,'0','0',0,3),(11221,116,4.0000,'0','0',0,3),(11222,109,4.5000,'0','0',0,3),(11222,113,2.0000,'0','0',0,3),(11222,120,12.0000,'0','0',0,1),(11222,123,70.0000,'0','0',0,20);
/*!40000 ALTER TABLE `order details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountID` varchar(5) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `OrderDate` (`OrderDate`),
  KEY `2_idx` (`AccountID`),
  KEY `2_idx1` (`UserID`),
  CONSTRAINT `1` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (11209,'B0',20,'2019-02-05 23:51:34'),(11210,'B0',20,'2019-02-05 23:51:38'),(11211,'B0',20,'2019-02-06 16:53:00'),(11212,'B0',20,'2019-02-06 18:49:33'),(11213,'B0',20,'2019-02-06 19:27:38'),(11214,'B0',20,'2019-02-06 21:46:18'),(11215,'B0',20,'2019-02-06 21:48:24'),(11216,'B0',20,'2019-02-06 22:20:52'),(11217,'B0',20,'2019-02-06 22:25:36'),(11218,'B0',20,'2019-02-06 22:28:43'),(11219,'B0',20,'2019-02-06 22:30:19'),(11220,'B0',20,'2019-02-06 22:35:08'),(11221,'B0',20,'2019-02-06 22:37:53'),(11222,'B0',20,'2019-02-06 22:38:03');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(40) NOT NULL,
  `UnitPrice` decimal(10,4) DEFAULT '0.0000',
  `UnitsInStock` smallint(2) DEFAULT '0',
  PRIMARY KEY (`ProductID`),
  KEY `ProductName` (`ProductName`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (103,'كانز بيبسي',5.0000,200),(108,'شيبسي عائلي',7.0000,350),(109,'مكرونه الملكه',4.5000,200),(110,'مكرونه نيرو',33.0000,100),(111,'ارز 2 كيلو',41.0000,100),(112,'ارز 1 كيلو',12.0000,100),(113,'كينوا',2.0000,100),(114,'شوفان',3.0000,100),(115,'تونه',1.0000,100),(116,'اي حاجه',4.0000,100),(117,'شيبسي 2 ج',5.0000,100),(118,'شيبسي 1ز6',42.0000,100),(119,'بطاطس',21.0000,100),(120,'صلصه :)',12.0000,100),(121,'دريتوس عائلي',10.0000,100),(122,'دريتوس وسط',10.0000,100),(123,'بسبوسه 1 كيلو',70.0000,100),(124,'صنف',70.0000,100),(125,'قطاعي 1 جنيه',1.0000,100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `types` (
  `TypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) NOT NULL,
  PRIMARY KEY (`TypeID`),
  UNIQUE KEY `Type_UNIQUE` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'admin'),(2,'casher');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `Notes` mediumtext NOT NULL,
  `log_type` varchar(10) DEFAULT 'casher',
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `ToAccountID` varchar(5) NOT NULL,
  `FromAccountID` varchar(5) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `username` (`username`),
  KEY `LastName` (`LastName`),
  KEY `log_type_idx` (`log_type`),
  KEY `usersaccidToaccountsID_idx` (`ToAccountID`),
  KEY `IDTOACCID_idx` (`ToAccountID`),
  KEY `IDFROMACCID_idx` (`FromAccountID`),
  CONSTRAINT `IDTOACCID` FOREIGN KEY (`ToAccountID`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `SSSSS` FOREIGN KEY (`FromAccountID`) REFERENCES `accounts` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'شاهين','محمود','تجريبي','admin','mahmoudadmin','2222','B1','B0'),(19,'شاهين','محمود','تجريبي','casher','mahmoudbet','2222','B2','B0'),(20,'شاهين','محمود','تجريبي','casher','mahmoudcasher','2222','B3','B0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'northwind'
--

--
-- Dumping routines for database 'northwind'
--
/*!50003 DROP FUNCTION IF EXISTS `MyRound` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `MyRound`(Operand DOUBLE,Places INTEGER) RETURNS double
    DETERMINISTIC
BEGIN

DECLARE x DOUBLE;
DECLARE i INTEGER;
DECLARE ix DOUBLE;

  SET x = Operand*POW(10,Places);
  SET i=x;
  
  IF (i-x) >= 0.5 THEN                   
    SET ix = 1;                  
  ELSE
    SET ix = 0;                 
  END IF;     

  SET x=i+ix;
  SET x=x/POW(10,Places);

RETURN x;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getaccountbalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getaccountbalance`(in id VARCHAR(5))
begin

select 
OperationID as 'رقم العمليه', UserID as 'المستخدم', OperationDate as 'تاريخ العمليه', ac.AccountName as 'اسم المدين',ad.AccountName as 'اسم الدائن',ac.AccountID as 'رمز المدين', ad.AccountID as 'رمز الدائن',DebitValue as 'القيمه المدينه', CreditValue as 'القيمه الدائنه'
from `northwind`.`operation details` od
inner join `northwind`.`accounts` ac on od.DebitID = ac.AccountID
inner join `northwind`.`accounts` ad  on od.CreditID = ad.AccountID
where od.DebitID=id or od.CreditID=id;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getaccountdebit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getaccountdebit`(out deb decimal)
begin
select
sum(od.UnitPrice*od.Quantity) into deb
from
`northwind`.`order details` od
 inner join `northwind`.`orders` o on o.OrderID = od.OrderID   
 where o.AccountID='C2' limit 1;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getaccountfullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getaccountfullname`()
begin
	select 
		concat_ws('-',`AccountID`,`AccountName`) as `fullname`
        from 
        `northwind`.`accounts`
        order by
        `fullname`;
        end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts`()
BEGIN
    SELECT * FROM northwind.products;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getnetaccountbalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getnetaccountbalance`(in id VARCHAR(5))
begin

select ifnull(sum(DebitValue),0) into @debitsum FROM northwind.`operation details` where DebitID=id ;
select  ifnull(sum(CreditValue),0)  into @creditsum  FROM northwind.`operation details` where CreditID=id ;
select sum(@debitsum-@creditsum) as 'الصافي';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getproductfullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getproductfullname`()
begin
		select 
		concat_ws('-',`ProductID`,`ProductName`) as `fullname`
        from 
        northwind.products
        order by
        `ProductID`;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getuserbyid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getuserbyid`(in userid INT(11))
begin
	select 
		*
        from 
        `northwind`.`users`
        where
        `UserID`=userid;
        end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getuserfullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getuserfullname`()
begin
	select 
		concat_ws('-',`UserID`,`FirstName`) as `fullname`
        from 
        `northwind`.`users`
        order by
        `fullname`;
        end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-06 22:53:52
