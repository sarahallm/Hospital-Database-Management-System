-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_system
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `reason` varchar(50) NOT NULL,
  `pid` int NOT NULL,
  `did` int NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `pid` (`pid`),
  KEY `did` (`did`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2024-04-10','10:30:00','Checkup',1,1),(2,'2024-04-12','11:00:00','Skin Rash',2,2),(3,'2024-04-15','15:00:00','Flu Symptoms',3,3),(4,'2024-04-20','09:30:00','Headache',4,4);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `depId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `HeadDoctorID` int NOT NULL,
  PRIMARY KEY (`depId`),
  KEY `HeadDoctorID` (`HeadDoctorID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`HeadDoctorID`) REFERENCES `doctor` (`did`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Cardiology',1),(2,'Dermatology',2),(3,'Pediatrics',3),(4,'Neurology',4);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `did` int NOT NULL,
  `fname` varchar(50) NOT NULL,
  `minit` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `depId` int DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `FK_Doctor_Department` (`depId`),
  CONSTRAINT `FK_Doctor_Department` FOREIGN KEY (`depId`) REFERENCES `department` (`depId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Sara','B.','Hussein','Cardiology','Riyadh, Saudi Arabia','966 57 567 8901',1),(2,'Hind','Y.','Abdallah','Dermatology','Jeddah, Saudi Arabia','966 58 678 9012',2),(3,'Samira','L.','Khalid','Pediatrics','Dammam, Saudi Arabia','966 59 789 0123',3),(4,'Maha','F.','Saeed','Neurology','Mecca, Saudi Arabia','966 50 890 1234',4);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorschedule`
--

DROP TABLE IF EXISTS `doctorschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctorschedule` (
  `scheduleID` int NOT NULL AUTO_INCREMENT,
  `did` int NOT NULL,
  `day` enum('Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday') NOT NULL,
  `timeAvailable` varchar(20) NOT NULL,
  PRIMARY KEY (`scheduleID`),
  KEY `did` (`did`),
  CONSTRAINT `doctorschedule_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorschedule`
--

LOCK TABLES `doctorschedule` WRITE;
/*!40000 ALTER TABLE `doctorschedule` DISABLE KEYS */;
INSERT INTO `doctorschedule` VALUES (1,1,'Monday','09:00-12:00'),(2,2,'Wednesday','10:00-14:00'),(3,3,'Thursday','13:00-17:00'),(4,4,'Saturday','08:00-11:00');
/*!40000 ALTER TABLE `doctorschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `pid` int NOT NULL,
  `fname` varchar(50) NOT NULL,
  `minit` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bdate` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `medicalHistory` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Ahlam','M.','Ahmed','1990-05-12','Female','966 53 123 4567','Riyadh, Saudi Arabia','Diabetes'),(2,'Fatima','K.','Mohammed','1985-08-25','Female','966 54 234 5678','Jeddah, Saudi Arabia','Hypertension'),(3,'Nawal','H.','Osman','1998-03-17','Female','966 55 345 6789','Dammam, Saudi Arabia','Asthma'),(4,'Randa','A.','Hassan','1992-11-30','Female','966 56 456 7890','Mecca, Saudi Arabia','No known history');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `presId` int NOT NULL AUTO_INCREMENT,
  `medication` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `pid` int NOT NULL,
  `did` int NOT NULL,
  PRIMARY KEY (`presId`),
  KEY `pid` (`pid`),
  KEY `did` (`did`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'Metformin','500mg','2 weeks',1,1),(2,'Antihistamine','10mg','1 week',2,2),(3,'Salbutamol','100mcg','As needed',3,3),(4,'Paracetamol','500mg','5 days',4,4);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-23  7:37:56
