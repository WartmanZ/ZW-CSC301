-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: csweb.hh.nku.edu    Database: db_spring17_wartmanz1
-- ------------------------------------------------------
-- Server version	5.5.44

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
-- Table structure for table `book_categories`
--

DROP TABLE IF EXISTS `book_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_categories` (
  `isbn` varchar(45) NOT NULL,
  `categoryid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_categories`
--

LOCK TABLES `book_categories` WRITE;
/*!40000 ALTER TABLE `book_categories` DISABLE KEYS */;
INSERT INTO `book_categories` VALUES ('67-0009-4439-2123',3),('5-5445-621',1),('5-5445-621',3),('5-45-621',1),('5-45-621',3),('5-45-621',1),('5-45-621',3),('1-5454-265',1),('1-5454-265',3),('1234',1),('1234',2),('12-3225-4554',1),('12-3225-4554',3),('54667412-345',1),('54667412-345',3),('0-672-31697-8',1),('0-672-31697-8',3),('0-672-31745-1',1),('0-672-31745-1',3),('0-672-31769-9',1),('0-672-31769-9',3),('0-672-33698-4',1),('0-672-33698-4',3),('1122-2212',2),('67-009-439-2',3),('0-672-31509-2',1);
/*!40000 ALTER TABLE `book_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_reviews`
--

DROP TABLE IF EXISTS `book_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_reviews` (
  `isbn` char(13) NOT NULL,
  `review` text,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_reviews`
--

LOCK TABLES `book_reviews` WRITE;
/*!40000 ALTER TABLE `book_reviews` DISABLE KEYS */;
INSERT INTO `book_reviews` VALUES ('0-672-31697-8','Morgan\'s book is clearly written and goes well beyond \n                     most of the basic Java books out there.');
/*!40000 ALTER TABLE `book_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `isbn` char(13) NOT NULL,
  `author` char(50) DEFAULT NULL,
  `title` char(100) DEFAULT NULL,
  `price` float(4,2) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('0-672-31509-2','Pruitt, et al.','Teach Yourself GIMP in 24 Hours',24.99),('0-672-31697-8','Michael Morgan','Java 2 for Professional Developers',34.99),('0-672-31745-1','Thomas Down','Installing Debian GNU/Linux',24.99),('0-672-31769-9','Thomas Schenk','Caldera OpenLinux System Administration Unleashed',49.99),('0-672-33698-4','Jesse Hockenbury','Bitserver 2016',74.99),('1-5454-265','Richard Fox','Programming Java Like a Mad Scientist',49.99),('1122-2212','Jesse Hockenbury','Harry Potter',99.99),('12-3225-4554','Arthur P. Garimin','Hello World',49.99),('54667412-345','Master IRB','Ruby.new',64.99),('67-009-439-2','G.J. Minin','Science in the Rainforests',69.99);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology'),(2,'English'),(3,'Science'),(10,'History');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `address` char(100) NOT NULL,
  `city` char(30) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customerid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Julie Smith','25 Oak Street','Airport West','smithj1','5445das3'),(2,'Alan Wong','1/47 Haines Avenue','Box Hill','AWong','22121'),(3,'Michelle Arthur','357 North Road','Yarraville','amichelle1','@112ffaz2!'),(4,'Zack Wartman','4787 Willow Lenoxburg Rd','Foster','wartmanz1','hyenaman'),(8,'Gerome Michaels','6556 Farun Road','Box Hill','GMichaels','plasticfans23');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `orderid` int(10) unsigned NOT NULL,
  `isbn` char(13) NOT NULL,
  `quantity` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`orderid`,`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,'0-672-31697-8',2),(2,'0-672-31769-9',1),(3,'0-672-31509-2',1),(3,'0-672-31769-9',1),(4,'0-672-31745-1',3);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerid` int(10) unsigned NOT NULL,
  `amount` float(6,2) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,69.98,'2000-04-02'),(2,1,49.99,'2000-04-15'),(3,2,74.98,'2000-04-19'),(4,3,24.99,'2000-05-01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poject_user`
--

DROP TABLE IF EXISTS `poject_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poject_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poject_user`
--

LOCK TABLES `poject_user` WRITE;
/*!40000 ALTER TABLE `poject_user` DISABLE KEYS */;
INSERT INTO `poject_user` VALUES (1,'Fin Corbin','FCorb','lonewolf'),(3,'Zack Wartman','wartmanz1','hyenaman');
/*!40000 ALTER TABLE `poject_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_animal`
--

DROP TABLE IF EXISTS `project_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_animal` (
  `animalid` int(11) NOT NULL AUTO_INCREMENT,
  `animalname` varchar(50) NOT NULL,
  `animalpicture` varchar(500) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`animalid`),
  UNIQUE KEY `animalid_UNIQUE` (`animalid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_animal`
--

LOCK TABLES `project_animal` WRITE;
/*!40000 ALTER TABLE `project_animal` DISABLE KEYS */;
INSERT INTO `project_animal` VALUES (1,'Malayan Tiger','http://s3.amazonaws.com/mongabay/animals/600/animals_01912.jpg',NULL),(2,'Brown Hyena','https://c2.staticflickr.com/8/7289/12269017524_d338dd1fe3_b.jpg',''),(3,'Giant Panda','https://thewhiskerchronicles.files.wordpress.com/2014/01/giant_panda_eating.jpg',''),(12,'Amur Leopard','https://upload.wikimedia.org/wikipedia/commons/0/09/Amur_Leopard_Pittsburgh_Zoo.jpg',NULL),(13,'Greater One-Horned Rhino','https://upload.wikimedia.org/wikipedia/commons/c/ca/One_horned_Rhino.jpg',NULL),(14,'African Wild Dog','https://upload.wikimedia.org/wikipedia/commons/c/cc/African_wild_dog_lycaon_pictus.jpg','The most beautiful canines on the planet.'),(15,'Lion','https://c1.staticflickr.com/9/8887/18576284415_325cff7855_o.jpg',NULL),(16,'Jaguar','http://ultimate-places.com/content/04-wild-places/01-animali/03-giaguari/05_jaguar.jpg',NULL),(17,'Red Panda','https://4.bp.blogspot.com/-b8WJl5i2gOU/VdjPg3M1b6I/AAAAAAABySE/YkMRrwF5J14/s0/Red_Panda3_uhd.jpg','Interestingly, not a Panda, but more closely related to a raccoon.'),(18,'Hippopotamus','http://tnimage.taiwannews.com.tw/photos/shares/AP/20170422/cb9fceb3813d4e2ab1d3cde447cc2b82.jpg','Fiona!!'),(19,'Western Lowland Gorilla','https://img.washingtonpost.com/rf/image_1484w/2010-2019/Wires/Videos/201606/Reuters/Images/201606_harambe_getty.jpg','Harambe'),(21,'Macaw','https://upload.wikimedia.org/wikipedia/commons/2/21/Blue-and-yellow_Macaw_RWD2.jpg',NULL),(22,'Arctic Fox','https://c402277.ssl.cf1.rackcdn.com/photos/540/images/hero_full/shutterstock_103864847.jpg?1345525295',NULL);
/*!40000 ALTER TABLE `project_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_animaldangerlvl`
--

DROP TABLE IF EXISTS `project_animaldangerlvl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_animaldangerlvl` (
  `animalid` int(11) NOT NULL,
  `dangerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_animaldangerlvl`
--

LOCK TABLES `project_animaldangerlvl` WRITE;
/*!40000 ALTER TABLE `project_animaldangerlvl` DISABLE KEYS */;
INSERT INTO `project_animaldangerlvl` VALUES (2,1),(1,1),(3,1),(10,2),(11,2),(12,1),(13,3),(14,2),(15,3),(16,4),(17,2),(18,3),(19,1),(20,5),(21,5),(22,2);
/*!40000 ALTER TABLE `project_animaldangerlvl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_dangerlevel`
--

DROP TABLE IF EXISTS `project_dangerlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_dangerlevel` (
  `dangerid` int(11) NOT NULL,
  `level` varchar(45) NOT NULL,
  PRIMARY KEY (`dangerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_dangerlevel`
--

LOCK TABLES `project_dangerlevel` WRITE;
/*!40000 ALTER TABLE `project_dangerlevel` DISABLE KEYS */;
INSERT INTO `project_dangerlevel` VALUES (1,'Critically Endangered'),(2,'Endangered'),(3,'Vulnerable'),(4,'Near Threatened'),(5,'Least Concern');
/*!40000 ALTER TABLE `project_dangerlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_gallery`
--

DROP TABLE IF EXISTS `project_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_gallery` (
  `imageid` int(11) NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `imageid_UNIQUE` (`imageid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_gallery`
--

LOCK TABLES `project_gallery` WRITE;
/*!40000 ALTER TABLE `project_gallery` DISABLE KEYS */;
INSERT INTO `project_gallery` VALUES (1,'https://c402277.ssl.cf1.rackcdn.com/photos/10341/images/hero_small/wild_dogs-web.jpg?1447180370'),(2,'http://www.jukani.co.za/userfiles/content/grp18/wild13.jpg'),(4,'http://www.susankmcconnell.com/wp-content/gallery/wild-painted-dog/30GZ6I2805.jpg'),(6,'http://cdn.c.photoshelter.com/img-get/I0000aBmXSeHiO7w/s/900/900/Wild-Dog-017.jpg'),(7,'http://animals.sandiegozoo.org/sites/default/files/2016-09/jaguar_ZN.jpg'),(8,'http://dreamicus.com/data/jaguar/jaguar-03.jpg'),(10,'https://upload.wikimedia.org/wikipedia/commons/c/c3/Brown_Hyena_%28Parahyaena_brunnea%29_%286472937465%29.jpg'),(11,'https://i.ytimg.com/vi/IXmJ2XH_aQ8/maxresdefault.jpg');
/*!40000 ALTER TABLE `project_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_useranimal`
--

DROP TABLE IF EXISTS `project_useranimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_useranimal` (
  `userid` int(11) NOT NULL,
  `animalid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_useranimal`
--

LOCK TABLES `project_useranimal` WRITE;
/*!40000 ALTER TABLE `project_useranimal` DISABLE KEYS */;
INSERT INTO `project_useranimal` VALUES (1,2),(1,1),(1,3),(1,10),(1,11),(1,12),(1,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(4,20),(3,21),(3,22);
/*!40000 ALTER TABLE `project_useranimal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 16:56:28
