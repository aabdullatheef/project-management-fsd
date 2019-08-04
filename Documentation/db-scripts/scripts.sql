-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: projectmanager
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `parent_tasks`
--

DROP TABLE IF EXISTS `parent_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_tasks` (
  `parent_task_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `parent_task_name` varchar(50) DEFAULT NULL,
  `project_id` bigint(10) NOT NULL,
  PRIMARY KEY (`parent_task_id`),
  KEY `FK_PARENT_TASKS` (`project_id`),
  CONSTRAINT `FK_PARENT_TASKS` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_tasks`
--

LOCK TABLES `parent_tasks` WRITE;
/*!40000 ALTER TABLE `parent_tasks` DISABLE KEYS */;
INSERT INTO `parent_tasks` VALUES (1,'pt create screens',1),(2,'pt design database scripts',2),(3,'pt raise clarifications',3),(4,'AGMS',4);
/*!40000 ALTER TABLE `parent_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) DEFAULT NULL,
  `start_date` varchar(10) DEFAULT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `priority` varchar(2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `manager_id` varchar(6) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_PROJECTS_MANAGER_ID` (`manager_id`),
  CONSTRAINT `FK_PROJECTS_MANAGER_ID` FOREIGN KEY (`manager_id`) REFERENCES `users` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'SOA','11/20/2018','11/30/2018','15','Completed','377248'),(2,'IAS','11/21/2018','11/29/2018','17','In-Progress','377248'),(3,'ITS Blue2','11/19/2018','11/29/2018','20','Completed','428398'),(4,'API Dev Factory','7/30/2019','12/31/2019','30','In-Progress','200000');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(50) DEFAULT NULL,
  `parent_task_id` bigint(10) DEFAULT NULL,
  `employee_id` varchar(6) NOT NULL,
  `start_date` varchar(10) DEFAULT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `priority` varchar(2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `project_id` bigint(10) NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_TASKS_PT` (`parent_task_id`),
  KEY `FK_TASKS_EI` (`employee_id`),
  KEY `FK_TASKS_PI` (`project_id`),
  CONSTRAINT `FK_TASKS_EI` FOREIGN KEY (`employee_id`) REFERENCES `users` (`employee_id`),
  CONSTRAINT `FK_TASKS_PI` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `FK_TASKS_PT` FOREIGN KEY (`parent_task_id`) REFERENCES `parent_tasks` (`parent_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (23,'generate report of tasks',1,'428398','11/01/2018','11/10/2018','15','A',1),(24,'complete the go perform',2,'377248','11/11/2018','11/12/2018','30','A',2),(25,'sent artifacts email',3,'428398','11/11/2018','11/13/2018','1','A',3),(27,'perform unit testing',NULL,'377248','11/17/2018','11/19/2018','26','A',1),(29,'Report 1',4,'451083','7/30/2019','8/10/2019','15','A',4);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `employee_id` varchar(6) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('100000','Afsheen','Abdul Latheef','A'),('121212','Smith','Steve','A'),('200000','Suhail','Abdul Latheef','A'),('377248','Nawap','Patel','A'),('404507','Rajesh','Adhikesavan','A'),('428398','Siraj','Mohammed','A'),('450000','Yasmin','B','A'),('451083','Abdul','Latheef','A');
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

-- Dump completed on 2019-08-04 22:28:17
