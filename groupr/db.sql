-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: grouprsp_cs411
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available`
--

DROP TABLE IF EXISTS `available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `available` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `day` varchar(10) NOT NULL DEFAULT '',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`netId`,`day`,`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available`
--

LOCK TABLES `available` WRITE;
/*!40000 ALTER TABLE `available` DISABLE KEYS */;
/*!40000 ALTER TABLE `available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouplangs`
--

DROP TABLE IF EXISTS `grouplangs`;
/*!50001 DROP VIEW IF EXISTS `grouplangs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouplangs` (
  `languageName` tinyint NOT NULL,
  `groupId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `numberOfMembers` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (128,'optimal0',0,NULL),(129,'optimal1',0,NULL),(130,'optimal2',0,NULL),(131,'optimal3',0,NULL),(132,'optimal4',0,NULL),(133,'optimal5',0,NULL),(134,'optimal6',0,NULL),(135,'optimal7',0,NULL),(136,'optimal8',0,NULL),(137,'optimal9',0,NULL),(138,'optimal10',0,NULL),(139,'optimal11',0,NULL),(140,'optimal12',0,NULL),(141,'optimal13',0,NULL),(142,'optimal14',0,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idea`
--

DROP TABLE IF EXISTS `idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idea` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `projectId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`netId`,`projectId`),
  KEY `projectId` (`projectId`),
  CONSTRAINT `idea_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE,
  CONSTRAINT `idea_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idea`
--

LOCK TABLES `idea` WRITE;
/*!40000 ALTER TABLE `idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `name` varchar(50) NOT NULL,
  `className` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (''),(' python'),('angularjs'),('applescript'),('assembly'),('c'),('c#'),('c++'),('cs'),('css'),('d3.js'),('django'),('flash'),('flask'),('go'),('google api'),('html'),('java'),('jquery'),('js'),('m c'),('matlab'),('mongodb'),('mysql'),('node.js'),('objective-c'),('perl'),('php'),('plsql'),('python'),('r'),('ruby'),('sas'),('sass'),('sql'),('swift'),('webgl'),('xml');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languagesdesired`
--

DROP TABLE IF EXISTS `languagesdesired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languagesdesired` (
  `languageName` varchar(20) NOT NULL DEFAULT '',
  `netId` varchar(10) NOT NULL DEFAULT '',
  `proficiency` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`languageName`,`netId`),
  KEY `netId` (`netId`),
  CONSTRAINT `languagesdesired_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languagesdesired`
--

LOCK TABLES `languagesdesired` WRITE;
/*!40000 ALTER TABLE `languagesdesired` DISABLE KEYS */;
INSERT INTO `languagesdesired` VALUES ('','ahardley1',NULL),('','amellon1',NULL),('','awang1',NULL),('','jpeters1',NULL),('','kmellon1',NULL),('','mling1',NULL),('','rlongho1',NULL),('','rogers1',NULL),('','rwales1',NULL),('','rwells1',NULL),('','tbales1',NULL),('','tdolan1',NULL),('','wgallow1',NULL),(' python','flord1',NULL),('angularjs','agordon1',NULL),('angularjs','schen1',NULL),('applescript','chapman2',NULL),('assembly','awang1',NULL),('assembly','jrhodes1',NULL),('c','ahardley1',NULL),('c','aharper1',NULL),('c','awang1',NULL),('c','bjorklund1',NULL),('c','cfafnir',NULL),('c','dthomps1',NULL),('c','jrhodes1',NULL),('c','mcooper1',NULL),('c','msmith1',NULL),('c','rlanster1',NULL),('c','rlongho1',NULL),('c','sacks1',NULL),('c++','ahardley1',NULL),('c++','bjorklund1',NULL),('c++','dthomps1',NULL),('c++','jpeters1',NULL),('c++','mcooper1',NULL),('c++','mjianga1',NULL),('c++','msmith1',NULL),('c++','npeters1',NULL),('c++','rlanster1',NULL),('c++','rlongho1',NULL),('c++','tsorrel1',NULL),('css','aharper1',NULL),('css','amellon1',NULL),('css','bcharles1',NULL),('css','bmiller1',NULL),('css','gmorgan1',NULL),('css','hdillan1',NULL),('css','jdolan1',NULL),('css','jjacobs1',NULL),('css','jlee1',NULL),('css','jlong1',NULL),('css','kbaker1',NULL),('css','kjacobs1',NULL),('css','lundgren1',NULL),('css','tbales1',NULL),('css','tturner1',NULL),('django','amellon1',NULL),('django','flord1',NULL),('go','mdonalds1',NULL),('html','aharper1',NULL),('html','amellon1',NULL),('html','bcharles1',NULL),('html','bmiller1',NULL),('html','dthomps1',NULL),('html','gmorgan1',NULL),('html','hdillan1',NULL),('html','jdolan1',NULL),('html','jjacobs1',NULL),('html','jlee1',NULL),('html','jlong1',NULL),('html','kbaker1',NULL),('html','kjacobs1',NULL),('html','lundgren1',NULL),('html','pcampbe1',NULL),('html','tbales1',NULL),('html','tturner1',NULL),('html','ysmith1',NULL),('java','bcharles1',NULL),('java','bjorklund1',NULL),('java','cfafnir',NULL),('java','ghosh1',NULL),('java','jrhodes1',NULL),('java','rwells1',NULL),('java','tsorrel1',NULL),('java','ysmith1',NULL),('jquery','rogers1',NULL),('jquery','tbales1',NULL),('js','aharper1',NULL),('js','awang1',NULL),('js','flord1',NULL),('js','ghosh1',NULL),('js','jdolan1',NULL),('js','jjacobs1',NULL),('js','jlee1',NULL),('js','kbaker1',NULL),('js','kjacobs1',NULL),('js','lundgren1',NULL),('js','mbovert1',NULL),('js','mdonalds1',NULL),('js','mthomp1',NULL),('js','pcampbe1',NULL),('js','sacks1',NULL),('js','tbales1',NULL),('matlab','sacks1',NULL),('mysql','mdonalds1',NULL),('objective-c','chapman2',NULL),('objective-c','jlee1',NULL),('objective-c','mdonalds1',NULL),('php','agordon1',NULL),('php','ahardley1',NULL),('php','amiller1',NULL),('php','dthomps1',NULL),('php','handers1',NULL),('php','jpeters1',NULL),('php','rlanster1',NULL),('php','rlongho1',NULL),('php','rmiller1',NULL),('php','rwales1',NULL),('python','amellon1',NULL),('python','bsanders1',NULL),('python','crobin1',NULL),('python','ghosh1',NULL),('python','gmorgan1',NULL),('python','jrhodes1',NULL),('python','kmellon1',NULL),('python','mdonalds1',NULL),('python','mling1',NULL),('python','npeters1',NULL),('python','rwells1',NULL),('python','schen1',NULL),('python','tdolan1',NULL),('python','tsorrel1',NULL),('python','wgallow1',NULL),('r','sacks1',NULL),('ruby','rmiller1',NULL),('sass','flord1',NULL),('sql','amiller1',NULL),('sql','cfafnir',NULL),('sql','chapman2',NULL),('sql','gmorgan1',NULL),('sql','handers1',NULL),('sql','iwellin1',NULL),('sql','jpeters1',NULL),('sql','mjianga1',NULL),('sql','mling1',NULL),('sql','myoung1',NULL),('sql','phuey1',NULL),('sql','rlanster1',NULL),('sql','rlongho1',NULL),('sql','rmiller1',NULL),('sql','sacks1',NULL),('sql','wgallow1',NULL),('swift','agordon1',NULL),('swift','chapman2',NULL),('swift','rogers1',NULL),('swift','rwales1',NULL),('webgl','kmellon1',NULL),('xml','ysmith1',NULL);
/*!40000 ALTER TABLE `languagesdesired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languagesknown`
--

DROP TABLE IF EXISTS `languagesknown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languagesknown` (
  `languageName` varchar(20) NOT NULL DEFAULT '',
  `netId` varchar(10) NOT NULL DEFAULT '',
  `proficiency` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`languageName`,`netId`),
  KEY `netId` (`netId`),
  CONSTRAINT `languagesknown_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languagesknown`
--

LOCK TABLES `languagesknown` WRITE;
/*!40000 ALTER TABLE `languagesknown` DISABLE KEYS */;
INSERT INTO `languagesknown` VALUES ('','bcharles1',NULL),('','kbaker1',NULL),('','kmellon1',NULL),('','mdonalds1',NULL),('','mling1',NULL),('','msmith1',NULL),('','rogers1',NULL),('','rwells1',NULL),('','tdolan1',NULL),('','wgallow1',NULL),('angularjs','dthomps1',NULL),('angularjs','jlong1',NULL),('angularjs','jrhodes1',NULL),('angularjs','rwales1',NULL),('applescript','nallen1',NULL),('assembly','rwells1',NULL),('c','bcharles1',NULL),('c','handers1',NULL),('c','iwellin1',NULL),('c','kbaker1',NULL),('c','kmellon1',NULL),('c','mling1',NULL),('c','nallen1',NULL),('c','rmiller1',NULL),('c','sacks1',NULL),('c#','awang1',NULL),('c#','hdillan1',NULL),('c#','sacks1',NULL),('c++','agordon1',NULL),('c++','aharper1',NULL),('c++','amiller1',NULL),('c++','awang1',NULL),('c++','bcharles1',NULL),('c++','bjorklund1',NULL),('c++','bmiller1',NULL),('c++','crobin1',NULL),('c++','ghosh1',NULL),('c++','gmorgan1',NULL),('c++','handers1',NULL),('c++','hdillan1',NULL),('c++','iwellin1',NULL),('c++','jdolan1',NULL),('c++','jjacobs1',NULL),('c++','jlee1',NULL),('c++','jpeters1',NULL),('c++','jrhodes1',NULL),('c++','kjacobs1',NULL),('c++','kmellon1',NULL),('c++','lcarters1',NULL),('c++','mling1',NULL),('c++','mthomp1',NULL),('c++','nallen1',NULL),('c++','pcampbe1',NULL),('c++','phuey1',NULL),('c++','rlanster1',NULL),('c++','rmiller1',NULL),('c++','rogers1',NULL),('c++','rwells1',NULL),('c++','sacks1',NULL),('c++','schen1',NULL),('c++','tdolan1',NULL),('c++','tsorrel1',NULL),('c++','tturner1',NULL),('c++','ysmith1',NULL),('cs','jrhodes1',NULL),('css','aharper1',NULL),('css','bjorklund1',NULL),('css','chapman2',NULL),('css','flord1',NULL),('css','ghosh1',NULL),('css','mdonalds1',NULL),('css','msmith1',NULL),('css','myoung1',NULL),('css','nallen1',NULL),('css','npeters1',NULL),('css','rlanster1',NULL),('css','rlongho1',NULL),('css','schen1',NULL),('d3.js','cfafnir',NULL),('flash','kmellon1',NULL),('flask','amiller1',NULL),('go','mdonalds1',NULL),('google api','kmellon1',NULL),('html','agordon1',NULL),('html','aharper1',NULL),('html','bjorklund1',NULL),('html','chapman2',NULL),('html','flord1',NULL),('html','ghosh1',NULL),('html','iwellin1',NULL),('html','jrhodes1',NULL),('html','mdonalds1',NULL),('html','msmith1',NULL),('html','myoung1',NULL),('html','npeters1',NULL),('html','rlanster1',NULL),('html','rlongho1',NULL),('html','schen1',NULL),('java','agordon1',NULL),('java','ahardley1',NULL),('java','awang1',NULL),('java','bjorklund1',NULL),('java','bmiller1',NULL),('java','chapman2',NULL),('java','crobin1',NULL),('java','dthomps1',NULL),('java','ghosh1',NULL),('java','iwellin1',NULL),('java','jjacobs1',NULL),('java','jlong1',NULL),('java','jrhodes1',NULL),('java','kbaker1',NULL),('java','kjacobs1',NULL),('java','kmellon1',NULL),('java','mbovert1',NULL),('java','mdonalds1',NULL),('java','mjianga1',NULL),('java','mling1',NULL),('java','mthomp1',NULL),('java','myoung1',NULL),('java','nallen1',NULL),('java','pcampbe1',NULL),('java','rogers1',NULL),('java','rwales1',NULL),('java','sacks1',NULL),('java','tdolan1',NULL),('java','tsorrel1',NULL),('java','tturner1',NULL),('java','wgallow1',NULL),('java','ysmith1',NULL),('jquery','ghosh1',NULL),('jquery','wgallow1',NULL),('js','agordon1',NULL),('js','aharper1',NULL),('js','bcharles1',NULL),('js','bjorklund1',NULL),('js','bmiller1',NULL),('js','bsanders1',NULL),('js','chapman2',NULL),('js','dthomps1',NULL),('js','iwellin1',NULL),('js','jrhodes1',NULL),('js','kmellon1',NULL),('js','lundgren1',NULL),('js','mdonalds1',NULL),('js','msmith1',NULL),('js','myoung1',NULL),('js','npeters1',NULL),('js','rlanster1',NULL),('js','rlongho1',NULL),('js','rwales1',NULL),('js','schen1',NULL),('js','tdolan1',NULL),('matlab','bjorklund1',NULL),('matlab','sacks1',NULL),('mongodb','wgallow1',NULL),('mysql','amellon1',NULL),('mysql','bsanders1',NULL),('mysql','mdonalds1',NULL),('mysql','npeters1',NULL),('mysql','tbales1',NULL),('mysql','tdolan1',NULL),('node.js','mdonalds1',NULL),('objective-c','chapman2',NULL),('objective-c','mcooper1',NULL),('objective-c','mdonalds1',NULL),('perl','bsanders1',NULL),('php','amellon1',NULL),('php','bsanders1',NULL),('php','chapman2',NULL),('php','hdillan1',NULL),('php','jdolan1',NULL),('php','mdonalds1',NULL),('php','phuey1',NULL),('php','tbales1',NULL),('php','wgallow1',NULL),('plsql','mbovert1',NULL),('python','agordon1',NULL),('python','ahardley1',NULL),('python','aharper1',NULL),('python','amiller1',NULL),('python','bcharles1',NULL),('python','bjorklund1',NULL),('python','cfafnir',NULL),('python','chapman2',NULL),('python','ghosh1',NULL),('python','handers1',NULL),('python','iwellin1',NULL),('python','jdolan1',NULL),('python','jlong1',NULL),('python','jrhodes1',NULL),('python','kbaker1',NULL),('python','kblue1',NULL),('python','kjacobs1',NULL),('python','lundgren1',NULL),('python','mcooper1',NULL),('python','mdonalds1',NULL),('python','mjianga1',NULL),('python','mthomp1',NULL),('python','pcampbe1',NULL),('python','phuey1',NULL),('python','rlanster1',NULL),('python','rlongho1',NULL),('python','rmiller1',NULL),('python','rprince1',NULL),('python','sacks1',NULL),('python','schen1',NULL),('python','tturner1',NULL),('r','sacks1',NULL),('r','tturner1',NULL),('ruby','ahardley1',NULL),('ruby','mcooper1',NULL),('ruby','npeters1',NULL),('sas','tturner1',NULL),('sql','ahardley1',NULL),('sql','aharper1',NULL),('sql','dthomps1',NULL),('sql','kbaker1',NULL),('sql','kblue1',NULL),('sql','kjacobs1',NULL),('sql','mbovert1',NULL),('sql','npeters1',NULL),('sql','rlanster1',NULL),('sql','rlongho1',NULL),('sql','rwales1',NULL),('sql','sacks1',NULL),('swift','kjacobs1',NULL),('swift','nallen1',NULL);
/*!40000 ALTER TABLE `languagesknown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `larry_desired_people`
--

DROP TABLE IF EXISTS `larry_desired_people`;
/*!50001 DROP VIEW IF EXISTS `larry_desired_people`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `larry_desired_people` (
  `netId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ncwells2_desired_people`
--

DROP TABLE IF EXISTS `ncwells2_desired_people`;
/*!50001 DROP VIEW IF EXISTS `ncwells2_desired_people`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ncwells2_desired_people` (
  `netId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `notfullgroups`
--

DROP TABLE IF EXISTS `notfullgroups`;
/*!50001 DROP VIEW IF EXISTS `notfullgroups`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `notfullgroups` (
  `groupId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `optimalpartof`
--

DROP TABLE IF EXISTS `optimalpartof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optimalpartof` (
  `groupId` int(11) NOT NULL DEFAULT '0',
  `netId` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupId`,`netId`),
  KEY `netId` (`netId`),
  CONSTRAINT `optimalpartof_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE,
  CONSTRAINT `optimalpartof_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optimalpartof`
--

LOCK TABLES `optimalpartof` WRITE;
/*!40000 ALTER TABLE `optimalpartof` DISABLE KEYS */;
/*!40000 ALTER TABLE `optimalpartof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partof`
--

DROP TABLE IF EXISTS `partof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partof` (
  `groupId` int(11) NOT NULL DEFAULT '0',
  `netId` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupId`,`netId`),
  KEY `netId` (`netId`),
  CONSTRAINT `partof_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE,
  CONSTRAINT `partof_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partof`
--

LOCK TABLES `partof` WRITE;
/*!40000 ALTER TABLE `partof` DISABLE KEYS */;
INSERT INTO `partof` VALUES (134,'agordon1'),(131,'ahardley1'),(142,'aharper1'),(132,'amellon1'),(139,'amiller1'),(141,'awang1'),(141,'bcharles1'),(142,'bjorklund1'),(138,'bmiller1'),(139,'bsanders1'),(137,'cfafnir'),(140,'chapman2'),(141,'crobin1'),(139,'dthomps1'),(138,'flord1'),(142,'ghosh1'),(137,'gmorgan1'),(129,'handers1'),(133,'hdillan1'),(137,'iwellin1'),(133,'jdolan1'),(142,'jjacobs1'),(136,'jlee1'),(132,'jlong1'),(135,'jpeters1'),(134,'jrhodes1'),(134,'kbaker1'),(135,'kblue1'),(135,'kjacobs1'),(140,'lcarters1'),(138,'lundgren1'),(129,'mbovert1'),(140,'mcooper1'),(131,'mdonalds1'),(130,'mjianga1'),(130,'mling1'),(128,'msmith1'),(134,'mthomp1'),(128,'myoung1'),(140,'nallen1'),(137,'npeters1'),(132,'pcampbe1'),(129,'phuey1'),(133,'rlanster1'),(130,'rlongho1'),(133,'rmiller1'),(139,'rogers1'),(131,'rprince1'),(136,'rwales1'),(130,'rwells1'),(129,'sacks1'),(136,'schen1'),(128,'tbales1'),(131,'tdolan1'),(141,'tturner1'),(135,'wgallow1'),(128,'ysmith1');
/*!40000 ALTER TABLE `partof` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER GroupTrig AFTER DELETE ON PartOf
FOR EACH ROW
BEGIN
  IF (OLD.groupId NOT IN 
    (SELECT id FROM Groups)) THEN
    DELETE FROM Groups
    WHERE Groups.id = OLD.groupId;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `preferred`
--

DROP TABLE IF EXISTS `preferred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferred` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `day` varchar(10) NOT NULL DEFAULT '',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`netId`,`day`,`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferred`
--

LOCK TABLES `preferred` WRITE;
/*!40000 ALTER TABLE `preferred` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `summary` text,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (8,11,'Web-based Herbology tool to help amateurs and professionals alike identify and care for plants. It\'ll be good, I promise.','Herbologist');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `rwells2_desired_people`
--

DROP TABLE IF EXISTS `rwells2_desired_people`;
/*!50001 DROP VIEW IF EXISTS `rwells2_desired_people`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `rwells2_desired_people` (
  `netId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (''),('adobe photoshop'),('android'),('android development'),('artificial intellige'),('biomedicine'),('cognitive psychology'),('computer graphics'),('computer vision'),('cooking'),('cyber security'),('data visualization'),('databases'),('education'),('fight'),('finance'),('game design'),('game development'),('graphic design'),('hardware'),('hci'),('iconography'),('illustration'),('illustrator'),('indesign'),('ios development'),('linguistics'),('machine learning'),('mandarin chinese'),('outreach'),('photography'),('physics'),('psychology'),('statistics'),('teaching'),('ui design'),('uiux'),('video editing'),('w'),('web'),('web design'),('web development'),('web visualization');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillsdesired`
--

DROP TABLE IF EXISTS `skillsdesired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillsdesired` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `skillName` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`netId`,`skillName`),
  CONSTRAINT `skillsdesired_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillsdesired`
--

LOCK TABLES `skillsdesired` WRITE;
/*!40000 ALTER TABLE `skillsdesired` DISABLE KEYS */;
/*!40000 ALTER TABLE `skillsdesired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillsknown`
--

DROP TABLE IF EXISTS `skillsknown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillsknown` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `skillName` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`netId`,`skillName`),
  CONSTRAINT `skillsknown_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillsknown`
--

LOCK TABLES `skillsknown` WRITE;
/*!40000 ALTER TABLE `skillsknown` DISABLE KEYS */;
INSERT INTO `skillsknown` VALUES ('agordon1','cooking'),('agordon1','illustration'),('agordon1','web development'),('ahardley1','databases'),('ahardley1','web development'),('aharper1','web development'),('amellon1','databases'),('amiller1','web development'),('awang1','android'),('awang1','artificial intellige'),('awang1','computer graphics'),('awang1','game design'),('awang1','game development'),('awang1','ui design'),('bcharles1','web development'),('bjorklund1','computer vision'),('bjorklund1','machine learning'),('bjorklund1','web development'),('bsanders1',''),('bsanders1','web development'),('cfafnir','biomedicine'),('cfafnir','web development'),('cfafnir','web visualization'),('chapman2','cognitive psychology'),('chapman2','education'),('chapman2','ios development'),('chapman2','outreach'),('chapman2','photography'),('chapman2','uiux'),('chapman2','web development'),('crobin1','android development'),('dthomps1','hardware'),('dthomps1','web development'),('flord1','adobe photoshop'),('flord1','illustrator'),('flord1','indesign'),('flord1','mandarin chinese'),('flord1','web design'),('ghosh1','android development'),('gmorgan1','finance'),('handers1','physics'),('hdillan1','databases'),('hdillan1','web development'),('iwellin1','web development'),('jdolan1','databases'),('jdolan1','web development'),('jrhodes1','data visualization'),('jrhodes1','psychology'),('kbaker1','databases'),('kbaker1','web development'),('kblue1','web development'),('kmellon1','web development'),('lundgren1','data visualization'),('lundgren1','hci'),('lundgren1','illustration'),('lundgren1','uiux'),('mbovert1','databases'),('mcooper1','ios development'),('mcooper1','web development'),('mdonalds1','education'),('mdonalds1','teaching'),('mjianga1','web development'),('mling1','web development'),('msmith1','artificial intellige'),('msmith1','game design'),('msmith1','graphic design'),('msmith1','uiux'),('msmith1','web development'),('mthomp1','databases'),('myoung1','web development'),('nallen1','iconography'),('nallen1','video editing'),('npeters1','databases'),('npeters1','web development'),('phuey1','databases'),('phuey1','web development'),('rlanster1','web development'),('rlongho1','databases'),('rlongho1','web development'),('rogers1','web development'),('rwales1','hardware'),('rwales1','web development'),('rwells1','hardware'),('sacks1','linguistics'),('sacks1','psychology'),('sacks1','statistics'),('schen1','cyber security'),('tbales1','web development'),('tdolan1','databases'),('tdolan1','web development'),('tsorrel1','android development'),('tturner1','databases'),('wgallow1','web development'),('ysmith1','android development');
/*!40000 ALTER TABLE `skillsknown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `netId` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bio` text,
  `major` varchar(50) DEFAULT NULL,
  `yearInSchool` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`netId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('agordon1','andy gordon',NULL,'cs','freshman'),('ahardley1','alex hardley',NULL,'mcs','junior'),('aharper1','alison harper',NULL,'ce','senior'),('amellon1','arthur mellon',NULL,'cs','sophomore'),('amiller1','abby miller',NULL,'cs','sophomore'),('awang1','alexander wang',NULL,'cs','senior'),('bcharles1','barry charles',NULL,'cs','sophomore'),('bjorklund1','howard bjorklund',NULL,'cs','junior'),('bmiller1','bill miller',NULL,'cs','grad'),('bsanders1','birdie sanders',NULL,'cs','senior'),('cfafnir','charles fafnir',NULL,'mcs','freshman'),('chapman2','brittany chapman',NULL,'cs','senior'),('crobin1','christopher robin',NULL,'cs','grad'),('dthomps1','daniel thompson',NULL,'cs','grad'),('flord1','fiona lord',NULL,'industrial design','junior'),('ghosh1','rahul ghosh',NULL,'cs','sophomore'),('gmorgan1','gully morgan',NULL,'cs','freshman'),('handers1','henry anderson',NULL,'physics','freshman'),('hdillan1','hannah dillan',NULL,'ce','sophomore'),('iwellin1','ivan wellington',NULL,'cs','sophomore'),('jdolan1','jenn dolan',NULL,'cs','junior'),('jjacobs1','jordan jacobs',NULL,'ge','senior'),('jlee1','jennifer lee',NULL,'ce','junior'),('jlong1','jordan long',NULL,'cs','sophomore'),('jpeters1','john peterson',NULL,'ce','junior'),('jrhodes1','jana rhodes',NULL,'cs','junior'),('kbaker1','kevin baker',NULL,'cs','grad'),('kblue1','kelly blue',NULL,'ce','grad'),('kjacobs1','kori jacobs',NULL,'matse','junior'),('kmellon1','kevin mellon',NULL,'cs','junior'),('lcarters1','laurel carters',NULL,'cs','junior'),('lundgren1','samantha lundgren',NULL,'graphic design, industrial design','senior'),('mbovert1','maddie boverton',NULL,'cs','grad'),('mcooper1','mitchell cooper',NULL,'cs','grad'),('mdonalds1','morgan donalds',NULL,'cs','senior'),('mjianga1','maya jianga',NULL,'cs','senior'),('mling1','mary ling',NULL,'ce','junior'),('msmith1','molly smith',NULL,'ce','sophomore'),('mthomp1','milly thompson',NULL,'statistics','senior'),('myoung1','marvin young',NULL,'cs','senior'),('nallen1','nora allen',NULL,'ece','junior'),('npeters1','noel peterson',NULL,'ce','sophomore'),('pcampbe1','peter campbell',NULL,'ce','sophomore'),('phuey1','paul huey',NULL,'ce','sophomore'),('rlanster1','ruby lanster',NULL,'cs','sophomore'),('rlongho1','robert longhorn',NULL,'ce','senior'),('rmiller1','rao miller',NULL,'cs','grad'),('rogers1','jesse rogers',NULL,'cs','sophomore'),('rprince1','roger prince',NULL,'ece','junior'),('rwales1','roland wales',NULL,'cs','senior'),('rwells1','rupert wells',NULL,'ce','senior'),('sacks1','jennifer sacks',NULL,'cs','senior'),('schen1','sasha chen',NULL,'cs','sophomore'),('tbales1','tony bales',NULL,'cs','sophomore'),('tdolan1','thomas dolan',NULL,'journalism','senior'),('tsorrel1','tim sorrel',NULL,'cs','junior'),('tturner1','tina turner',NULL,'statistics','senior'),('wgallow1','william gallows',NULL,'cs','grad'),('ysmith1','yolanda smith',NULL,'cs','sophomore');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `studentlangs`
--

DROP TABLE IF EXISTS `studentlangs`;
/*!50001 DROP VIEW IF EXISTS `studentlangs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `studentlangs` (
  `languageName` tinyint NOT NULL,
  `netId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suggested`
--

DROP TABLE IF EXISTS `suggested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggested` (
  `groupId` int(11) NOT NULL DEFAULT '0',
  `netId` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupId`,`netId`),
  KEY `netId` (`netId`),
  CONSTRAINT `suggested_ibfk_1` FOREIGN KEY (`netId`) REFERENCES `student` (`netId`) ON DELETE CASCADE,
  CONSTRAINT `suggested_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggested`
--

LOCK TABLES `suggested` WRITE;
/*!40000 ALTER TABLE `suggested` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `instructorName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`netId`,`instructorName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `times` (
  `day` varchar(10) NOT NULL DEFAULT '',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`day`,`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
/*!40000 ALTER TABLE `times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `unsatisfiedgroups`
--

DROP TABLE IF EXISTS `unsatisfiedgroups`;
/*!50001 DROP VIEW IF EXISTS `unsatisfiedgroups`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `unsatisfiedgroups` (
  `groupId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `grouplangs`
--

/*!50001 DROP TABLE IF EXISTS `grouplangs`*/;
/*!50001 DROP VIEW IF EXISTS `grouplangs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `grouplangs` AS select `languagesdesired`.`languageName` AS `languageName`,`optimalpartof`.`groupId` AS `groupId` from (`languagesdesired` join `optimalpartof` on((`languagesdesired`.`netId` = `optimalpartof`.`netId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `larry_desired_people`
--

/*!50001 DROP TABLE IF EXISTS `larry_desired_people`*/;
/*!50001 DROP VIEW IF EXISTS `larry_desired_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `larry_desired_people` AS select `languagesknown`.`netId` AS `netId` from `languagesknown` where `languagesknown`.`languageName` in (select `languagesdesired`.`languageName` from `languagesdesired` where (`languagesdesired`.`netId` = 'larry')) group by `languagesknown`.`netId` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ncwells2_desired_people`
--

/*!50001 DROP TABLE IF EXISTS `ncwells2_desired_people`*/;
/*!50001 DROP VIEW IF EXISTS `ncwells2_desired_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ncwells2_desired_people` AS select `languagesknown`.`netId` AS `netId` from `languagesknown` where `languagesknown`.`languageName` in (select `languagesdesired`.`languageName` from `languagesdesired` where (`languagesdesired`.`netId` = 'ncwells2')) group by `languagesknown`.`netId` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notfullgroups`
--

/*!50001 DROP TABLE IF EXISTS `notfullgroups`*/;
/*!50001 DROP VIEW IF EXISTS `notfullgroups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `notfullgroups` AS select `optimalpartof`.`groupId` AS `groupId` from `optimalpartof` group by `optimalpartof`.`groupId` having (count(`optimalpartof`.`netId`) < 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rwells2_desired_people`
--

/*!50001 DROP TABLE IF EXISTS `rwells2_desired_people`*/;
/*!50001 DROP VIEW IF EXISTS `rwells2_desired_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `rwells2_desired_people` AS select `languagesknown`.`netId` AS `netId` from `languagesknown` where `languagesknown`.`languageName` in (select `languagesdesired`.`languageName` from `languagesdesired` where (`languagesdesired`.`netId` = 'rwells2')) group by `languagesknown`.`netId` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentlangs`
--

/*!50001 DROP TABLE IF EXISTS `studentlangs`*/;
/*!50001 DROP VIEW IF EXISTS `studentlangs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `studentlangs` AS select `languagesknown`.`languageName` AS `languageName`,`languagesknown`.`netId` AS `netId` from `languagesknown` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unsatisfiedgroups`
--

/*!50001 DROP TABLE IF EXISTS `unsatisfiedgroups`*/;
/*!50001 DROP VIEW IF EXISTS `unsatisfiedgroups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`groupr`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `unsatisfiedgroups` AS select `optimalpartof`.`groupId` AS `groupId` from `optimalpartof` group by `optimalpartof`.`groupId` having (count(`optimalpartof`.`netId`) < 3) */;
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

-- Dump completed on 2016-04-22 22:22:14
