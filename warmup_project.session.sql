-- Drop tables if they exist (in order to avoid foreign key conflicts)
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
    role ENUM('Administrator', 'Captain', 'Coach', 'Assistant Coach', 'Other') NOT NULL,
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
    relationship ENUM('Father', 'Mother', 'Grandfather', 'Grandmother', 'Tutor', 'Partner', 'Friend', 'Other'),
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

-- Insert Data into Locations

INSERT INTO Locations (type, name, address, city, province, postalCode, phoneNumber, webAddress, maxCapacity)
VALUES ('Head', 'Pallet Club', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', '555-1234', 'http://palletvolleyball.com', 100),
    ('Branch', 'Cerulean Club', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', '555-5678', 'http://ceruleanmvc.com', 80),
    ('Branch', 'Vermilion Club', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', '555-8765', 'http://vermilionmvc.com', 60),
    ('Branch', 'Celadon Club', '5 Green Ave', 'Celadon City', 'Kanto', 'C6L 8TY', '555-2345', 'http://celadonmvc.com', 70),
    ('Branch', 'Fuchsia Club', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', '555-3456', 'http://fuchsiamvc.com', 50),
    ('Branch', 'Saffron Club', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', '555-4567', 'http://saffronmvc.com', 90),
    ('Branch', 'Lavender Club', '2 Spirit Ln', 'Lavender Town', 'Kanto', 'L2V 7RN', '555-5679', 'http://lavendermvc.com', 40),
    ('Branch', 'Goldenrod Club', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', '555-6789', 'http://goldenrodmvc.com', 100),
    ('Branch', 'Ecruteak Club', '3 Bell Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', '555-7890', 'http://ecruteakmvc.com', 70),
    ('Branch', 'Blackthorn Club', '10 Dragon St', 'Blackthorn City', 'Johto', 'B1C 4TN', '555-8901', 'http://blackthornmvc.com', 60);

-- Insert Data into Personnel

INSERT INTO Personnel (firstName, lastName, dateOfBirth, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, email, role, mandate)
VALUES ('Ash', 'Ketchum', '1987-05-22', 'SSN001', 'MED001', '555-1111', '123 Pikachu Rd', 'Pallet Town', 'Kanto', 'K1N 7D4', 'ash@mvc.com', 'Coach', 'Salaried'),
    ('Misty', 'Waterflower', '1988-03-15', 'SSN002', 'MED002', '555-2222', '456 Starmie St', 'Cerulean City', 'Kanto', 'C3R 1LE', 'misty@mvc.com', 'Assistant Coach', 'Volunteer'),
    ('Brock', 'Harrison', '1986-07-30', 'SSN003', 'MED003', '555-3333', '789 Onix Ln', 'Pewter City', 'Kanto', 'P1W 3TR', 'brock@mvc.com', 'Coach', 'Salaried'),
    ('Gary', 'Oak', '1987-09-10', 'SSN004', 'MED004', '555-4444', '321 Eevee Ave', 'Pallet Town', 'Kanto', 'K1N 7D4', 'gary@mvc.com', 'Administrator', 'Salaried'),
    ('Jessie', 'James', '1989-11-05', 'SSN005', 'MED005', '555-5555', '654 Wobbuffet Rd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 'jessie@mvc.com', 'Other', 'Volunteer'),
    ('James', 'Rocket', '1989-11-05', 'SSN006', 'MED006', '555-6666', '654 Wobbuffet Rd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 'james@mvc.com', 'Other', 'Volunteer'),
    ('Professor', 'Oak', '1950-03-12', 'SSN007', 'MED007', '555-7777', '12 Research Lab', 'Pallet Town', 'Kanto', 'K1N 7D4', 'oak@mvc.com', 'Administrator', 'Salaried'),
    ('Dawn', 'Haruno', '1990-06-14', 'SSN008', 'MED008', '555-8888', '789 Piplup Blvd', 'Twinleaf Town', 'Sinnoh', 'T1W 4DN', 'dawn@mvc.com', 'Assistant Coach', 'Volunteer'),
    ('May', 'Maple', '1991-08-21', 'SSN009', 'MED009', '555-9999', '456 Torchic St', 'Petalburg City', 'Hoenn', 'P3L 7RT', 'may@mvc.com', 'Coach', 'Salaried'),
    ('Tracey', 'Sketchit', '1989-12-30', 'SSN010', 'MED010', '555-0000', '123 Scyther Rd', 'Johto', 'Johto', 'J4T 3FR', 'tracey@mvc.com', 'Other', 'Volunteer');
    

-- Insert Data into FamilyMembers

INSERT INTO FamilyMembers (firstName, lastName, dateOfBirth, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, email)
VALUES ('Delia', 'Ketchum', '1960-05-15', 'FSSN001', 'FMED001', '555-1212', '123 Pikachu Rd', 'Pallet Town', 'Kanto', 'K1N 7D4', 'delia@mvc.com'),
    ('Joy', 'Waterflower', '1975-07-22', 'FSSN002', 'FMED002', '555-1313', '456 Cerulean St', 'Cerulean City', 'Kanto', 'C3R 1LE', 'joy@mvc.com'),
    ('Lt. Surge', 'Surge', '1965-11-11', 'FSSN003', 'FMED003', '555-1414', '10 Vermilion Rd', 'Vermilion City', 'Kanto', 'V2R 5IT', 'surge@mvc.com'),
    ('Officer', 'Jenny', '1970-09-09', 'FSSN004', 'FMED004', '555-1515', '5 Celadon Ave', 'Celadon City', 'Kanto', 'C6L 8TY', 'jenny@mvc.com'),
    ('Sabrina', 'Gym', '1980-01-01', 'FSSN005', 'FMED005', '555-1616', '15 Fuchsia Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 'sabrina@mvc.com'),
    ('Koga', 'Ninja', '1978-04-20', 'FSSN006', 'FMED006', '555-1717', '30 Saffron Rd', 'Saffron City', 'Kanto', 'S4F 3RT', 'koga@mvc.com'),
    ('Morty', 'Ghost', '1979-10-31', 'FSSN007', 'FMED007', '555-1818', '2 Lavender Ln', 'Lavender Town', 'Kanto', 'L2V 7RN', 'morty@mvc.com'),
    ('Whitney', 'Faun', '1982-08-12', 'FSSN008', 'FMED008', '555-1919', '88 Goldenrod St', 'Goldenrod City', 'Johto', 'G8D 9LR', 'whitney@mvc.com'),
    ('Chuck', 'Fighter', '1977-05-25', 'FSSN009', 'FMED009', '555-2020', '3 Ecruteak Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', 'chuck@mvc.com'),
    ('Clair', 'Dragon', '1981-03-03', 'FSSN010', 'FMED010', '555-2121', '10 Blackthorn St', 'Blackthorn City', 'Johto', 'B1C 4TN', 'clair@mvc.com');


-- Insert Data into FamilyMemberLocation

INSERT INTO FamilyMemberLocation (familyMemberID, locationID, startDate, endDate)
VALUES (1, 1, '2023-01-01', NULL),
    (2, 2, '2023-01-01', NULL),
    (3, 3, '2023-01-01', NULL),
    (4, 4, '2023-01-01', NULL),
    (5, 5, '2023-01-01', NULL),
    (6, 6, '2023-01-01', NULL),
    (7, 7, '2023-01-01', NULL),
    (8, 8, '2023-01-01', NULL),
    (9, 9, '2023-01-01', NULL),
    (10, 10, '2023-01-01', NULL);


-- Insert Data into ClubMembers

INSERT INTO ClubMembers (firstName, lastName, dateOfBirth, height, weight, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, locationID, isMinor)
VALUES ('Pikachu', 'Electric', '2015-08-10', 0.4, 6.0, 'CSSN001', 'CMED001', '555-3001', '123 Pikachu Rd', 'Pallet Town', 'Kanto', 'K1N 7D4', 1, TRUE),
    ('Charmander', 'Flame', '2010-02-15', 0.6, 8.5, 'CSSN002', 'CMED002', '555-3002', '456 Flame St', 'Cerulean City', 'Kanto', 'C3R 1LE', 2, FALSE),
    ('Bulbasaur', 'Leaf', '2012-11-20', 0.7, 9.0, 'CSSN003', 'CMED003', '555-3003', '789 Leaf Ln', 'Vermilion City', 'Kanto', 'V2R 5IT', 3, TRUE),
    ('Squirtle', 'Shell', '2009-07-07', 0.5, 9.5, 'CSSN004', 'CMED004', '555-3004', '321 Water Rd', 'Celadon City', 'Kanto', 'C6L 8TY', 4, FALSE),
    ('Jigglypuff', 'Song', '2016-04-01', 0.6, 5.5, 'CSSN005', 'CMED005', '555-3005', '654 Song St', 'Fuchsia City', 'Kanto', 'F1C 9HS', 5, TRUE),
    ('Meowth', 'Cat', '2011-12-12', 0.4, 4.2, 'CSSN006', 'CMED006', '555-3006', '987 Cat Ave', 'Saffron City', 'Kanto', 'S4F 3RT', 6, FALSE),
    ('Psyduck', 'Duck', '2014-09-15', 0.5, 7.0, 'CSSN007', 'CMED007', '555-3007', '222 Duck Blvd', 'Lavender Town', 'Kanto', 'L2V 7RN', 7, TRUE),
    ('Snorlax', 'Sleep', '2007-01-25', 2.1, 460, 'CSSN008', 'CMED008', '555-3008', '333 Sleep Rd', 'Goldenrod City', 'Johto', 'G8D 9LR', 8, FALSE),
    ('Eevee', 'Evolution', '2013-05-18', 0.3, 6.5, 'CSSN009', 'CMED009', '555-3009', '444 Evolution St', 'Ecruteak City', 'Johto', 'E3C 1TY', 9, TRUE),
    ('Mewtwo', 'Psychic', '2005-06-23', 2.0, 122, 'CSSN010', 'CMED010', '555-3010', '555 Psychic Ln', 'Blackthorn City', 'Johto', 'B1C 4TN', 10, FALSE);

-- Insert Data into MemberFamilyRelations

INSERT INTO MemberFamilyRelations (memberID, familyMemberID, relationship)
VALUES (1, 1, 'Mother'),
    (3, 2, 'Mother'),
    (5, 3, 'Father'),
    (7, 4, 'Tutor'),
    (9, 5, 'Grandmother');

-- Insert Data into PersonnelLocation

INSERT INTO PersonnelLocation (personnelID, locationID, startDate, endDate)
VALUES (1, 1, '2023-01-01', NULL),
    (2, 2, '2023-02-01', NULL),
    (3, 3, '2023-03-01', NULL),
    (4, 1, '2023-01-15', NULL),
    (5, 5, '2023-04-01', NULL),
    (6, 5, '2023-04-01', NULL),
    (7, 1, '2022-12-01', NULL),
    (8, 6, '2023-03-15', NULL),
    (9, 7, '2023-05-01', NULL),
    (10, 8, '2023-06-01', NULL);

-- Insert Data into Hobbies

INSERT INTO Hobbies (hobbyName)
VALUES ('Volleyball'),
    ('Soccer'),
    ('Tennis'),
    ('Ping Pong'),
    ('Swimming'),
    ('Hockey'),
    ('Golf'),
    ('Badminton'),
    ('Basketball'),
    ('Running');

-- Insert Data into ClubMemberHobbies

INSERT INTO ClubMemberHobbies
VALUES (2, 1),
    (2, 2),
    (2, 3),
    (4, 2),
    (4, 4),
    (4, 6),
    (6, 1),
    (6, 5),
    (6, 7),
    (6, 8),
    (1, 1),
    (3, 2),
    (3, 3),
    (5, 1),
    (5, 9),
    (7, 4),
    (8, 6),
    (8, 10),
    (9, 2);

-- Insert Data into Payments

INSERT INTO Payments (memberID, paymentDate, paymentAmount, paymentMethod, membershipYear)
VALUES (1, '2024-01-15', 100.00, 'Credit Card', 2024),
    (2, '2024-02-20', 200.00, 'Debit', 2024),
    (3, '2024-03-05', 100.00, 'Cash', 2024),
    (4, '2024-04-10', 200.00, 'Credit Card', 2024),
    (5, '2024-01-20', 100.00, 'Debit', 2024),
    (6, '2024-02-25', 200.00, 'Cash', 2024),
    (7, '2024-03-15', 100.00, 'Credit Card', 2024),
    (8, '2024-04-01', 200.00, 'Debit', 2024),
    (9, '2024-05-10', 100.00, 'Cash', 2024),
    (10, '2024-06-18', 200.00, 'Credit Card', 2024);

-- -- 8 Required Queries

-- -- 1. Location details with personnel and member counts
-- SELECT L.*, 
--        COUNT(DISTINCT PL.personnelID) AS personnelCount,
--        COUNT(DISTINCT CM.memberID) AS memberCount
-- FROM Locations L
-- LEFT JOIN PersonnelLocation PL ON L.locationID = PL.locationID AND PL.endDate IS NULL
-- LEFT JOIN ClubMembers CM ON L.locationID = CM.locationID
-- GROUP BY L.locationID
-- ORDER BY memberCount DESC;

-- -- 2. Major members who are also active personnel
-- SELECT CM.memberID, CM.firstName, CM.lastName,
--        TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
--        CM.city, CM.province,
--        IF(SUM(YEAR(P.paymentDate) = YEAR(CURDATE())) >= 1, 'Active', 'Inactive') AS status,
--        L.name AS memberLocation,
--        L2.name AS personnelLocation
-- FROM ClubMembers CM
-- JOIN Personnel P ON CM.socialSecurityNumber = P.socialSecurityNumber
-- JOIN PersonnelLocation PL ON P.personnelID = PL.personnelID AND PL.endDate IS NULL
-- JOIN Locations L2 ON PL.locationID = L2.locationID
-- JOIN Locations L ON CM.locationID = L.locationID
-- WHERE CM.isMinor = FALSE
-- GROUP BY CM.memberID
-- ORDER BY L2.name ASC, age ASC;

-- -- 3. Members with at least 3 hobbies
-- SELECT CM.memberID, CM.firstName, CM.lastName,
--        TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
--        CM.city, CM.province,
--        IF(SUM(YEAR(P.paymentDate) = YEAR(CURDATE())) >= 1, 'Active', 'Inactive') AS status,
--        L.name AS locationName,
--        COUNT(CMH.hobbyID) AS hobbyCount
-- FROM ClubMembers CM
-- JOIN ClubMemberHobbies CMH ON CM.memberID = CMH.memberID
-- JOIN Locations L ON CM.locationID = L.locationID
-- LEFT JOIN Payments P ON CM.memberID = P.memberID
-- GROUP BY CM.memberID
-- HAVING hobbyCount >= 3
-- ORDER BY age DESC, locationName ASC;

-- -- 4. Members with no hobbies
-- SELECT CM.memberID, CM.firstName, CM.lastName,
--        TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
--        CM.city, CM.province,
--        IF(SUM(YEAR(P.paymentDate) = YEAR(CURDATE())) >= 1, 'Active', 'Inactive') AS status,
--        L.name AS locationName
-- FROM ClubMembers CM
-- LEFT JOIN ClubMemberHobbies CMH ON CM.memberID = CMH.memberID
-- JOIN Locations L ON CM.locationID = L.locationID
-- LEFT JOIN Payments P ON CM.memberID = P.memberID
-- WHERE CMH.hobbyID IS NULL
-- GROUP BY CM.memberID
-- ORDER BY locationName ASC, age ASC;

-- -- 5. Total number of members by age
-- SELECT TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS age,
--        COUNT(*) AS memberCount
-- FROM ClubMembers
-- GROUP BY age
-- ORDER BY age ASC;

-- -- 6. Major family members and their children
-- SELECT FM.firstName AS parentFirst, FM.lastName AS parentLast,
--        CM.memberID, CM.firstName, CM.lastName, CM.dateOfBirth,
--        CM.socialSecurityNumber, CM.medicareCardNumber, CM.telephoneNumber,
--        CM.address, CM.city, CM.province, CM.postalCode,
--        MFR.relationship,
--        IF(SUM(YEAR(P.paymentDate) = YEAR(CURDATE())) >= 1, 'Active', 'Inactive') AS status
-- FROM FamilyMembers FM
-- JOIN MemberFamilyRelations MFR ON FM.familyMemberID = MFR.familyMemberID
-- JOIN ClubMembers CM ON MFR.memberID = CM.memberID
-- LEFT JOIN Payments P ON CM.memberID = P.memberID
-- WHERE NOT EXISTS (SELECT 1 FROM ClubMembers CM2 WHERE CM2.socialSecurityNumber = FM.socialSecurityNumber)
-- GROUP BY CM.memberID;

-- -- 7. Total membership fees and donations by major members (2020–2024)
-- SELECT SUM(paymentAmount) AS totalPayments,
--        SUM(
--          CASE
--            WHEN CM.isMinor = TRUE AND paymentAmount > 100 THEN paymentAmount - 100
--            WHEN CM.isMinor = FALSE AND paymentAmount > 200 THEN paymentAmount - 200
--            ELSE 0
--          END
--        ) AS totalDonations
-- FROM Payments P
-- JOIN ClubMembers CM ON P.memberID = CM.memberID
-- WHERE membershipYear BETWEEN 2020 AND 2024;

-- -- 8. Inactive members and amount due
-- SELECT CM.memberID, CM.firstName, CM.lastName,
--        TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
--        CM.city, CM.province,
--        L.name AS locationName,
--        (CASE
--          WHEN CM.isMinor = TRUE THEN 100
--          ELSE 200
--        END - COALESCE(SUM(P.paymentAmount), 0)) AS amountDue
-- FROM ClubMembers CM
-- JOIN Locations L ON CM.locationID = L.locationID
-- LEFT JOIN Payments P ON CM.memberID = P.memberID AND membershipYear = YEAR(CURDATE()) - 1
-- GROUP BY CM.memberID
-- HAVING amountDue > 0
-- ORDER BY locationName ASC, age ASC;