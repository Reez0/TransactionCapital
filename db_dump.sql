-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: transaction_capital_db
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add requests',7,'add_requests'),(26,'Can change requests',7,'change_requests'),(27,'Can delete requests',7,'delete_requests'),(28,'Can view requests',7,'view_requests'),(29,'Can add api keys',8,'add_apikeys'),(30,'Can change api keys',8,'change_apikeys'),(31,'Can delete api keys',8,'delete_apikeys'),(32,'Can view api keys',8,'view_apikeys');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$MkTUtPUH1sQ9$hIWW3nBpcolaSwc9p0myC3lQ7mU3d06hPtmDTsseob0=','2021-03-01 08:41:18.318704',1,'admin','','','a@a.com',1,1,'2021-03-01 08:41:06.185267');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-03-01 08:41:41.792921','1','mapbox.com',1,'[{\"added\": {}}]',8,1),(2,'2021-03-01 08:42:03.570766','2','openweathermap.org',1,'[{\"added\": {}}]',8,1),(3,'2021-03-01 09:37:17.106528','2','openweathermap.org',3,'',8,1),(4,'2021-03-01 09:37:17.117513','1','mapbox.com',3,'',8,1),(5,'2021-03-01 09:43:26.088919','3','openweathermap.org',1,'[{\"added\": {}}]',8,1),(6,'2021-03-01 09:43:46.910532','4','mapbox.com',1,'[{\"added\": {}}]',8,1),(7,'2021-03-01 11:15:00.745535','4','37 Cookham road, Auckland Park, Johannesburg',3,'',7,1),(8,'2021-03-01 11:15:00.752749','3','37 Cookham road, Auckland Park, Johannesburg',3,'',7,1),(9,'2021-03-01 11:15:00.756293','2','37 Cookham road, Auckland Park, Johannesburg',3,'',7,1),(10,'2021-03-01 11:15:00.758966','1','154 Shamrock Street, Florida, Johannesburg, South Africa',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'weather','apikeys'),(7,'weather','requests');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-26 18:28:05.811083'),(2,'auth','0001_initial','2021-02-26 18:28:06.003171'),(3,'admin','0001_initial','2021-02-26 18:28:06.730697'),(4,'admin','0002_logentry_remove_auto_add','2021-02-26 18:28:06.893900'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-26 18:28:06.911669'),(6,'contenttypes','0002_remove_content_type_name','2021-02-26 18:28:06.993342'),(7,'auth','0002_alter_permission_name_max_length','2021-02-26 18:28:07.043691'),(8,'auth','0003_alter_user_email_max_length','2021-02-26 18:28:07.068192'),(9,'auth','0004_alter_user_username_opts','2021-02-26 18:28:07.080532'),(10,'auth','0005_alter_user_last_login_null','2021-02-26 18:28:07.129253'),(11,'auth','0006_require_contenttypes_0002','2021-02-26 18:28:07.132877'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-26 18:28:07.141729'),(13,'auth','0008_alter_user_username_max_length','2021-02-26 18:28:07.208582'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-26 18:28:07.267820'),(15,'auth','0010_alter_group_name_max_length','2021-02-26 18:28:07.291242'),(16,'auth','0011_update_proxy_permissions','2021-02-26 18:28:07.303182'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-26 18:28:07.360284'),(18,'sessions','0001_initial','2021-02-26 18:28:07.402235'),(19,'weather','0001_initial','2021-02-26 18:28:07.517411'),(20,'weather','0002_auto_20210226_1834','2021-02-26 18:34:58.210017'),(21,'weather','0003_auto_20210228_1520','2021-02-28 15:20:13.860118');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('t9wwe7cwnitto2p5qvkwb6zbvoihworz','ZGRhMDRiZGM3NGQ2ZGFlOWY2YjdjZTE2ZmQyNjgxYzA4Y2VhYjI1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMjM4ZDE3YjhhZjNmZWUyOWQzZTE4NjMwMjdiNjFjOTMyZGE5M2IyIn0=','2021-03-15 08:41:18.323342');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_apikeys`
--

DROP TABLE IF EXISTS `weather_apikeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_apikeys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_name` varchar(256) NOT NULL,
  `key_value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_apikeys`
--

LOCK TABLES `weather_apikeys` WRITE;
/*!40000 ALTER TABLE `weather_apikeys` DISABLE KEYS */;
INSERT INTO `weather_apikeys` VALUES (3,'openweathermap.org','a15fafa5e9a0844798797ca91d98a2bd'),(4,'mapbox.com','pk.eyJ1IjoicmVlejAiLCJhIjoiY2tsbnI4cXQ3MGxxNzJucXlocjh1dXQ5ayJ9.pMlxZdsoApDQdMl64tYhqw');
/*!40000 ALTER TABLE `weather_apikeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_requests`
--

DROP TABLE IF EXISTS `weather_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_timestamp` date NOT NULL,
  `request_address` varchar(100) NOT NULL,
  `request_response_data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_requests`
--

LOCK TABLES `weather_requests` WRITE;
/*!40000 ALTER TABLE `weather_requests` DISABLE KEYS */;
INSERT INTO `weather_requests` VALUES (5,'2021-03-01','37 Cookham road, Auckland Park, Johannesburg','{\"current_weather\":{\"coord\":{\"lon\":28.0056,\"lat\":-26.1859},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":22.08,\"feels_like\":20.8,\"temp_min\":21.11,\"temp_max\":23.33,\"pressure\":1016,\"humidity\":56},\"visibility\":10000,\"wind\":{\"speed\":3.11,\"deg\":85},\"clouds\":{\"all\":0},\"dt\":1614597307,\"sys\":{\"type\":3,\"id\":2005686,\"country\":\"ZA\",\"sunrise\":1614571310,\"sunset\":1614616749},\"timezone\":7200,\"id\":7778818,\"name\":\"Auckland Park\",\"cod\":200},\"weather_forecast\":{\"lat\":-26.1859,\"lon\":28.0056,\"timezone\":\"Africa/Johannesburg\",\"timezone_offset\":7200,\"hourly\":[{\"dt\":1614596400,\"temp\":22.23,\"feels_like\":20.82,\"pressure\":1016,\"humidity\":54,\"dew_point\":12.49,\"uvi\":12.86,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.11,\"wind_deg\":85,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614600000,\"temp\":23.17,\"feels_like\":20.39,\"pressure\":1016,\"humidity\":37,\"dew_point\":7.69,\"uvi\":10.18,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.19,\"wind_deg\":86,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614603600,\"temp\":23.95,\"feels_like\":20.18,\"pressure\":1016,\"humidity\":27,\"dew_point\":3.83,\"uvi\":6.57,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.44,\"wind_deg\":91,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614607200,\"temp\":23.97,\"feels_like\":19.59,\"pressure\":1015,\"humidity\":23,\"dew_point\":1.59,\"uvi\":3.21,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.77,\"wind_deg\":93,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614610800,\"temp\":23.46,\"feels_like\":18.98,\"pressure\":1015,\"humidity\":23,\"dew_point\":1.16,\"uvi\":1.02,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.81,\"wind_deg\":90,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614614400,\"temp\":22.37,\"feels_like\":18.54,\"pressure\":1015,\"humidity\":27,\"dew_point\":2.73,\"uvi\":0.13,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.19,\"wind_deg\":76,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614618000,\"temp\":21,\"feels_like\":17.54,\"pressure\":1017,\"humidity\":30,\"dew_point\":3.11,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.73,\"wind_deg\":52,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614621600,\"temp\":20.15,\"feels_like\":16.89,\"pressure\":1018,\"humidity\":33,\"dew_point\":3.59,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.6,\"wind_deg\":12,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614625200,\"temp\":19.01,\"feels_like\":14.99,\"pressure\":1019,\"humidity\":38,\"dew_point\":4.54,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.96,\"wind_deg\":352,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614628800,\"temp\":17.59,\"feels_like\":14.12,\"pressure\":1019,\"humidity\":48,\"dew_point\":6.57,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.78,\"wind_deg\":357,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614632400,\"temp\":17.13,\"feels_like\":14.29,\"pressure\":1019,\"humidity\":53,\"dew_point\":7.52,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.22,\"wind_deg\":15,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614636000,\"temp\":16.71,\"feels_like\":13.99,\"pressure\":1020,\"humidity\":55,\"dew_point\":7.81,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.1,\"wind_deg\":29,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614639600,\"temp\":16.19,\"feels_like\":13.46,\"pressure\":1020,\"humidity\":58,\"dew_point\":7.96,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.21,\"wind_deg\":36,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614643200,\"temp\":15.81,\"feels_like\":13.38,\"pressure\":1020,\"humidity\":59,\"dew_point\":7.85,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.74,\"wind_deg\":21,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614646800,\"temp\":15.53,\"feels_like\":13.12,\"pressure\":1020,\"humidity\":59,\"dew_point\":7.81,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.62,\"wind_deg\":12,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614650400,\"temp\":15.21,\"feels_like\":12.96,\"pressure\":1020,\"humidity\":61,\"dew_point\":7.97,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.46,\"wind_deg\":3,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614654000,\"temp\":14.87,\"feels_like\":12.87,\"pressure\":1020,\"humidity\":64,\"dew_point\":8.21,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.24,\"wind_deg\":353,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614657600,\"temp\":14.53,\"feels_like\":12.6,\"pressure\":1021,\"humidity\":66,\"dew_point\":8.42,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.18,\"wind_deg\":338,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614661200,\"temp\":15.11,\"feels_like\":13.26,\"pressure\":1021,\"humidity\":65,\"dew_point\":8.72,\"uvi\":0.64,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.18,\"wind_deg\":327,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614664800,\"temp\":16.61,\"feels_like\":14.55,\"pressure\":1021,\"humidity\":59,\"dew_point\":8.78,\"uvi\":2.46,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.47,\"wind_deg\":317,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614668400,\"temp\":18.41,\"feels_like\":16.25,\"pressure\":1020,\"humidity\":52,\"dew_point\":8.5,\"uvi\":5.63,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.55,\"wind_deg\":304,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614672000,\"temp\":20.59,\"feels_like\":18.44,\"pressure\":1019,\"humidity\":43,\"dew_point\":7.7,\"uvi\":9.36,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.26,\"wind_deg\":292,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614675600,\"temp\":22.63,\"feels_like\":20.42,\"pressure\":1018,\"humidity\":35,\"dew_point\":6.7,\"uvi\":12.46,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.97,\"wind_deg\":264,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614679200,\"temp\":24.12,\"feels_like\":21.77,\"pressure\":1016,\"humidity\":31,\"dew_point\":5.96,\"uvi\":13.65,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.02,\"wind_deg\":239,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614682800,\"temp\":24.98,\"feels_like\":22.55,\"pressure\":1015,\"humidity\":28,\"dew_point\":5.42,\"uvi\":12.85,\"clouds\":5,\"visibility\":10000,\"wind_speed\":1.92,\"wind_deg\":227,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614686400,\"temp\":25.19,\"feels_like\":22.83,\"pressure\":1014,\"humidity\":27,\"dew_point\":5.28,\"uvi\":10.16,\"clouds\":14,\"visibility\":10000,\"wind_speed\":1.73,\"wind_deg\":215,\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02d\"}],\"pop\":0},{\"dt\":1614690000,\"temp\":24.48,\"feels_like\":22.08,\"pressure\":1013,\"humidity\":29,\"dew_point\":5.35,\"uvi\":5.4,\"clouds\":61,\"visibility\":10000,\"wind_speed\":1.9,\"wind_deg\":181,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614693600,\"temp\":24.06,\"feels_like\":21.64,\"pressure\":1013,\"humidity\":29,\"dew_point\":5.27,\"uvi\":2.63,\"clouds\":72,\"visibility\":10000,\"wind_speed\":1.82,\"wind_deg\":156,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614697200,\"temp\":23.77,\"feels_like\":21.97,\"pressure\":1012,\"humidity\":30,\"dew_point\":5.19,\"uvi\":0.83,\"clouds\":70,\"visibility\":10000,\"wind_speed\":1.01,\"wind_deg\":111,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614700800,\"temp\":23.14,\"feels_like\":21.61,\"pressure\":1012,\"humidity\":31,\"dew_point\":5.2,\"uvi\":0.04,\"clouds\":65,\"visibility\":10000,\"wind_speed\":0.6,\"wind_deg\":13,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614704400,\"temp\":21.72,\"feels_like\":19.94,\"pressure\":1013,\"humidity\":35,\"dew_point\":5.8,\"uvi\":0,\"clouds\":56,\"visibility\":10000,\"wind_speed\":1.1,\"wind_deg\":348,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"pop\":0},{\"dt\":1614708000,\"temp\":21.13,\"feels_like\":19.22,\"pressure\":1014,\"humidity\":38,\"dew_point\":6.48,\"uvi\":0,\"clouds\":50,\"visibility\":10000,\"wind_speed\":1.5,\"wind_deg\":344,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614711600,\"temp\":20.51,\"feels_like\":18.76,\"pressure\":1016,\"humidity\":41,\"dew_point\":6.87,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.44,\"wind_deg\":320,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614715200,\"temp\":19.95,\"feels_like\":18.47,\"pressure\":1017,\"humidity\":41,\"dew_point\":6.52,\"uvi\":0,\"clouds\":6,\"visibility\":10000,\"wind_speed\":0.9,\"wind_deg\":283,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614718800,\"temp\":19.96,\"feels_like\":18.22,\"pressure\":1017,\"humidity\":40,\"dew_point\":6.27,\"uvi\":0,\"clouds\":28,\"visibility\":10000,\"wind_speed\":1.16,\"wind_deg\":251,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614722400,\"temp\":19.52,\"feels_like\":17.9,\"pressure\":1017,\"humidity\":41,\"dew_point\":6.28,\"uvi\":0,\"clouds\":42,\"visibility\":10000,\"wind_speed\":0.98,\"wind_deg\":168,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614726000,\"temp\":18.62,\"feels_like\":17.08,\"pressure\":1016,\"humidity\":44,\"dew_point\":6.38,\"uvi\":0,\"clouds\":35,\"visibility\":10000,\"wind_speed\":0.93,\"wind_deg\":96,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614729600,\"temp\":18.02,\"feels_like\":16.35,\"pressure\":1016,\"humidity\":47,\"dew_point\":6.74,\"uvi\":0,\"clouds\":29,\"visibility\":10000,\"wind_speed\":1.24,\"wind_deg\":77,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614733200,\"temp\":17.17,\"feels_like\":15.35,\"pressure\":1016,\"humidity\":53,\"dew_point\":7.64,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.77,\"wind_deg\":70,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614736800,\"temp\":16.73,\"feels_like\":14.92,\"pressure\":1016,\"humidity\":57,\"dew_point\":8.21,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.98,\"wind_deg\":51,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614740400,\"temp\":16.42,\"feels_like\":14.56,\"pressure\":1017,\"humidity\":59,\"dew_point\":8.42,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.12,\"wind_deg\":32,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614744000,\"temp\":16.05,\"feels_like\":14.35,\"pressure\":1017,\"humidity\":61,\"dew_point\":8.73,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.95,\"wind_deg\":21,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614747600,\"temp\":16.63,\"feels_like\":15.27,\"pressure\":1017,\"humidity\":61,\"dew_point\":9.23,\"uvi\":0.64,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.66,\"wind_deg\":12,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614751200,\"temp\":18.42,\"feels_like\":17.07,\"pressure\":1016,\"humidity\":55,\"dew_point\":9.28,\"uvi\":2.46,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.7,\"wind_deg\":4,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614754800,\"temp\":20.82,\"feels_like\":19.16,\"pressure\":1015,\"humidity\":44,\"dew_point\":8.22,\"uvi\":5.58,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.75,\"wind_deg\":0,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614758400,\"temp\":23.51,\"feels_like\":21.86,\"pressure\":1015,\"humidity\":33,\"dew_point\":6.53,\"uvi\":9.29,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.14,\"wind_deg\":20,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614762000,\"temp\":25.59,\"feels_like\":23.74,\"pressure\":1014,\"humidity\":27,\"dew_point\":5.58,\"uvi\":12.38,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.09,\"wind_deg\":105,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614765600,\"temp\":26.88,\"feels_like\":24.07,\"pressure\":1013,\"humidity\":23,\"dew_point\":4.16,\"uvi\":13.79,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.13,\"wind_deg\":130,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0}]}}'),(6,'2021-03-01','25 Johan Oosthuizen Road, Florida Hills, Johannesburg, South Africa','{\"current_weather\":{\"coord\":{\"lon\":27.93,\"lat\":-26.16},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":21.85,\"feels_like\":21.93,\"temp_min\":21.11,\"temp_max\":22.22,\"pressure\":1032,\"humidity\":51},\"visibility\":10000,\"wind\":{\"speed\":0.45,\"deg\":79,\"gust\":4.02},\"clouds\":{\"all\":0},\"dt\":1614597731,\"sys\":{\"type\":3,\"id\":2008899,\"country\":\"ZA\",\"sunrise\":1614571329,\"sunset\":1614616766},\"timezone\":7200,\"id\":7870410,\"name\":\"Albertskroon\",\"cod\":200},\"weather_forecast\":{\"lat\":-26.16,\"lon\":27.93,\"timezone\":\"Africa/Johannesburg\",\"timezone_offset\":7200,\"hourly\":[{\"dt\":1614596400,\"temp\":21.85,\"feels_like\":20.17,\"pressure\":1032,\"humidity\":51,\"dew_point\":11.27,\"uvi\":12.98,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.97,\"wind_deg\":79,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614600000,\"temp\":23.07,\"feels_like\":20.28,\"pressure\":1025,\"humidity\":35,\"dew_point\":6.79,\"uvi\":10.34,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.92,\"wind_deg\":78,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614603600,\"temp\":24.03,\"feels_like\":20.49,\"pressure\":1019,\"humidity\":26,\"dew_point\":3.36,\"uvi\":6.74,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3,\"wind_deg\":82,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614607200,\"temp\":24.18,\"feels_like\":20.13,\"pressure\":1016,\"humidity\":22,\"dew_point\":1.14,\"uvi\":3.33,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.19,\"wind_deg\":84,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614610800,\"temp\":23.66,\"feels_like\":19.68,\"pressure\":1015,\"humidity\":24,\"dew_point\":1.92,\"uvi\":1.07,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.27,\"wind_deg\":82,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614614400,\"temp\":22.34,\"feels_like\":18.91,\"pressure\":1015,\"humidity\":28,\"dew_point\":3.33,\"uvi\":0.15,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.74,\"wind_deg\":67,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614618000,\"temp\":20.58,\"feels_like\":17.38,\"pressure\":1017,\"humidity\":32,\"dew_point\":3.39,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.5,\"wind_deg\":33,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614621600,\"temp\":19.48,\"feels_like\":16.01,\"pressure\":1018,\"humidity\":35,\"dew_point\":3.83,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.97,\"wind_deg\":358,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614625200,\"temp\":18.5,\"feels_like\":14.5,\"pressure\":1019,\"humidity\":39,\"dew_point\":4.65,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.91,\"wind_deg\":355,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614628800,\"temp\":17.33,\"feels_like\":13.9,\"pressure\":1019,\"humidity\":48,\"dew_point\":6.27,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.65,\"wind_deg\":1,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614632400,\"temp\":16.86,\"feels_like\":14,\"pressure\":1019,\"humidity\":53,\"dew_point\":7.31,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.16,\"wind_deg\":19,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614636000,\"temp\":16.41,\"feels_like\":13.63,\"pressure\":1020,\"humidity\":56,\"dew_point\":7.83,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.17,\"wind_deg\":30,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614639600,\"temp\":15.96,\"feels_like\":13.17,\"pressure\":1020,\"humidity\":59,\"dew_point\":8.02,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":3.31,\"wind_deg\":36,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614643200,\"temp\":15.59,\"feels_like\":13.07,\"pressure\":1020,\"humidity\":60,\"dew_point\":7.97,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.88,\"wind_deg\":24,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614646800,\"temp\":15.29,\"feels_like\":12.87,\"pressure\":1020,\"humidity\":61,\"dew_point\":7.97,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.73,\"wind_deg\":13,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614650400,\"temp\":14.95,\"feels_like\":12.65,\"pressure\":1020,\"humidity\":63,\"dew_point\":8.17,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.61,\"wind_deg\":4,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614654000,\"temp\":14.57,\"feels_like\":12.5,\"pressure\":1020,\"humidity\":66,\"dew_point\":8.38,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.4,\"wind_deg\":354,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614657600,\"temp\":14.18,\"feels_like\":12.19,\"pressure\":1020,\"humidity\":68,\"dew_point\":8.55,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.3,\"wind_deg\":341,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614661200,\"temp\":15.02,\"feels_like\":13.18,\"pressure\":1021,\"humidity\":66,\"dew_point\":8.95,\"uvi\":0.62,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.21,\"wind_deg\":329,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614664800,\"temp\":16.55,\"feels_like\":14.53,\"pressure\":1021,\"humidity\":61,\"dew_point\":9.1,\"uvi\":2.39,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.58,\"wind_deg\":316,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614668400,\"temp\":18.32,\"feels_like\":16.17,\"pressure\":1020,\"humidity\":54,\"dew_point\":8.98,\"uvi\":5.49,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.7,\"wind_deg\":304,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614672000,\"temp\":20.43,\"feels_like\":18.26,\"pressure\":1019,\"humidity\":45,\"dew_point\":8.32,\"uvi\":9.2,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.46,\"wind_deg\":294,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614675600,\"temp\":22.38,\"feels_like\":20.22,\"pressure\":1018,\"humidity\":38,\"dew_point\":7.41,\"uvi\":12.33,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.2,\"wind_deg\":271,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614679200,\"temp\":23.88,\"feels_like\":21.61,\"pressure\":1016,\"humidity\":33,\"dew_point\":6.7,\"uvi\":13.6,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.12,\"wind_deg\":248,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614682800,\"temp\":24.68,\"feels_like\":22.4,\"pressure\":1015,\"humidity\":30,\"dew_point\":6.17,\"uvi\":12.87,\"clouds\":8,\"visibility\":10000,\"wind_speed\":1.93,\"wind_deg\":240,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614686400,\"temp\":24.89,\"feels_like\":22.65,\"pressure\":1014,\"humidity\":29,\"dew_point\":5.98,\"uvi\":10.24,\"clouds\":17,\"visibility\":10000,\"wind_speed\":1.78,\"wind_deg\":236,\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02d\"}],\"pop\":0},{\"dt\":1614690000,\"temp\":24.61,\"feels_like\":22.47,\"pressure\":1013,\"humidity\":30,\"dew_point\":5.92,\"uvi\":5.16,\"clouds\":62,\"visibility\":10000,\"wind_speed\":1.7,\"wind_deg\":209,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614693600,\"temp\":24.22,\"feels_like\":22.13,\"pressure\":1013,\"humidity\":30,\"dew_point\":5.81,\"uvi\":2.54,\"clouds\":72,\"visibility\":10000,\"wind_speed\":1.53,\"wind_deg\":178,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614697200,\"temp\":23.8,\"feels_like\":22.28,\"pressure\":1012,\"humidity\":31,\"dew_point\":5.95,\"uvi\":0.81,\"clouds\":72,\"visibility\":10000,\"wind_speed\":0.75,\"wind_deg\":134,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614700800,\"temp\":23.03,\"feels_like\":21.74,\"pressure\":1012,\"humidity\":32,\"dew_point\":5.91,\"uvi\":0.09,\"clouds\":68,\"visibility\":10000,\"wind_speed\":0.36,\"wind_deg\":4,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"pop\":0},{\"dt\":1614704400,\"temp\":21.35,\"feels_like\":19.72,\"pressure\":1013,\"humidity\":36,\"dew_point\":6.02,\"uvi\":0,\"clouds\":57,\"visibility\":10000,\"wind_speed\":0.92,\"wind_deg\":328,\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"pop\":0},{\"dt\":1614708000,\"temp\":20.62,\"feels_like\":18.84,\"pressure\":1014,\"humidity\":39,\"dew_point\":6.47,\"uvi\":0,\"clouds\":50,\"visibility\":10000,\"wind_speed\":1.29,\"wind_deg\":326,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614711600,\"temp\":20,\"feels_like\":18.2,\"pressure\":1016,\"humidity\":42,\"dew_point\":6.84,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.48,\"wind_deg\":301,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614715200,\"temp\":19.37,\"feels_like\":17.68,\"pressure\":1017,\"humidity\":44,\"dew_point\":6.83,\"uvi\":0,\"clouds\":4,\"visibility\":10000,\"wind_speed\":1.35,\"wind_deg\":274,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614718800,\"temp\":19.18,\"feels_like\":17.45,\"pressure\":1017,\"humidity\":44,\"dew_point\":6.79,\"uvi\":0,\"clouds\":20,\"visibility\":10000,\"wind_speed\":1.35,\"wind_deg\":254,\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02n\"}],\"pop\":0},{\"dt\":1614722400,\"temp\":18.84,\"feels_like\":17.42,\"pressure\":1017,\"humidity\":45,\"dew_point\":6.81,\"uvi\":0,\"clouds\":32,\"visibility\":10000,\"wind_speed\":0.92,\"wind_deg\":195,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614726000,\"temp\":18.27,\"feels_like\":17.04,\"pressure\":1016,\"humidity\":47,\"dew_point\":6.81,\"uvi\":0,\"clouds\":28,\"visibility\":10000,\"wind_speed\":0.68,\"wind_deg\":122,\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03n\"}],\"pop\":0},{\"dt\":1614729600,\"temp\":17.65,\"feels_like\":16.25,\"pressure\":1016,\"humidity\":49,\"dew_point\":6.98,\"uvi\":0,\"clouds\":23,\"visibility\":10000,\"wind_speed\":0.94,\"wind_deg\":79,\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02n\"}],\"pop\":0},{\"dt\":1614733200,\"temp\":16.86,\"feels_like\":15.12,\"pressure\":1016,\"humidity\":53,\"dew_point\":7.48,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.56,\"wind_deg\":73,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614736800,\"temp\":16.49,\"feels_like\":14.63,\"pressure\":1016,\"humidity\":57,\"dew_point\":8.02,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.97,\"wind_deg\":55,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614740400,\"temp\":16.14,\"feels_like\":14.22,\"pressure\":1017,\"humidity\":60,\"dew_point\":8.49,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.2,\"wind_deg\":33,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614744000,\"temp\":15.68,\"feels_like\":13.99,\"pressure\":1017,\"humidity\":64,\"dew_point\":8.96,\"uvi\":0,\"clouds\":0,\"visibility\":10000,\"wind_speed\":2.07,\"wind_deg\":23,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"pop\":0},{\"dt\":1614747600,\"temp\":16.5,\"feels_like\":15.27,\"pressure\":1017,\"humidity\":64,\"dew_point\":9.7,\"uvi\":0.61,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.7,\"wind_deg\":16,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614751200,\"temp\":18.38,\"feels_like\":17.04,\"pressure\":1016,\"humidity\":56,\"dew_point\":9.72,\"uvi\":2.37,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.76,\"wind_deg\":7,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614754800,\"temp\":20.71,\"feels_like\":19.13,\"pressure\":1015,\"humidity\":46,\"dew_point\":8.83,\"uvi\":5.48,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.83,\"wind_deg\":1,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614758400,\"temp\":23.29,\"feels_like\":21.69,\"pressure\":1015,\"humidity\":35,\"dew_point\":7.35,\"uvi\":9.2,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.27,\"wind_deg\":9,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614762000,\"temp\":25.52,\"feels_like\":24.08,\"pressure\":1014,\"humidity\":29,\"dew_point\":6.45,\"uvi\":12.35,\"clouds\":0,\"visibility\":10000,\"wind_speed\":0.8,\"wind_deg\":98,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0},{\"dt\":1614765600,\"temp\":26.94,\"feels_like\":24.57,\"pressure\":1013,\"humidity\":24,\"dew_point\":5.12,\"uvi\":13.87,\"clouds\":0,\"visibility\":10000,\"wind_speed\":1.68,\"wind_deg\":132,\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"pop\":0}]}}');
/*!40000 ALTER TABLE `weather_requests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-01 13:29:37
