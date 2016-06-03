CREATE DATABASE  IF NOT EXISTS `artgallerydb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `artgallerydb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: artgallerydb
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `PersonId` bigint(20) NOT NULL,
  PRIMARY KEY (`PersonId`),
  CONSTRAINT `FK_sp56fgw3ubma5i9neuw0mxqmg` FOREIGN KEY (`PersonId`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `address` varchar(255) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phoneNo` bigint(20) DEFAULT NULL,
  `PersonId` bigint(20) NOT NULL,
  PRIMARY KEY (`PersonId`),
  CONSTRAINT `FK_lscbakrfqtuimb1jdbul0i63y` FOREIGN KEY (`PersonId`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('7th Park Street','03051991','talati.r@husky.neu.edu','Female',9874563210,5);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `OrderItem_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity_Ordered` int(11) DEFAULT NULL,
  `Total_Cost` float DEFAULT NULL,
  `Order_ID` bigint(20) DEFAULT NULL,
  `Painting_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderItem_ID`),
  KEY `FK_7ahy2orc95105v9v3w1fiq2g6` (`Order_ID`),
  KEY `FK_2dk342ixcvpeap7j9v84unf03` (`Painting_ID`),
  CONSTRAINT `FK_2dk342ixcvpeap7j9v84unf03` FOREIGN KEY (`Painting_ID`) REFERENCES `painting` (`Painting_Id`),
  CONSTRAINT `FK_7ahy2orc95105v9v3w1fiq2g6` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,20000,1,4);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Order_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Order_Status` varchar(255) DEFAULT NULL,
  `Order_Total` float DEFAULT NULL,
  `PersonId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `FK_14gjhmbhjy8r2d359yahxr3i8` (`PersonId`),
  CONSTRAINT `FK_14gjhmbhjy8r2d359yahxr3i8` FOREIGN KEY (`PersonId`) REFERENCES `customer` (`PersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'paid',20000,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `painting`
--

DROP TABLE IF EXISTS `painting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `painting` (
  `Painting_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Artist_Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Painting_Name` varchar(100) NOT NULL,
  `Path` varchar(100) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `PaintingCategory_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Painting_Id`),
  KEY `FK_lmmsbmbbeki1ktndj2l152bqm` (`PaintingCategory_ID`),
  CONSTRAINT `FK_lmmsbmbbeki1ktndj2l152bqm` FOREIGN KEY (`PaintingCategory_ID`) REFERENCES `paintingcategory` (`PaintingCategory_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painting`
--

LOCK TABLES `painting` WRITE;
/*!40000 ALTER TABLE `painting` DISABLE KEYS */;
INSERT INTO `painting` VALUES (1,'Artists1 art1','description is.....','Landscape1','bg1.jpg',500,1,1),(2,'Artists1 art1','my description is.....','Landscape2','hp4.jpg',1050,1,1),(3,'artist2 art2','description is......','Painting1','nart4.jpg',570,1,2),(4,'Artist3 art3','Description is.....','Photo1','hp6.jpg',20000,0,3);
/*!40000 ALTER TABLE `painting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paintingcategory`
--

DROP TABLE IF EXISTS `paintingcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paintingcategory` (
  `PaintingCategory_Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaintingCategory` varchar(100) NOT NULL,
  PRIMARY KEY (`PaintingCategory_Id`),
  UNIQUE KEY `UK_3uiphlkbbgsse12omb2veetqq` (`PaintingCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paintingcategory`
--

LOCK TABLES `paintingcategory` WRITE;
/*!40000 ALTER TABLE `paintingcategory` DISABLE KEYS */;
INSERT INTO `paintingcategory` VALUES (1,'Landscape'),(2,'Painting'),(3,'Photography');
/*!40000 ALTER TABLE `paintingcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `Payment_ID` bigint(20) NOT NULL,
  `CVV` int(11) DEFAULT NULL,
  `Expiration_Date` varchar(100) DEFAULT NULL,
  `Credit_Card_Number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,235,'13/1','5555245262452482');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'admin fname','admin lname'),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL),(5,'Rimple','Talati');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `Supplier_Name` varchar(100) NOT NULL,
  `PersonId` bigint(20) NOT NULL,
  PRIMARY KEY (`PersonId`),
  UNIQUE KEY `UK_oblju1ty9fel0463juvxs6ij5` (`Supplier_Name`),
  CONSTRAINT `FK_41ibhwablwr6g966m1osuc9t1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('artist2 art2',3),('Artist3 art3',4),('Artists1 art1',2);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_product`
--

DROP TABLE IF EXISTS `supplier_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_product` (
  `PersonId` bigint(20) NOT NULL,
  `Painting_ID` int(11) NOT NULL,
  KEY `FK_m23j6yp5mj257snus7e4qwukb` (`Painting_ID`),
  KEY `FK_cag5tgi9xqs50dd8xsg7o262p` (`PersonId`),
  CONSTRAINT `FK_cag5tgi9xqs50dd8xsg7o262p` FOREIGN KEY (`PersonId`) REFERENCES `supplier` (`PersonId`),
  CONSTRAINT `FK_m23j6yp5mj257snus7e4qwukb` FOREIGN KEY (`Painting_ID`) REFERENCES `painting` (`Painting_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_product`
--

LOCK TABLES `supplier_product` WRITE;
/*!40000 ALTER TABLE `supplier_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'a','admin','admin'),(2,'a1','supplier','a1'),(3,'a2','supplier','a2'),(4,'a3','supplier','a3'),(5,'c1','customer','c1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'artgallerydb'
--

--
-- Dumping routines for database 'artgallerydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24  8:53:28
