-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: hospital_management_system
-- ------------------------------------------------------
-- Server version	9.0.1
--
-- Requires MySQL 8.0.16 or newer (CHECK constraints are enforced from 8.0.16).
--
-- Table names, column names and column order are unchanged so the Java code
-- (which uses positional INSERTs and SELECT *) keeps working as before.
-- Changes: proper data types, PRIMARY KEY / UNIQUE / NOT NULL / CHECK / ENUM
-- constraints, a FOREIGN KEY from patient_info to Room, and duplicate test
-- rows removed so the keys can be applied.

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

CREATE DATABASE IF NOT EXISTS `hospital_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `hospital_management_system`;

--
-- Table structure for table `Ambulance`
--

DROP TABLE IF EXISTS `Ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ambulance` (
  `Name` varchar(50) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Car_name` varchar(50) NOT NULL,
  `Available` enum('Available','Unavailable') NOT NULL DEFAULT 'Available',
  `Location` varchar(100) NOT NULL,
  PRIMARY KEY (`Name`),
  CONSTRAINT `chk_ambulance_name` CHECK (`Name` <> '')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ambulance`
--

LOCK TABLES `Ambulance` WRITE;
/*!40000 ALTER TABLE `Ambulance` DISABLE KEYS */;
INSERT INTO `Ambulance` VALUES ('AV','Male','ZEN','Available','Area 16'),('AX','Female','Maruti','Available','Area 12'),('BZ','Male','Honda','Unavailable','Area 5'),('CY','Female','Tata','Available','Area 9'),('DW','Male','Toyota','Unavailable','Area 21'),('EX','Female','Hyundai','Available','Area 7'),('FY','Male','Ford','Available','Area 14'),('GZ','Female','Mahindra','Unavailable','Area 3'),('HX','Male','Chevrolet','Available','Area 18'),('IJ','Female','Suzuki','Unavailable','Area 22');
/*!40000 ALTER TABLE `Ambulance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department` varchar(100) NOT NULL,
  `Phone_no` varchar(15) NOT NULL,
  PRIMARY KEY (`Department`),
  CONSTRAINT `chk_department_phone` CHECK (regexp_like(`Phone_no`,_utf8mb4'^[0-9]{6,15}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Urology Department','123456789'),('ENT (Otorhinolaryngology) Department','123456789'),('Endocrinology Department','123456789'),('Nephrology Department','123456789'),('Surgical Department','123456789'),('Nursing Department','123456789'),('Operation Theater Complex (OT)','123456789'),('Paramedical Department','123456789'),('Cardiology Department','123456789'),('Neurology Department','123456789'),('Pediatrics Department','123456789'),('Orthopedics Department','123456789');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP_INFO`
--
-- Salary and Aadhar_Number stay as text because the sample values are
-- masked ('99xxxxx', '68xxxxxxx').
--

