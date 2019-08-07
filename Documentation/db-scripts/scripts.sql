-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_tasks`
--

LOCK TABLES `parent_tasks` WRITE;
/*!40000 ALTER TABLE `parent_tasks` DISABLE KEYS */;
INSERT INTO `parent_tasks` VALUES (1,'pt create screens',1),(2,'pt design database scripts',2),(3,'pt raise clarifications',3),(4,'AGMS',4),(5,'Data API services',4),(6,'Upgrade to Node 8',1),(7,'Angular 8 upgrade',1),(8,'UI Components',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Market Place','07/01/2019','08/01/2019','15','Completed','377248'),(2,'DA Spec Extractor','08/01/2019','08/30/2019','17','In-Progress','377248'),(3,'API Store','07/01/2019','12/31/2019','20','Completed','428398'),(4,'API Dev Factory','7/30/2019','12/31/2019','30','In-Progress','200000'),(5,'Data Store','9/1/2019','12/31/2019','25','In-Progress','123123'),(6,'Add Project','9/1/2019','9/30/2019','8','In-Progress','100000'),(7,'React Application Development','10/1/2019','10/31/2019','3','In-Progress','212121');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (30,'Implement POST/GET call API',5,'200000','9/1/2019','9/30/2019','30','A',4),(31,'Process Ingestion',4,'450000','8/11/2019','8/31/2019','24','A',4),(32,'Report Generation',4,'121212','9/1/2019','9/30/2019','15','A',4),(33,'Install node8',6,'404507','8/27/2019','8/31/2019','15','C',1),(34,'Install angularcli 8',7,'100000','9/3/2019','9/14/2019','15','A',1),(35,'React components',8,'377248','1/1/2020','1/31/2020','20','A',7);
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
INSERT INTO `users` VALUES ('100000','Afsheen','Abdul Latheef','A'),('121212','Smith','Steve','A'),('123123','Smitha','Prasad','A'),('200000','Suhail','Abdul Latheef','A'),('212121','Test First Name','Last Name Test','A'),('377248','John','Mathew','A'),('404507','Alan','King','A'),('428398','Greg','Traugy','A'),('450000','Yasmin','B','A'),('451083','Abdul','Latheef','A'),('454545','afsdfdasdf','sdaf','A');
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

-- Dump completed on 2019-08-07 11:57:51
