-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: tourismdatabase
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `agent_id` int DEFAULT NULL,
  `agent_fname` varchar(45) DEFAULT NULL,
  `agent_lname` varchar(45) DEFAULT NULL,
  `agent_contact` varchar(45) NOT NULL,
  `agent_email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Mike','Tyson','8291930866','miketyson@gmail.com'),(2,'John','Smith','9854251365','johnsmith@gmail.com'),(3,'Ron','Wilson','9854210356','ronwilson@gmail.com'),(4,'Ronald','Swanson','8542169877','ronaldswanson@gmail.com');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookedpackage`
--

DROP TABLE IF EXISTS `bookedpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookedpackage` (
  `customer_id` int DEFAULT NULL,
  `package_id` varchar(20) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `bookedpackage_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL,
  CONSTRAINT `bookedpackage_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookedpackage`
--

LOCK TABLES `bookedpackage` WRITE;
/*!40000 ALTER TABLE `bookedpackage` DISABLE KEYS */;
INSERT INTO `bookedpackage` VALUES (5,'P005','Short-Trip to Pune 3 Nights Festive Special'),(7,'P006','A Fun-Filled Break to Modern City '),(15,'P005','Short-Trip to Pune 3 Nights Festive Special'),(20,'P004','Short Break to Bustling Metropolis ');
/*!40000 ALTER TABLE `bookedpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` varchar(45) NOT NULL,
  `customer_id` varchar(45) DEFAULT NULL,
  `package_id` varchar(45) DEFAULT NULL,
  `hotel_id` varchar(45) DEFAULT NULL,
  `transportation_id` varchar(45) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `package_id` (`package_id`),
  KEY `booking_ibfk_4` (`hotel_id`),
  KEY `booking_ibfk_4_idx` (`transportation_id`),
  KEY `booking_ibfk_3_idx` (`customer_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`) ON DELETE SET NULL,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('B001','4','P007','H008','T001','2020-11-10'),('B002','10','P014','H021','T002','2020-09-11'),('B003','12','P004','H007','T003','2020-10-08'),('B004','5','P001',NULL,'T004','2020-10-09'),('B005','8','P014','H020','T005','2020-11-11'),('B006','1','P013','H018','T005','2020-12-05'),('B007','12','P002','H014','T004','2020-12-07'),('B008','13','P004','H011','T003','2020-12-07'),('B009','14','P008','H008','T001','2020-12-08'),('B010','7','P010','H009','T001','2020-12-10');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingconfirmed`
--

DROP TABLE IF EXISTS `bookingconfirmed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingconfirmed` (
  `customer_id` int DEFAULT NULL,
  `package_id` varchar(40) DEFAULT NULL,
  `hotel_id` varchar(40) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `transportation_id` varchar(20) DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `package_id` (`package_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `transportation_id` (`transportation_id`),
  CONSTRAINT `bookingconfirmed_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL,
  CONSTRAINT `bookingconfirmed_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`) ON DELETE SET NULL,
  CONSTRAINT `bookingconfirmed_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE SET NULL,
  CONSTRAINT `bookingconfirmed_ibfk_4` FOREIGN KEY (`transportation_id`) REFERENCES `transportation` (`transportation_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingconfirmed`
--

LOCK TABLES `bookingconfirmed` WRITE;
/*!40000 ALTER TABLE `bookingconfirmed` DISABLE KEYS */;
INSERT INTO `bookingconfirmed` VALUES (39,'P006','H010',NULL,'T003'),(40,'P010','H006',NULL,'T001');
/*!40000 ALTER TABLE `bookingconfirmed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(45) DEFAULT NULL,
  `customer_lname` varchar(45) DEFAULT NULL,
  `customer_contact` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_address` varchar(45) DEFAULT NULL,
  `number_of_members` int DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Jessica','Day','8291435866','jessicaday@gmail.com','Vashi, Mumbai',2,1),(2,'Nick','Miller','8642571359','nickmiller@gmail.com','Chembur, Mumbai',2,4),(3,'Winston','Bishop','8246358744','bishopwinston@gmail.com','Chembur, Mumbai',3,3),(4,'Cecelia','Parikh','9856425130','ceceparish@gmail.com','Bandra, Mumbai',4,2),(5,'Winston','Schmidth','8547263514','winstonschmidth@gmsil.com','Dadar, Mumbai',2,2),(6,'Aly','Nelson','8542135066','alynelson@gmail.com','Vashi, Mumbai',3,3),(7,'Jim','Halpert','8542154762','jimhalpert@gmail.com','Kurla, Mumbai',3,2),(8,'Pam','Beesly','9456214504','pambeesly@gmail.com','Chembur, Mumbai',4,2),(9,'Dwight','Shrute','9852462145','dwightshrute@gmail.com','Airoli, Mumbai',5,1),(11,'Jan ','Levinson','9856427151','janlevinson@gmail.com','BKC, Mumbai',5,3),(12,'Angela ','Kinsley','8542361544','angelakinsley@gmail.com','Vashi, Mumbai',3,1),(13,'Kelly','Kapoor','9856421543','kellykapoor@gmail.com','Chembur, Mumbai',2,2),(14,'Ryan ','Howard','8291930865','ryanhoward@gmail.com','Bandra, Mumbai',2,1),(15,'Karen','Filipelli','8524103654','karenfilipelli','Vashi, Mumabi',4,4),(16,'Andy','Bernard','9856421578','andybernard@gmail.com','Andheri, Mumbai',3,2),(17,'Creed','Braton','9854216357','creedbraton@gmail.com','BKC, Mumbai',2,2),(18,'Kevin','Malone','9854213564','kevinmalone@gmail.com','Vashi, Mumbai',3,4),(19,'Holly','Flax','8294531544','hollyflax@gmail.com','Andheri, Mumbai',5,4),(20,'Stanley','Hudson','8542136587','stanleyhudson@gmail.com','Vashi, Mumbai',4,3),(21,'Atharva','Nanavate','8452154785','atharvananavate@gmail.com','Vashi, Mumbai',5,1),(22,'Joey','Tribbiani','8542351399','joeytrib@gmail.com','Chembur, Mumbai',4,4),(23,'abc','abc','8542635122','abc@gmail.com','abcdef',4,1),(24,'agrsgdv','dbsde','535241','bdbb','bffbf',2,1),(25,'agwg','fhbna','654685','dfbnedt','the',5,1),(26,'egnjeyj','jtm,t.i','541531','yrltlkh.','hdglyl',5,1),(27,'Monica ','Geller','85420124769','monicageller@gmail.com','BKC, Mumbai',4,1),(28,'Janhavi','Patil','8625410235','patiljanhavi@gmail.com','Chembur,Mumbai',2,1),(29,'Thor','Odinson','9856324150','thorodinson@gmail.com','BKC, Mumbai',5,1),(30,'Loki','Odinson','5243615','loki@gmail.com','Powai, Mumbai',4,1),(31,'Himani','Patil','9865241350','himanipatil@gmail.com','Chembur, Mumbai',4,1),(32,'Ann ','Perkins','8542104563','annperkins@gmail.com','Kurla, Mumbai',5,1),(33,'Leslie','Knope','8542150355','lesknope@gmail.com','Powai, Mumbai',4,1),(34,'Ronald','Swanson','98521450122','ronswanson@gmail.com','Powai, Mumbai',4,1),(35,'Himani','Patil','8542150355','himanipatil10@gmail.com','Kurla, Mumbai',8,1),(36,'Tom','Haverford','8542105635','tomhaverford@gmail.com','BKC, Mumbai',5,1),(39,'Anushka','Kadam','8532104578','anushkakadam@gmail.com','Chembur, Mumbai',4,1),(40,'Andy','Dwyer','8542103569','andydwyer@gmail.com','BKC, Mumbai',2,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `my_trigger3` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN        INSERT INTO trigger_test VALUES('added new customer');    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_id` varchar(45) NOT NULL,
  `hotel_name` varchar(45) NOT NULL,
  `hotel_destination` varchar(45) DEFAULT NULL,
  `hotel_type` varchar(45) DEFAULT NULL,
  `hotel_cost` int NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('H001','Waterstones Hotel','Mumbai','5 star',5000),('H002','Taj Santacruz','Mumbai','5 star',4265),('H003','Taj Lands End','Mumbai','5 star',4855),('H004','Hotel Kohinoor Park','Mumbai','4 star',4120),('H005','Hotel Parklane','Mumbai','3 star',3214),('H006','Hotel Moutain Top','Manali','5 star',4215),('H007','Montana Blues Hotel','Manali','5 star',5241),('H008','Snow Valley Resorts','Manali','4 star',4215),('H009','The Orchard Greens','Manali','4 star',4321),('H010','Lemon Tree Premier','Pune','5 star',4521),('H011','Hotel Parc Estique','Pune','4 star',4219),('H012','Cocoon hotel','Pune','4 star',4289),('H013','Ramee Grand Hotel','Pune','3 star',3874),('H014','The Zen Ladakh','Leh','5 star',5245),('H015','Ladakh View Homestay','Leh','4 star',4165),('H016','Otsal Residency','Leh','4 star',4365),('H017','River Valley','Leh','4 star',2143),('H018','Vivanta','Bangalore','5 star',6524),('H019','Radisson Blue Atria','Bangalore','5 star',5784),('H020','Minla Hotel','Banglore','5 star',5689),('H021','The Signature Inn','Banglore','4 star',4756),('H022','Stayhome Classic','Banglore','3 star',4152),('H023','Udaan, woodberry Hotel','Sikkim','5 star',5421),('H024','The Golden Crest','Sikkim','4 star',4163),('H025','The Royal Heritage','Sikkim','4 star',4789),('H026','Denzong Shangrila','Sikkin','3 star',4521),('H030','fjtdkjtd','gmfky','5 star',5240),('H031','Gold Palace','Mumbai','5 star',4251),('H032','Hotel Horizon','Goa','5 star',2541);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','admin'),('agent','agent');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `package_id` varchar(45) NOT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `package_destination` varchar(45) DEFAULT NULL,
  `package_description` varchar(45) DEFAULT NULL,
  `number_of_days` varchar(45) DEFAULT NULL,
  `package_cost` int DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES ('P001','Captivating Ladakh','Leh','Customized holiday','3N/4D',7899),('P002','Magical Ladakh','Leh','Customized holiday','6N/7D',10365),('P003','Leh Ladakh Pangong Nubra','Leh','Group Tour','6N/7D',12052),('P004','Short Break to Bustling Metropolis ','Pune','Customized Tour','3N/4D',10254),('P005','Short-Trip to Pune 3 Nights Festive Special','Pune','Group Tour','3N/4D',12546),('P006','A Fun-Filled Break to Modern City ','Pune','Customized Holiday','4N/5D',18546),('P007','Retreat to Shimla, Manali & Chandigarh-Flight Inclusive Deal','Manali','Group Tour','6N/7D',11485),('P008','Long weekend in Manali','Manali','Customized Holiday','4N/5D',14526),('P010','Exotic weekend in Shimla','Manali','Customized Holiday','2N/3D',10254),('P011','White Mountains of Himachal -ex Chandigarh','Manali','Group Tour','7N/8D',16548),('P012','Radiant South','Bangalore','Group Tour','6N/7D',14645),('P013','Long Weekend Trip - Buzzing Bangalore and Charming Coorg','Bangalore','Customized Holiday','3N/4D',18007),('P014','Mysore Ooty Kodaikanal','Bangalore','Customized Holiday','5N/6D',13999),('P015','Vaishno Devi Tour','Jammu','Group Tour','3N/4D',20145),('P016','Explore Srinagar Beauty','Kashmir','Customized Holiday','5D/4N',12450),('P017','Go to Lonavala','Lonavala','Customized Holiday','3D/2N',5642),('P025','Magical Alibaug','Alibaug','Customized Holiday','2D/1N',5241),('P040','Go to Alibaug!','Alibaug','Customized Holiday','3D/2N',3524),('P041','Amazing Goa','Goa','Customized Holiday','3D/2N',5421);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportation` (
  `transportation_type` varchar(45) NOT NULL,
  `transportation_cost` int DEFAULT NULL,
  `departure` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `transportation_id` varchar(45) NOT NULL,
  PRIMARY KEY (`transportation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
INSERT INTO `transportation` VALUES ('Flight',4520,'Mumbai','Manali','T001'),('Flight',5210,'Mumbai','Bangalore','T002'),('Bus',400,'Mumbai','Pune','T003'),('Flight',5265,'Mumbai','Leh','T004'),('Bus',700,'Mumbai','Bangalore','T005'),('Train',954,'Mumbai','Bangalore','T006'),('Train',1254,'Mumbai','Leh','T007'),('Bus',854,'Mumbai','Leh','T008'),('Train',541,'Mumbai','Goa','T009');
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_test`
--

DROP TABLE IF EXISTS `trigger_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger_test` (
  `message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_test`
--

LOCK TABLES `trigger_test` WRITE;
/*!40000 ALTER TABLE `trigger_test` DISABLE KEYS */;
INSERT INTO `trigger_test` VALUES ('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer'),('added new customer');
/*!40000 ALTER TABLE `trigger_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 18:50:44
