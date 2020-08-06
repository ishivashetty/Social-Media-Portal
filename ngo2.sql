# Host: localhost  (Version: 5.5.25)
# Date: 2017-03-25 07:34:20
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'admin@projectmad.com','admin','root');

#
# Structure for table "card"
#

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(11) DEFAULT NULL,
  `CardType` varchar(255) DEFAULT NULL,
  `CardNumber` varchar(255) DEFAULT NULL,
  `CardName` varchar(255) DEFAULT NULL,
  `ExpiryDate` varchar(255) DEFAULT NULL,
  `Cvv` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#
# Data for table "card"
#

INSERT INTO `card` VALUES (2,1,'MASTERCARD','5555555555555555','shiva','01-2024',444),(11,1,'RUPAY','6666666666666666','yyyyyyy','05-2018',444),(18,6,'VISA','4444444444444444','Ninad','01-2019',888);

#
# Structure for table "cart"
#

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

#
# Data for table "cart"
#

INSERT INTO `cart` VALUES (20,1,7,5),(21,1,8,1),(22,1,11,10);

#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PostId` int(11) DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

#
# Data for table "comment"
#


#
# Structure for table "donation"
#

DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation` (
  `Id` int(11) unsigned NOT NULL DEFAULT '0',
  `MemberId` int(11) DEFAULT NULL,
  `CardId` int(11) unsigned DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PaymentMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "donation"
#

INSERT INTO `donation` VALUES (1,1,2,678,'2017-03-20 10:37:21','Saved Cards'),(2,1,2,567,'2017-03-20 10:39:23','Saved Cards'),(4,1,2,444,'2017-03-20 10:57:59','Saved Cards'),(31,1,11,567,'2017-03-20 10:40:21','Saved Cards'),(32,1,2,44444,'2017-03-20 12:03:16','Saved Cards'),(33,1,2,4444,'2017-03-20 12:12:06','Saved Cards'),(34,1,2,45555,'2017-03-20 12:14:01','Saved Cards'),(35,1,2,4555,'2017-03-20 12:16:04','Saved Cards'),(36,1,2,4555,'2017-03-20 13:12:14','Saved Cards'),(37,1,2,444,'2017-03-20 13:23:14','Saved Cards'),(38,1,2,4566,'2017-03-20 13:25:38','Saved Cards'),(40,1,2,5666,'2017-03-20 14:05:05','Saved Cards'),(41,1,2,677,'2017-03-20 14:05:47','Saved Cards'),(42,6,18,4444,'2017-03-20 16:05:46','Saved Cards');

#
# Structure for table "event"
#

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Caption` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `Days` int(11) DEFAULT NULL,
  `ManagementId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "event"
#

INSERT INTO `event` VALUES (1,'Gender Equality','2017-03-24',55,1);

#
# Structure for table "eventsubscription"
#

DROP TABLE IF EXISTS `eventsubscription`;
CREATE TABLE `eventsubscription` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(11) DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "eventsubscription"
#

INSERT INTO `eventsubscription` VALUES (6,1,'shivashetty@dummy.com','9876767676');

#
# Structure for table "management"
#

DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `ProfilePhoto` varchar(255) DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "management"
#

INSERT INTO `management` VALUES (1,'joy','joy@gmail.com','joy123','Lighthouse.jpg','8989898989'),(2,'shivaa','sss@ggg.com','456789','user.jpg','8585858585');

#
# Structure for table "member"
#

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  `ProfilePhoto` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Dob` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Data for table "member"
#

INSERT INTO `member` VALUES (1,'Shiva','shivashetty@dummy.com','ABCD','9876767676','Desert.jpg','Male','',''),(2,'Shiva Shetty','shivashetty33@gmail.com','ABCD123','8082148141',NULL,'Male',NULL,NULL),(4,'yoyo','iiii@gg.com','1111','8888888888',NULL,'Male',NULL,'2017-03-07'),(5,'ooo','gggg@yyy.ccc','7777','8888888888','Desert.jpg','Male',NULL,'2017-03-08'),(6,'Ninad','ninad@gmail.com','789789','8989898523','user.jpg','Male','Neral Neral Neral Neral Neral Neral Neral Neral Neral Neral Neral l ','2017-03-08'),(7,'ddd','dddd@gg.cyyy','888888','4444444444','user.jpg','Male',NULL,'2002-03-21'),(10,'ooiii','hh@ggg.hhh','444444','9090909090','user.jpg','Male',NULL,'2002-03-14'),(11,'uuuu','hh@ggg.hhh','676767','6767676767','user.jpg','Male',NULL,'2002-03-21');

