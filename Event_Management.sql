-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Event_Management
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` int(11) NOT NULL,
  `id_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger`
--

DROP TABLE IF EXISTS `event_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL CHECK (`status_level` in (1,2,3,4,5,6)),
  `prev_status_level` int(11) DEFAULT NULL CHECK (`prev_status_level` in (1,2,3,4,5,6)),
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `username` (`username`),
  CONSTRAINT `event_ledger_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger`
--

LOCK TABLES `event_ledger` WRITE;
/*!40000 ALTER TABLE `event_ledger` DISABLE KEYS */;
INSERT INTO `event_ledger` VALUES (1,'A1','sdfvs','aj10',1,1,'2018-08-10','2018-08-11'),(2,'A2','sdfvs','aj10',1,1,'2017-08-10','2017-08-11'),(3,'A3','sdfvs','aj10',1,1,'2016-08-10','2016-08-11'),(4,'A4','sdfvs','aj10',1,1,'2015-08-10','2015-08-11'),(5,'A5','sdfvs','aj10',1,1,'2014-08-10','2014-08-11'),(6,'P1','sad','ap',1,1,'2013-08-11','2013-08-12');
/*!40000 ALTER TABLE `event_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_rejected`
--

DROP TABLE IF EXISTS `event_rejected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_rejected` (
  `event_id` int(11) NOT NULL,
  `reason_for_rejection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL CHECK (`communication_flag` in (0,1,2)),
  KEY `fk4` (`event_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_rejected`
--

LOCK TABLES `event_rejected` WRITE;
/*!40000 ALTER TABLE `event_rejected` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_rejected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger`
--

DROP TABLE IF EXISTS `misc_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger` (
  `event_id` int(11) DEFAULT NULL,
  `request_number` int(11) NOT NULL,
  `requested_date` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_category` int(11) NOT NULL CHECK (`request_category` in (1,2,3,4,5)),
  KEY `event_id` (`event_id`),
  CONSTRAINT `misc_ledger_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger`
--

LOCK TABLES `misc_ledger` WRITE;
/*!40000 ALTER TABLE `misc_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('CSI',1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_rejected`
--

DROP TABLE IF EXISTS `resource_rejected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_rejected` (
  `id` int(11) DEFAULT NULL,
  `reason_for_rejection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `communication_no` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL CHECK (`communication_flag` in (0,1,2)),
  KEY `fk8` (`id`),
  CONSTRAINT `fk8` FOREIGN KEY (`id`) REFERENCES `slots_and_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_rejected`
--

LOCK TABLES `resource_rejected` WRITE;
/*!40000 ALTER TABLE `resource_rejected` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_rejected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `building` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_incharge_id` int(11) NOT NULL,
  `room_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_computers` int(11) NOT NULL,
  `projector_support` int(11) NOT NULL CHECK (`projector_support` in (0,1)),
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `unique_rooms` (`room_number`,`floor`,`building`),
  KEY `fk3` (`emp_incharge_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`emp_incharge_id`) REFERENCES `emp` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots_and_details`
--

DROP TABLE IF EXISTS `slots_and_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `slot_number` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status_level` int(11) NOT NULL CHECK (`status_level` in (1,2,3,4,5,6)),
  `prev_status_level` int(11) NOT NULL CHECK (`prev_status_level` in (1,2,3,4,5,6)),
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`room_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details`
--

LOCK TABLES `slots_and_details` WRITE;
/*!40000 ALTER TABLE `slots_and_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `slots_and_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` int(11) NOT NULL,
  `id_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_level` int(11) NOT NULL CHECK (`access_level` in (0,1,2,3,4,5)),
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `email_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL CHECK (`email_id` like '%@%.com'),
  PRIMARY KEY (`username`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aj10','aj10',1,'Atharva',1,'ayhu@.com'),('ap','ap',1,'Ayushi',1,'122@.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-26 19:55:01
