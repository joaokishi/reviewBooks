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
-- Table structure for table `book_genres`
--

DROP TABLE IF EXISTS `book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genres` (
  `id_book` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_book`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `book_genres_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE,
  CONSTRAINT `book_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genres`
--

LOCK TABLES `book_genres` WRITE;
/*!40000 ALTER TABLE `book_genres` DISABLE KEYS */;
INSERT INTO `book_genres` VALUES (117,147),(118,147),(120,147),(122,147),(123,147),(125,147),(126,147),(127,147),(128,147),(130,147),(135,147),(137,147),(139,147),(140,147),(141,147),(142,147),(143,147),(145,147),(146,147),(147,147),(148,147),(150,147),(152,147),(153,147),(155,147),(156,147),(157,147),(158,147),(160,147),(165,147),(167,147),(169,147),(170,147),(171,147),(172,147),(173,147),(175,147),(176,147),(117,148),(125,148),(127,148),(147,148),(155,148),(157,148),(118,149),(148,149),(118,150),(129,150),(144,150),(148,150),(159,150),(174,150),(118,151),(148,151),(118,152),(148,152),(119,154),(149,154),(119,155),(149,155),(119,156),(149,156),(119,157),(149,157),(120,158),(150,158),(120,159),(127,159),(137,159),(138,159),(140,159),(141,159),(142,159),(143,159),(150,159),(157,159),(167,159),(168,159),(170,159),(171,159),(172,159),(173,159),(120,161),(150,161),(120,162),(150,162),(121,163),(151,163),(121,164),(151,164),(121,165),(151,165),(121,166),(134,166),(151,166),(164,166),(121,167),(151,167),(122,169),(152,169),(122,170),(152,170),(122,171),(152,171),(122,172),(152,172),(123,173),(153,173),(123,175),(153,175),(123,176),(153,176),(124,177),(154,177),(124,178),(154,178),(124,179),(154,179),(124,180),(132,180),(154,180),(162,180),(125,182),(155,182),(125,183),(155,183),(126,186),(156,186),(126,187),(156,187),(126,188),(141,188),(156,188),(171,188),(127,189),(157,189),(127,192),(144,192),(157,192),(174,192),(128,195),(158,195),(128,196),(158,196),(129,198),(159,198),(129,199),(159,199),(129,200),(159,200),(129,201),(159,201),(130,202),(160,202),(131,204),(135,204),(141,204),(145,204),(161,204),(165,204),(171,204),(175,204),(131,205),(161,205),(131,206),(161,206),(131,207),(161,207),(132,208),(162,208),(132,209),(162,209),(132,210),(162,210),(133,212),(163,212),(133,213),(163,213),(133,214),(137,214),(140,214),(163,214),(167,214),(170,214),(133,215),(163,215),(134,217),(164,217),(134,218),(164,218),(135,219),(165,219),(135,222),(165,222),(135,223),(165,223),(137,225),(167,225),(137,228),(167,228),(138,229),(168,229),(138,231),(168,231),(138,232),(168,232),(138,233),(168,233),(139,234),(169,234),(139,235),(169,235),(140,238),(170,238),(141,244),(171,244),(142,247),(172,247),(142,248),(172,248),(142,249),(172,249),(143,253),(173,253),(143,254),(173,254),(143,255),(173,255),(144,257),(174,257),(144,259),(174,259),(144,260),(174,260),(145,261),(175,261),(145,263),(175,263),(146,266),(176,266),(146,267),(176,267),(146,268),(176,268),(146,269),(176,269);
/*!40000 ALTER TABLE `book_genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01  0:18:19
