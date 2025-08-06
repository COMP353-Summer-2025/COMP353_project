-- COMP353 Warmup Project - Data Population Script (Compact Version)
-- 12 Locations, 15 Personnel, 15 Family Members, 25 Club Members, 15 Hobbies

-- 1. LOCATIONS TABLE
INSERT INTO Locations (type, name, address, city, province, postalCode, phoneNumber, webAddress, maxCapacity)
VALUES ('Head', 'Pallet Club', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', '555-1234', 'http://palletvolleyball.com', 100),
    ('Branch', 'Cerulean Club', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', '555-5678', 'http://ceruleanmvc.com', 80),
    ('Branch', 'Vermilion Club', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', '555-8765', 'http://vermilionmvc.com', 60),
    ('Branch', 'Celadon Club', '5 Green Ave', 'Celadon City', 'Kanto', 'C6L 8TY', '555-2345', 'http://celadonmvc.com', 70),
    ('Branch', 'Fuchsia Club', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', '555-3456', 'http://fuchsiamvc.com', 50),
    ('Branch', 'Saffron Club', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', '555-4567', 'http://saffronmvc.com', 90),
    ('Branch', 'Lavender Club', '2 Spirit Ln', 'Lavender Town', 'Kanto', 'L2V 7RN', '555-5679', 'http://lavendermvc.com', 40),
    ('Branch', 'Viridian Club', '20 Forest Ave', 'Viridian City', 'Kanto', 'V1R 2DN', '555-9012', 'http://viridianmvc.com', 65),
    ('Branch', 'Pewter Club', '30 Rock St', 'Pewter City', 'Kanto', 'P1W 3TR', '555-0123', 'http://pewtermvc.com', 55),
    ('Branch', 'Goldenrod Club', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', '555-6789', 'http://goldenrodmvc.com', 100),
    ('Branch', 'Ecruteak Club', '3 Bell Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', '555-7890', 'http://ecruteakmvc.com', 70),
    ('Branch', 'Blackthorn Club', '10 Dragon St', 'Blackthorn City', 'Johto', 'B1C 4TN', '555-8901', 'http://blackthornmvc.com', 60);

-- 2. PERSONNEL TABLE
INSERT INTO Personnel (firstName, lastName, dateOfBirth, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, email, role, mandate)
VALUES ('Ash', 'Ketchum', '1987-05-22', 'SSN001', 'MED001', '555-1111', '123 Pikachu Rd', 'Pallet Town', 'Kanto', 'K1N 7D4', 'ash@mvc.com', 'Coach', 'Salaried'),
    ('Misty', 'Waterflower', '1988-03-15', 'SSN002', 'MED002', '555-2222', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', 'misty@mvc.com', 'Coach', 'Volunteer'),
    ('Brock', 'Harrison', '1985-09-10', 'SSN003', 'MED003', '555-3333', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', 'brock@mvc.com', 'Administrator', 'Salaried'),
    ('Gary', 'Oak', '1987-11-22', 'SSN004', 'MED004', '555-4444', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', 'gary@mvc.com', 'Coach', 'Salaried'),
    ('Jessie', 'Team', '1989-07-08', 'SSN005', 'MED005', '555-5555', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 'jessie@mvc.com', 'Coach', 'Volunteer'),
    ('James', 'Team', '1988-12-25', 'SSN006', 'MED006', '555-6666', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 'james@mvc.com', 'Administrator', 'Volunteer'),
    ('Professor', 'Oak', '1955-01-01', 'SSN007', 'MED007', '555-7777', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', 'oak@mvc.com', 'Administrator', 'Salaried'),
    ('Dawn', 'Hikari', '1992-06-15', 'SSN008', 'MED008', '555-8888', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', 'dawn@mvc.com', 'Coach', 'Volunteer'),
    ('May', 'Haruka', '1991-04-03', 'SSN009', 'MED009', '555-9999', '3 Bell Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', 'may@mvc.com', 'Coach', 'Salaried'),
    ('Tracey', 'Sketchit', '1990-08-17', 'SSN010', 'MED010', '555-1010', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', 'tracey@mvc.com', 'Administrator', 'Volunteer'),
    ('Serena', 'Yvonne', '1993-02-28', 'SSN011', 'MED011', '555-1112', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', 'serena@mvc.com', 'Coach', 'Salaried'),
    ('Clemont', 'Citron', '1990-05-14', 'SSN012', 'MED012', '555-1213', '5 Green Ave', 'Celadon City', 'Kanto', 'C6L 8TY', 'clemont@mvc.com', 'Administrator', 'Volunteer'),
    ('Cilan', 'Dento', '1989-03-07', 'SSN013', 'MED013', '555-1314', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', 'cilan@mvc.com', 'Coach', 'Salaried'),
    ('Iris', 'Iris', '1994-12-12', 'SSN014', 'MED014', '555-1415', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', 'iris@mvc.com', 'Coach', 'Salaried'),
    ('Cynthia', 'Shirona', '1985-07-20', 'SSN015', 'MED015', '555-1516', '10 Dragon St', 'Blackthorn City', 'Johto', 'B1C 4TN', 'cynthia@mvc.com', 'Administrator', 'Salaried');

-- 3. FAMILY MEMBERS TABLE
INSERT INTO FamilyMembers (firstName, lastName, dateOfBirth, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, email)
VALUES ('Delia', 'Ketchum', '1960-05-15', 'FSSN001', 'FMED001', '555-1212', '123 Pikachu Rd', 'Pallet Town', 'Kanto', 'K1N 7D4', 'delia@mvc.com'),
    ('Joy', 'Nurse', '1965-08-20', 'FSSN002', 'FMED002', '555-2323', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', 'joy@mvc.com'),
    ('Lt. Surge', 'Electric', '1970-01-30', 'FSSN003', 'FMED003', '555-3434', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', 'surge@mvc.com'),
    ('Officer', 'Jenny', '1975-06-12', 'FSSN004', 'FMED004', '555-4545', '5 Green Ave', 'Celadon City', 'Kanto', 'C6L 8TY', 'jenny@mvc.com'),
    ('Sabrina', 'Psychic', '1980-11-08', 'FSSN005', 'FMED005', '555-5656', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 'sabrina@mvc.com'),
    ('Koga', 'Ninja', '1968-04-25', 'FSSN006', 'FMED006', '555-6767', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', 'koga@mvc.com'),
    ('Morty', 'Ghost', '1972-10-31', 'FSSN007', 'FMED007', '555-7878', '2 Spirit Ln', 'Lavender Town', 'Kanto', 'L2V 7RN', 'morty@mvc.com'),
    ('Whitney', 'Normal', '1985-02-14', 'FSSN008', 'FMED008', '555-8989', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', 'whitney@mvc.com'),
    ('Chuck', 'Fighting', '1963-09-05', 'FSSN009', 'FMED009', '555-9090', '3 Bell Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', 'chuck@mvc.com'),
    ('Clair', 'Dragon', '1983-12-18', 'FSSN010', 'FMED010', '555-0101', '10 Dragon St', 'Blackthorn City', 'Johto', 'B1C 4TN', 'clair@mvc.com'),
    ('Norman', 'Gym', '1967-07-03', 'FSSN011', 'FMED011', '555-1122', '20 Forest Ave', 'Viridian City', 'Kanto', 'V1R 2DN', 'norman@mvc.com'),
    ('Caroline', 'Helper', '1970-03-22', 'FSSN012', 'FMED012', '555-2233', '30 Rock St', 'Pewter City', 'Kanto', 'P1W 3TR', 'caroline@mvc.com'),
    ('Flannery', 'Fire', '1987-11-11', 'FSSN013', 'FMED013', '555-3344', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', 'flannery@mvc.com'),
    ('Winona', 'Flying', '1989-05-08', 'FSSN014', 'FMED014', '555-4455', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', 'winona@mvc.com'),
    ('Tate', 'Psychic', '1995-01-16', 'FSSN015', 'FMED015', '555-5566', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', 'tate@mvc.com');

-- 4. CLUB MEMBERS TABLE
ALTER TABLE ClubMembers AUTO_INCREMENT = 1;
INSERT INTO ClubMembers (firstName, lastName, dateOfBirth, height, weight, socialSecurityNumber, medicareCardNumber, telephoneNumber, address, city, province, postalCode, locationID, isMinor, email)
VALUES ('Pikachu', 'Electric', '2015-08-10', 0.4, 6.0, 'CSSN001', 'CMED001', '555-3001', '123 Pikachu Rd', 'Pallet Town', 'Kanto', 'K1N 7D4', 1, TRUE, 'pikachu.electric@mvc.com'),
    ('Charmander', 'Fire', '2010-04-15', 0.6, 8.5, 'CSSN002', 'CMED002', '555-3002', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', 2, FALSE, 'charmander.fire@mvc.com'),
    ('Bulbasaur', 'Grass', '2016-03-22', 0.7, 6.9, 'CSSN003', 'CMED003', '555-3003', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', 3, TRUE, 'bulbasaur.grass@mvc.com'),
    ('Squirtle', 'Water', '2009-09-08', 0.5, 9.0, 'CSSN004', 'CMED004', '555-3004', '5 Green Ave', 'Celadon City', 'Kanto', 'C6L 8TY', 4, FALSE, 'squirtle.water@mvc.com'),
    ('Jigglypuff', 'Normal', '2017-01-05', 0.5, 5.5, 'CSSN005', 'CMED005', '555-3005', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 5, TRUE, 'jigglypuff.normal@mvc.com'),
    ('Meowth', 'Normal', '2008-07-12', 0.4, 4.2, 'CSSN006', 'CMED006', '555-3006', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', 6, FALSE, 'meowth.normal@mvc.com'),
    ('Psyduck', 'Water', '2016-11-30', 0.8, 19.6, 'CSSN007', 'CMED007', '555-3007', '2 Spirit Ln', 'Lavender Town', 'Kanto', 'L2V 7RN', 7, TRUE, 'psyduck.water@mvc.com'),
    ('Snorlax', 'Normal', '2007-12-25', 2.1, 460.0, 'CSSN008', 'CMED008', '555-3008', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', 8, FALSE, 'snorlax.normal@mvc.com'),
    ('Eevee', 'Normal', '2017-06-18', 0.3, 6.5, 'CSSN009', 'CMED009', '555-3009', '3 Bell Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', 9, TRUE, 'eevee.normal@mvc.com'),
    ('Mewtwo', 'Psychic', '2008-02-29', 2.0, 122.0, 'CSSN010', 'CMED010', '555-3010', '10 Dragon St', 'Blackthorn City', 'Johto', 'B1C 4TN', 10, FALSE, 'mewtwo.psychic@mvc.com'),
    ('Geodude', 'Rock', '2016-05-14', 0.4, 20.0, 'CSSN011', 'CMED011', '555-3011', '20 Forest Ave', 'Viridian City', 'Kanto', 'V1R 2DN', 11, TRUE, 'geodude.rock@mvc.com'),
    ('Machop', 'Fighting', '2016-08-03', 0.8, 19.5, 'CSSN012', 'CMED012', '555-3012', '30 Rock St', 'Pewter City', 'Kanto', 'P1W 3TR', 12, TRUE, 'machop.fighting@mvc.com'),
    ('Alakazam', 'Psychic', '2016-10-21', 1.5, 48.0, 'CSSN013', 'CMED013', '555-3013', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', 1, TRUE, 'alakazam.psychic@mvc.com'),
    ('Gengar', 'Ghost', '2016-12-07', 1.5, 40.5, 'CSSN014', 'CMED014', '555-3014', '25 Water Rd', 'Cerulean City', 'Kanto', 'C3R 1LE', 2, TRUE, 'gengar.ghost@mvc.com'),
    ('Onix', 'Rock', '2016-04-19', 8.8, 210.0, 'CSSN015', 'CMED015', '555-3015', '10 Harbor St', 'Vermilion City', 'Kanto', 'V2R 5IT', 3, TRUE, 'onix.rock@mvc.com'),
    ('Charizard', 'Fire', '2005-01-10', 1.7, 90.5, 'CSSN016', 'CMED016', '555-3016', '5 Green Ave', 'Celadon City', 'Kanto', 'C6L 8TY', 4, FALSE, 'charizard.fire@mvc.com'),
    ('Blastoise', 'Water', '2004-11-28', 1.6, 85.5, 'CSSN017', 'CMED017', '555-3017', '15 Pink Blvd', 'Fuchsia City', 'Kanto', 'F1C 9HS', 5, FALSE, 'blastoise.water@mvc.com'),
    ('Venusaur', 'Grass', '2003-06-16', 2.0, 100.0, 'CSSN018', 'CMED018', '555-3018', '30 Electric Rd', 'Saffron City', 'Kanto', 'S4F 3RT', 6, FALSE, 'venusaur.grass@mvc.com'),
    ('Lapras', 'Water', '2002-09-24', 2.5, 220.0, 'CSSN019', 'CMED019', '555-3019', '2 Spirit Ln', 'Lavender Town', 'Kanto', 'L2V 7RN', 7, FALSE, 'lapras.water@mvc.com'),
    ('Dragonite', 'Dragon', '2001-03-12', 2.2, 210.0, 'CSSN020', 'CMED020', '555-3020', '88 Radio St', 'Goldenrod City', 'Johto', 'G8D 9LR', 8, FALSE, 'dragonite.dragon@mvc.com'),
    ('Slowpoke', 'Water', '2006-07-07', 1.2, 36.0, 'CSSN021', 'CMED021', '555-3021', '3 Bell Rd', 'Ecruteak City', 'Johto', 'E3C 1TY', 9, FALSE, 'slowpoke.water@mvc.com'),
    ('Magikarp', 'Water', '2005-12-31', 0.9, 10.0, 'CSSN022', 'CMED022', '555-3022', '10 Dragon St', 'Blackthorn City', 'Johto', 'B1C 4TN', 10, FALSE, 'magikarp.water@mvc.com'),
    ('Ditto', 'Normal', '2004-02-14', 0.3, 4.0, 'CSSN023', 'CMED023', '555-3023', '20 Forest Ave', 'Viridian City', 'Kanto', 'V1R 2DN', 11, FALSE, 'ditto.normal@mvc.com'),
    ('Porygon', 'Normal', '2003-08-09', 0.8, 36.5, 'CSSN024', 'CMED024', '555-3024', '30 Rock St', 'Pewter City', 'Kanto', 'P1W 3TR', 12, FALSE, 'porygon.normal@mvc.com'),
    ('Mew', 'Psychic', '2002-05-20', 0.4, 4.0, 'CSSN025', 'CMED025', '555-3025', '1 Oak St', 'Pallet Town', 'Kanto', 'K1N 7D4', 1, FALSE, 'mew.psychic@mvc.com');

-- 5. HOBBIES TABLE
INSERT INTO Hobbies (hobbyName)
VALUES ('Volleyball'), ('Soccer'), ('Tennis'), ('Ping Pong'), ('Swimming'), ('Hockey'), ('Golf'), ('Badminton'), ('Basketball'), ('Running'), ('Cycling'), ('Dancing'), ('Singing'), ('Reading'), ('Cooking');

-- 6. FAMILY MEMBER LOCATION RELATIONSHIPS
INSERT INTO FamilyMemberLocation (familyMemberID, locationID, startDate, endDate)
VALUES (1,1,'2023-01-01',NULL), (2,2,'2023-01-01',NULL), (3,3,'2023-01-01',NULL), (4,4,'2023-01-01',NULL), (5,5,'2023-01-01',NULL),
    (6,6,'2023-01-01',NULL), (7,7,'2023-01-01',NULL), (8,8,'2023-01-01',NULL), (9,9,'2023-01-01',NULL), (10,10,'2023-01-01',NULL),
    (11,11,'2023-01-01',NULL), (12,12,'2023-01-01',NULL), (13,1,'2023-01-01',NULL), (14,2,'2023-01-01',NULL), (15,3,'2023-01-01',NULL),
    (1,2,'2022-06-01',NULL), (2,3,'2022-06-01',NULL), (3,4,'2022-06-01',NULL), (4,5,'2022-06-01',NULL), (5,6,'2022-06-01',NULL),
    (11,12,'2022-06-01',NULL), (12,1,'2022-06-01',NULL), (13,2,'2022-06-01',NULL), (14,3,'2022-06-01',NULL), (15,4,'2022-06-01',NULL);

-- 7. MEMBER FAMILY RELATIONSHIPS
INSERT INTO MemberFamilyRelations (memberID, familyMemberID, relationship)
VALUES (1,1,'Mother'), (3,2,'Mother'), (5,3,'Father'), (7,4,'Tutor'), (9,5,'Grandmother'),
    (11,11,'Father'), (12,12,'Mother'), (13,13,'Tutor'), (14,14,'Grandmother'), (15,15,'Father'),
    (16,11,'Father'), (17,12,'Mother'), (18,13,'Tutor'), (19,14,'Grandmother'), (20,15,'Father');

-- 8. PERSONNEL LOCATION ASSIGNMENTS
INSERT INTO PersonnelLocation (personnelID, locationID, startDate, endDate)
VALUES (1,1,'2023-01-01',NULL), (2,2,'2023-02-01',NULL), (3,3,'2023-03-01',NULL), (4,1,'2023-01-15',NULL), (5,5,'2023-04-01',NULL),
    (6,5,'2023-04-01',NULL), (7,1,'2022-12-01',NULL), (8,6,'2023-03-15',NULL), (9,7,'2023-05-01',NULL), (10,8,'2023-06-01',NULL),
    (11,2,'2023-07-01',NULL), (12,4,'2023-08-01',NULL), (13,6,'2023-09-01',NULL), (14,8,'2023-10-01',NULL), (15,10,'2023-11-01',NULL);

-- 9. CLUB MEMBER HOBBIES
INSERT INTO ClubMemberHobbies
VALUES (1,1), (1,14), (1,15), (2,1), (2,2), (2,3), (2,4), (3,2), (3,3), (3,4), (4,2), (4,4), (4,5), (4,6),
    (5,1), (5,9), (5,10), (5,11), (6,1), (6,5), (6,7), (6,8), (7,4), (7,12), (7,13), (7,14),
    (8,6), (8,9), (8,10), (8,11), (9,2), (10,1), (10,3), (10,5), (10,7), (21,8), (21,15), (22,12), (22,13),
    (16,1), (16,2), (16,3), (16,9), (17,4), (17,5), (17,6), (17,10), (18,7), (18,8), (18,9), (18,11),
    (19,1), (19,5), (19,12), (19,13), (20,2), (20,6), (20,14), (20,15);

-- 10. PAYMENTS TABLE
INSERT INTO Payments (memberID, paymentDate, paymentAmount, paymentMethod, membershipYear)
VALUES -- 2025 Payments
    (1,'2025-01-15',100.00,'Credit Card',2025), (2,'2025-02-20',200.00,'Debit',2025), (3,'2025-03-05',100.00,'Cash',2025),
    (4,'2025-04-10',200.00,'Credit Card',2025), (5,'2025-01-20',100.00,'Debit',2025), (6,'2025-02-25',200.00,'Cash',2025),
    (7,'2025-03-15',100.00,'Credit Card',2025), (8,'2025-04-01',200.00,'Debit',2025), (9,'2025-05-10',100.00,'Cash',2025),
    (10,'2025-06-18',200.00,'Credit Card',2025), (16,'2025-01-25',200.00,'Debit',2025), (17,'2025-02-28',200.00,'Cash',2025),
    (18,'2025-03-20',200.00,'Credit Card',2025), (19,'2025-04-15',200.00,'Debit',2025), (20,'2025-05-18',200.00,'Cash',2025),
    -- 2024 Payments
    (2,'2024-02-20',200.00,'Debit',2024), (4,'2024-04-10',200.00,'Credit Card',2024), (6,'2024-02-25',200.00,'Cash',2024),
    (8,'2024-04-01',200.00,'Debit',2024), (10,'2024-06-18',200.00,'Credit Card',2024),
    (1,'2024-01-15',50.00,'Credit Card',2024), (3,'2024-03-05',50.00,'Cash',2024), (5,'2024-01-20',50.00,'Debit',2024),
    (7,'2024-03-15',50.00,'Credit Card',2024), (9,'2024-05-10',50.00,'Cash',2024),
    (11,'2024-01-10',50.00,'Cash',2024), (12,'2024-02-10',50.00,'Debit',2024), (13,'2024-03-10',50.00,'Credit Card',2024),
    (14,'2024-04-10',50.00,'Cash',2024), (15,'2024-05-10',50.00,'Debit',2024),
    (21,'2024-01-10',50.00,'Cash',2024), (22,'2024-02-10',100.00,'Debit',2024), (23,'2024-03-10',75.00,'Credit Card',2024),
    (24,'2024-04-10',150.00,'Cash',2024), (25,'2024-05-10',25.00,'Debit',2024),
    -- 2023 Payments
    (1,'2023-01-15',100.00,'Credit Card',2023), (2,'2023-02-20',250.00,'Debit',2023), (3,'2023-03-05',100.00,'Cash',2023),
    (4,'2023-04-10',300.00,'Credit Card',2023), (5,'2023-01-20',150.00,'Debit',2023), (6,'2023-02-25',400.00,'Cash',2023),
    (7,'2023-03-15',200.00,'Credit Card',2023), (8,'2023-04-01',350.00,'Debit',2023), (9,'2023-05-10',100.00,'Cash',2023),
    (10,'2023-06-18',500.00,'Credit Card',2023), (11,'2023-01-20',100.00,'Credit Card',2023), (12,'2023-02-25',100.00,'Debit',2023),
    (13,'2023-03-30',100.00,'Cash',2023), (14,'2023-04-15',100.00,'Credit Card',2023), (15,'2023-05-20',100.00,'Debit',2023),
    -- 2022 Payments
    (1,'2022-01-15',100.00,'Credit Card',2022), (2,'2022-02-20',200.00,'Debit',2022), (4,'2022-04-10',250.00,'Credit Card',2022),
    (6,'2022-02-25',300.00,'Cash',2022), (8,'2022-04-01',350.00,'Debit',2022), (10,'2022-06-18',400.00,'Credit Card',2022),
    -- 2021 Payments
    (2,'2021-01-15',100.00,'Credit Card',2021), (4,'2021-04-10',280.00,'Credit Card',2021), (6,'2021-02-25',300.00,'Cash',2021),
    (8,'2021-04-01',250.00,'Debit',2021), (10,'2021-06-18',350.00,'Credit Card',2021), (2,'2021-02-20',220.00,'Debit',2021),
    -- 2020 Payments
    (2,'2020-02-20',200.00,'Debit',2020), (4,'2020-04-10',300.00,'Credit Card',2020), (6,'2020-02-25',250.00,'Cash',2020),
    (8,'2020-04-01',400.00,'Debit',2020), (10,'2020-06-18',300.00,'Credit Card',2020), (4,'2020-06-10',100.00,'Debit',2020),
    -- Earlier Years
    (2,'2019-01-15',100.00,'Credit Card',2019), (6,'2019-08-20',100.00,'Cash',2019),
    (8,'2018-03-15',100.00,'Credit Card',2018), (10,'2017-09-10',100.00,'Debit',2017);