#
# Structure for table "memberevent"
#

DROP TABLE IF EXISTS `memberevent`;
CREATE TABLE `memberevent` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(11) DEFAULT NULL,
  `EventId` int(11) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "memberevent"
#

INSERT INTO `memberevent` VALUES (1,1,1,'2017-03-24 22:53:51'),(3,2,1,'2017-03-25 00:55:50');

#
# Structure for table "memberpost"
#

DROP TABLE IF EXISTS `memberpost`;
CREATE TABLE `memberpost` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PostId` int(11) DEFAULT NULL,
  `Uploader` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `LastSeen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "memberpost"
#


#
# Structure for table "post"
#

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) DEFAULT NULL,
  `UserType` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "post"
#

INSERT INTO `post` VALUES (1,'1','member','Desert.jpg','hi','2017-03-25 05:43:01'),(8,'1','member','Jellyfish.jpg','oo','2017-03-25 06:43:47'),(9,'1','management','Hydrangeas.jpg','-','2017-03-25 07:21:11');

#
# Structure for table "post111"
#

DROP TABLE IF EXISTS `post111`;
CREATE TABLE `post111` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "post111"
#

INSERT INTO `post111` VALUES (1,'Shiva','Demo Post','Koala.jpg','2017-04-11 01:03:47'),(2,'Joy','Demo Post','Hydrangeas.jpg','2017-09-11 14:25:36'),(3,'Tamim','Demo 3rd Post','Lighthouse.jpg','2017-11-11 23:25:57'),(4,'Ninad','Niand ka Post\r\nFrom Neral','Tulips.jpg','2017-05-11 11:27:06');

#
# Structure for table "postlike"
#

DROP TABLE IF EXISTS `postlike`;
CREATE TABLE `postlike` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PostId` int(11) DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "postlike"
#

INSERT INTO `postlike` VALUES (8,1,'Shiva','liked','2017-03-25 06:36:35'),(9,7,'Shiva','unliked','2017-03-25 05:43:47'),(11,1,'1','unliked','2017-03-25 06:45:59'),(12,8,'1','liked','2017-03-25 07:09:48');

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (7,'Tshirts Male','1.jpg','Tshirts Male','White Beard',1000),(8,'Tshirts Male','2.jpg','Tshirts Male','Black Beard',1000),(11,'Tshirts Male','3.jpg','Tshirts Male','White Tatto',1000),(12,'Tshirts Male','4.jpg','Tshirts Male','Customised',1000),(13,'Tshirts Female','prod4.jpg','Tshirts Female','Watermelon',750),(14,'Tshirts Female','prod3.jpg','Tshirts Female','Cactus',750),(15,'Tshirts Female','prod2.jpg','Tshirts Female','Eyelashes',750),(16,'Tshirts Female','prod1.jpg','Tshirts Female','Typewriter',750),(17,'Jewellery','140.jpg','Jewellery','Red Neckpiece',500),(18,'Jewellery','141.jpg','Jewellery','Earings',500),(19,'Jewellery','142.jpg','Jewellery','Antique',500),(20,'Jewellery','145.jpg','Jewellery','Bracelet',500),(21,'Planners1','122.jpg','Planners','Simple Planner',300),(22,'Planners2','123.jpg','Planners','Amazing Planner',300),(23,'Planners3','12222.jpg','Planners','Traditional Planner',300),(24,'Planners4','blur.jpg','Planners','Ink Planner',300);

#
# Structure for table "share"
#

DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PostId` int(11) DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "share"
#

INSERT INTO `share` VALUES (2,4,'Shiva','shared','2017-03-16 17:33:20'),(3,3,'Shiva','shared','2017-03-15 17:02:33'),(4,1,'Shiva','unshared','2017-03-25 06:36:46'),(5,2,'Shiva','shared','2017-03-16 23:49:10'),(6,5,'Shiva','shared','2017-03-25 05:29:19'),(7,7,'Shiva','unshared','2017-03-25 05:44:50'),(8,1,'1','unshared','2017-03-25 06:47:32');
