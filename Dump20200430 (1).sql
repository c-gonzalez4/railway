-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: railway system
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'87 Madison road','Teaneck','NJ'),(2,'94 Euclid avenue','Paramus','NJ'),(3,'437 Kale Circle','Woodridge','NJ'),(4,'89 John Street ','Fort Lee','NJ');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'123 Rainbow Lane','Hackensack','NJ'),(2,'34 Yellow Road','North Bergen','NJ'),(3,'89 Cool Street ','Newark','NJ'),(4,'221 Amber Lane','Jersey City','NJ'),(5,'78 Washington Avenue','Hoboken','NJ'),(6,'89 Broad Avenue','Manhattan','NY');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`PassengerID`),
  KEY `fk_Passenger_Passenger Address_idx` (`AddressID`),
  CONSTRAINT `fk_Passenger_Passenger Address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Carolina','Gonzalez',22,1),(2,'Tom','Rivers',48,2),(3,'Mary','Rivers',78,2),(4,'Nicole','Kirk',30,3),(5,'Amy ','Gomez',39,4);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `RouteID` int NOT NULL,
  `RouteName` varchar(45) NOT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Star'),(2,'Square'),(3,'Magic'),(4,'Alpha');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `ArrivalTime` varchar(45) NOT NULL,
  `DepartureTime` varchar(45) NOT NULL,
  `CurrentDate` varchar(45) NOT NULL,
  `StationID` int NOT NULL,
  `TrainID` int NOT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `fk_Schedule_Station1_idx` (`StationID`),
  KEY `fk_Schedule_Train1_idx` (`TrainID`),
  CONSTRAINT `fk_Schedule_Station1` FOREIGN KEY (`StationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `fk_Schedule_Train1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'12:00pm','12:05pm','04/21/2020',1,2),(2,'1:00pm','1:05pm','04/21/2020',2,2),(3,'2:00pm','2:05pm','04/21/2020',3,2),(4,'6:00pm','6:05pm','04/21/2020',4,1),(5,'7:00pm','7:05pm','04/21/2020',1,1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `StationID` int NOT NULL AUTO_INCREMENT,
  `StationName` varchar(45) NOT NULL,
  `LocationID` int NOT NULL,
  PRIMARY KEY (`StationID`),
  KEY `fk_Station_Location1_idx` (`LocationID`),
  CONSTRAINT `fk_Station_Location1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Magic',1),(2,'Kennedy ',2),(3,'Adams',3),(4,'Barney',4),(5,'Eve',5),(6,'Scarlet',6),(7,'Peanut',6),(8,'Musical ',1);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station order`
--

DROP TABLE IF EXISTS `station order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station order` (
  `OrderID` int NOT NULL,
  `StationOrder` int NOT NULL,
  `RouteID` int NOT NULL,
  `StationID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Station Order_Route1_idx` (`RouteID`),
  KEY `fk_Station Order_Station1_idx` (`StationID`),
  CONSTRAINT `fk_Station Order_Route1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`),
  CONSTRAINT `fk_Station Order_Station1` FOREIGN KEY (`StationID`) REFERENCES `station` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station order`
--

LOCK TABLES `station order` WRITE;
/*!40000 ALTER TABLE `station order` DISABLE KEYS */;
INSERT INTO `station order` VALUES (1,3,1,1),(2,1,1,3),(3,2,1,2),(4,1,3,4),(5,2,3,1);
/*!40000 ALTER TABLE `station order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` int NOT NULL,
  `Seat` varchar(45) NOT NULL,
  `Price` varchar(45) NOT NULL,
  `ScheduleID` int NOT NULL,
  `PassengerID` int NOT NULL,
  PRIMARY KEY (`TicketID`,`ScheduleID`),
  KEY `fk_Ticket_Schedule1_idx` (`ScheduleID`),
  KEY `fk_Ticket_Passenger1_idx` (`PassengerID`),
  CONSTRAINT `fk_Ticket_Passenger1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `fk_Ticket_Schedule1` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'34','$12',1,1),(2,'11','$12',2,2),(3,'10','$10',2,3),(4,'15','$15',4,4);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `TrainID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `NumberofSeats` int NOT NULL,
  PRIMARY KEY (`TrainID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'Blue',90),(2,'Rose',30),(3,'Orange',60),(4,'Tobby',70);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 13:53:12
