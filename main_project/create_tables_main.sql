-- Additional tables for COMP353 Main Project
-- This file creates the missing tables based on the PDF requirements
-- Drop tables if they exist (in reverse order due to foreign key dependencies)
DROP TABLE IF EXISTS SecondaryFamilyMembers;
DROP TABLE IF EXISTS EmailLogs;
DROP TABLE IF EXISTS TeamPlayers;
DROP TABLE IF EXISTS TeamFormations;
DROP TABLE IF EXISTS Teams;
-- Create Teams table
CREATE TABLE `Teams` (
    `teamID` int NOT NULL AUTO_INCREMENT,
    `teamName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    `headCoachID` int NOT NULL,
    `locationID` int NOT NULL,
    `gender` enum('Male', 'Female') COLLATE utf8mb3_unicode_ci NOT NULL,
    PRIMARY KEY (`teamID`),
    KEY `headCoachID` (`headCoachID`),
    KEY `locationID` (`locationID`),
    CONSTRAINT `Teams_ibfk_1` FOREIGN KEY (`headCoachID`) REFERENCES `Personnel` (`personnelID`),
    CONSTRAINT `Teams_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `Locations` (`locationID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
-- Create TeamFormations table
CREATE TABLE `TeamFormations` (
    `formationID` int NOT NULL AUTO_INCREMENT,
    `locationID` int NOT NULL,
    `sessionType` enum('Game', 'Training') COLLATE utf8mb3_unicode_ci NOT NULL,
    `sessionDate` date NOT NULL,
    `sessionTime` time NOT NULL,
    `sessionAddress` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
    `teamID` int NOT NULL,
    `team2ID` int NOT NULL,
    `scoreTeam1` int DEFAULT NULL,
    `scoreTeam2` int DEFAULT NULL,
    PRIMARY KEY (`formationID`),
    KEY `locationID` (`locationID`),
    KEY `teamID_idx` (`teamID`),
    KEY `team2ID_idx` (`team2ID`),
    CONSTRAINT `fk_team1` FOREIGN KEY (`teamID`) REFERENCES `Teams` (`teamID`),
    CONSTRAINT `fk_team2` FOREIGN KEY (`team2ID`) REFERENCES `Teams` (`teamID`),
    CONSTRAINT `TeamFormations_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `Locations` (`locationID`),
    CONSTRAINT `TeamFormations_chk_1` CHECK ((`teamID` <> `team2ID`))
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
-- Create TeamPlayers table
CREATE TABLE `TeamPlayers` (
    `formationID` int NOT NULL,
    `clubMemberID` int NOT NULL,
    `role` enum(
        'Setter',
        'Outside Hitter',
        'Opposite Hitter',
        'Middle Blocker',
        'Defensive Specialist',
        'Libero'
    ) COLLATE utf8mb3_unicode_ci NOT NULL,
    PRIMARY KEY (`formationID`, `clubMemberID`),
    KEY `clubMemberID` (`clubMemberID`),
    CONSTRAINT `TeamPlayers_ibfk_1` FOREIGN KEY (`formationID`) REFERENCES `TeamFormations` (`formationID`),
    CONSTRAINT `TeamPlayers_ibfk_2` FOREIGN KEY (`clubMemberID`) REFERENCES `ClubMembers` (`memberID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
-- Create EmailLogs table
CREATE TABLE `EmailLogs` (
    `emailID` int NOT NULL AUTO_INCREMENT,
    `emailDate` date NOT NULL,
    `senderLocationID` int NOT NULL,
    `receiverMemberID` int NOT NULL,
    `subject` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
    `bodyPreview` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
    PRIMARY KEY (`emailID`),
    KEY `senderLocationID` (`senderLocationID`),
    KEY `receiverMemberID` (`receiverMemberID`),
    CONSTRAINT `EmailLogs_ibfk_1` FOREIGN KEY (`senderLocationID`) REFERENCES `Locations` (`locationID`),
    CONSTRAINT `EmailLogs_ibfk_2` FOREIGN KEY (`receiverMemberID`) REFERENCES `ClubMembers` (`memberID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;
-- Create SecondaryFamilyMembers table
CREATE TABLE `SecondaryFamilyMembers` (
    `secondaryFamilyMemberID` int NOT NULL AUTO_INCREMENT,
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
    `relationship` enum(
        'Spouse',
        'Parent',
        'Child',
        'Sibling',
        'Grandparent',
        'Grandchild',
        'Other'
    ) COLLATE utf8mb3_unicode_ci NOT NULL,
    `primaryFamilyMemberID` int NOT NULL,
    PRIMARY KEY (`secondaryFamilyMemberID`),
    UNIQUE KEY `socialSecurityNumber` (`socialSecurityNumber`),
    UNIQUE KEY `medicareCardNumber` (`medicareCardNumber`),
    KEY `primaryFamilyMemberID` (`primaryFamilyMemberID`),
    CONSTRAINT `SecondaryFamilyMembers_ibfk_1` FOREIGN KEY (`primaryFamilyMemberID`) REFERENCES `FamilyMembers` (`familyMemberID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_unicode_ci;