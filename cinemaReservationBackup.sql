-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cinemaReservation
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `Cinema`
--

DROP TABLE IF EXISTS `Cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cinema` (
  `CinemaID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CinemaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cinema`
--

LOCK TABLES `Cinema` WRITE;
/*!40000 ALTER TABLE `Cinema` DISABLE KEYS */;
INSERT INTO `Cinema` VALUES (1,'Cinema A','Location A'),(2,'Cinema B','Location B');
/*!40000 ALTER TABLE `Cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie` (
  `MovieID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'Movie 1',120),(2,'Movie 2',105);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `ReservationID` int(11) NOT NULL,
  `ShowtimeID` int(11) DEFAULT NULL,
  `SeatNumber` int(11) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `TarifID` int(11) DEFAULT NULL,
  `TicketPrice` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `ShowtimeID` (`ShowtimeID`),
  KEY `TarifID` (`TarifID`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`ShowtimeID`) REFERENCES `Showtime` (`ShowtimeID`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`TarifID`) REFERENCES `Tarif` (`TarifID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Showtime`
--

DROP TABLE IF EXISTS `Showtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Showtime` (
  `ShowtimeID` int(11) NOT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `CinemaID` int(11) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ShowtimeID`),
  KEY `MovieID` (`MovieID`),
  KEY `CinemaID` (`CinemaID`),
  CONSTRAINT `Showtime_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`),
  CONSTRAINT `Showtime_ibfk_2` FOREIGN KEY (`CinemaID`) REFERENCES `Cinema` (`CinemaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Showtime`
--

LOCK TABLES `Showtime` WRITE;
/*!40000 ALTER TABLE `Showtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `Showtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarif`
--

DROP TABLE IF EXISTS `Tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tarif` (
  `TarifID` int(11) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`TarifID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarif`
--

LOCK TABLES `Tarif` WRITE;
/*!40000 ALTER TABLE `Tarif` DISABLE KEYS */;
INSERT INTO `Tarif` VALUES (1,'Plein tarif',9.20),(2,'Étudiant',7.60),(3,'Moins de 14 ans',5.90);
/*!40000 ALTER TABLE `Tarif` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 12:47:11
