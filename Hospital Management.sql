-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: hospital_management_system
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `Ambulance`
--

DROP TABLE IF EXISTS `Ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ambulance` (
  `Name` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Car_name` varchar(20) DEFAULT NULL,
  `Available` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ambulance`
--

LOCK TABLES `Ambulance` WRITE;
/*!40000 ALTER TABLE `Ambulance` DISABLE KEYS */;
INSERT INTO `Ambulance` VALUES ('av','Male','ZEN','Available','Area 16'),('AV','Male','ZEN','Available','Area 16'),('AX','Female','Maruti','Available','Area 12'),('BZ','Male','Honda','Unavailable','Area 5'),('CY','Female','Tata','Available','Area 9'),('DW','Male','Toyota','Unavailable','Area 21'),('EX','Female','Hyundai','Available','Area 7'),('FY','Male','Ford','Available','Area 14'),('GZ','Female','Mahindra','Unavailable','Area 3'),('HX','Male','Chevrolet','Available','Area 18'),('IJ','Female','Suzuki','Unavailable','Area 22');
/*!40000 ALTER TABLE `Ambulance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department` varchar(100) DEFAULT NULL,
  `Phone_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Urology Department','123456789'),('ENT (Otorhinolaryngology) Department','123456789'),('Endocrinology Department','123456789'),('Nephrology Department','123456789'),('Surgical Department','123456789'),('Nursing Department','123456789'),('Operation Theater Complex (ОТ)','123456789'),('Paramedical Department','123456789'),('Cardiology Department','123456789'),('Neuorology Department','123456789'),('Pediatrics Department','123456789'),('Orthopedics Department','123456789');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP_INFO`
--

DROP TABLE IF EXISTS `EMP_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP_INFO` (
  `Name` varchar(20) DEFAULT NULL,
  `Age` varchar(20) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `salary` varchar(20) DEFAULT NULL,
  `Gmail` varchar(20) DEFAULT NULL,
  `Aadhar_Number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP_INFO`
--

LOCK TABLES `EMP_INFO` WRITE;
/*!40000 ALTER TABLE `EMP_INFO` DISABLE KEYS */;
INSERT INTO `EMP_INFO` VALUES ('Doctor1','30','9999999999','99xxxxx','doctor1@gmail.com','68xxxxxxx'),('Doctor2','35','8888888888','98xxxxx','doctor2@gmail.com','78xxxxxxx'),('Nurse1','28','7777777777','97xxxxx','nurse1@gmail.com','88xxxxxxx'),('Technician1','32','6666666666','96xxxxx','tech1@gmail.com','89xxxxxxx'),('Admin1','40','5555555555','95xxxxx','admin1@gmail.com','90xxxxxxx'),('Doctor3','45','4444444444','94xxxxx','doctor3@gmail.com','91xxxxxxx'),('Nurse2','29','3333333333','93xxxxx','nurse2@gmail.com','92xxxxxxx'),('Technician2','31','2222222222','92xxxxx','tech2@gmail.com','93xxxxxxx'),('Admin2','42','1111111111','91xxxxx','admin2@gmail.com','94xxxxxxx'),('Doctor4','50','1234567890','90xxxxx','doctor4@gmail.com','95xxxxxxx'),('Nurse3','26','2345678901','89xxxxx','nurse3@gmail.com','96xxxxxxx'),('Technician3','34','3456789012','88xxxxx','tech3@gmail.com','97xxxxxxx');
/*!40000 ALTER TABLE `EMP_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `ID` varchar(20) DEFAULT NULL,
  `PW` varchar(20) DEFAULT NULL
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
-- Table structure for table `patient_info`
--

DROP TABLE IF EXISTS `patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_info` (
  `ID` varchar(20) DEFAULT NULL,
  `Number` varchar(40) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Patient_Disease` varchar(20) DEFAULT NULL,
  `Room_Number` varchar(20) DEFAULT NULL,
  `Time` varchar(100) DEFAULT NULL,
  `Deposite` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_info`
--

LOCK TABLES `patient_info` WRITE;
/*!40000 ALTER TABLE `patient_info` DISABLE KEYS */;
INSERT INTO `patient_info` VALUES ('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024','9999'),('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024','9999'),('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024','9999'),('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024','9999'),('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024','9999'),('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024','9999'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121212','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','100','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','1500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','1500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','1500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','1500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','1500'),('Aadhar Card','12121212','Sumit','Male','Fever','200','Sat Sep 28 03:03:56 IST 2024','1500'),('Aadhar Card','','','null','','200','Sun Sep 29 02:00:26 IST 2024','99'),('Voter ID','9999','Bimal','Male','Fever','200','Sun Sep 29 02:19:37 IST 2024','500'),('Aadhar Card','999999','Sumon','Male','Fever','200','Sun Sep 29 23:30:48 IST 2024','500'),('Driving License','888','aaa','Male','dd','201','Tue Oct 08 11:42:19 IST 2024','5000');
/*!40000 ALTER TABLE `patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `room_no` varchar(20) DEFAULT NULL,
  `Availability` varchar(20) DEFAULT NULL,
  `Price` varchar(20) DEFAULT NULL,
  `Room_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES ('100','Available','500','G Bed 1'),('101','Occupied','500','G Bed 2'),('102','Available','500','G Bed 3'),('103','Available','500','G Bed 4'),('200','Occupied','1500','Private Room'),('201','Occupied','1500','Private Room'),('202','Available','1500','Private Room'),('203','Available','1500','Private Room'),('300','Available','3500','ICU Bed 1'),('301','Available','3500','ICU Bed 2'),('302','Available','3500','ICU Bed 3'),('303','Available','3500','ICU Bed 4'),('304','Available','3500','ICU Bed 5'),('305','Available','3500','ICU Bed 6'),('100','Available','500','G Bed 1');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
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