DROP TABLE IF EXISTS `EMP_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP_INFO` (
  `Name` varchar(50) NOT NULL,
  `Age` tinyint unsigned NOT NULL,
  `Phone_Number` char(10) NOT NULL,
  `salary` varchar(20) NOT NULL,
  `Gmail` varchar(100) NOT NULL,
  `Aadhar_Number` varchar(12) NOT NULL,
  PRIMARY KEY (`Phone_Number`),
  UNIQUE KEY `uq_emp_gmail` (`Gmail`),
  UNIQUE KEY `uq_emp_aadhar` (`Aadhar_Number`),
  CONSTRAINT `chk_emp_name` CHECK (`Name` <> ''),
  CONSTRAINT `chk_emp_age` CHECK (`Age` between 18 and 100),
  CONSTRAINT `chk_emp_phone` CHECK (regexp_like(`Phone_Number`,_utf8mb4'^[0-9]{10}$')),
  CONSTRAINT `chk_emp_gmail` CHECK (`Gmail` like _utf8mb4'%_@_%._%')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP_INFO`
--

LOCK TABLES `EMP_INFO` WRITE;
/*!40000 ALTER TABLE `EMP_INFO` DISABLE KEYS */;
INSERT INTO `EMP_INFO` VALUES ('Doctor1',30,'9999999999','99xxxxx','doctor1@gmail.com','68xxxxxxx'),('Doctor2',35,'8888888888','98xxxxx','doctor2@gmail.com','78xxxxxxx'),('Nurse1',28,'7777777777','97xxxxx','nurse1@gmail.com','88xxxxxxx'),('Technician1',32,'6666666666','96xxxxx','tech1@gmail.com','89xxxxxxx'),('Admin1',40,'5555555555','95xxxxx','admin1@gmail.com','90xxxxxxx'),('Doctor3',45,'4444444444','94xxxxx','doctor3@gmail.com','91xxxxxxx'),('Nurse2',29,'3333333333','93xxxxx','nurse2@gmail.com','92xxxxxxx'),('Technician2',31,'2222222222','92xxxxx','tech2@gmail.com','93xxxxxxx'),('Admin2',42,'1111111111','91xxxxx','admin2@gmail.com','94xxxxxxx'),('Doctor4',50,'1234567890','90xxxxx','doctor4@gmail.com','95xxxxxxx'),('Nurse3',26,'2345678901','89xxxxx','nurse3@gmail.com','96xxxxxxx'),('Technician3',34,'3456789012','88xxxxx','tech3@gmail.com','97xxxxxxx');
/*!40000 ALTER TABLE `EMP_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `ID` varchar(50) NOT NULL,
  `PW` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `chk_login_id` CHECK (`ID` <> ''),
  CONSTRAINT `chk_login_pw` CHECK (`PW` <> '')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('Sumit','12345');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `room_no` varchar(10) NOT NULL,
  `Availability` enum('Available','Occupied') NOT NULL DEFAULT 'Available',
  `Price` int NOT NULL,
  `Room_type` varchar(50) NOT NULL,
  PRIMARY KEY (`room_no`),
  CONSTRAINT `chk_room_price` CHECK (`Price` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES ('100','Occupied',500,'G Bed 1'),('101','Available',500,'G Bed 2'),('102','Available',500,'G Bed 3'),('103','Available',500,'G Bed 4'),('200','Occupied',1500,'Private Room'),('201','Occupied',1500,'Private Room'),('202','Available',1500,'Private Room'),('203','Available',1500,'Private Room'),('300','Available',3500,'ICU Bed 1'),('301','Available',3500,'ICU Bed 2'),('302','Available',3500,'ICU Bed 3'),('303','Available',3500,'ICU Bed 4'),('304','Available',3500,'ICU Bed 5'),('305','Available',3500,'ICU Bed 6');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_info`
--
-- `Number` is the ID document number and is what patient discharge uses to
-- find a patient, so it is the primary key. `Time` stays as text because the
-- app stores java.util.Date.toString() (e.g. 'Sat Sep 28 00:34:15 IST 2024').
--

DROP TABLE IF EXISTS `patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_info` (
  `ID` enum('Aadhar Card','Voter ID','Driving License') NOT NULL,
  `Number` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Patient_Disease` varchar(100) NOT NULL,
  `Room_Number` varchar(10) NOT NULL,
  `Time` varchar(50) NOT NULL,
  `Deposite` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Number`),
  KEY `fk_patient_room` (`Room_Number`),
  CONSTRAINT `fk_patient_room` FOREIGN KEY (`Room_Number`) REFERENCES `Room` (`room_no`) ON UPDATE CASCADE,
  CONSTRAINT `chk_patient_number` CHECK (`Number` <> ''),
  CONSTRAINT `chk_patient_name` CHECK (`Name` <> ''),
  CONSTRAINT `chk_patient_disease` CHECK (`Patient_Disease` <> ''),
  CONSTRAINT `chk_patient_deposite` CHECK (`Deposite` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_info`
--

LOCK TABLES `patient_info` WRITE;
/*!40000 ALTER TABLE `patient_info` DISABLE KEYS */;
INSERT INTO `patient_info` VALUES ('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024',9999),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024',500),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024',500),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024',1500),('Voter ID','9999','Bimal','Male','Fever','200','Sun Sep 29 02:19:37 IST 2024',500),('Aadhar Card','999999','Sumon','Male','Fever','200','Sun Sep 29 23:30:48 IST 2024',500),('Driving License','888','aaa','Male','dd','201','Tue Oct 08 11:42:19 IST 2024',5000);
/*!40000 ALTER TABLE `patient_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 23:24:57
