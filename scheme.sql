-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: erg
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `blue_repository`
--

DROP TABLE IF EXISTS `blue_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blue_repository` (
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') NOT NULL,
  `val` enum('B','W') NOT NULL,
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blue_repository`
--

LOCK TABLES `blue_repository` WRITE;
/*!40000 ALTER TABLE `blue_repository` DISABLE KEYS */;
INSERT INTO `blue_repository` VALUES ('A','B'),('B','B'),('C','B'),('D','B'),('E','B'),('F','B'),('G','B'),('H','B'),('I','B'),('J','B'),('K','B'),('L','B'),('M','B'),('N','B'),('O','B'),('P','B'),('Q','B'),('R','B'),('S','B'),('T','B'),('U','B');
/*!40000 ALTER TABLE `blue_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `xA` tinyint(1) NOT NULL,
  `yA` tinyint(1) NOT NULL,
  `piece_color` enum('B','R','W') DEFAULT NULL,
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') DEFAULT NULL,
  PRIMARY KEY (`xA`,`yA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,'W',NULL),(1,2,'W',NULL),(1,3,'W',NULL),(1,4,'W',NULL),(1,5,'W',NULL),(1,6,'W',NULL),(1,7,'W',NULL),(1,8,'W',NULL),(1,9,'W',NULL),(1,10,'W',NULL),(1,11,'W',NULL),(1,12,'W',NULL),(1,13,'W',NULL),(1,14,'W',NULL),(1,15,'W',NULL),(1,16,'W',NULL),(1,17,'W',NULL),(1,18,'W',NULL),(1,19,'W',NULL),(1,20,'W',NULL),(2,1,'W',NULL),(2,2,'W',NULL),(2,3,'W',NULL),(2,4,'W',NULL),(2,5,'W',NULL),(2,6,'W',NULL),(2,7,'W',NULL),(2,8,'W',NULL),(2,9,'W',NULL),(2,10,'W',NULL),(2,11,'W',NULL),(2,12,'W',NULL),(2,13,'W',NULL),(2,14,'W',NULL),(2,15,'W',NULL),(2,16,'W',NULL),(2,17,'W',NULL),(2,18,'W',NULL),(2,19,'W',NULL),(2,20,'W',NULL),(3,1,'W',NULL),(3,2,'W',NULL),(3,3,'W',NULL),(3,4,'W',NULL),(3,5,'W',NULL),(3,6,'W',NULL),(3,7,'W',NULL),(3,8,'W',NULL),(3,9,'W',NULL),(3,10,'W',NULL),(3,11,'W',NULL),(3,12,'W',NULL),(3,13,'W',NULL),(3,14,'W',NULL),(3,15,'W',NULL),(3,16,'W',NULL),(3,17,'W',NULL),(3,18,'W',NULL),(3,19,'W',NULL),(3,20,'W',NULL),(4,1,'W',NULL),(4,2,'W',NULL),(4,3,'W',NULL),(4,4,'W',NULL),(4,5,'W',NULL),(4,6,'W',NULL),(4,7,'W',NULL),(4,8,'W',NULL),(4,9,'W',NULL),(4,10,'W',NULL),(4,11,'W',NULL),(4,12,'W',NULL),(4,13,'W',NULL),(4,14,'W',NULL),(4,15,'W',NULL),(4,16,'W',NULL),(4,17,'W',NULL),(4,18,'W',NULL),(4,19,'W',NULL),(4,20,'W',NULL),(5,1,'W',NULL),(5,2,'W',NULL),(5,3,'W',NULL),(5,4,'W',NULL),(5,5,'W',NULL),(5,6,'W',NULL),(5,7,'W',NULL),(5,8,'W',NULL),(5,9,'W',NULL),(5,10,'W',NULL),(5,11,'W',NULL),(5,12,'W',NULL),(5,13,'W',NULL),(5,14,'W',NULL),(5,15,'W',NULL),(5,16,'W',NULL),(5,17,'W',NULL),(5,18,'W',NULL),(5,19,'W',NULL),(5,20,'W',NULL),(6,1,'W',NULL),(6,2,'W',NULL),(6,3,'W',NULL),(6,4,'W',NULL),(6,5,'W',NULL),(6,6,'W',NULL),(6,7,'W',NULL),(6,8,'W',NULL),(6,9,'W',NULL),(6,10,'W',NULL),(6,11,'W',NULL),(6,12,'W',NULL),(6,13,'W',NULL),(6,14,'W',NULL),(6,15,'W',NULL),(6,16,'W',NULL),(6,17,'W',NULL),(6,18,'W',NULL),(6,19,'W',NULL),(6,20,'W',NULL),(7,1,'W',NULL),(7,2,'W',NULL),(7,3,'W',NULL),(7,4,'W',NULL),(7,5,'W',NULL),(7,6,'W',NULL),(7,7,'W',NULL),(7,8,'W',NULL),(7,9,'W',NULL),(7,10,'W',NULL),(7,11,'W',NULL),(7,12,'W',NULL),(7,13,'W',NULL),(7,14,'W',NULL),(7,15,'W',NULL),(7,16,'W',NULL),(7,17,'W',NULL),(7,18,'W',NULL),(7,19,'W',NULL),(7,20,'W',NULL),(8,1,'W',NULL),(8,2,'W',NULL),(8,3,'W',NULL),(8,4,'W',NULL),(8,5,'W',NULL),(8,6,'W',NULL),(8,7,'W',NULL),(8,8,'W',NULL),(8,9,'W',NULL),(8,10,'W',NULL),(8,11,'W',NULL),(8,12,'W',NULL),(8,13,'W',NULL),(8,14,'W',NULL),(8,15,'W',NULL),(8,16,'W',NULL),(8,17,'W',NULL),(8,18,'W',NULL),(8,19,'W',NULL),(8,20,'W',NULL),(9,1,'W',NULL),(9,2,'W',NULL),(9,3,'W',NULL),(9,4,'W',NULL),(9,5,'W',NULL),(9,6,'W',NULL),(9,7,'W',NULL),(9,8,'W',NULL),(9,9,'W',NULL),(9,10,'W',NULL),(9,11,'W',NULL),(9,12,'W',NULL),(9,13,'W',NULL),(9,14,'W',NULL),(9,15,'W',NULL),(9,16,'W',NULL),(9,17,'W',NULL),(9,18,'W',NULL),(9,19,'W',NULL),(9,20,'W',NULL),(10,1,'W',NULL),(10,2,'W',NULL),(10,3,'W',NULL),(10,4,'W',NULL),(10,5,'W',NULL),(10,6,'W',NULL),(10,7,'W',NULL),(10,8,'W',NULL),(10,9,'W',NULL),(10,10,'W',NULL),(10,11,'W',NULL),(10,12,'W',NULL),(10,13,'W',NULL),(10,14,'W',NULL),(10,15,'W',NULL),(10,16,'W',NULL),(10,17,'W',NULL),(10,18,'W',NULL),(10,19,'W',NULL),(10,20,'W',NULL),(11,1,'W',NULL),(11,2,'W',NULL),(11,3,'W',NULL),(11,4,'W',NULL),(11,5,'W',NULL),(11,6,'W',NULL),(11,7,'W',NULL),(11,8,'W',NULL),(11,9,'W',NULL),(11,10,'W',NULL),(11,11,'W',NULL),(11,12,'W',NULL),(11,13,'W',NULL),(11,14,'W',NULL),(11,15,'W',NULL),(11,16,'W',NULL),(11,17,'W',NULL),(11,18,'W',NULL),(11,19,'W',NULL),(11,20,'W',NULL),(12,1,'W',NULL),(12,2,'W',NULL),(12,3,'W',NULL),(12,4,'W',NULL),(12,5,'W',NULL),(12,6,'W',NULL),(12,7,'W',NULL),(12,8,'W',NULL),(12,9,'W',NULL),(12,10,'W',NULL),(12,11,'W',NULL),(12,12,'W',NULL),(12,13,'W',NULL),(12,14,'W',NULL),(12,15,'W',NULL),(12,16,'W',NULL),(12,17,'W',NULL),(12,18,'W',NULL),(12,19,'W',NULL),(12,20,'W',NULL),(13,1,'W',NULL),(13,2,'W',NULL),(13,3,'W',NULL),(13,4,'W',NULL),(13,5,'W',NULL),(13,6,'W',NULL),(13,7,'W',NULL),(13,8,'W',NULL),(13,9,'W',NULL),(13,10,'W',NULL),(13,11,'W',NULL),(13,12,'W',NULL),(13,13,'W',NULL),(13,14,'W',NULL),(13,15,'W',NULL),(13,16,'W',NULL),(13,17,'W',NULL),(13,18,'W',NULL),(13,19,'W',NULL),(13,20,'W',NULL),(14,1,'W',NULL),(14,2,'W',NULL),(14,3,'W',NULL),(14,4,'W',NULL),(14,5,'W',NULL),(14,6,'W',NULL),(14,7,'W',NULL),(14,8,'W',NULL),(14,9,'W',NULL),(14,10,'W',NULL),(14,11,'W',NULL),(14,12,'W',NULL),(14,13,'W',NULL),(14,14,'W',NULL),(14,15,'W',NULL),(14,16,'W',NULL),(14,17,'W',NULL),(14,18,'W',NULL),(14,19,'W',NULL),(14,20,'W',NULL),(15,1,'W',NULL),(15,2,'W',NULL),(15,3,'W',NULL),(15,4,'W',NULL),(15,5,'W',NULL),(15,6,'W',NULL),(15,7,'W',NULL),(15,8,'W',NULL),(15,9,'W',NULL),(15,10,'W',NULL),(15,11,'W',NULL),(15,12,'W',NULL),(15,13,'W',NULL),(15,14,'W',NULL),(15,15,'W',NULL),(15,16,'W',NULL),(15,17,'W',NULL),(15,18,'W',NULL),(15,19,'W',NULL),(15,20,'W',NULL),(16,1,'W',NULL),(16,2,'W',NULL),(16,3,'W',NULL),(16,4,'W',NULL),(16,5,'W',NULL),(16,6,'W',NULL),(16,7,'W',NULL),(16,8,'W',NULL),(16,9,'W',NULL),(16,10,'W',NULL),(16,11,'W',NULL),(16,12,'W',NULL),(16,13,'W',NULL),(16,14,'W',NULL),(16,15,'W',NULL),(16,16,'W',NULL),(16,17,'W',NULL),(16,18,'W',NULL),(16,19,'W',NULL),(16,20,'W',NULL),(17,1,'W',NULL),(17,2,'W',NULL),(17,3,'W',NULL),(17,4,'W',NULL),(17,5,'W',NULL),(17,6,'W',NULL),(17,7,'W',NULL),(17,8,'W',NULL),(17,9,'W',NULL),(17,10,'W',NULL),(17,11,'W',NULL),(17,12,'W',NULL),(17,13,'W',NULL),(17,14,'W',NULL),(17,15,'W',NULL),(17,16,'W',NULL),(17,17,'W',NULL),(17,18,'W',NULL),(17,19,'W',NULL),(17,20,'W',NULL),(18,1,'W',NULL),(18,2,'W',NULL),(18,3,'W',NULL),(18,4,'W',NULL),(18,5,'W',NULL),(18,6,'W',NULL),(18,7,'W',NULL),(18,8,'W',NULL),(18,9,'W',NULL),(18,10,'W',NULL),(18,11,'W',NULL),(18,12,'W',NULL),(18,13,'W',NULL),(18,14,'W',NULL),(18,15,'W',NULL),(18,16,'W',NULL),(18,17,'W',NULL),(18,18,'W',NULL),(18,19,'W',NULL),(18,20,'W',NULL),(19,1,'W',NULL),(19,2,'W',NULL),(19,3,'W',NULL),(19,4,'W',NULL),(19,5,'W',NULL),(19,6,'W',NULL),(19,7,'W',NULL),(19,8,'W',NULL),(19,9,'W',NULL),(19,10,'W',NULL),(19,11,'W',NULL),(19,12,'W',NULL),(19,13,'W',NULL),(19,14,'W',NULL),(19,15,'W',NULL),(19,16,'W',NULL),(19,17,'W',NULL),(19,18,'W',NULL),(19,19,'W',NULL),(19,20,'W',NULL),(20,1,'W',NULL),(20,2,'W',NULL),(20,3,'W',NULL),(20,4,'W',NULL),(20,5,'W',NULL),(20,6,'W',NULL),(20,7,'W',NULL),(20,8,'W',NULL),(20,9,'W',NULL),(20,10,'W',NULL),(20,11,'W',NULL),(20,12,'W',NULL),(20,13,'W',NULL),(20,14,'W',NULL),(20,15,'W',NULL),(20,16,'W',NULL),(20,17,'W',NULL),(20,18,'W',NULL),(20,19,'W',NULL),(20,20,'W',NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_empty`
--

DROP TABLE IF EXISTS `board_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_empty` (
  `xA` tinyint(1) NOT NULL,
  `yA` tinyint(1) NOT NULL,
  `piece_color` enum('B','R','W') DEFAULT NULL,
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') DEFAULT NULL,
  PRIMARY KEY (`xA`,`yA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_empty`
--

LOCK TABLES `board_empty` WRITE;
/*!40000 ALTER TABLE `board_empty` DISABLE KEYS */;
INSERT INTO `board_empty` VALUES (1,1,'W',NULL),(1,2,'W',NULL),(1,3,'W',NULL),(1,4,'W',NULL),(1,5,'W',NULL),(1,6,'W',NULL),(1,7,'W',NULL),(1,8,'W',NULL),(1,9,'W',NULL),(1,10,'W',NULL),(1,11,'W',NULL),(1,12,'W',NULL),(1,13,'W',NULL),(1,14,'W',NULL),(1,15,'W',NULL),(1,16,'W',NULL),(1,17,'W',NULL),(1,18,'W',NULL),(1,19,'W',NULL),(1,20,'W',NULL),(2,1,'W',NULL),(2,2,'W',NULL),(2,3,'W',NULL),(2,4,'W',NULL),(2,5,'W',NULL),(2,6,'W',NULL),(2,7,'W',NULL),(2,8,'W',NULL),(2,9,'W',NULL),(2,10,'W',NULL),(2,11,'W',NULL),(2,12,'W',NULL),(2,13,'W',NULL),(2,14,'W',NULL),(2,15,'W',NULL),(2,16,'W',NULL),(2,17,'W',NULL),(2,18,'W',NULL),(2,19,'W',NULL),(2,20,'W',NULL),(3,1,'W',NULL),(3,2,'W',NULL),(3,3,'W',NULL),(3,4,'W',NULL),(3,5,'W',NULL),(3,6,'W',NULL),(3,7,'W',NULL),(3,8,'W',NULL),(3,9,'W',NULL),(3,10,'W',NULL),(3,11,'W',NULL),(3,12,'W',NULL),(3,13,'W',NULL),(3,14,'W',NULL),(3,15,'W',NULL),(3,16,'W',NULL),(3,17,'W',NULL),(3,18,'W',NULL),(3,19,'W',NULL),(3,20,'W',NULL),(4,1,'W',NULL),(4,2,'W',NULL),(4,3,'W',NULL),(4,4,'W',NULL),(4,5,'W',NULL),(4,6,'W',NULL),(4,7,'W',NULL),(4,8,'W',NULL),(4,9,'W',NULL),(4,10,'W',NULL),(4,11,'W',NULL),(4,12,'W',NULL),(4,13,'W',NULL),(4,14,'W',NULL),(4,15,'W',NULL),(4,16,'W',NULL),(4,17,'W',NULL),(4,18,'W',NULL),(4,19,'W',NULL),(4,20,'W',NULL),(5,1,'W',NULL),(5,2,'W',NULL),(5,3,'W',NULL),(5,4,'W',NULL),(5,5,'W',NULL),(5,6,'W',NULL),(5,7,'W',NULL),(5,8,'W',NULL),(5,9,'W',NULL),(5,10,'W',NULL),(5,11,'W',NULL),(5,12,'W',NULL),(5,13,'W',NULL),(5,14,'W',NULL),(5,15,'W',NULL),(5,16,'W',NULL),(5,17,'W',NULL),(5,18,'W',NULL),(5,19,'W',NULL),(5,20,'W',NULL),(6,1,'W',NULL),(6,2,'W',NULL),(6,3,'W',NULL),(6,4,'W',NULL),(6,5,'W',NULL),(6,6,'W',NULL),(6,7,'W',NULL),(6,8,'W',NULL),(6,9,'W',NULL),(6,10,'W',NULL),(6,11,'W',NULL),(6,12,'W',NULL),(6,13,'W',NULL),(6,14,'W',NULL),(6,15,'W',NULL),(6,16,'W',NULL),(6,17,'W',NULL),(6,18,'W',NULL),(6,19,'W',NULL),(6,20,'W',NULL),(7,1,'W',NULL),(7,2,'W',NULL),(7,3,'W',NULL),(7,4,'W',NULL),(7,5,'W',NULL),(7,6,'W',NULL),(7,7,'W',NULL),(7,8,'W',NULL),(7,9,'W',NULL),(7,10,'W',NULL),(7,11,'W',NULL),(7,12,'W',NULL),(7,13,'W',NULL),(7,14,'W',NULL),(7,15,'W',NULL),(7,16,'W',NULL),(7,17,'W',NULL),(7,18,'W',NULL),(7,19,'W',NULL),(7,20,'W',NULL),(8,1,'W',NULL),(8,2,'W',NULL),(8,3,'W',NULL),(8,4,'W',NULL),(8,5,'W',NULL),(8,6,'W',NULL),(8,7,'W',NULL),(8,8,'W',NULL),(8,9,'W',NULL),(8,10,'W',NULL),(8,11,'W',NULL),(8,12,'W',NULL),(8,13,'W',NULL),(8,14,'W',NULL),(8,15,'W',NULL),(8,16,'W',NULL),(8,17,'W',NULL),(8,18,'W',NULL),(8,19,'W',NULL),(8,20,'W',NULL),(9,1,'W',NULL),(9,2,'W',NULL),(9,3,'W',NULL),(9,4,'W',NULL),(9,5,'W',NULL),(9,6,'W',NULL),(9,7,'W',NULL),(9,8,'W',NULL),(9,9,'W',NULL),(9,10,'W',NULL),(9,11,'W',NULL),(9,12,'W',NULL),(9,13,'W',NULL),(9,14,'W',NULL),(9,15,'W',NULL),(9,16,'W',NULL),(9,17,'W',NULL),(9,18,'W',NULL),(9,19,'W',NULL),(9,20,'W',NULL),(10,1,'W',NULL),(10,2,'W',NULL),(10,3,'W',NULL),(10,4,'W',NULL),(10,5,'W',NULL),(10,6,'W',NULL),(10,7,'W',NULL),(10,8,'W',NULL),(10,9,'W',NULL),(10,10,'W',NULL),(10,11,'W',NULL),(10,12,'W',NULL),(10,13,'W',NULL),(10,14,'W',NULL),(10,15,'W',NULL),(10,16,'W',NULL),(10,17,'W',NULL),(10,18,'W',NULL),(10,19,'W',NULL),(10,20,'W',NULL),(11,1,'W',NULL),(11,2,'W',NULL),(11,3,'W',NULL),(11,4,'W',NULL),(11,5,'W',NULL),(11,6,'W',NULL),(11,7,'W',NULL),(11,8,'W',NULL),(11,9,'W',NULL),(11,10,'W',NULL),(11,11,'W',NULL),(11,12,'W',NULL),(11,13,'W',NULL),(11,14,'W',NULL),(11,15,'W',NULL),(11,16,'W',NULL),(11,17,'W',NULL),(11,18,'W',NULL),(11,19,'W',NULL),(11,20,'W',NULL),(12,1,'W',NULL),(12,2,'W',NULL),(12,3,'W',NULL),(12,4,'W',NULL),(12,5,'W',NULL),(12,6,'W',NULL),(12,7,'W',NULL),(12,8,'W',NULL),(12,9,'W',NULL),(12,10,'W',NULL),(12,11,'W',NULL),(12,12,'W',NULL),(12,13,'W',NULL),(12,14,'W',NULL),(12,15,'W',NULL),(12,16,'W',NULL),(12,17,'W',NULL),(12,18,'W',NULL),(12,19,'W',NULL),(12,20,'W',NULL),(13,1,'W',NULL),(13,2,'W',NULL),(13,3,'W',NULL),(13,4,'W',NULL),(13,5,'W',NULL),(13,6,'W',NULL),(13,7,'W',NULL),(13,8,'W',NULL),(13,9,'W',NULL),(13,10,'W',NULL),(13,11,'W',NULL),(13,12,'W',NULL),(13,13,'W',NULL),(13,14,'W',NULL),(13,15,'W',NULL),(13,16,'W',NULL),(13,17,'W',NULL),(13,18,'W',NULL),(13,19,'W',NULL),(13,20,'W',NULL),(14,1,'W',NULL),(14,2,'W',NULL),(14,3,'W',NULL),(14,4,'W',NULL),(14,5,'W',NULL),(14,6,'W',NULL),(14,7,'W',NULL),(14,8,'W',NULL),(14,9,'W',NULL),(14,10,'W',NULL),(14,11,'W',NULL),(14,12,'W',NULL),(14,13,'W',NULL),(14,14,'W',NULL),(14,15,'W',NULL),(14,16,'W',NULL),(14,17,'W',NULL),(14,18,'W',NULL),(14,19,'W',NULL),(14,20,'W',NULL),(15,1,'W',NULL),(15,2,'W',NULL),(15,3,'W',NULL),(15,4,'W',NULL),(15,5,'W',NULL),(15,6,'W',NULL),(15,7,'W',NULL),(15,8,'W',NULL),(15,9,'W',NULL),(15,10,'W',NULL),(15,11,'W',NULL),(15,12,'W',NULL),(15,13,'W',NULL),(15,14,'W',NULL),(15,15,'W',NULL),(15,16,'W',NULL),(15,17,'W',NULL),(15,18,'W',NULL),(15,19,'W',NULL),(15,20,'W',NULL),(16,1,'W',NULL),(16,2,'W',NULL),(16,3,'W',NULL),(16,4,'W',NULL),(16,5,'W',NULL),(16,6,'W',NULL),(16,7,'W',NULL),(16,8,'W',NULL),(16,9,'W',NULL),(16,10,'W',NULL),(16,11,'W',NULL),(16,12,'W',NULL),(16,13,'W',NULL),(16,14,'W',NULL),(16,15,'W',NULL),(16,16,'W',NULL),(16,17,'W',NULL),(16,18,'W',NULL),(16,19,'W',NULL),(16,20,'W',NULL),(17,1,'W',NULL),(17,2,'W',NULL),(17,3,'W',NULL),(17,4,'W',NULL),(17,5,'W',NULL),(17,6,'W',NULL),(17,7,'W',NULL),(17,8,'W',NULL),(17,9,'W',NULL),(17,10,'W',NULL),(17,11,'W',NULL),(17,12,'W',NULL),(17,13,'W',NULL),(17,14,'W',NULL),(17,15,'W',NULL),(17,16,'W',NULL),(17,17,'W',NULL),(17,18,'W',NULL),(17,19,'W',NULL),(17,20,'W',NULL),(18,1,'W',NULL),(18,2,'W',NULL),(18,3,'W',NULL),(18,4,'W',NULL),(18,5,'W',NULL),(18,6,'W',NULL),(18,7,'W',NULL),(18,8,'W',NULL),(18,9,'W',NULL),(18,10,'W',NULL),(18,11,'W',NULL),(18,12,'W',NULL),(18,13,'W',NULL),(18,14,'W',NULL),(18,15,'W',NULL),(18,16,'W',NULL),(18,17,'W',NULL),(18,18,'W',NULL),(18,19,'W',NULL),(18,20,'W',NULL),(19,1,'W',NULL),(19,2,'W',NULL),(19,3,'W',NULL),(19,4,'W',NULL),(19,5,'W',NULL),(19,6,'W',NULL),(19,7,'W',NULL),(19,8,'W',NULL),(19,9,'W',NULL),(19,10,'W',NULL),(19,11,'W',NULL),(19,12,'W',NULL),(19,13,'W',NULL),(19,14,'W',NULL),(19,15,'W',NULL),(19,16,'W',NULL),(19,17,'W',NULL),(19,18,'W',NULL),(19,19,'W',NULL),(19,20,'W',NULL),(20,1,'W',NULL),(20,2,'W',NULL),(20,3,'W',NULL),(20,4,'W',NULL),(20,5,'W',NULL),(20,6,'W',NULL),(20,7,'W',NULL),(20,8,'W',NULL),(20,9,'W',NULL),(20,10,'W',NULL),(20,11,'W',NULL),(20,12,'W',NULL),(20,13,'W',NULL),(20,14,'W',NULL),(20,15,'W',NULL),(20,16,'W',NULL),(20,17,'W',NULL),(20,18,'W',NULL),(20,19,'W',NULL),(20,20,'W',NULL);
/*!40000 ALTER TABLE `board_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `full_repositoryb`
--

DROP TABLE IF EXISTS `full_repositoryb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `full_repositoryb` (
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') NOT NULL,
  `val` enum('B','W') NOT NULL,
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `full_repositoryb`
--

LOCK TABLES `full_repositoryb` WRITE;
/*!40000 ALTER TABLE `full_repositoryb` DISABLE KEYS */;
INSERT INTO `full_repositoryb` VALUES ('A','B'),('B','B'),('C','B'),('D','B'),('E','B'),('F','B'),('G','B'),('H','B'),('I','B'),('J','B'),('K','B'),('L','B'),('M','B'),('N','B'),('O','B'),('P','B'),('Q','B'),('R','B'),('S','B'),('T','B'),('U','B');
/*!40000 ALTER TABLE `full_repositoryb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `full_repositoryr`
--

DROP TABLE IF EXISTS `full_repositoryr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `full_repositoryr` (
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') NOT NULL,
  `val` enum('R','W') NOT NULL,
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `full_repositoryr`
--

LOCK TABLES `full_repositoryr` WRITE;
/*!40000 ALTER TABLE `full_repositoryr` DISABLE KEYS */;
INSERT INTO `full_repositoryr` VALUES ('A','R'),('B','R'),('C','R'),('D','R'),('E','R'),('F','R'),('G','R'),('H','R'),('I','R'),('J','R'),('K','R'),('L','R'),('M','R'),('N','R'),('O','R'),('P','R'),('Q','R'),('R','R'),('S','R'),('T','R'),('U','R');
/*!40000 ALTER TABLE `full_repositoryr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
INSERT INTO `game_status` VALUES ('started','','D','2022-12-20 18:47:47');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','R') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (NULL,'B',NULL,NULL),(NULL,'R',NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `red_repository`
--

DROP TABLE IF EXISTS `red_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `red_repository` (
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') NOT NULL,
  `val` enum('R','W') NOT NULL,
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `red_repository`
--

LOCK TABLES `red_repository` WRITE;
/*!40000 ALTER TABLE `red_repository` DISABLE KEYS */;
INSERT INTO `red_repository` VALUES ('A','R'),('B','R'),('C','R'),('D','R'),('E','R'),('F','R'),('G','R'),('H','R'),('I','R'),('J','R'),('K','R'),('L','R'),('M','R'),('N','R'),('O','R'),('P','R'),('Q','R'),('R','R'),('S','R'),('T','R'),('U','R');
/*!40000 ALTER TABLE `red_repository` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-20 20:50:18
