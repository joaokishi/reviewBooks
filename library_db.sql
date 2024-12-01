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
  `genre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('The Complete Lord Of The Rings Trilogy','J.R.R. Tolkien','Highbridge Company','2012','No synopsis available','9781611748864',55,'Fiction, Ficción, Wizards, Quête, 823/.912'),('Pride and Prejudice','Jane Austen','Independently Published','2019','No synopsis available','9781092633550',56,'Courtship, Drama, Families, Family, Fiction'),('El diario de Ana Frank','Anne Frank','Abg-Selector USA, ABG-Selector USA','2016','No synopsis available','1681653656',57,'autobiographies, Jews-Netherlands, Jews, Diaries, Holocaust'),('War and peace','Лев Толстой','Wordsworth Editions','1993','No synopsis available','1853260622',58,'Classic, History, Fiction, Russia, Campaigns'),('Alice\'s Adventures in Wonderland','Lewis Carroll','CreateSpace Independent Publishing Platform','2015','No synopsis available','1518870120',59,'classics, animals, anthropomorphism, children, croquet'),('Dracula','Bram Stoker','Berkley (an imprint of Penguin Random House LLC)','2021','No synopsis available','9780593438497',60,'Fiction, Horror, Monsters, Thriller, Vampires'),('The Odyssey','Όμηρος','Vintage Books','1990','No synopsis available','9780679728139',61,'great_books_of_the_western_world, Poetry, Fiction, Horses, Diseases'),('Outliers','Malcolm Gladwell','Little, Brown and Co.','2008','No synopsis available','0316017922',62,'Psychology, Business, Success, Nonfiction, nyt:paperback_business_books=2012-02-25'),('A wizard of Earthsea','Ursula K. Le Guin','Houghton Mifflin Harcourt','2012','No synopsis available','0547851391',63,'Fiction, Magic, Fantasy, Wizards'),('Picture of Dorian Gray','Oscar Wilde','CreateSpace Independent Publishing Platform','2017','No synopsis available','1979161917',64,'Fiction, Youthfulness, Portraits, Juvénilité, General'),('The Wonderful Wizard of Oz','L. Frank Baum','Independently published, Independently Published','Nov ','No synopsis available','171236068X',65,'Witches, Fiction, Wizards, Specimens, History'),('El extraño caso del Dr. Jekyll y Mr. Hyde','Robert Louis Stevenson','Anaya','1981','No synopsis available','8475250084',66,'Fiction, Physicians, Ficción, Médicos, Supernatural'),('Macbeth','William Shakespeare','Swan Books','1983','No synopsis available','9780934048033',67,'Drama, Regicides, Texts, Scotland, kings'),('Grapes of Wrath, The','John Steinbeck','L.A. Theatre Works MP3-CD from Brilliance Audio','Apr ','No synopsis available','1522609830',68,'Depressions, Fiction, award:pulitzer_prize=1940, open_syllabus_project, award:pulitzer_prize=fiction'),('Christmas Carol','Charles Dickens, Ricardo Abraham, Arthur Rackham, John Leech, Harry Furniss, Luis Barthe, Viggo Johansen, Federigo Verdinois, Lluís Nonell i Brunés, David Aliaga Muñoz, Julius Seybt, Edward Aubrey Moriarty','Buccaneer Books, Incorporated','1980','No synopsis available','0899670172',69,'Readers, open_syllabus_project, Promptbooks, Navidad, Esperanto'),('Beyond good and evil','Friedrich Nietzsche','Oxford University Press','1998','No synopsis available','0585110875',70,'Ethics, Philosophy, Asceticism, Nonfiction, open_syllabus_project'),('Moby Dick','Herman Melville','Doherty Associates, LLC, Tom','1998','No synopsis available','9780812580075',71,'Whaling, Whales, great_books_of_the_western_world, Literature, Sailors'),('Heidi (Classic Collection)','Johanna Spyri','Unabridged Library Edition','Nove','No synopsis available','1561001635',72,'Children, Babies, Toddlers, Children\'s, Kid\'s'),('Pilgrim\'s Progress Illustrated','John Bunyan','Independently Published','2021','No synopsis available','9798522732219',73,'Bibliography, Readers, Fiction, Benga, Germans'),('Heaven Official\'s Blessing: Tian Guan Ci Fu Vol. 1','Mo Xiang Tong Xiu','Seven Seas Entertainment','2021','No synopsis available','9781648279171',74,'nyt:trade-fiction-paperback=2022-03-06'),('Prince','Niccolò Machiavelli','Seltzer Books','2008','No synopsis available','1102008095',75,'Fiction, Biographie, History, Literature, Politics'),('Abraham Lincoln','Carl Sandburg','Dell Pub Co','Sept','No synopsis available','9780440300083',76,'Biography, History, Presidents, Biographies, Historia'),('Five on a treasure island','Enid Blyton','Fabbri Publishing Ltd.','1992','No synopsis available','1855873494',77,'adventure, Shipwrecks, Fiction'),('Treasure Island','Robert Louis Stevenson','CreateSpace Independent Publishing Platform','2013','No synopsis available','9781481884716',78,'Fiction, Treasure-trove, Pirates, Literature, History'),('David Copperfield','Charles Dickens, Francesc Ràfolsen, Mary Sebag-Montefiore, Ginger Roberts Brackett, Manuel Rodríguez Navas y Carrasco., Jose KING','Independently Published','2018','No synopsis available','9781790981779',79,'Readers, Fiction, General, Orphans, History'),('Madame Bovary','Gustave Flaubert','1st World Library','2006','No synopsis available','1595400761',80,'Fiction, Adultery, Technique, Suicide, History'),('Tres Mosqueteros, Los','Alexandre Dumas, Auguste Maquet','Tandem Library','June','No synopsis available','9780613943475',81,'History, Fiction, Swordsmen, Swordplay, Histoire'),('La tragedia de Otelo, el Moro de Venecia','William Shakespeare','Editorial Lectorum','Augu','No synopsis available','9789683685452',82,'Drama, Printing, Specimens, Jealousy, Muslims'),('Don Quixote','Miguel de Cervantes Saavedra','Printers Row Publishing Group','2013','No synopsis available','1607108585',83,'Quotations, Fiction, Dictionaries, España, Readers'),('Le ver à soie','J. K. Rowling','GRASSET, Grasset','Oct ','No synopsis available','9782246810667',84,'fiction, mystery, detective, crime, England');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewed_books`
--

DROP TABLE IF EXISTS `reviewed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewed_books` (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `review_date` date DEFAULT NULL,
  `review_text` varchar(200) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `id_book` int NOT NULL,
  PRIMARY KEY (`id_review`),
  KEY `id_user` (`id_user`),
  KEY `reviewed_books_ibfk_2_idx` (`id_book`),
  CONSTRAINT `reviewed_books_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `reviewed_books_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewed_books`
--

LOCK TABLES `reviewed_books` WRITE;
/*!40000 ALTER TABLE `reviewed_books` DISABLE KEYS */;
INSERT INTO `reviewed_books` VALUES (46,12,'2024-11-14','',5,80),(47,12,'2024-11-14','',5,75),(48,12,'2024-11-14','',5,58);
/*!40000 ALTER TABLE `reviewed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin',11,'admin',NULL),('123','123',12,NULL,NULL),('1234','1234',13,NULL,NULL),('','',14,NULL,NULL),('oii','oii',15,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14  5:38:59
