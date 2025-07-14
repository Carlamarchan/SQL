-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestion_descargas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `detalle_descarga`
--

DROP TABLE IF EXISTS `detalle_descarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_descarga` (
  `detalle_descarga_id` int(11) NOT NULL AUTO_INCREMENT,
  `lista_descarga_id` int(11) NOT NULL,
  `podcast_id` int(11) NOT NULL,
  `fecha_descraga` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`detalle_descarga_id`),
  UNIQUE KEY `detalle_descarga_id_UNIQUE` (`detalle_descarga_id`),
  KEY `fk_lista_descarga_has_podcast_podcast1_idx` (`podcast_id`),
  KEY `fk_lista_descarga_has_podcast_lista_descarga1_idx` (`lista_descarga_id`),
  CONSTRAINT `fk_lista_descarga_has_podcast_lista_descarga1` FOREIGN KEY (`lista_descarga_id`) REFERENCES `lista_descarga` (`lista_descarga_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_descarga_has_podcast_podcast1` FOREIGN KEY (`podcast_id`) REFERENCES `podcast` (`podcast_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_descarga`
--

LOCK TABLES `detalle_descarga` WRITE;
/*!40000 ALTER TABLE `detalle_descarga` DISABLE KEYS */;
INSERT INTO `detalle_descarga` VALUES (1,1,11,'2025-01-09 23:00:00'),(2,1,12,'2024-11-14 23:00:00'),(3,1,13,'2024-12-27 23:00:00'),(4,2,6,'2025-07-14 22:00:00'),(5,2,14,'2025-08-09 22:00:00'),(6,3,7,'2025-01-04 23:00:00'),(7,3,10,'2024-12-07 23:00:00'),(8,3,15,'2025-11-17 23:00:00'),(9,6,1,'2025-07-14 22:00:00'),(10,6,2,'2024-11-14 23:00:00'),(11,6,3,'2024-12-07 23:00:00'),(12,6,5,'2025-01-09 23:00:00');
/*!40000 ALTER TABLE `detalle_descarga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-14 19:32:46
