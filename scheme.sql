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
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blue_repository`
--

LOCK TABLES `blue_repository` WRITE;
/*!40000 ALTER TABLE `blue_repository` DISABLE KEYS */;
INSERT INTO `blue_repository` VALUES ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H'),('I'),('J'),('K'),('L'),('M'),('N'),('O'),('P'),('Q'),('R'),('S'),('T'),('U');
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
  `piece_color` enum('B','R') DEFAULT NULL,
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') DEFAULT NULL,
  PRIMARY KEY (`xA`,`yA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL),(1,5,NULL,NULL),(1,6,NULL,NULL),(1,7,NULL,NULL),(1,8,NULL,NULL),(1,9,NULL,NULL),(1,10,NULL,NULL),(1,11,NULL,NULL),(1,12,NULL,NULL),(1,13,NULL,NULL),(1,14,NULL,NULL),(1,15,NULL,NULL),(1,16,NULL,NULL),(1,17,NULL,NULL),(1,18,NULL,NULL),(1,19,NULL,NULL),(1,20,NULL,NULL),(2,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(2,9,NULL,NULL),(2,10,NULL,NULL),(2,11,NULL,NULL),(2,12,NULL,NULL),(2,13,NULL,NULL),(2,14,NULL,NULL),(2,15,NULL,NULL),(2,16,NULL,NULL),(2,17,NULL,NULL),(2,18,NULL,NULL),(2,19,NULL,NULL),(2,20,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(3,5,NULL,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(3,8,NULL,NULL),(3,9,NULL,NULL),(3,10,NULL,NULL),(3,11,NULL,NULL),(3,12,NULL,NULL),(3,13,NULL,NULL),(3,14,NULL,NULL),(3,15,NULL,NULL),(3,16,NULL,NULL),(3,17,NULL,NULL),(3,18,NULL,NULL),(3,19,NULL,NULL),(3,20,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,3,NULL,NULL),(4,4,NULL,NULL),(4,5,NULL,NULL),(4,6,NULL,NULL),(4,7,NULL,NULL),(4,8,NULL,NULL),(4,9,NULL,NULL),(4,10,NULL,NULL),(4,11,NULL,NULL),(4,12,NULL,NULL),(4,13,NULL,NULL),(4,14,NULL,NULL),(4,15,NULL,NULL),(4,16,NULL,NULL),(4,17,NULL,NULL),(4,18,NULL,NULL),(4,19,NULL,NULL),(4,20,NULL,NULL),(5,1,NULL,NULL),(5,2,NULL,NULL),(5,3,NULL,NULL),(5,4,NULL,NULL),(5,5,NULL,NULL),(5,6,NULL,NULL),(5,7,NULL,NULL),(5,8,NULL,NULL),(5,9,NULL,NULL),(5,10,NULL,NULL),(5,11,NULL,NULL),(5,12,NULL,NULL),(5,13,NULL,NULL),(5,14,NULL,NULL),(5,15,NULL,NULL),(5,16,NULL,NULL),(5,17,NULL,NULL),(5,18,NULL,NULL),(5,19,NULL,NULL),(5,20,NULL,NULL),(6,1,NULL,NULL),(6,2,NULL,NULL),(6,3,NULL,NULL),(6,4,NULL,NULL),(6,5,NULL,NULL),(6,6,NULL,NULL),(6,7,NULL,NULL),(6,8,NULL,NULL),(6,9,NULL,NULL),(6,10,NULL,NULL),(6,11,NULL,NULL),(6,12,NULL,NULL),(6,13,NULL,NULL),(6,14,NULL,NULL),(6,15,NULL,NULL),(6,16,NULL,NULL),(6,17,NULL,NULL),(6,18,NULL,NULL),(6,19,NULL,NULL),(6,20,NULL,NULL),(7,1,NULL,NULL),(7,2,NULL,NULL),(7,3,NULL,NULL),(7,4,NULL,NULL),(7,5,NULL,NULL),(7,6,NULL,NULL),(7,7,NULL,NULL),(7,8,NULL,NULL),(7,9,NULL,NULL),(7,10,NULL,NULL),(7,11,NULL,NULL),(7,12,NULL,NULL),(7,13,NULL,NULL),(7,14,NULL,NULL),(7,15,NULL,NULL),(7,16,NULL,NULL),(7,17,NULL,NULL),(7,18,NULL,NULL),(7,19,NULL,NULL),(7,20,NULL,NULL),(8,1,NULL,NULL),(8,2,NULL,NULL),(8,3,NULL,NULL),(8,4,NULL,NULL),(8,5,NULL,NULL),(8,6,NULL,NULL),(8,7,NULL,NULL),(8,8,NULL,NULL),(8,9,NULL,NULL),(8,10,NULL,NULL),(8,11,NULL,NULL),(8,12,NULL,NULL),(8,13,NULL,NULL),(8,14,NULL,NULL),(8,15,NULL,NULL),(8,16,NULL,NULL),(8,17,NULL,NULL),(8,18,NULL,NULL),(8,19,NULL,NULL),(8,20,NULL,NULL),(9,1,NULL,NULL),(9,2,NULL,NULL),(9,3,NULL,NULL),(9,4,NULL,NULL),(9,5,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(9,9,NULL,NULL),(9,10,NULL,NULL),(9,11,NULL,NULL),(9,12,NULL,NULL),(9,13,NULL,NULL),(9,14,NULL,NULL),(9,15,NULL,NULL),(9,16,NULL,NULL),(9,17,NULL,NULL),(9,18,NULL,NULL),(9,19,NULL,NULL),(9,20,NULL,NULL),(10,1,NULL,NULL),(10,2,NULL,NULL),(10,3,NULL,NULL),(10,4,NULL,NULL),(10,5,NULL,NULL),(10,6,NULL,NULL),(10,7,NULL,NULL),(10,8,NULL,NULL),(10,9,NULL,NULL),(10,10,NULL,NULL),(10,11,NULL,NULL),(10,12,NULL,NULL),(10,13,NULL,NULL),(10,14,NULL,NULL),(10,15,NULL,NULL),(10,16,NULL,NULL),(10,17,NULL,NULL),(10,18,NULL,NULL),(10,19,NULL,NULL),(10,20,NULL,NULL),(11,1,NULL,NULL),(11,2,NULL,NULL),(11,3,NULL,NULL),(11,4,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(11,8,NULL,NULL),(11,9,NULL,NULL),(11,10,NULL,NULL),(11,11,NULL,NULL),(11,12,NULL,NULL),(11,13,NULL,NULL),(11,14,NULL,NULL),(11,15,NULL,NULL),(11,16,NULL,NULL),(11,17,NULL,NULL),(11,18,NULL,NULL),(11,19,NULL,NULL),(11,20,NULL,NULL),(12,1,NULL,NULL),(12,2,NULL,NULL),(12,3,NULL,NULL),(12,4,NULL,NULL),(12,5,NULL,NULL),(12,6,NULL,NULL),(12,7,NULL,NULL),(12,8,NULL,NULL),(12,9,NULL,NULL),(12,10,NULL,NULL),(12,11,NULL,NULL),(12,12,NULL,NULL),(12,13,NULL,NULL),(12,14,NULL,NULL),(12,15,NULL,NULL),(12,16,NULL,NULL),(12,17,NULL,NULL),(12,18,NULL,NULL),(12,19,NULL,NULL),(12,20,NULL,NULL),(13,1,NULL,NULL),(13,2,NULL,NULL),(13,3,NULL,NULL),(13,4,NULL,NULL),(13,5,NULL,NULL),(13,6,NULL,NULL),(13,7,NULL,NULL),(13,8,NULL,NULL),(13,9,NULL,NULL),(13,10,NULL,NULL),(13,11,NULL,NULL),(13,12,NULL,NULL),(13,13,NULL,NULL),(13,14,NULL,NULL),(13,15,NULL,NULL),(13,16,NULL,NULL),(13,17,NULL,NULL),(13,18,NULL,NULL),(13,19,NULL,NULL),(13,20,NULL,NULL),(14,1,NULL,NULL),(14,2,NULL,NULL),(14,3,NULL,NULL),(14,4,NULL,NULL),(14,5,NULL,NULL),(14,6,NULL,NULL),(14,7,NULL,NULL),(14,8,NULL,NULL),(14,9,NULL,NULL),(14,10,NULL,NULL),(14,11,NULL,NULL),(14,12,NULL,NULL),(14,13,NULL,NULL),(14,14,NULL,NULL),(14,15,NULL,NULL),(14,16,NULL,NULL),(14,17,NULL,NULL),(14,18,NULL,NULL),(14,19,NULL,NULL),(14,20,NULL,NULL),(15,1,NULL,NULL),(15,2,NULL,NULL),(15,3,NULL,NULL),(15,4,NULL,NULL),(15,5,NULL,NULL),(15,6,NULL,NULL),(15,7,NULL,NULL),(15,8,NULL,NULL),(15,9,NULL,NULL),(15,10,NULL,NULL),(15,11,NULL,NULL),(15,12,NULL,NULL),(15,13,NULL,NULL),(15,14,NULL,NULL),(15,15,NULL,NULL),(15,16,NULL,NULL),(15,17,NULL,NULL),(15,18,NULL,NULL),(15,19,NULL,NULL),(15,20,NULL,NULL),(16,1,NULL,NULL),(16,2,NULL,NULL),(16,3,NULL,NULL),(16,4,NULL,NULL),(16,5,NULL,NULL),(16,6,NULL,NULL),(16,7,NULL,NULL),(16,8,NULL,NULL),(16,9,NULL,NULL),(16,10,NULL,NULL),(16,11,NULL,NULL),(16,12,NULL,NULL),(16,13,NULL,NULL),(16,14,NULL,NULL),(16,15,NULL,NULL),(16,16,NULL,NULL),(16,17,NULL,NULL),(16,18,NULL,NULL),(16,19,NULL,NULL),(16,20,NULL,NULL),(17,1,NULL,NULL),(17,2,NULL,NULL),(17,3,NULL,NULL),(17,4,NULL,NULL),(17,5,NULL,NULL),(17,6,NULL,NULL),(17,7,NULL,NULL),(17,8,NULL,NULL),(17,9,NULL,NULL),(17,10,NULL,NULL),(17,11,NULL,NULL),(17,12,NULL,NULL),(17,13,NULL,NULL),(17,14,NULL,NULL),(17,15,NULL,NULL),(17,16,NULL,NULL),(17,17,NULL,NULL),(17,18,NULL,NULL),(17,19,NULL,NULL),(17,20,NULL,NULL),(18,1,NULL,NULL),(18,2,NULL,NULL),(18,3,NULL,NULL),(18,4,NULL,NULL),(18,5,NULL,NULL),(18,6,NULL,NULL),(18,7,NULL,NULL),(18,8,NULL,NULL),(18,9,NULL,NULL),(18,10,NULL,NULL),(18,11,NULL,NULL),(18,12,NULL,NULL),(18,13,NULL,NULL),(18,14,NULL,NULL),(18,15,NULL,NULL),(18,16,NULL,NULL),(18,17,NULL,NULL),(18,18,NULL,NULL),(18,19,NULL,NULL),(18,20,NULL,NULL),(19,1,NULL,NULL),(19,2,NULL,NULL),(19,3,NULL,NULL),(19,4,NULL,NULL),(19,5,NULL,NULL),(19,6,NULL,NULL),(19,7,NULL,NULL),(19,8,NULL,NULL),(19,9,NULL,NULL),(19,10,NULL,NULL),(19,11,NULL,NULL),(19,12,NULL,NULL),(19,13,NULL,NULL),(19,14,NULL,NULL),(19,15,NULL,NULL),(19,16,NULL,NULL),(19,17,NULL,NULL),(19,18,NULL,NULL),(19,19,NULL,NULL),(19,20,NULL,NULL),(20,1,NULL,NULL),(20,2,NULL,NULL),(20,3,NULL,NULL),(20,4,NULL,NULL),(20,5,NULL,NULL),(20,6,NULL,NULL),(20,7,NULL,NULL),(20,8,NULL,NULL),(20,9,NULL,NULL),(20,10,NULL,NULL),(20,11,NULL,NULL),(20,12,NULL,NULL),(20,13,NULL,NULL),(20,14,NULL,NULL),(20,15,NULL,NULL),(20,16,NULL,NULL),(20,17,NULL,NULL),(20,18,NULL,NULL),(20,19,NULL,NULL),(20,20,NULL,NULL);
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
  `piece_color` enum('B','R') DEFAULT NULL,
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') DEFAULT NULL,
  PRIMARY KEY (`xA`,`yA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_empty`
--

LOCK TABLES `board_empty` WRITE;
/*!40000 ALTER TABLE `board_empty` DISABLE KEYS */;
INSERT INTO `board_empty` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL),(1,5,NULL,NULL),(1,6,NULL,NULL),(1,7,NULL,NULL),(1,8,NULL,NULL),(1,9,NULL,NULL),(1,10,NULL,NULL),(1,11,NULL,NULL),(1,12,NULL,NULL),(1,13,NULL,NULL),(1,14,NULL,NULL),(1,15,NULL,NULL),(1,16,NULL,NULL),(1,17,NULL,NULL),(1,18,NULL,NULL),(1,19,NULL,NULL),(1,20,NULL,NULL),(2,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(2,9,NULL,NULL),(2,10,NULL,NULL),(2,11,NULL,NULL),(2,12,NULL,NULL),(2,13,NULL,NULL),(2,14,NULL,NULL),(2,15,NULL,NULL),(2,16,NULL,NULL),(2,17,NULL,NULL),(2,18,NULL,NULL),(2,19,NULL,NULL),(2,20,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(3,5,NULL,NULL),(3,6,NULL,NULL),(3,7,NULL,NULL),(3,8,NULL,NULL),(3,9,NULL,NULL),(3,10,NULL,NULL),(3,11,NULL,NULL),(3,12,NULL,NULL),(3,13,NULL,NULL),(3,14,NULL,NULL),(3,15,NULL,NULL),(3,16,NULL,NULL),(3,17,NULL,NULL),(3,18,NULL,NULL),(3,19,NULL,NULL),(3,20,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,3,NULL,NULL),(4,4,NULL,NULL),(4,5,NULL,NULL),(4,6,NULL,NULL),(4,7,NULL,NULL),(4,8,NULL,NULL),(4,9,NULL,NULL),(4,10,NULL,NULL),(4,11,NULL,NULL),(4,12,NULL,NULL),(4,13,NULL,NULL),(4,14,NULL,NULL),(4,15,NULL,NULL),(4,16,NULL,NULL),(4,17,NULL,NULL),(4,18,NULL,NULL),(4,19,NULL,NULL),(4,20,NULL,NULL),(5,1,NULL,NULL),(5,2,NULL,NULL),(5,3,NULL,NULL),(5,4,NULL,NULL),(5,5,NULL,NULL),(5,6,NULL,NULL),(5,7,NULL,NULL),(5,8,NULL,NULL),(5,9,NULL,NULL),(5,10,NULL,NULL),(5,11,NULL,NULL),(5,12,NULL,NULL),(5,13,NULL,NULL),(5,14,NULL,NULL),(5,15,NULL,NULL),(5,16,NULL,NULL),(5,17,NULL,NULL),(5,18,NULL,NULL),(5,19,NULL,NULL),(5,20,NULL,NULL),(6,1,NULL,NULL),(6,2,NULL,NULL),(6,3,NULL,NULL),(6,4,NULL,NULL),(6,5,NULL,NULL),(6,6,NULL,NULL),(6,7,NULL,NULL),(6,8,NULL,NULL),(6,9,NULL,NULL),(6,10,NULL,NULL),(6,11,NULL,NULL),(6,12,NULL,NULL),(6,13,NULL,NULL),(6,14,NULL,NULL),(6,15,NULL,NULL),(6,16,NULL,NULL),(6,17,NULL,NULL),(6,18,NULL,NULL),(6,19,NULL,NULL),(6,20,NULL,NULL),(7,1,NULL,NULL),(7,2,NULL,NULL),(7,3,NULL,NULL),(7,4,NULL,NULL),(7,5,NULL,NULL),(7,6,NULL,NULL),(7,7,NULL,NULL),(7,8,NULL,NULL),(7,9,NULL,NULL),(7,10,NULL,NULL),(7,11,NULL,NULL),(7,12,NULL,NULL),(7,13,NULL,NULL),(7,14,NULL,NULL),(7,15,NULL,NULL),(7,16,NULL,NULL),(7,17,NULL,NULL),(7,18,NULL,NULL),(7,19,NULL,NULL),(7,20,NULL,NULL),(8,1,NULL,NULL),(8,2,NULL,NULL),(8,3,NULL,NULL),(8,4,NULL,NULL),(8,5,NULL,NULL),(8,6,NULL,NULL),(8,7,NULL,NULL),(8,8,NULL,NULL),(8,9,NULL,NULL),(8,10,NULL,NULL),(8,11,NULL,NULL),(8,12,NULL,NULL),(8,13,NULL,NULL),(8,14,NULL,NULL),(8,15,NULL,NULL),(8,16,NULL,NULL),(8,17,NULL,NULL),(8,18,NULL,NULL),(8,19,NULL,NULL),(8,20,NULL,NULL),(9,1,NULL,NULL),(9,2,NULL,NULL),(9,3,NULL,NULL),(9,4,NULL,NULL),(9,5,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(9,9,NULL,NULL),(9,10,NULL,NULL),(9,11,NULL,NULL),(9,12,NULL,NULL),(9,13,NULL,NULL),(9,14,NULL,NULL),(9,15,NULL,NULL),(9,16,NULL,NULL),(9,17,NULL,NULL),(9,18,NULL,NULL),(9,19,NULL,NULL),(9,20,NULL,NULL),(10,1,NULL,NULL),(10,2,NULL,NULL),(10,3,NULL,NULL),(10,4,NULL,NULL),(10,5,NULL,NULL),(10,6,NULL,NULL),(10,7,NULL,NULL),(10,8,NULL,NULL),(10,9,NULL,NULL),(10,10,NULL,NULL),(10,11,NULL,NULL),(10,12,NULL,NULL),(10,13,NULL,NULL),(10,14,NULL,NULL),(10,15,NULL,NULL),(10,16,NULL,NULL),(10,17,NULL,NULL),(10,18,NULL,NULL),(10,19,NULL,NULL),(10,20,NULL,NULL),(11,1,NULL,NULL),(11,2,NULL,NULL),(11,3,NULL,NULL),(11,4,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(11,8,NULL,NULL),(11,9,NULL,NULL),(11,10,NULL,NULL),(11,11,NULL,NULL),(11,12,NULL,NULL),(11,13,NULL,NULL),(11,14,NULL,NULL),(11,15,NULL,NULL),(11,16,NULL,NULL),(11,17,NULL,NULL),(11,18,NULL,NULL),(11,19,NULL,NULL),(11,20,NULL,NULL),(12,1,NULL,NULL),(12,2,NULL,NULL),(12,3,NULL,NULL),(12,4,NULL,NULL),(12,5,NULL,NULL),(12,6,NULL,NULL),(12,7,NULL,NULL),(12,8,NULL,NULL),(12,9,NULL,NULL),(12,10,NULL,NULL),(12,11,NULL,NULL),(12,12,NULL,NULL),(12,13,NULL,NULL),(12,14,NULL,NULL),(12,15,NULL,NULL),(12,16,NULL,NULL),(12,17,NULL,NULL),(12,18,NULL,NULL),(12,19,NULL,NULL),(12,20,NULL,NULL),(13,1,NULL,NULL),(13,2,NULL,NULL),(13,3,NULL,NULL),(13,4,NULL,NULL),(13,5,NULL,NULL),(13,6,NULL,NULL),(13,7,NULL,NULL),(13,8,NULL,NULL),(13,9,NULL,NULL),(13,10,NULL,NULL),(13,11,NULL,NULL),(13,12,NULL,NULL),(13,13,NULL,NULL),(13,14,NULL,NULL),(13,15,NULL,NULL),(13,16,NULL,NULL),(13,17,NULL,NULL),(13,18,NULL,NULL),(13,19,NULL,NULL),(13,20,NULL,NULL),(14,1,NULL,NULL),(14,2,NULL,NULL),(14,3,NULL,NULL),(14,4,NULL,NULL),(14,5,NULL,NULL),(14,6,NULL,NULL),(14,7,NULL,NULL),(14,8,NULL,NULL),(14,9,NULL,NULL),(14,10,NULL,NULL),(14,11,NULL,NULL),(14,12,NULL,NULL),(14,13,NULL,NULL),(14,14,NULL,NULL),(14,15,NULL,NULL),(14,16,NULL,NULL),(14,17,NULL,NULL),(14,18,NULL,NULL),(14,19,NULL,NULL),(14,20,NULL,NULL),(15,1,NULL,NULL),(15,2,NULL,NULL),(15,3,NULL,NULL),(15,4,NULL,NULL),(15,5,NULL,NULL),(15,6,NULL,NULL),(15,7,NULL,NULL),(15,8,NULL,NULL),(15,9,NULL,NULL),(15,10,NULL,NULL),(15,11,NULL,NULL),(15,12,NULL,NULL),(15,13,NULL,NULL),(15,14,NULL,NULL),(15,15,NULL,NULL),(15,16,NULL,NULL),(15,17,NULL,NULL),(15,18,NULL,NULL),(15,19,NULL,NULL),(15,20,NULL,NULL),(16,1,NULL,NULL),(16,2,NULL,NULL),(16,3,NULL,NULL),(16,4,NULL,NULL),(16,5,NULL,NULL),(16,6,NULL,NULL),(16,7,NULL,NULL),(16,8,NULL,NULL),(16,9,NULL,NULL),(16,10,NULL,NULL),(16,11,NULL,NULL),(16,12,NULL,NULL),(16,13,NULL,NULL),(16,14,NULL,NULL),(16,15,NULL,NULL),(16,16,NULL,NULL),(16,17,NULL,NULL),(16,18,NULL,NULL),(16,19,NULL,NULL),(16,20,NULL,NULL),(17,1,NULL,NULL),(17,2,NULL,NULL),(17,3,NULL,NULL),(17,4,NULL,NULL),(17,5,NULL,NULL),(17,6,NULL,NULL),(17,7,NULL,NULL),(17,8,NULL,NULL),(17,9,NULL,NULL),(17,10,NULL,NULL),(17,11,NULL,NULL),(17,12,NULL,NULL),(17,13,NULL,NULL),(17,14,NULL,NULL),(17,15,NULL,NULL),(17,16,NULL,NULL),(17,17,NULL,NULL),(17,18,NULL,NULL),(17,19,NULL,NULL),(17,20,NULL,NULL),(18,1,NULL,NULL),(18,2,NULL,NULL),(18,3,NULL,NULL),(18,4,NULL,NULL),(18,5,NULL,NULL),(18,6,NULL,NULL),(18,7,NULL,NULL),(18,8,NULL,NULL),(18,9,NULL,NULL),(18,10,NULL,NULL),(18,11,NULL,NULL),(18,12,NULL,NULL),(18,13,NULL,NULL),(18,14,NULL,NULL),(18,15,NULL,NULL),(18,16,NULL,NULL),(18,17,NULL,NULL),(18,18,NULL,NULL),(18,19,NULL,NULL),(18,20,NULL,NULL),(19,1,NULL,NULL),(19,2,NULL,NULL),(19,3,NULL,NULL),(19,4,NULL,NULL),(19,5,NULL,NULL),(19,6,NULL,NULL),(19,7,NULL,NULL),(19,8,NULL,NULL),(19,9,NULL,NULL),(19,10,NULL,NULL),(19,11,NULL,NULL),(19,12,NULL,NULL),(19,13,NULL,NULL),(19,14,NULL,NULL),(19,15,NULL,NULL),(19,16,NULL,NULL),(19,17,NULL,NULL),(19,18,NULL,NULL),(19,19,NULL,NULL),(19,20,NULL,NULL),(20,1,NULL,NULL),(20,2,NULL,NULL),(20,3,NULL,NULL),(20,4,NULL,NULL),(20,5,NULL,NULL),(20,6,NULL,NULL),(20,7,NULL,NULL),(20,8,NULL,NULL),(20,9,NULL,NULL),(20,10,NULL,NULL),(20,11,NULL,NULL),(20,12,NULL,NULL),(20,13,NULL,NULL),(20,14,NULL,NULL),(20,15,NULL,NULL),(20,16,NULL,NULL),(20,17,NULL,NULL),(20,18,NULL,NULL),(20,19,NULL,NULL),(20,20,NULL,NULL);
/*!40000 ALTER TABLE `board_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `full_repository`
--

DROP TABLE IF EXISTS `full_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `full_repository` (
  `piece_shape` enum('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U') NOT NULL,
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `full_repository`
--

LOCK TABLES `full_repository` WRITE;
/*!40000 ALTER TABLE `full_repository` DISABLE KEYS */;
INSERT INTO `full_repository` VALUES ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H'),('I'),('J'),('K'),('L'),('M'),('N'),('O'),('P'),('Q'),('R'),('S'),('T'),('U');
/*!40000 ALTER TABLE `full_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('B','R') DEFAULT NULL,
  `result` enum('B','R','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
INSERT INTO `game_status` VALUES ('not active',NULL,NULL,'2022-12-09 18:00:00');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER game_status_update BEFORE UPDATE ON game_status FOR EACH ROW BEGIN
SET NEW.last_change=NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `last_action` timestamp NULL DEFAULT NULL,
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
  PRIMARY KEY (`piece_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `red_repository`
--

LOCK TABLES `red_repository` WRITE;
/*!40000 ALTER TABLE `red_repository` DISABLE KEYS */;
INSERT INTO `red_repository` VALUES ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H'),('I'),('J'),('K'),('L'),('M'),('N'),('O'),('P'),('Q'),('R'),('S'),('T'),('U');
/*!40000 ALTER TABLE `red_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'erg'
--

--
-- Dumping routines for database 'erg'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clean_board` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board`()
BEGIN
    REPLACE INTO board SELECT * FROM board_empty;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `full_repositories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `full_repositories`()
BEGIN
	REPLACE INTO blue_repository SELECT * FROM full_repository;
    REPLACE INTO red_repository SELECT * FROM full_repository;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `move_piece` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece`(p_color char, piece char)
BEGIN

if(p_color='B') then
	UPDATE blue_repository SET piece_shape=NULL WHERE piece_shape=piece;
else 
	UPDATE red_repository SET piece_shape=NULL WHERE piece_shape=piece;
end if;

UPDATE game_status SET p_turn=if(p_color='B','R','B');	

END ;;
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

-- Dump completed on 2022-12-09  3:11:51
