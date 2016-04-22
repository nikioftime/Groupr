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
-- Table structure for table `Available`
--

DROP TABLE IF EXISTS `Available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Available` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `day` varchar(10) NOT NULL DEFAULT '',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`netId`,`day`,`start`,`end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Available`
--

LOCK TABLES `Available` WRITE;
/*!40000 ALTER TABLE `Available` DISABLE KEYS */;
/*!40000 ALTER TABLE `Available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `numberOfMembers` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES (5,'granger2',1,NULL),(11,'longbot2',1,NULL),(13,'weasley9',1,NULL),(22,'rey2',1,NULL),(15,'ncwells2',1,NULL),(18,'skywalk3',1,NULL),(19,'hasolo2',1,NULL),(20,'fn2187',1,NULL),(21,'pdamero2',1,NULL),(24,'msmith1',1,NULL),(25,'bcharles1',1,NULL),(26,'agordon1',1,NULL),(27,'flord1',1,NULL),(28,'nallen1',1,NULL),(29,'mdonalds1',1,NULL),(30,'jrhodes1',1,NULL),(31,'awang1',1,NULL),(32,'rogers1',1,NULL),(33,'sacks1',1,NULL),(34,'chapman2',1,NULL),(35,'lundgren1',1,NULL),(36,'ghosh1',1,NULL),(37,'schen1',1,NULL),(38,'bjorklund1',1,NULL),(39,'rlanster1',1,NULL),(40,'aharper1',1,NULL),(41,'amellon1',1,NULL),(42,'tbales1',1,NULL),(43,'handers1',1,NULL),(44,'jpeters1',1,NULL),(45,'jlee1',1,NULL),(46,'ysmith1',1,NULL),(47,'tsorrel1',1,NULL),(48,'rlongho1',1,NULL),(49,'kblue1',1,NULL),(50,'dthomps1',1,NULL),(51,'rwales1',1,NULL),(52,'cfafnir',1,NULL),(53,'ahardley1',1,NULL),(54,'mcooper1',1,NULL),(55,'rmiller1',1,NULL),(56,'gmorgan1',1,NULL),(57,'amiller1',1,NULL),(58,'jdolan1',1,NULL),(59,'phuey1',1,NULL),(60,'pcampbe1',1,NULL),(61,'tturner1',1,NULL),(62,'iwellin1',1,NULL),(63,'kbaker1',1,NULL),(64,'bsanders1',1,NULL),(65,'jlong1',1,NULL),(66,'myoung1',1,NULL),(67,'kmellon1',1,NULL),(68,'hdillan1',1,NULL),(69,'kjacobs1',1,NULL),(70,'npeters1',1,NULL),(71,'lcarters1',1,NULL),(72,'bmiller1',1,NULL),(73,'mbovert1',1,NULL),(74,'wgallow1',1,NULL),(75,'crobin1',1,NULL),(76,'mling1',1,NULL),(77,'mthomp1',1,NULL),(78,'tdolan1',1,NULL),(79,'jjacobs1',1,NULL),(80,'mjianga1',1,NULL),(81,'rprince1',1,NULL),(82,'rwells1',1,NULL);
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idea`
--

DROP TABLE IF EXISTS `Idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Idea` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `projectId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`netId`,`projectId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idea`
--

LOCK TABLES `Idea` WRITE;
/*!40000 ALTER TABLE `Idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `Idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instructor` (
  `name` varchar(50) NOT NULL,
  `className` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Languages` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES (''),(' python'),('angularjs'),('applescript'),('assembly'),('c'),('c#'),('c++'),('cs'),('css'),('d3.js'),('django'),('flash'),('flask'),('go'),('google api'),('html'),('java'),('jquery'),('js'),('m c'),('matlab'),('mongodb'),('mysql'),('node.js'),('objective-c'),('perl'),('php'),('plsql'),('python'),('r'),('ruby'),('sas'),('sass'),('sql'),('swift'),('webgl'),('xml');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LanguagesDesired`
--

DROP TABLE IF EXISTS `LanguagesDesired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LanguagesDesired` (
  `languageName` varchar(20) NOT NULL DEFAULT '',
  `netId` varchar(10) NOT NULL DEFAULT '',
  `proficiency` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`languageName`,`netId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LanguagesDesired`
--

LOCK TABLES `LanguagesDesired` WRITE;
/*!40000 ALTER TABLE `LanguagesDesired` DISABLE KEYS */;
INSERT INTO `LanguagesDesired` VALUES ('java','rwells1',NULL),('python','rwells1',NULL),('','rwells1',NULL),('jquery','rogers1',NULL),('swift','rogers1',NULL),('','rogers1',NULL),('c','msmith1',NULL),('c++','msmith1',NULL),('css','bcharles1',NULL),('html','bcharles1',NULL),('java','bcharles1',NULL),('c++','mjianga1',NULL),('sql','mjianga1',NULL),('php','agordon1',NULL),('swift','agordon1',NULL),('angularjs','agordon1',NULL),('html','jjacobs1',NULL),('css','jjacobs1',NULL),('js','jjacobs1',NULL),('js','flord1',NULL),('django','flord1',NULL),('sass','flord1',NULL),(' python','flord1',NULL),('python','tdolan1',NULL),('','tdolan1',NULL),('go','mdonalds1',NULL),('python','mdonalds1',NULL),('js','mdonalds1',NULL),('mysql','mdonalds1',NULL),('objective-c','mdonalds1',NULL),('js','mthomp1',NULL),('java','jrhodes1',NULL),('python','jrhodes1',NULL),('assembly','jrhodes1',NULL),('c','jrhodes1',NULL),('python','mling1',NULL),('sql','mling1',NULL),('','mling1',NULL),('c','awang1',NULL),('assembly','awang1',NULL),('js','awang1',NULL),('','awang1',NULL),('python','wgallow1',NULL),('sql','wgallow1',NULL),('','wgallow1',NULL),('matlab','sacks1',NULL),('c','sacks1',NULL),('r','sacks1',NULL),('js','sacks1',NULL),('sql','sacks1',NULL),('swift','chapman2',NULL),('objective-c','chapman2',NULL),('sql','chapman2',NULL),('applescript','chapman2',NULL),('js','mbovert1',NULL),('css','lundgren1',NULL),('html','lundgren1',NULL),('js','lundgren1',NULL),('java','ghosh1',NULL),('python','ghosh1',NULL),('js','ghosh1',NULL),('python','bsanders1',NULL),('python','crobin1',NULL),('python','schen1',NULL),('angularjs','schen1',NULL),('python','kmellon1',NULL),('webgl','kmellon1',NULL),('','kmellon1',NULL),('css','bmiller1',NULL),('html','bmiller1',NULL),('java','bjorklund1',NULL),('c++','bjorklund1',NULL),('c','bjorklund1',NULL),('c','rlanster1',NULL),('c++','rlanster1',NULL),('php','rlanster1',NULL),('sql','rlanster1',NULL),('c','aharper1',NULL),('html','aharper1',NULL),('css','aharper1',NULL),('js','aharper1',NULL),('python','amellon1',NULL),('django','amellon1',NULL),('css','amellon1',NULL),('html','amellon1',NULL),('','amellon1',NULL),('html','tbales1',NULL),('css','tbales1',NULL),('js','tbales1',NULL),('jquery','tbales1',NULL),('','tbales1',NULL),('python','npeters1',NULL),('c++','npeters1',NULL),('sql','handers1',NULL),('php','handers1',NULL),('css','kjacobs1',NULL),('html','kjacobs1',NULL),('js','kjacobs1',NULL),('c++','jpeters1',NULL),('php','jpeters1',NULL),('sql','jpeters1',NULL),('','jpeters1',NULL),('html','hdillan1',NULL),('css','hdillan1',NULL),('js','jlee1',NULL),('html','jlee1',NULL),('css','jlee1',NULL),('objective-c','jlee1',NULL),('java','ysmith1',NULL),('xml','ysmith1',NULL),('html','ysmith1',NULL),('sql','myoung1',NULL),('html','jlong1',NULL),('css','jlong1',NULL),('html','kbaker1',NULL),('css','kbaker1',NULL),('js','kbaker1',NULL),('sql','iwellin1',NULL),('java','tsorrel1',NULL),('python','tsorrel1',NULL),('c++','tsorrel1',NULL),('c++','rlongho1',NULL),('c','rlongho1',NULL),('php','rlongho1',NULL),('sql','rlongho1',NULL),('','rlongho1',NULL),('css','tturner1',NULL),('html','tturner1',NULL),('html','dthomps1',NULL),('c++','dthomps1',NULL),('c','dthomps1',NULL),('php','dthomps1',NULL),('html','pcampbe1',NULL),('js','pcampbe1',NULL),('php','rwales1',NULL),('swift','rwales1',NULL),('','rwales1',NULL),('sql','phuey1',NULL),('java','cfafnir',NULL),('c','cfafnir',NULL),('sql','cfafnir',NULL),('html','jdolan1',NULL),('css','jdolan1',NULL),('js','jdolan1',NULL),('sql','amiller1',NULL),('php','amiller1',NULL),('python','gmorgan1',NULL),('sql','gmorgan1',NULL),('html','gmorgan1',NULL),('css','gmorgan1',NULL),('sql','rmiller1',NULL),('php','rmiller1',NULL),('ruby','rmiller1',NULL),('c++','ahardley1',NULL),('php','ahardley1',NULL),('c','ahardley1',NULL),('','ahardley1',NULL),('c++','mcooper1',NULL),('c','mcooper1',NULL);
/*!40000 ALTER TABLE `LanguagesDesired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LanguagesKnown`
--

DROP TABLE IF EXISTS `LanguagesKnown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LanguagesKnown` (
  `languageName` varchar(20) NOT NULL DEFAULT '',
  `netId` varchar(10) NOT NULL DEFAULT '',
  `proficiency` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`languageName`,`netId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LanguagesKnown`
--

LOCK TABLES `LanguagesKnown` WRITE;
/*!40000 ALTER TABLE `LanguagesKnown` DISABLE KEYS */;
INSERT INTO `LanguagesKnown` VALUES ('','kbaker1',NULL),('python','mdonalds1',NULL),('','msmith1',NULL),('js','msmith1',NULL),('html','msmith1',NULL),('css','msmith1',NULL),('php','mdonalds1',NULL),('','bcharles1',NULL),('python','bcharles1',NULL),('js','bcharles1',NULL),('c++','bcharles1',NULL),('c','bcharles1',NULL),('java','agordon1',NULL),('c++','agordon1',NULL),('html','agordon1',NULL),('js','agordon1',NULL),('python','agordon1',NULL),('html','flord1',NULL),('css','flord1',NULL),('java','nallen1',NULL),('c','nallen1',NULL),('c++','nallen1',NULL),('css','nallen1',NULL),('swift','nallen1',NULL),('applescript','nallen1',NULL),('objective-c','mdonalds1',NULL),('node.js','mdonalds1',NULL),('mysql','mdonalds1',NULL),('js','mdonalds1',NULL),('java','mdonalds1',NULL),('html','mdonalds1',NULL),('css','mdonalds1',NULL),('python','jrhodes1',NULL),('html','jrhodes1',NULL),('cs','jrhodes1',NULL),('js','jrhodes1',NULL),('angularjs','jrhodes1',NULL),('java','jrhodes1',NULL),('c++','jrhodes1',NULL),('c++','awang1',NULL),('java','awang1',NULL),('c#','awang1',NULL),('','rogers1',NULL),('java','rogers1',NULL),('c++','rogers1',NULL),('java','sacks1',NULL),('c++','sacks1',NULL),('c','sacks1',NULL),('python','sacks1',NULL),('sql','sacks1',NULL),('matlab','sacks1',NULL),('r','sacks1',NULL),('c#','sacks1',NULL),('java','chapman2',NULL),('html','chapman2',NULL),('css','chapman2',NULL),('objective-c','chapman2',NULL),('js','chapman2',NULL),('python','chapman2',NULL),('php','chapman2',NULL),('js','lundgren1',NULL),('python','lundgren1',NULL),('c++','ghosh1',NULL),('java','ghosh1',NULL),('python','ghosh1',NULL),('html','ghosh1',NULL),('css','ghosh1',NULL),('jquery','ghosh1',NULL),('html','schen1',NULL),('css','schen1',NULL),('js','schen1',NULL),('python','schen1',NULL),('c++','schen1',NULL),('c++','bjorklund1',NULL),('python','bjorklund1',NULL),('java','bjorklund1',NULL),('js','bjorklund1',NULL),('css','bjorklund1',NULL),('html','bjorklund1',NULL),('matlab','bjorklund1',NULL),('python','rlanster1',NULL),('sql','rlanster1',NULL),('c++','rlanster1',NULL),('html','rlanster1',NULL),('css','rlanster1',NULL),('js','rlanster1',NULL),('python','aharper1',NULL),('sql','aharper1',NULL),('c++','aharper1',NULL),('html','aharper1',NULL),('css','aharper1',NULL),('js','aharper1',NULL),('php','amellon1',NULL),('mysql','amellon1',NULL),('php','tbales1',NULL),('mysql','tbales1',NULL),('python','handers1',NULL),('c','handers1',NULL),('c++','handers1',NULL),('c++','jpeters1',NULL),('c++','jlee1',NULL),('c++','ysmith1',NULL),('java','ysmith1',NULL),('java','tsorrel1',NULL),('c++','tsorrel1',NULL),('python','rlongho1',NULL),('sql','rlongho1',NULL),('html','rlongho1',NULL),('css','rlongho1',NULL),('js','rlongho1',NULL),('python','kblue1',NULL),('sql','kblue1',NULL),('angularjs','dthomps1',NULL),('java','dthomps1',NULL),('js','dthomps1',NULL),('sql','dthomps1',NULL),('java','rwales1',NULL),('js','rwales1',NULL),('sql','rwales1',NULL),('angularjs','rwales1',NULL),('d3.js','cfafnir',NULL),('python','cfafnir',NULL),('ruby','ahardley1',NULL),('java','ahardley1',NULL),('python','ahardley1',NULL),('sql','ahardley1',NULL),('objective-c','mcooper1',NULL),('ruby','mcooper1',NULL),('python','mcooper1',NULL),('c','rmiller1',NULL),('c++','rmiller1',NULL),('python','rmiller1',NULL),('c++','gmorgan1',NULL),('python','amiller1',NULL),('flask','amiller1',NULL),('c++','amiller1',NULL),('python','jdolan1',NULL),('c++','jdolan1',NULL),('php','jdolan1',NULL),('python','phuey1',NULL),('c++','phuey1',NULL),('php','phuey1',NULL),('c++','pcampbe1',NULL),('java','pcampbe1',NULL),('python','pcampbe1',NULL),('python','tturner1',NULL),('r','tturner1',NULL),('sas','tturner1',NULL),('c++','tturner1',NULL),('java','tturner1',NULL),('python','iwellin1',NULL),('c++','iwellin1',NULL),('c','iwellin1',NULL),('java','iwellin1',NULL),('html','iwellin1',NULL),('js','iwellin1',NULL),('sql','kbaker1',NULL),('python','kbaker1',NULL),('c','kbaker1',NULL),('java','kbaker1',NULL),('php','bsanders1',NULL),('js','bsanders1',NULL),('perl','bsanders1',NULL),('mysql','bsanders1',NULL),('java','jlong1',NULL),('python','jlong1',NULL),('angularjs','jlong1',NULL),('html','myoung1',NULL),('css','myoung1',NULL),('js','myoung1',NULL),('java','myoung1',NULL),('','kmellon1',NULL),('js','kmellon1',NULL),('java','kmellon1',NULL),('google api','kmellon1',NULL),('flash','kmellon1',NULL),('c++','kmellon1',NULL),('c','kmellon1',NULL),('c++','hdillan1',NULL),('c#','hdillan1',NULL),('php','hdillan1',NULL),('python','kjacobs1',NULL),('c++','kjacobs1',NULL),('java','kjacobs1',NULL),('sql','kjacobs1',NULL),('swift','kjacobs1',NULL),('ruby','npeters1',NULL),('js','npeters1',NULL),('html','npeters1',NULL),('css','npeters1',NULL),('sql','npeters1',NULL),('mysql','npeters1',NULL),('c++','lcarters1',NULL),('c++','bmiller1',NULL),('js','bmiller1',NULL),('java','bmiller1',NULL),('sql','mbovert1',NULL),('plsql','mbovert1',NULL),('java','mbovert1',NULL),('','wgallow1',NULL),('php','wgallow1',NULL),('mongodb','wgallow1',NULL),('jquery','wgallow1',NULL),('java','wgallow1',NULL),('java','crobin1',NULL),('c++','crobin1',NULL),('','mling1',NULL),('java','mling1',NULL),('c++','mling1',NULL),('c','mling1',NULL),('python','mthomp1',NULL),('java','mthomp1',NULL),('c++','mthomp1',NULL),('','tdolan1',NULL),('mysql','tdolan1',NULL),('js','tdolan1',NULL),('java','tdolan1',NULL),('c++','tdolan1',NULL),('java','jjacobs1',NULL),('c++','jjacobs1',NULL),('python','mjianga1',NULL),('java','mjianga1',NULL),('python','rprince1',NULL),('go','mdonalds1',NULL),('','rwells1',NULL),('c++','rwells1',NULL),('assembly','rwells1',NULL),('','mdonalds1',NULL);
/*!40000 ALTER TABLE `LanguagesKnown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartOf`
--

DROP TABLE IF EXISTS `PartOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartOf` (
  `groupId` int(11) NOT NULL DEFAULT '0',
  `netId` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupId`,`netId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartOf`
--

LOCK TABLES `PartOf` WRITE;
/*!40000 ALTER TABLE `PartOf` DISABLE KEYS */;
INSERT INTO `PartOf` VALUES (5,'granger2'),(11,'longbot2'),(13,'weasley9'),(18,'skywalk3'),(19,'hasolo2'),(20,'fn2187'),(21,'pdamero2'),(22,'rey2'),(24,'msmith1'),(25,'bcharles1'),(26,'agordon1'),(27,'flord1'),(28,'nallen1'),(29,'mdonalds1'),(30,'jrhodes1'),(31,'awang1'),(32,'rogers1'),(33,'sacks1'),(34,'chapman2'),(35,'lundgren1'),(36,'ghosh1'),(37,'schen1'),(38,'bjorklund1'),(39,'rlanster1'),(40,'aharper1'),(41,'amellon1'),(42,'tbales1'),(43,'handers1'),(44,'jpeters1'),(45,'jlee1'),(46,'ysmith1'),(47,'tsorrel1'),(48,'rlongho1'),(49,'kblue1'),(50,'dthomps1'),(51,'rwales1'),(52,'cfafnir'),(53,'ahardley1'),(54,'mcooper1'),(55,'rmiller1'),(56,'gmorgan1'),(57,'amiller1'),(58,'jdolan1'),(59,'phuey1'),(60,'pcampbe1'),(61,'tturner1'),(62,'iwellin1'),(63,'kbaker1'),(64,'bsanders1'),(65,'jlong1'),(66,'myoung1'),(67,'kmellon1'),(68,'hdillan1'),(69,'kjacobs1'),(70,'npeters1'),(71,'lcarters1'),(72,'bmiller1'),(73,'mbovert1'),(74,'wgallow1'),(75,'crobin1'),(76,'mling1'),(77,'mthomp1'),(78,'tdolan1'),(79,'jjacobs1'),(80,'mjianga1'),(81,'rprince1'),(82,'rwells1');
/*!40000 ALTER TABLE `PartOf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preferred`
--

DROP TABLE IF EXISTS `Preferred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preferred` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `day` varchar(10) NOT NULL DEFAULT '',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`netId`,`day`,`start`,`end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preferred`
--

LOCK TABLES `Preferred` WRITE;
/*!40000 ALTER TABLE `Preferred` DISABLE KEYS */;
/*!40000 ALTER TABLE `Preferred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `summary` text,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (8,11,'Web-based Herbology tool to help amateurs and professionals alike identify and care for plants. It\'ll be good, I promise.','Herbologist');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skills`
--

DROP TABLE IF EXISTS `Skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skills` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skills`
--

LOCK TABLES `Skills` WRITE;
/*!40000 ALTER TABLE `Skills` DISABLE KEYS */;
INSERT INTO `Skills` VALUES (''),('adobe photoshop'),('android'),('android development'),('artificial intellige'),('biomedicine'),('cognitive psychology'),('computer graphics'),('computer vision'),('cooking'),('cyber security'),('data visualization'),('databases'),('education'),('fight'),('finance'),('game design'),('game development'),('graphic design'),('hardware'),('hci'),('iconography'),('illustration'),('illustrator'),('indesign'),('ios development'),('linguistics'),('machine learning'),('mandarin chinese'),('outreach'),('photography'),('physics'),('psychology'),('statistics'),('teaching'),('ui design'),('uiux'),('video editing'),('w'),('web'),('web design'),('web development'),('web visualization');
/*!40000 ALTER TABLE `Skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkillsDesired`
--

DROP TABLE IF EXISTS `SkillsDesired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SkillsDesired` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `skillName` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`netId`,`skillName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkillsDesired`
--

LOCK TABLES `SkillsDesired` WRITE;
/*!40000 ALTER TABLE `SkillsDesired` DISABLE KEYS */;
/*!40000 ALTER TABLE `SkillsDesired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkillsKnown`
--

DROP TABLE IF EXISTS `SkillsKnown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SkillsKnown` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `skillName` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`netId`,`skillName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkillsKnown`
--

LOCK TABLES `SkillsKnown` WRITE;
/*!40000 ALTER TABLE `SkillsKnown` DISABLE KEYS */;
INSERT INTO `SkillsKnown` VALUES ('agordon1','cooking'),('agordon1','illustration'),('agordon1','web development'),('ahardley1','databases'),('ahardley1','web development'),('aharper1','web development'),('amellon1','databases'),('amiller1','web development'),('awang1','android'),('awang1','artificial intellige'),('awang1','computer graphics'),('awang1','game design'),('awang1','game development'),('awang1','ui design'),('bcharles1','web development'),('bjorklund1','computer vision'),('bjorklund1','machine learning'),('bjorklund1','web development'),('bsanders1',''),('bsanders1','web development'),('cfafnir','biomedicine'),('cfafnir','web development'),('cfafnir','web visualization'),('chapman2','cognitive psychology'),('chapman2','education'),('chapman2','ios development'),('chapman2','outreach'),('chapman2','photography'),('chapman2','uiux'),('chapman2','web development'),('crobin1','android development'),('dthomps1','hardware'),('dthomps1','web development'),('flord1','adobe photoshop'),('flord1','illustrator'),('flord1','indesign'),('flord1','mandarin chinese'),('flord1','web design'),('ghosh1','android development'),('gmorgan1','finance'),('handers1','physics'),('hdillan1','databases'),('hdillan1','web development'),('iwellin1','web development'),('jdolan1','databases'),('jdolan1','web development'),('jrhodes1','data visualization'),('jrhodes1','psychology'),('kbaker1','databases'),('kbaker1','web development'),('kblue1','web development'),('kmellon1','web development'),('lundgren1','data visualization'),('lundgren1','hci'),('lundgren1','illustration'),('lundgren1','uiux'),('mbovert1','databases'),('mcooper1','ios development'),('mcooper1','web development'),('mdonalds1','education'),('mdonalds1','teaching'),('mjianga1','web development'),('mling1','web development'),('msmith1','artificial intellige'),('msmith1','game design'),('msmith1','graphic design'),('msmith1','uiux'),('msmith1','web development'),('mthomp1','databases'),('myoung1','web development'),('nallen1','iconography'),('nallen1','video editing'),('npeters1','databases'),('npeters1','web development'),('phuey1','databases'),('phuey1','web development'),('rlanster1','web development'),('rlongho1','databases'),('rlongho1','web development'),('rogers1','web development'),('rwales1','hardware'),('rwales1','web development'),('rwells1','hardware'),('sacks1','linguistics'),('sacks1','psychology'),('sacks1','statistics'),('schen1','cyber security'),('tbales1','web development'),('tdolan1','databases'),('tdolan1','web development'),('tsorrel1','android development'),('tturner1','databases'),('wgallow1','web development'),('ysmith1','android development');
/*!40000 ALTER TABLE `SkillsKnown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `netId` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bio` text,
  `major` varchar(50) DEFAULT NULL,
  `yearInSchool` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`netId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('rogers1','jesse rogers',NULL,'cs','sophomore'),('msmith1','molly smith',NULL,'ce','sophomore'),('bcharles1','barry charles',NULL,'cs','sophomore'),('agordon1','andy gordon',NULL,'cs','freshman'),('flord1','fiona lord',NULL,'industrial design','junior'),('nallen1','nora allen',NULL,'ece','junior'),('mdonalds1','morgan donalds',NULL,'cs','senior'),('jrhodes1','jana rhodes',NULL,'cs','junior'),('awang1','alexander wang',NULL,'cs','senior'),('sacks1','jennifer sacks',NULL,'cs','senior'),('chapman2','brittany chapman',NULL,'cs','senior'),('lundgren1','samantha lundgren',NULL,'graphic design, industrial design','senior'),('ghosh1','rahul ghosh',NULL,'cs','sophomore'),('schen1','sasha chen',NULL,'cs','sophomore'),('bjorklund1','howard bjorklund',NULL,'cs','junior'),('rlanster1','ruby lanster',NULL,'cs','sophomore'),('aharper1','alison harper',NULL,'ce','senior'),('amellon1','arthur mellon',NULL,'cs','sophomore'),('tbales1','tony bales',NULL,'cs','sophomore'),('handers1','henry anderson',NULL,'physics','freshman'),('jpeters1','john peterson',NULL,'ce','junior'),('jlee1','jennifer lee',NULL,'ce','junior'),('ysmith1','yolanda smith',NULL,'cs','sophomore'),('tsorrel1','tim sorrel',NULL,'cs','junior'),('rlongho1','robert longhorn',NULL,'ce','senior'),('kblue1','kelly blue',NULL,'ce','grad'),('dthomps1','daniel thompson',NULL,'cs','grad'),('rwales1','roland wales',NULL,'cs','senior'),('cfafnir','charles fafnir',NULL,'mcs','freshman'),('ahardley1','alex hardley',NULL,'mcs','junior'),('mcooper1','mitchell cooper',NULL,'cs','grad'),('rmiller1','rao miller',NULL,'cs','grad'),('gmorgan1','gully morgan',NULL,'cs','freshman'),('amiller1','abby miller',NULL,'cs','sophomore'),('jdolan1','jenn dolan',NULL,'cs','junior'),('phuey1','paul huey',NULL,'ce','sophomore'),('pcampbe1','peter campbell',NULL,'ce','sophomore'),('tturner1','tina turner',NULL,'statistics','senior'),('iwellin1','ivan wellington',NULL,'cs','sophomore'),('kbaker1','kevin baker',NULL,'cs','grad'),('bsanders1','birdie sanders',NULL,'cs','senior'),('jlong1','jordan long',NULL,'cs','sophomore'),('myoung1','marvin young',NULL,'cs','senior'),('kmellon1','kevin mellon',NULL,'cs','junior'),('hdillan1','hannah dillan',NULL,'ce','sophomore'),('kjacobs1','kori jacobs',NULL,'matse','junior'),('npeters1','noel peterson',NULL,'ce','sophomore'),('lcarters1','laurel carters',NULL,'cs','junior'),('bmiller1','bill miller',NULL,'cs','grad'),('mbovert1','maddie boverton',NULL,'cs','grad'),('wgallow1','william gallows',NULL,'cs','grad'),('crobin1','christopher robin',NULL,'cs','grad'),('mling1','mary ling',NULL,'ce','junior'),('mthomp1','milly thompson',NULL,'statistics','senior'),('tdolan1','thomas dolan',NULL,'journalism','senior'),('jjacobs1','jordan jacobs',NULL,'ge','senior'),('mjianga1','maya jianga',NULL,'cs','senior'),('rprince1','roger prince',NULL,'ece','junior'),('rwells1','rupert wells',NULL,'ce','senior');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suggested`
--

DROP TABLE IF EXISTS `Suggested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suggested` (
  `groupId` int(11) NOT NULL DEFAULT '0',
  `netId` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupId`,`netId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suggested`
--

LOCK TABLES `Suggested` WRITE;
/*!40000 ALTER TABLE `Suggested` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suggested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaches`
--

DROP TABLE IF EXISTS `Teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teaches` (
  `netId` varchar(10) NOT NULL DEFAULT '',
  `instructorName` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`netId`,`instructorName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaches`
--

LOCK TABLES `Teaches` WRITE;
/*!40000 ALTER TABLE `Teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Times`
--

DROP TABLE IF EXISTS `Times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Times` (
  `day` varchar(10) NOT NULL DEFAULT '',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`day`,`start`,`end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Times`
--

LOCK TABLES `Times` WRITE;
/*!40000 ALTER TABLE `Times` DISABLE KEYS */;
/*!40000 ALTER TABLE `Times` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-22  1:13:45
