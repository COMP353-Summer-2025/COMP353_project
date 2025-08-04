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
CREATE TABLE Locations (
    locationID INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('Head', 'Branch') NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    province VARCHAR(100),
    postalCode VARCHAR(20),
    phoneNumber VARCHAR(20),
    webAddress VARCHAR(255),
    maxCapacity INT,
    UNIQUE(name)
);
CREATE TABLE Personnel (
    personnelID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    dateOfBirth DATE,
    socialSecurityNumber VARCHAR(20) NOT NULL UNIQUE,
    medicareCardNumber VARCHAR(20) UNIQUE,
    telephoneNumber VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    province VARCHAR(100),
    postalCode VARCHAR(20),
    email VARCHAR(100),
    role ENUM(
        'Administrator',
        'Captain',
        'Coach',
        'Assistant Coach',
        'Other'
    ) NOT NULL,
    mandate ENUM('Volunteer', 'Salaried') NOT NULL
);
CREATE TABLE PersonnelLocation (
    personnelID INT NOT NULL,
    locationID INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    PRIMARY KEY (personnelID, locationID, startDate),
    FOREIGN KEY (personnelID) REFERENCES Personnel(personnelID),
    FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);
CREATE TABLE FamilyMembers (
    familyMemberID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    dateOfBirth DATE,
    socialSecurityNumber VARCHAR(20) NOT NULL UNIQUE,
    medicareCardNumber VARCHAR(20) UNIQUE,
    telephoneNumber VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    province VARCHAR(100),
    postalCode VARCHAR(20),
    email VARCHAR(100)
);
CREATE TABLE FamilyMemberLocation (
    familyMemberID INT NOT NULL,
    locationID INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    PRIMARY KEY (familyMemberID, locationID, startDate),
    FOREIGN KEY (familyMemberID) REFERENCES FamilyMembers(familyMemberID),
    FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);
CREATE TABLE ClubMembers (
    memberID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    height DECIMAL(4, 2),
    weight DECIMAL(5, 2),
    socialSecurityNumber VARCHAR(20) NOT NULL UNIQUE,
    medicareCardNumber VARCHAR(20) UNIQUE,
    telephoneNumber VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    province VARCHAR(100),
    postalCode VARCHAR(20),
    locationID INT NOT NULL,
    isMinor BOOLEAN NOT NULL,
    FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);
CREATE TABLE MemberFamilyRelations (
    memberID INT NOT NULL,
    familyMemberID INT NOT NULL,
    relationship ENUM(
        'Father',
        'Mother',
        'Grandfather',
        'Grandmother',
        'Tutor',
        'Partner',
        'Friend',
        'Other'
    ),
    PRIMARY KEY (memberID, familyMemberID),
    FOREIGN KEY (memberID) REFERENCES ClubMembers(memberID),
    FOREIGN KEY (familyMemberID) REFERENCES FamilyMembers(familyMemberID)
);
CREATE TABLE Hobbies (
    hobbyID INT AUTO_INCREMENT PRIMARY KEY,
    hobbyName VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE ClubMemberHobbies (
    memberID INT NOT NULL,
    hobbyID INT NOT NULL,
    PRIMARY KEY (memberID, hobbyID),
    FOREIGN KEY (memberID) REFERENCES ClubMembers(memberID),
    FOREIGN KEY (hobbyID) REFERENCES Hobbies(hobbyID)
);
CREATE TABLE Payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    memberID INT NOT NULL,
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(7, 2) NOT NULL,
    paymentMethod ENUM('Cash', 'Debit', 'Credit Card') NOT NULL,
    membershipYear YEAR NOT NULL,
    FOREIGN KEY (memberID) REFERENCES ClubMembers(memberID)
);