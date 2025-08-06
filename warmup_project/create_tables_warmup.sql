-- Drop tables if they exist (in order to avoid foreign key conflicts)
-- First drop main project tables that reference warmup tables
DROP TABLE IF EXISTS SecondaryFamilyMembers;
DROP TABLE IF EXISTS EmailLogs;
DROP TABLE IF EXISTS TeamPlayers;
DROP TABLE IF EXISTS TeamFormations;
DROP TABLE IF EXISTS Teams;
-- Then drop warmup project tables
DROP TABLE IF EXISTS ClubMemberHobbies;
DROP TABLE IF EXISTS MemberFamilyRelations;
DROP TABLE IF EXISTS FamilyMemberLocation;
DROP TABLE IF EXISTS PersonnelLocation;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS ClubMembers;
DROP TABLE IF EXISTS FamilyMembers;
DROP TABLE IF EXISTS Personnel;
DROP TABLE IF EXISTS Hobbies;
DROP TABLE IF EXISTS Locations;
-- Create Tables
CREATE TABLE `Locations` (
    `locationID` int NOT NULL AUTO_INCREMENT,
    `type` enum('Head', 'Branch') COLLATE utf8mb3_unicode_ci NOT NULL,
    `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `city` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `province` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `postalCode` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `phoneNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `webAddress` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `maxCapacity` int DEFAULT NULL,
    PRIMARY KEY (`locationID`),
    UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `Personnel` (
    `personnelID` int NOT NULL AUTO_INCREMENT,
    `firstName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    `lastName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    `dateOfBirth` date DEFAULT NULL,
    `socialSecurityNumber` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
    `medicareCardNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `telephoneNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `city` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `province` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `postalCode` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `role` enum(
        'Administrator',
        'Captain',
        'Coach',
        'Assistant Coach',
        'Other'
    ) COLLATE utf8mb3_unicode_ci NOT NULL,
    `mandate` enum('Volunteer', 'Salaried') COLLATE utf8mb3_unicode_ci NOT NULL,
    PRIMARY KEY (`personnelID`),
    UNIQUE KEY `socialSecurityNumber` (`socialSecurityNumber`),
    UNIQUE KEY `medicareCardNumber` (`medicareCardNumber`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `PersonnelLocation` (
    `personnelID` int NOT NULL,
    `locationID` int NOT NULL,
    `startDate` date NOT NULL,
    `endDate` date DEFAULT NULL,
    PRIMARY KEY (`personnelID`, `locationID`, `startDate`),
    KEY `locationID` (`locationID`),
    CONSTRAINT `PersonnelLocation_ibfk_1` FOREIGN KEY (`personnelID`) REFERENCES `Personnel` (`personnelID`),
    CONSTRAINT `PersonnelLocation_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `Locations` (`locationID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `FamilyMembers` (
    `familyMemberID` int NOT NULL AUTO_INCREMENT,
    `firstName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    `lastName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    `dateOfBirth` date DEFAULT NULL,
    `socialSecurityNumber` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
    `medicareCardNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `telephoneNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `city` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `province` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `postalCode` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    `email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`familyMemberID`),
    UNIQUE KEY `socialSecurityNumber` (`socialSecurityNumber`),
    UNIQUE KEY `medicareCardNumber` (`medicareCardNumber`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `FamilyMemberLocation` (
    `familyMemberID` int NOT NULL,
    `locationID` int NOT NULL,
    `startDate` date NOT NULL,
    `endDate` date DEFAULT NULL,
    PRIMARY KEY (`familyMemberID`, `locationID`, `startDate`),
    KEY `locationID` (`locationID`),
    CONSTRAINT `FamilyMemberLocation_ibfk_1` FOREIGN KEY (`familyMemberID`) REFERENCES `FamilyMembers` (`familyMemberID`),
    CONSTRAINT `FamilyMemberLocation_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `Locations` (`locationID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `ClubMembers` (
  `memberID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateOfBirth` date NOT NULL,
  `height` decimal(4,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `socialSecurityNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `medicareCardNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `telephoneNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postalCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `locationID` int NOT NULL,
  `isMinor` tinyint(1) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `socialSecurityNumber` (`socialSecurityNumber`),
  UNIQUE KEY `medicareCardNumber` (`medicareCardNumber`),
  KEY `locationID` (`locationID`),
  CONSTRAINT `ClubMembers_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `Locations` (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
CREATE TABLE `MemberFamilyRelations` (
    `memberID` int NOT NULL,
    `familyMemberID` int NOT NULL,
    `relationship` enum(
        'Father',
        'Mother',
        'Grandfather',
        'Grandmother',
        'Tutor',
        'Partner',
        'Friend',
        'Other'
    ) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`memberID`, `familyMemberID`),
    KEY `familyMemberID` (`familyMemberID`),
    CONSTRAINT `MemberFamilyRelations_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `ClubMembers` (`memberID`),
    CONSTRAINT `MemberFamilyRelations_ibfk_2` FOREIGN KEY (`familyMemberID`) REFERENCES `FamilyMembers` (`familyMemberID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `Hobbies` (
    `hobbyID` int NOT NULL AUTO_INCREMENT,
    `hobbyName` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
    PRIMARY KEY (`hobbyID`),
    UNIQUE KEY `hobbyName` (`hobbyName`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `ClubMemberHobbies` (
    `memberID` int NOT NULL,
    `hobbyID` int NOT NULL,
    PRIMARY KEY (`memberID`, `hobbyID`),
    KEY `hobbyID` (`hobbyID`),
    CONSTRAINT `ClubMemberHobbies_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `ClubMembers` (`memberID`),
    CONSTRAINT `ClubMemberHobbies_ibfk_2` FOREIGN KEY (`hobbyID`) REFERENCES `Hobbies` (`hobbyID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
CREATE TABLE `Payments` (
    `paymentID` int NOT NULL AUTO_INCREMENT,
    `memberID` int NOT NULL,
    `paymentDate` date NOT NULL,
    `paymentAmount` decimal(7, 2) NOT NULL,
    `paymentMethod` enum('Cash', 'Debit', 'Credit Card') COLLATE utf8mb3_unicode_ci NOT NULL,
    `membershipYear` year NOT NULL,
    PRIMARY KEY (`paymentID`),
    KEY `memberID` (`memberID`),
    CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `ClubMembers` (`memberID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;