-- MySQL dump 10.13  Distrib 9.6.0, for macos15 (arm64)
--
-- Host: localhost    Database: sql_tutorial
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'cf45b744-53f8-11f1-8c41-a1a24881b0ee:1-78';

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`emp_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'研发',206),(2,'行政',207),(3,'资讯',208);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL,
  `client_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (400,'阿狗','254354335'),(401,'阿猫','25633899'),(402,'旺来','45354345'),(403,'露西','54354365'),(404,'艾瑞克','18783783');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `birth date` date DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `sup_id` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `branch_id` (`branch_id`),
  KEY `sup_id` (`sup_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`sup_id`) REFERENCES `employee` (`emp_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (206,'小黄','1998-10-08','F',50000,1,NULL),(207,'小绿','1985-09-16','M',29000,2,206),(208,'小黑','2000-12-19','M',35000,3,206),(209,'小白','1997-01-22','F',39000,3,207),(210,'小蓝','1925-11-10','F',84000,1,207);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'小白','历史'),(2,'小黑','生物'),(4,'小蓝','英语'),(5,NULL,'英语');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_2`
--

DROP TABLE IF EXISTS `student_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_2` (
  `student_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `major` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `major` (`major`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_2`
--

LOCK TABLES `student_2` WRITE;
/*!40000 ALTER TABLE `student_2` DISABLE KEYS */;
INSERT INTO `student_2` VALUES (1,'小白','英语'),(2,'小黑','历史'),(5,'小绿',NULL);
/*!40000 ALTER TABLE `student_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_3`
--

DROP TABLE IF EXISTS `student_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_3` (
  `student_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_3`
--

LOCK TABLES `student_3` WRITE;
/*!40000 ALTER TABLE `student_3` DISABLE KEYS */;
INSERT INTO `student_3` VALUES (2,'小黄','物理',90),(3,'小绿','物理',70);
/*!40000 ALTER TABLE `student_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_4`
--

DROP TABLE IF EXISTS `student_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_4` (
  `student_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_4`
--

LOCK TABLES `student_4` WRITE;
/*!40000 ALTER TABLE `student_4` DISABLE KEYS */;
INSERT INTO `student_4` VALUES (1,'小白','英语',50),(2,'小黄','生物',90),(3,'小绿','历史',70),(4,'小蓝','英语',80),(5,'小黑','化学',20);
/*!40000 ALTER TABLE `student_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_with`
--

DROP TABLE IF EXISTS `works_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_with` (
  `emp_id` int NOT NULL,
  `client_id` int NOT NULL,
  `total_sales` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`,`client_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `works_with_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE,
  CONSTRAINT `works_with_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_with`
--

LOCK TABLES `works_with` WRITE;
/*!40000 ALTER TABLE `works_with` DISABLE KEYS */;
INSERT INTO `works_with` VALUES (206,400,70000),(207,401,24000),(208,402,9800),(209,403,24000),(210,404,87940);
/*!40000 ALTER TABLE `works_with` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-20 22:11:21
