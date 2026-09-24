-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: hospital_management_system
-- ------------------------------------------------------
-- Server version	9.0.1
--
-- Requires MySQL 8.0.23 or newer (INVISIBLE columns; CHECK constraints are
-- enforced from 8.0.16).
--
-- Table names, visible column names and column order are unchanged, so the
-- Java code (positional INSERTs and SELECT *) keeps working as before.
-- Surrogate keys and audit timestamps are INVISIBLE columns: they are not
-- returned by SELECT * and are filled automatically by positional INSERTs.
--
-- Contents:
--   Tables     : Ambulance, department, EMP_INFO, login, Room, patient_info,
--                patient_discharge_log (audit history)
--   Constraints: PRIMARY KEY, UNIQUE, FOREIGN KEY, NOT NULL, CHECK, ENUM, DEFAULT
--   Indexes    : idx_room_availability, idx_patient_name, idx_log_discharged_at
--   Triggers   : room double-booking guard, automatic room status, discharge audit
--   Views      : v_patient_billing, v_room_status, v_room_occupancy_summary
--   Procedures : sp_admit_patient, sp_discharge_patient (transactional)
--   See DATABASE.md for the design notes.

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

DROP VIEW IF EXISTS `v_patient_billing`;
DROP VIEW IF EXISTS `v_room_status`;
DROP VIEW IF EXISTS `v_room_occupancy_summary`;
DROP TABLE IF EXISTS `patient_discharge_log`;

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
-- Emp_ID is an invisible surrogate primary key; the natural identifiers
-- (phone, email, Aadhar) are kept unique. Salary and Aadhar_Number stay as
-- text because the sample values are masked ('99xxxxx', '68xxxxxxx').
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
  `Emp_ID` int unsigned NOT NULL AUTO_INCREMENT /*!80023 INVISIBLE */,
  PRIMARY KEY (`Emp_ID`),
  UNIQUE KEY `uq_emp_phone` (`Phone_Number`),
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
-- One room_no is one bed, so a room holds at most one patient (enforced by
-- the triggers below).
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
  KEY `idx_room_availability` (`Availability`),
  CONSTRAINT `chk_room_price` CHECK (`Price` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES ('100','Occupied',500,'G Bed 1'),('101','Occupied',500,'G Bed 2'),('102','Occupied',500,'G Bed 3'),('103','Available',500,'G Bed 4'),('200','Occupied',1500,'Private Room'),('201','Occupied',1500,'Private Room'),('202','Occupied',1500,'Private Room'),('203','Occupied',1500,'Private Room'),('300','Available',3500,'ICU Bed 1'),('301','Available',3500,'ICU Bed 2'),('302','Available',3500,'ICU Bed 3'),('303','Available',3500,'ICU Bed 4'),('304','Available',3500,'ICU Bed 5'),('305','Available',3500,'ICU Bed 6');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_info`
--
-- Patient_ID is an invisible surrogate primary key; `Number` (the ID document
-- number, used by patient discharge) is a unique natural key. `Time` stays as
-- text because the app stores java.util.Date.toString(); Admitted_At keeps a
-- real DATETIME for sorting and date maths.
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
  `Patient_ID` int unsigned NOT NULL AUTO_INCREMENT /*!80023 INVISIBLE */,
  `Admitted_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP /*!80023 INVISIBLE */,
  `Updated_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP /*!80023 INVISIBLE */,
  PRIMARY KEY (`Patient_ID`),
  UNIQUE KEY `uq_patient_number` (`Number`),
  UNIQUE KEY `uq_patient_room` (`Room_Number`),
  KEY `idx_patient_name` (`Name`),
  CONSTRAINT `fk_patient_room` FOREIGN KEY (`Room_Number`) REFERENCES `Room` (`room_no`) ON UPDATE CASCADE ON DELETE RESTRICT,
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
INSERT INTO `patient_info` (`ID`,`Number`,`Name`,`Gender`,`Patient_Disease`,`Room_Number`,`Time`,`Deposite`,`Admitted_At`) VALUES ('Aadhar Card','99','Sumit','Male','Bimal','100','Sat Sep 28 00:34:15 IST 2024',9999,'2024-09-28 00:34:15'),('Aadhar Card','1212121212','Sumit','Male','fever','101','Sat Sep 28 02:51:53 IST 2024',500,'2024-09-28 02:51:53'),('Aadhar Card','1212121','Sumit','Male','fever','200','Sat Sep 28 02:51:53 IST 2024',500,'2024-09-28 02:51:53'),('Aadhar Card','12121212','Sumit','Male','Fever','202','Sat Sep 28 03:03:56 IST 2024',1500,'2024-09-28 03:03:56'),('Voter ID','9999','Bimal','Male','Fever','203','Sun Sep 29 02:19:37 IST 2024',500,'2024-09-29 02:19:37'),('Aadhar Card','999999','Sumon','Male','Fever','102','Sun Sep 29 23:30:48 IST 2024',500,'2024-09-29 23:30:48'),('Driving License','888','aaa','Male','dd','201','Tue Oct 08 11:42:19 IST 2024',5000,'2024-10-08 11:42:19');
/*!40000 ALTER TABLE `patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_discharge_log`
--
-- Audit history. Discharging deletes the row from patient_info, so a
-- trigger copies the patient and the final bill here first.
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_discharge_log` (
  `Log_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ID` enum('Aadhar Card','Voter ID','Driving License') NOT NULL,
  `Number` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Patient_Disease` varchar(100) NOT NULL,
  `Room_Number` varchar(10) NOT NULL,
  `Room_Price` int NOT NULL,
  `Deposite` int NOT NULL,
  `Pending_Amount` int NOT NULL,
  `Admitted_At` datetime NOT NULL,
  `Discharged_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Log_ID`),
  KEY `idx_log_number` (`Number`),
  KEY `idx_log_discharged_at` (`Discharged_At`),
  CONSTRAINT `fk_log_room` FOREIGN KEY (`Room_Number`) REFERENCES `Room` (`room_no`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `chk_log_dates` CHECK (`Discharged_At` >= `Admitted_At`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Views
--

-- Bill for each admitted patient: room price minus deposit paid.
CREATE VIEW `v_patient_billing` AS
SELECT p.`Number`, p.`Name`, p.`Room_Number`, r.`Room_type`, p.`Admitted_At`,
       r.`Price` AS `Room_Price`, p.`Deposite`,
       r.`Price` - p.`Deposite` AS `Pending_Amount`
FROM `patient_info` p
JOIN `Room` r ON r.`room_no` = p.`Room_Number`;

-- Every room with the patient in it, if any (LEFT JOIN keeps empty rooms).
CREATE VIEW `v_room_status` AS
SELECT r.`room_no`, r.`Room_type`, r.`Price`, r.`Availability`,
       p.`Name` AS `Patient_Name`, p.`Number` AS `Patient_Number`, p.`Admitted_At`
FROM `Room` r
LEFT JOIN `patient_info` p ON p.`Room_Number` = r.`room_no`;

-- Occupancy per ward, for a dashboard.
CREATE VIEW `v_room_occupancy_summary` AS
SELECT CASE
         WHEN r.`Room_type` LIKE 'G Bed%' THEN 'General Ward'
         WHEN r.`Room_type` LIKE 'ICU%' THEN 'ICU'
         ELSE r.`Room_type`
       END AS `Ward`,
       COUNT(*) AS `Total_Rooms`,
       SUM(r.`Availability` = 'Occupied') AS `Occupied`,
       SUM(r.`Availability` = 'Available') AS `Available`,
       ROUND(100 * SUM(r.`Availability` = 'Occupied') / COUNT(*), 1) AS `Occupancy_Percent`
FROM `Room` r
GROUP BY `Ward`;

--
-- Triggers and stored procedures
--
-- Created in strict mode so bad input raises an error instead of being
-- silently truncated.
--

SET SESSION SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP TRIGGER IF EXISTS `trg_patient_before_insert`;
DROP TRIGGER IF EXISTS `trg_patient_after_insert`;
DROP TRIGGER IF EXISTS `trg_patient_before_update`;
DROP TRIGGER IF EXISTS `trg_patient_after_update`;
DROP TRIGGER IF EXISTS `trg_patient_after_delete`;
DROP PROCEDURE IF EXISTS `sp_admit_patient`;
DROP PROCEDURE IF EXISTS `sp_discharge_patient`;

DELIMITER ;;

-- Block admitting a patient into a room that is already occupied.
-- Also stamp the timestamps: MySQL does not apply the CURRENT_TIMESTAMP
-- default of an INVISIBLE column when the INSERT has no column list (the
-- app's INSERT), leaving a zero date instead.
CREATE TRIGGER `trg_patient_before_insert` BEFORE INSERT ON `patient_info` FOR EACH ROW
BEGIN
  IF NEW.`Admitted_At` < '1000-01-01' THEN
    SET NEW.`Admitted_At` = NOW();
  END IF;
  IF NEW.`Updated_At` < '1000-01-01' THEN
    SET NEW.`Updated_At` = NOW();
  END IF;
  IF (SELECT `Availability` FROM `Room` WHERE `room_no` = NEW.`Room_Number`) = 'Occupied' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Room is already occupied';
  END IF;
END ;;

-- Mark the room as occupied once the patient is admitted.
CREATE TRIGGER `trg_patient_after_insert` AFTER INSERT ON `patient_info` FOR EACH ROW
BEGIN
  UPDATE `Room` SET `Availability` = 'Occupied' WHERE `room_no` = NEW.`Room_Number`;
END ;;

-- Block moving a patient into an occupied room.
CREATE TRIGGER `trg_patient_before_update` BEFORE UPDATE ON `patient_info` FOR EACH ROW
BEGIN
  IF NEW.`Room_Number` <> OLD.`Room_Number`
     AND (SELECT `Availability` FROM `Room` WHERE `room_no` = NEW.`Room_Number`) = 'Occupied' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Room is already occupied';
  END IF;
END ;;

-- When a patient changes room, free the old room and occupy the new one.
CREATE TRIGGER `trg_patient_after_update` AFTER UPDATE ON `patient_info` FOR EACH ROW
BEGIN
  IF NEW.`Room_Number` <> OLD.`Room_Number` THEN
    UPDATE `Room` SET `Availability` = 'Available' WHERE `room_no` = OLD.`Room_Number`;
    UPDATE `Room` SET `Availability` = 'Occupied' WHERE `room_no` = NEW.`Room_Number`;
  END IF;
END ;;

-- On discharge: keep a history record with the final bill and free the room.
CREATE TRIGGER `trg_patient_after_delete` AFTER DELETE ON `patient_info` FOR EACH ROW
BEGIN
  DECLARE v_price INT;
  SELECT `Price` INTO v_price FROM `Room` WHERE `room_no` = OLD.`Room_Number`;

  INSERT INTO `patient_discharge_log`
    (`ID`, `Number`, `Name`, `Gender`, `Patient_Disease`, `Room_Number`,
     `Room_Price`, `Deposite`, `Pending_Amount`, `Admitted_At`, `Discharged_At`)
  VALUES
    (OLD.`ID`, OLD.`Number`, OLD.`Name`, OLD.`Gender`, OLD.`Patient_Disease`, OLD.`Room_Number`,
     v_price, OLD.`Deposite`, v_price - OLD.`Deposite`, OLD.`Admitted_At`, GREATEST(NOW(), OLD.`Admitted_At`));

  UPDATE `Room` SET `Availability` = 'Available' WHERE `room_no` = OLD.`Room_Number`;
END ;;

-- Admit a patient in one transaction; the triggers handle the room status.
CREATE PROCEDURE `sp_admit_patient`(
  IN p_id_type VARCHAR(20),
  IN p_number VARCHAR(40),
  IN p_name VARCHAR(50),
  IN p_gender VARCHAR(10),
  IN p_disease VARCHAR(100),
  IN p_room VARCHAR(10),
  IN p_deposit INT)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;
  INSERT INTO `patient_info`
    (`ID`, `Number`, `Name`, `Gender`, `Patient_Disease`, `Room_Number`, `Time`, `Deposite`)
  VALUES
    (p_id_type, p_number, p_name, p_gender, p_disease, p_room,
     DATE_FORMAT(NOW(), '%a %b %d %H:%i:%s IST %Y'), p_deposit);
  COMMIT;

  SELECT * FROM `v_patient_billing` WHERE `Number` = p_number;
END ;;

-- Discharge a patient in one transaction and return the final bill.
CREATE PROCEDURE `sp_discharge_patient`(IN p_number VARCHAR(40))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;
  IF NOT EXISTS (SELECT 1 FROM `patient_info` WHERE `Number` = p_number FOR UPDATE) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Patient not found';
  END IF;
  DELETE FROM `patient_info` WHERE `Number` = p_number;
  COMMIT;

  SELECT * FROM `patient_discharge_log`
  WHERE `Number` = p_number
  ORDER BY `Log_ID` DESC
  LIMIT 1;
END ;;

DELIMITER ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 23:24:57
