CREATE DATABASE  IF NOT EXISTS `library_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library_db`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (247,'Adultery'),(234,'adventure'),(164,'animals'),(165,'anthropomorphism'),(210,'Asceticism'),(154,'autobiographies'),(217,'Babies'),(222,'Benga'),(219,'Bibliography'),(225,'Biographie'),(232,'Biographies'),(229,'Biography'),(178,'Business'),(162,'Campaigns'),(166,'children'),(158,'Classic'),(163,'classics'),(149,'Courtship'),(268,'crime'),(167,'croquet'),(202,'Depressions'),(267,'detective'),(156,'Diaries'),(263,'Dictionaries'),(176,'Diseases'),(150,'Drama'),(269,'England'),(207,'Esperanto'),(208,'Ethics'),(151,'Families'),(152,'Family'),(183,'Fantasy'),(147,'Fiction'),(188,'General'),(223,'Germans'),(255,'Histoire'),(233,'Historia'),(159,'History'),(157,'Holocaust'),(169,'Horror'),(175,'Horses'),(259,'Jealousy'),(155,'Jews'),(201,'kings'),(214,'Literature'),(182,'Magic'),(170,'Monsters'),(260,'Muslims'),(266,'mystery'),(206,'Navidad'),(180,'Nonfiction'),(244,'Orphans'),(209,'Philosophy'),(195,'Physicians'),(238,'Pirates'),(173,'Poetry'),(228,'Politics'),(187,'Portraits'),(231,'Presidents'),(257,'Printing'),(205,'Promptbooks'),(177,'Psychology'),(261,'Quotations'),(204,'Readers'),(198,'Regicides'),(161,'Russia'),(215,'Sailors'),(200,'Scotland'),(235,'Shipwrecks'),(192,'Specimens'),(179,'Success'),(249,'Suicide'),(196,'Supernatural'),(254,'Swordplay'),(253,'Swordsmen'),(248,'Technique'),(199,'Texts'),(171,'Thriller'),(218,'Toddlers'),(172,'Vampires'),(213,'Whales'),(212,'Whaling'),(189,'Witches'),(148,'Wizards'),(186,'Youthfulness');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01  0:18:18
