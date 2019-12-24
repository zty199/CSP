-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: csp
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `confirm_list`
--

DROP TABLE IF EXISTS `confirm_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirm_list` (
  `stuID` char(12) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `IDnumber` char(18) DEFAULT NULL,
  PRIMARY KEY (`stuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirm_list`
--

LOCK TABLES `confirm_list` WRITE;
/*!40000 ALTER TABLE `confirm_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirm_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intention_list`
--

DROP TABLE IF EXISTS `intention_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intention_list` (
  `stuID` char(12) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `intention` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`stuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intention_list`
--

LOCK TABLES `intention_list` WRITE;
/*!40000 ALTER TABLE `intention_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `intention_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `jobID` varchar(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `grade` char(4) DEFAULT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('0000','0000','0000'),('2018','2018','2018'),('2019','2019','2019');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_overview`
--

DROP TABLE IF EXISTS `score_overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_overview` (
  `stuID` char(12) NOT NULL,
  `session` char(4) NOT NULL,
  `total_score` int(4) DEFAULT NULL,
  `score_1` int(4) DEFAULT NULL,
  `score_2` int(4) DEFAULT NULL,
  `score_3` int(4) DEFAULT NULL,
  `score_4` int(4) DEFAULT NULL,
  `score_5` int(4) DEFAULT NULL,
  `current_rank` varchar(10) DEFAULT NULL,
  `period_rank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`stuID`,`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_overview`
--

LOCK TABLES `score_overview` WRITE;
/*!40000 ALTER TABLE `score_overview` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_overview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_overview`
--

DROP TABLE IF EXISTS `stu_overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stu_overview` (
  `stuID` char(12) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `IDnumber` char(18) DEFAULT NULL,
  `grade` char(4) DEFAULT NULL,
  `public_free` tinyint(4) DEFAULT NULL,
  `used_qual` int(4) DEFAULT NULL,
  `score_qual` int(4) DEFAULT NULL,
  PRIMARY KEY (`stuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_overview`
--

LOCK TABLES `stu_overview` WRITE;
/*!40000 ALTER TABLE `stu_overview` DISABLE KEYS */;
/*!40000 ALTER TABLE `stu_overview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-24 21:59:35
