CREATE DATABASE  IF NOT EXISTS `connect60mais` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `connect60mais`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: connect60mais
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `areas_of_interest`
--

DROP TABLE IF EXISTS `areas_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas_of_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `interest_area` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_interest` (`user_id`,`interest_area`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_of_interest`
--

LOCK TABLES `areas_of_interest` WRITE;
/*!40000 ALTER TABLE `areas_of_interest` DISABLE KEYS */;
INSERT INTO `areas_of_interest` VALUES (1,'550e8400-e29b-41d4-a716-446655440000','Tech'),(3,'520e8400-e29b-49d4-a716-446655840000','Cook'),(4,'550e8400-e29b-41d4-a716-446655440000','Escritório'),(7,'6a90b9da-f624-4487-b67c-9789228f8c2f','Tech'),(8,'cc625680-f4a1-4f40-a58e-eb48c8840bf0','Tech');
/*!40000 ALTER TABLE `areas_of_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseinstructors`
--

DROP TABLE IF EXISTS `courseinstructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseinstructors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `instructor_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_course_instructor` (`course_id`,`instructor_id`),
  KEY `course_id` (`course_id`),
  KEY `instructor_id` (`instructor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseinstructors`
--

LOCK TABLES `courseinstructors` WRITE;
/*!40000 ALTER TABLE `courseinstructors` DISABLE KEYS */;
INSERT INTO `courseinstructors` VALUES (1,1,'72d4fa5b-fb76-47f8-ae1b-ded35a8c17c3'),(2,2,'829c6751-2a20-430f-8992-63658321569b'),(3,3,'302a7a85-2985-4591-8022-c1841df4c187'),(4,4,'4137bf30-76b2-4cf6-8213-ec2ac52c334b'),(5,5,'ac0d6676-8675-438e-ba16-68df9d117201'),(6,6,'fa404dde-249c-47f9-baa8-a7830f9aa39a'),(7,7,'71d4fa7b-fb12-44f8-ae1b-ded35a8c17c3');
/*!40000 ALTER TABLE `courseinstructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text,
  `category` varchar(100) DEFAULT NULL,
  `level` enum('beginner','intermediate','advanced') DEFAULT 'beginner',
  `price` decimal(10,2) DEFAULT '0.00',
  `url_capa_curso` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `fk_created_by` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Curso de Python','Aprenda Python do zero ao avançado.','Tech','beginner',99.90,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-12 04:26:34',''),(2,'Curso de Javascript','Aprenda Javascript do zero ao avançado.','Tech','beginner',0.00,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:55:53',''),(3,'Curso de Word','Aprenda Word zero ao avançado.','Tech','beginner',0.00,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:58:18',''),(4,'Curso de Excel','Aprenda Excel zero ao avançado.','Tech','beginner',0.00,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:58:40',''),(5,'Friend address parent level shoulder.','Require word involve investment member fly protect. Position machine relationship by too very. Military page social beautiful operation without remember.','Business','advanced',58.88,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(6,'Create cell space project child air.','Under baby same push number their defense. Head behavior fact view seven even. Century allow could from tough market though. Religious ago lay send.','Business','advanced',102.83,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(7,'Protect stop style machine dog officer more.','Great on treatment test majority significant collection. Subject paper marriage what avoid goal marriage.\nStock report call once. Spend six example visit room.','Tech','intermediate',75.13,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(8,'Must skin team will voice.','Value stage break any writer really. Attack investment contain miss message power front. Character deep leader possible.','Tech','intermediate',121.35,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(9,'Toward husband adult front like another growth.','Ball people more whether gas open trade officer. Receive law of ago writer wish. Make trial cold table treatment.\nManage collection before as recent.','Tech','advanced',171.57,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(10,'Republican follow see face.','Southern service others house. Hold woman product anything market. To back another natural policy suggest.\nExactly support best why prevent no. Behind measure option send player. Buy top from so.','Tech','intermediate',168.57,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(11,'Minute star red land bag.','Control right reach my various. Hear size live.\nManage art spring natural natural fund ball. End father himself civil sport. Worry weight stuff onto better.','Tech','advanced',79.82,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(12,'Budget all technology field join.','Fear artist weight consumer. Identify boy garden particular safe heavy college. Ago then common.','Business','advanced',116.57,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(13,'Value staff phone court lawyer occur.','Hope assume win lawyer.\nEvening turn nothing conference stop. Mean particular goal billion movie.','Design','advanced',135.37,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(14,'Leave remain find call national.','Individual measure later Republican notice sister minute. Station idea dark. Dark ground know off.','Design','beginner',106.25,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-15 19:59:25',''),(15,'Speak agreement create compare authority.','Foreign from condition soon nice enter. Young doctor involve light serious show.\nExecutive direction campaign forget put treatment upon. Measure all easy act center.','Tech','intermediate',93.31,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-16 15:37:17',''),(16,'Less stuff build method my you.','Respond north career. Discuss do decade direction involve.\nStuff east now. Senior performance according should. Quite entire team voice each show.','Business','intermediate',141.53,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-16 15:37:17',''),(17,'Game by baby seat.','Man hope leave would example town. West truth general tell.\nBuild star society own scene behavior. Face development help build choose. Arrive before teach food including.','Tech','advanced',91.25,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-16 15:37:17',''),(18,'Garden together million beautiful weight action per.','Hour degree president throw garden star military. Dog work purpose responsibility building success. Toward Mrs war public opportunity.','Tech','intermediate',158.98,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-16 15:37:17',''),(19,'Year bag size almost start way.','Model sea office method list serious position. Doctor hot record interesting experience. Conference any weight.\nLaw final article age trouble foot. Series series red. Throw woman exist.','Tech','beginner',181.13,'https://asimov.academy/wp-content/uploads/2023/12/curso-python-basico.webp','2025-02-16 15:37:17','');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `getsearchresultsview`
--

DROP TABLE IF EXISTS `getsearchresultsview`;
/*!50001 DROP VIEW IF EXISTS `getsearchresultsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getsearchresultsview` AS SELECT 
 1 AS `name`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `bio` text,
  `profile_picture_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES ('72d4fa5b-fb76-47f8-ae1b-ded35a8c17c3','Maria Souza','maria@example.com','Instrutora de tecnologia com 10 anos de experiência.','https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg','2025-02-12 04:26:44'),('829c6751-2a20-430f-8992-63658321569b','Robert Ward','morgantammy@example.net','Single case last must growth adult. Involve himself throughout.\nEvent weight floor. Represent small break. It realize particularly enter news.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&s','2025-02-15 15:14:34'),('302a7a85-2985-4591-8022-c1841df4c187','Kevin Morris','murphysarah@example.net','Respond finally various. Perform kid act fight. Must skill join indicate bar hold.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&s','2025-02-15 15:14:34'),('4137bf30-76b2-4cf6-8213-ec2ac52c334b','Jeff Vance','sharon59@example.org','Throw guess girl theory. Down moment this.\nSite agreement ok item compare half card only. Section teach rate tough if campaign city.\nEnter democratic arrive great doctor. Phone reveal kid now white.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&s','2025-02-15 15:14:34'),('ac0d6676-8675-438e-ba16-68df9d117201','Amy Hayes','floresmichael@example.net','Mother score popular may. Plant low radio Congress nothing four each defense. Member city vote wife listen growth television.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&s','2025-02-15 15:14:34'),('fa404dde-249c-47f9-baa8-a7830f9aa39a','Raymond Morrison','bryantchristopher@example.net','Money respond hit.\nLast Mr mouth she majority man difference. Day choose top trade citizen edge stock child. Challenge little such successful others.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&s','2025-02-15 15:14:34'),('71d4fa7b-fb12-44f8-ae1b-ded35a8c17c3','Maria Fernanda','mariaf@example.com','Instrutora de tecnologia com 10 anos de experiência.','https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg','2025-02-20 04:56:01');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text,
  `video_url` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `linksMateriais` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(36) NOT NULL,
  `course_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `progress_percentage` decimal(5,2) DEFAULT '0.00',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `module_id` (`module_id`),
  KEY `lesson_id` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendered_courses`
--

DROP TABLE IF EXISTS `rendered_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rendered_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `rendered` tinyint(1) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendered_courses`
--

LOCK TABLES `rendered_courses` WRITE;
/*!40000 ALTER TABLE `rendered_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `rendered_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfeedback`
--

DROP TABLE IF EXISTS `userfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(36) NOT NULL,
  `course_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comments` text,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfeedback`
--

LOCK TABLES `userfeedback` WRITE;
/*!40000 ALTER TABLE `userfeedback` DISABLE KEYS */;
INSERT INTO `userfeedback` VALUES (1,'1aa4eff2-e4a7-428f-841e-b413bf0c56e9',1,2,'Ótimo curso! Muito didático e fácil de entender.','2025-02-21 02:18:19'),(2,'6a90b9da-f624-48b7-b67c-9798228f2c2f',1,4,'Gostei, mas achei um pouco avançado para iniciantes.','2025-02-21 02:18:22'),(3,'cc625680-f4a1-4f40-a58e-eb48c8840bf0',1,3,'Pessimo, precisa melhorar muit pra ser considerado um curso.','2025-02-21 02:18:24'),(4,'6a90b9da-f624-4487-b67c-9789228f8c2f',2,5,'Explicações claras e diretas, gostei muito!','2025-02-21 02:18:43'),(5,'a40a02b2-204e-4321-85b9-66d5e212e998',2,4,'O conteúdo é excelente, mas poderia ter mais exercícios.','2025-02-21 02:18:46'),(6,'520e8400-e29b-49d4-a716-446655840000',2,2,'Excelente para quem quer aprender do zero!','2025-02-21 02:18:48'),(7,'1aa4eff2-e4a7-428f-841e-b413bf0c56e9',3,2,'Ótimo curso! Muito didático e fácil de entender.','2025-02-21 02:19:06'),(8,'6a90b9da-f624-48b7-b67c-9798228f2c2f',3,4,'Gostei, mas achei um pouco avançado para iniciantes.','2025-02-21 02:19:08'),(9,'cc625680-f4a1-4f40-a58e-eb48c8840bf0',3,3,'Pessimo, precisa melhorar muit pra ser considerado um curso.','2025-02-21 02:19:10'),(10,'6a90b9da-f624-4487-b67c-9789228f8c2f',4,5,'Explicações claras e diretas, gostei muito!','2025-02-21 02:19:21'),(11,'a40a02b2-204e-4321-85b9-66d5e212e998',4,4,'O conteúdo é excelente, mas poderia ter mais exercícios.','2025-02-21 02:19:23'),(12,'520e8400-e29b-49d4-a716-446655840000',4,2,'Excelente para quem quer aprender do zero!','2025-02-21 02:19:25'),(13,'1aa4eff2-e4a7-428f-841e-b413bf0c56e9',5,2,'Ótimo curso! Muito didático e fácil de entender.','2025-02-21 02:19:34'),(14,'6a90b9da-f624-48b7-b67c-9798228f2c2f',5,4,'Gostei, mas achei um pouco avançado para iniciantes.','2025-02-21 02:19:36'),(15,'cc625680-f4a1-4f40-a58e-eb48c8840bf0',5,3,'Pessimo, precisa melhorar muit pra ser considerado um curso.','2025-02-21 02:19:38'),(16,'6a90b9da-f624-4487-b67c-9789228f8c2f',6,5,'Explicações claras e diretas, gostei muito!','2025-02-21 02:19:53'),(17,'a40a02b2-204e-4321-85b9-66d5e212e998',6,4,'O conteúdo é excelente, mas poderia ter mais exercícios.','2025-02-21 02:19:55'),(18,'520e8400-e29b-49d4-a716-446655840000',6,2,'Excelente para quem quer aprender do zero!','2025-02-21 02:19:57'),(19,'1aa4eff2-e4a7-428f-841e-b413bf0c56e9',7,2,'Ótimo curso! Muito didático e fácil de entender.','2025-02-21 02:20:06'),(20,'6a90b9da-f624-48b7-b67c-9798228f2c2f',7,4,'Gostei, mas achei um pouco avançado para iniciantes.','2025-02-21 02:20:08'),(21,'cc625680-f4a1-4f40-a58e-eb48c8840bf0',7,3,'Pessimo, precisa melhorar muit pra ser considerado um curso.','2025-02-21 02:20:10');
/*!40000 ALTER TABLE `userfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `age` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('550e8400-e29b-41d4-a716-446655440000','João Silva','joao@example.com','hashed_password','1995-06-15','2025-02-12 04:26:27'),('520e8400-e29b-49d4-a716-446655840000','Marina Marques','marina@gmail.com','hashed_password','1998-06-15','2025-02-13 02:57:33'),('a40a02b2-204e-4321-85b9-66d5e212e998','Ismael Roberto','ismael@gmail.com','scrypt:32768:8:1$DboJhuqpFaZzQJRZ$66eb4518fde3b12ad819ae967f0085fc104ad4e67d471cd91cf5165a1e3ccbb6a7f986e1b23bf4af3a4c5255b448e7ae908b879d046f2182d589a0921304f639','2000-01-18','2025-02-13 03:42:31'),('6a90b9da-f624-4487-b67c-9789228f8c2f','Matrix Gonçalves','matrixl@gmail.com','scrypt:32768:8:1$IwDmOFnf5jW2WFFJ$021158a5cd0ffb9126c2efc14be91ab745f90234d0a4642ac14390418c3e4f8c5ed4c2eea71ff2d15046bc4adde6372a10ae196c6302534994823a70846fe8f5','2000-01-18','2025-02-13 17:52:03'),('cc625680-f4a1-4f40-a58e-eb48c8840bf0','Robert Gonçalves','robert@gmail.com','scrypt:32768:8:1$sGbVu0hLb67KO9Nl$e8eab03dc24f8698d463bb1394ee0672dbbb89e8b229612d3f6da0a5196d946198d0356e2b574494d42307887da312c78da6b6afeafcb89e2c43767a4e22915a',NULL,'2025-02-13 18:00:40'),('1aa4eff2-e4a7-428f-841e-b413bfc056e9','Roddsbeo Gonçalves','rossdbe@gmail.com','scrypt:32768:8:1$sW25YJH1Xk6HTHJX$bade0c1234551803c654d9e56804d54d745c1e11f694b7899faa40b7afd9e98bb41b06242391758399193a30f3b98a3ceee6596b717f112c6b3724250f13c03e','2005-01-18','2025-02-13 18:26:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(36) NOT NULL,
  `course_id` int(11) NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `getsearchresultsview`
--

/*!50001 DROP VIEW IF EXISTS `getsearchresultsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getsearchresultsview` AS select `courses`.`title` AS `name`,'course' AS `type` from `courses` union select `instructors`.`name` AS `name`,'instructor' AS `type` from `instructors` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-22 17:26:07
