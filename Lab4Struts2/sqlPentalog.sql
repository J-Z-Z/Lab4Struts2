-- MySQL dump 10.13  Distrib 5.5.27, for Win64 (x86)
--
-- Host: localhost    Database: uni2_4t
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `curs`
--

DROP TABLE IF EXISTS `curs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curs` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `nume_curs` varchar(30) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `curs_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `universitate` (`u_id`),
  CONSTRAINT `curs_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `profesor` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curs`
--

LOCK TABLES `curs` WRITE;
/*!40000 ALTER TABLE `curs` DISABLE KEYS */;
INSERT INTO `curs` VALUES (1,'C++',1,1),(2,'Mecanica',1,2),(3,'Fizica',1,5),(4,'Economia Moldovei',2,3),(5,'Limba Franceza',2,4),(6,'Contabilitate',2,3),(7,'Dreptul',3,6),(8,'Psihologia',3,7),(9,'Etica',3,6),(10,'test',2,3);
/*!40000 ALTER TABLE `curs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(30) NOT NULL,
  `prenume` varchar(30) NOT NULL,
  `adresa` varchar(40) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Besliu','Victor','Stefan cel Mare, 30'),(2,'Gutuleac','Emilian','str.Studentilor,3'),(3,'Tucan',' Gabriela','str. Florilor, 24'),(4,'Birzu','Danie','str. Gh. Asachi,14'),(5,'Muresanu','Muresan','str. Mihai Viteazu,19'),(6,'Rednic','Simion','str. Hincesti, 198'),(7,'Alexandru','Stepanenco','str. Cosmonautilor, 30 apt. 8'),(8,'Chiorsac','Mircea','str. Mihai Eminescu, 23'),(9,'Sidelnicov','Vasile','str. Petru Zadnipru, 11'),(10,'Diligul','Alexandru','str. Banulescu Bodoni, 19'),(11,'Nichitin','Veaceslav','str. Sciusev, 131');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_curs`
--

DROP TABLE IF EXISTS `stud_curs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_curs` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `s_id` (`s_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `stud_curs_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`),
  CONSTRAINT `stud_curs_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `curs` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_curs`
--

LOCK TABLES `stud_curs` WRITE;
/*!40000 ALTER TABLE `stud_curs` DISABLE KEYS */;
INSERT INTO `stud_curs` VALUES (2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3),(13,5,1),(14,5,2),(15,5,3),(16,6,4),(17,6,5),(18,6,6),(19,7,4),(20,7,5),(21,7,6),(22,7,7),(23,8,4),(24,8,5),(25,8,6),(26,8,7),(27,9,4),(28,9,5),(29,9,6),(30,9,7),(31,10,4),(32,10,5),(33,10,6),(34,10,7),(35,11,7),(36,11,8),(37,11,9),(38,12,7),(39,12,8),(40,12,9),(41,13,7),(42,13,8),(43,13,9),(44,14,7),(45,14,8),(46,14,9),(47,15,7),(48,15,8),(49,15,9),(50,16,7),(51,16,8),(52,16,9),(53,17,7),(54,17,8),(55,17,9),(56,18,7),(57,18,8),(58,18,9),(59,19,4),(60,19,5),(61,19,6),(62,20,4),(63,20,5),(64,20,6),(65,21,4),(66,21,5),(67,21,6),(68,22,4),(69,22,5),(70,22,6),(71,23,4),(72,23,5);
/*!40000 ALTER TABLE `stud_curs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(30) NOT NULL,
  `prenume` varchar(30) NOT NULL,
  `grupa` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telFix` varchar(20) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Victor','Dovgaliuc','TI-103','victor@gmail.com','068352011'),(2,'Andrian','Corneliu','TI-103','agiucorneliu@yhaoo.com','23-14-25'),(3,'Alexandru','Elena','TI-103','elena18@mail.ro','23-14-25'),(4,'Alexei','Alexandru','TI-103','alexalex@gmail.com','28-33-73'),(5,'Ardeleanu','Bogdan','TI-103','ardeleanudan@yahoo.com','24-44-09'),(6,'Atitienei','George','ME-059','georgeatit@yahoo.com','24-34-27'),(7,'Bacioiu','Vicentiu','ME-059','bacioivicentiu','71-34-75'),(8,'Badea','Cristina','ME-059','cristinea@mail.ro','35-10-20'),(9,'Badescu','Maria','ME-059','badescum@yahoo.com','43-64-65'),(10,'Bajanica','Ion','ME-059','ionbajanica@yahoo.com','35-12-27'),(11,'Balcan','Adrian','FAF-108','balcanadn@yahoo.com','37-11-35'),(12,'Baluta','Adrian','FAF-108','balutar@yahoo.ro','72-14-92'),(13,'Bazar','Cristina','FAF-108','cristinuta@yhaoo.com','63-94-55'),(14,'Bazavan','Alexandru','FAF-108','AlexandruBaz@gmail.com','53-40-47'),(15,'Bejenaru','Andreea','FAF-107','andreea@gmail.com','33-64-35'),(16,'Bobei','Alexandru','FAF-107','alexbob@mail.ro','93-64-19'),(17,'Bosoaga','Andreea','FAF-107','bosogaa@yahoo.com','23-14-25'),(18,'Bouros','Oana','FAF-107','oanabouros@mail.ro','22-54-45'),(19,'Brailescu','Petrut','REI-027','brailescu@yahoo.com','52-24-25'),(20,'Bubulan','Cosmin','REI-027','cosminbraiu@yahoo.com','43-14-25'),(21,'Buca','Elen','REI-027','eleonoruca@yahoo.com','23-16-25'),(22,'Bucurica','Cosmin','REI-027','cosmincoza@yahoo.com','22-14-25'),(23,'Buica','Elena','REI-027','buicael@yahoo.com','23-14-35'),(26,'Buliga','Andrei','TI-101','buligaandrei@gmail.com','41-21-64'),(27,'Crepcia','Mihai','TI-101','crepciamihai@gmail.com','42-36-24'),(28,'Ivanescu','Minu','TI-101','ivanescuminu@gmail.com','32-36-24'),(29,'Moldovan','Vasile','TI-102','moldovanvasile@gmail.com','94-28-55');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universitate`
--

DROP TABLE IF EXISTS `universitate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universitate` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `nume_univer` varchar(30) NOT NULL,
  `adresa` varchar(40) NOT NULL,
  `telefon` varchar(30) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universitate`
--

LOCK TABLES `universitate` WRITE;
/*!40000 ALTER TABLE `universitate` DISABLE KEYS */;
INSERT INTO `universitate` VALUES (1,'UTM','bd. Stefan cel Mare, 168','(+37322) 237-861'),(2,'ASE','str. Banulescu-Bodoni, 61','(+37322) 224-128'),(3,'USM','Str. Alexei Mateevici, 60','(+37322) 577-629'),(4,'ASSE','str. Mircea cel Batrin, 9','(+37322) 237-378');
/*!40000 ALTER TABLE `universitate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-15 12:34:00
