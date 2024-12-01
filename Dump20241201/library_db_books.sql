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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `title` varchar(200) DEFAULT NULL,
  `author` varchar(400) NOT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publish_date` varchar(4) DEFAULT NULL,
  `synopsis` varchar(500) DEFAULT NULL,
  `isbn` varchar(20) NOT NULL,
  `id_book` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('The Complete Lord Of The Rings Trilogy','J.R.R. Tolkien','Highbridge Company','2012','No synopsis available','9781611748864',117),('Pride and Prejudice','Jane Austen','Independently Published','2019','No synopsis available','9781092633550',118),('El diario de Ana Frank','Anne Frank','Abg-Selector USA, ABG-Selector USA','2016','No synopsis available','1681653656',119),('War and peace','Лев Толстой','Wordsworth Editions','1993','No synopsis available','1853260622',120),('Alice\'s Adventures in Wonderland','Lewis Carroll','CreateSpace Independent Publishing Platform','2015','No synopsis available','1518870120',121),('Dracula','Bram Stoker','Berkley (an imprint of Penguin Random House LLC)','2021','No synopsis available','9780593438497',122),('The Odyssey','Όμηρος','Vintage Books','1990','No synopsis available','9780679728139',123),('Outliers','Malcolm Gladwell','Little, Brown and Co.','2008','No synopsis available','0316017922',124),('A wizard of Earthsea','Ursula K. Le Guin','Houghton Mifflin Harcourt','2012','No synopsis available','0547851391',125),('Picture of Dorian Gray','Oscar Wilde, Oscar Wilde, Oscar Wilde','CreateSpace Independent Publishing Platform','2017','No synopsis available','1977629903',126),('The Wonderful Wizard of Oz','L. Frank Baum','Independently published, Independently Published','Nov ','No synopsis available','171236068X',127),('El extraño caso del Dr. Jekyll y Mr. Hyde','Robert Louis Stevenson','Anaya','1981','No synopsis available','8475250084',128),('Macbeth','William Shakespeare','Swan Books','1983','No synopsis available','9780934048033',129),('Grapes of Wrath, The','John Steinbeck','L.A. Theatre Works MP3-CD from Brilliance Audio','Apr ','No synopsis available','1522609830',130),('Christmas Carol','Charles Dickens, Ricardo Abraham, Arthur Rackham, John Leech, Harry Furniss, Luis Barthe, Viggo Johansen, Federigo Verdinois, Lluís Nonell i Brunés, David Aliaga Muñoz, Julius Seybt, Edward Aubrey Moriarty','Buccaneer Books, Incorporated','1980','No synopsis available','0899670172',131),('Beyond good and evil','Friedrich Nietzsche','Oxford University Press','1998','No synopsis available','0585110875',132),('Moby Dick','Herman Melville','Doherty Associates, LLC, Tom','1998','No synopsis available','9780812580075',133),('HEIDI','Johanna Spyri','Cecilie Dressler Verlag','1993','No synopsis available','3791535420',134),('Pilgrim\'s Progress Illustrated','John Bunyan','Independently Published','2021','No synopsis available','9798522732219',135),('Heaven Official\'s Blessing: Tian Guan Ci Fu Vol. 1','Mo Xiang Tong Xiu','Seven Seas Entertainment','2021','No synopsis available','9781648279171',136),('Prince','Niccolò Machiavelli','Seltzer Books','2008','No synopsis available','1102008095',137),('Abraham Lincoln','Carl Sandburg','Dell Pub Co','Sept','No synopsis available','9780440300083',138),('Five on a treasure island','Enid Blyton','Fabbri Publishing Ltd.','1992','No synopsis available','1855873494',139),('Treasure Island','Robert Louis Stevenson','Independently Published','2021','No synopsis available','9798717555371',140),('David Copperfield','Charles Dickens, Francesc Ràfolsen, Mary Sebag-Montefiore, Ginger Roberts Brackett, Manuel Rodríguez Navas y Carrasco., Jose KING','Independently Published','2018','No synopsis available','9781790981779',141),('Madame Bovary','Gustave Flaubert','1st World Library','2006','No synopsis available','1595400761',142),('Tres Mosqueteros, Los','Alexandre Dumas, Auguste Maquet','Tandem Library','June','No synopsis available','9780613943475',143),('La tragedia de Otelo, el Moro de Venecia','William Shakespeare','Editorial Lectorum','Augu','No synopsis available','9789683685452',144),('Don Quixote','Miguel de Cervantes Saavedra','Printers Row Publishing Group','2013','No synopsis available','1607108585',145),('Le ver à soie','J. K. Rowling','GRASSET, Grasset','Oct ','No synopsis available','9782246810667',146),('The Complete Lord Of The Rings Trilogy','J.R.R. Tolkien','Highbridge Company','2012','No synopsis available','9781611748864',147),('Pride and Prejudice','Jane Austen','Independently Published','2019','No synopsis available','9781092633550',148),('El diario de Ana Frank','Anne Frank','Abg-Selector USA, ABG-Selector USA','2016','No synopsis available','1681653656',149),('War and peace','Лев Толстой','Wordsworth Editions','1993','No synopsis available','1853260622',150),('Alice\'s Adventures in Wonderland','Lewis Carroll','CreateSpace Independent Publishing Platform','2015','No synopsis available','1518870120',151),('Dracula','Bram Stoker','Berkley (an imprint of Penguin Random House LLC)','2021','No synopsis available','9780593438497',152),('The Odyssey','Όμηρος','Vintage Books','1990','No synopsis available','9780679728139',153),('Outliers','Malcolm Gladwell','Little, Brown and Co.','2008','No synopsis available','0316017922',154),('A wizard of Earthsea','Ursula K. Le Guin','Houghton Mifflin Harcourt','2012','No synopsis available','0547851391',155),('Picture of Dorian Gray','Oscar Wilde, Oscar Wilde, Oscar Wilde','CreateSpace Independent Publishing Platform','2017','No synopsis available','1977629903',156),('The Wonderful Wizard of Oz','L. Frank Baum','Independently published, Independently Published','Nov ','No synopsis available','171236068X',157),('El extraño caso del Dr. Jekyll y Mr. Hyde','Robert Louis Stevenson','Anaya','1981','No synopsis available','8475250084',158),('Macbeth','William Shakespeare','Swan Books','1983','No synopsis available','9780934048033',159),('Grapes of Wrath, The','John Steinbeck','L.A. Theatre Works MP3-CD from Brilliance Audio','Apr ','No synopsis available','1522609830',160),('Christmas Carol','Charles Dickens, Ricardo Abraham, Arthur Rackham, John Leech, Harry Furniss, Luis Barthe, Viggo Johansen, Federigo Verdinois, Lluís Nonell i Brunés, David Aliaga Muñoz, Julius Seybt, Edward Aubrey Moriarty','Buccaneer Books, Incorporated','1980','No synopsis available','0899670172',161),('Beyond good and evil','Friedrich Nietzsche','Oxford University Press','1998','No synopsis available','0585110875',162),('Moby Dick','Herman Melville','Doherty Associates, LLC, Tom','1998','No synopsis available','9780812580075',163),('HEIDI','Johanna Spyri','Cecilie Dressler Verlag','1993','No synopsis available','3791535420',164),('Pilgrim\'s Progress Illustrated','John Bunyan','Independently Published','2021','No synopsis available','9798522732219',165),('Heaven Official\'s Blessing: Tian Guan Ci Fu Vol. 1','Mo Xiang Tong Xiu','Seven Seas Entertainment','2021','No synopsis available','9781648279171',166),('Prince','Niccolò Machiavelli','Seltzer Books','2008','No synopsis available','1102008095',167),('Abraham Lincoln','Carl Sandburg','Dell Pub Co','Sept','No synopsis available','9780440300083',168),('Five on a treasure island','Enid Blyton','Fabbri Publishing Ltd.','1992','No synopsis available','1855873494',169),('Treasure Island','Robert Louis Stevenson','Independently Published','2021','No synopsis available','9798717555371',170),('David Copperfield','Charles Dickens, Francesc Ràfolsen, Mary Sebag-Montefiore, Ginger Roberts Brackett, Manuel Rodríguez Navas y Carrasco., Jose KING','Independently Published','2018','No synopsis available','9781790981779',171),('Madame Bovary','Gustave Flaubert','1st World Library','2006','No synopsis available','1595400761',172),('Tres Mosqueteros, Los','Alexandre Dumas, Auguste Maquet','Tandem Library','June','No synopsis available','9780613943475',173),('La tragedia de Otelo, el Moro de Venecia','William Shakespeare','Editorial Lectorum','Augu','No synopsis available','9789683685452',174),('Don Quixote','Miguel de Cervantes Saavedra','Printers Row Publishing Group','2013','No synopsis available','1607108585',175),('Le ver à soie','J. K. Rowling','GRASSET, Grasset','Oct ','No synopsis available','9782246810667',176);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
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
