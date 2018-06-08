CREATE DATABASE `innodb`;

USE `innodb`;

DROP TABLE IF EXISTS `BULLETINS`;
DROP TABLE IF EXISTS `EVENTS`;
DROP TABLE IF EXISTS `GROUPS`;
DROP TABLE IF EXISTS `GROUP_MEMBERS`;
DROP TABLE IF EXISTS `USERS`;
DROP TABLE IF EXISTS `USER_EVENTS`;

CREATE TABLE `BULLETINS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `userID` varchar(15) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulletinsFK_idx` (`userID`,`groupID`)
) 

CREATE TABLE `EVENTS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(15) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `start` varchar(10) DEFAULT NULL,
  `end` varchar(10) DEFAULT NULL,
  `groupID` int(11) NOT NULL,
  `yearweek` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) 

CREATE TABLE `GROUPS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) 

CREATE TABLE `GROUP_MEMBERS` (
  `username` varchar(15) NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`username`,`groupID`),
  KEY `group_memberFK2` (`groupID`),
  CONSTRAINT `group_memberFK1` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_memberFK2` FOREIGN KEY (`groupID`) REFERENCES `GROUPS` (`ID`)
) 

CREATE TABLE `USERS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) 

CREATE TABLE `USER_EVENTS` (
  `username` varchar(15) NOT NULL,
  `eventID` int(11) NOT NULL,
  PRIMARY KEY (`username`,`eventID`),
  KEY `userevents_FK2_idx` (`eventID`),
  CONSTRAINT `userevents_FK1` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userevents_FK2` FOREIGN KEY (`eventID`) REFERENCES `EVENTS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)