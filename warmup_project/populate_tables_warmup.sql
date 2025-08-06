-- ===================================================================
-- COMP353 Warmup Project - Summer 2025
-- Database Application System for Montréal Volleyball Club (MVC)
-- Data Population Script - Warmup Tables
-- ===================================================================
-- This script populates the core database tables with comprehensive test data
-- to support all required queries and ensure proper functionality testing.
-- 
-- Tables populated in dependency order:
-- 1. Locations (Independent)
-- 2. Personnel (Independent) 
-- 3. FamilyMembers (Independent)
-- 4. ClubMembers (Independent)
-- 5. Hobbies (Independent)
-- 6. FamilyMemberLocation (Depends on FamilyMembers, Locations)
-- 7. MemberFamilyRelations (Depends on ClubMembers, FamilyMembers)
-- 8. PersonnelLocation (Depends on Personnel, Locations)
-- 9. ClubMemberHobbies (Depends on ClubMembers, Hobbies)
-- 10. Payments (Depends on ClubMembers)
-- ===================================================================
-- ===================================================================
-- 1. LOCATIONS TABLE
-- ===================================================================
-- Purpose: 12 locations (1 Head office + 11 Branch locations) to ensure 
--          comprehensive query coverage across different regions
-- ===================================================================
INSERT INTO Locations (
        type,
        name,
        address,
        city,
        province,
        postalCode,
        phoneNumber,
        webAddress,
        maxCapacity
    )
VALUES -- Head Office + Kanto Region
    (
        'Head',
        'Pallet Club',
        '1 Oak St',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        '555-1234',
        'http://palletvolleyball.com',
        100
    ),
    (
        'Branch',
        'Cerulean Club',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        '555-5678',
        'http://ceruleanmvc.com',
        80
    ),
    (
        'Branch',
        'Vermilion Club',
        '10 Harbor St',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        '555-8765',
        'http://vermilionmvc.com',
        60
    ),
    (
        'Branch',
        'Celadon Club',
        '5 Green Ave',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        '555-2345',
        'http://celadonmvc.com',
        70
    ),
    (
        'Branch',
        'Fuchsia Club',
        '15 Pink Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        '555-3456',
        'http://fuchsiamvc.com',
        50
    ),
    (
        'Branch',
        'Saffron Club',
        '30 Electric Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        '555-4567',
        'http://saffronmvc.com',
        90
    ),
    (
        'Branch',
        'Lavender Club',
        '2 Spirit Ln',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        '555-5679',
        'http://lavendermvc.com',
        40
    ),
    (
        'Branch',
        'Viridian Club',
        '20 Forest Ave',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        '555-9012',
        'http://viridianmvc.com',
        65
    ),
    (
        'Branch',
        'Pewter Club',
        '30 Rock St',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        '555-0123',
        'http://pewtermvc.com',
        55
    ),
    -- Johto Region
    (
        'Branch',
        'Goldenrod Club',
        '88 Radio St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        '555-6789',
        'http://goldenrodmvc.com',
        100
    ),
    (
        'Branch',
        'Ecruteak Club',
        '3 Bell Rd',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        '555-7890',
        'http://ecruteakmvc.com',
        70
    ),
    (
        'Branch',
        'Blackthorn Club',
        '10 Dragon St',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        '555-8901',
        'http://blackthornmvc.com',
        60
    );
-- ===================================================================
-- 2. PERSONNEL TABLE
-- ===================================================================
-- Purpose: 15 personnel with mixed roles (Coaches, Administrators) and
--          mandates (Salaried, Volunteer) distributed across locations
-- ===================================================================
INSERT INTO Personnel (
        firstName,
        lastName,
        dateOfBirth,
        socialSecurityNumber,
        medicareCardNumber,
        telephoneNumber,
        address,
        city,
        province,
        postalCode,
        email,
        role,
        mandate
    )
VALUES -- Head Coaches & Senior Staff
    (
        'Ash',
        'Ketchum',
        '1987-05-22',
        'SSN001',
        'MED001',
        '555-1111',
        '123 Pikachu Rd',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'ash@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Misty',
        'Waterflower',
        '1988-03-15',
        'SSN002',
        'MED002',
        '555-2222',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'misty@mvc.com',
        'Coach',
        'Volunteer'
    ),
    (
        'Brock',
        'Harrison',
        '1985-09-10',
        'SSN003',
        'MED003',
        '555-3333',
        '10 Harbor St',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        'brock@mvc.com',
        'Administrator',
        'Salaried'
    ),
    (
        'Gary',
        'Oak',
        '1987-11-22',
        'SSN004',
        'MED004',
        '555-4444',
        '1 Oak St',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'gary@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Jessie',
        'Team',
        '1989-07-08',
        'SSN005',
        'MED005',
        '555-5555',
        '15 Pink Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        'jessie@mvc.com',
        'Coach',
        'Volunteer'
    ),
    -- Regional Staff
    (
        'James',
        'Team',
        '1988-12-25',
        'SSN006',
        'MED006',
        '555-6666',
        '15 Pink Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        'james@mvc.com',
        'Administrator',
        'Volunteer'
    ),
    (
        'Professor',
        'Oak',
        '1955-01-01',
        'SSN007',
        'MED007',
        '555-7777',
        '1 Oak St',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'oak@mvc.com',
        'Administrator',
        'Salaried'
    ),
    (
        'Dawn',
        'Hikari',
        '1992-06-15',
        'SSN008',
        'MED008',
        '555-8888',
        '30 Electric Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        'dawn@mvc.com',
        'Coach',
        'Volunteer'
    ),
    (
        'May',
        'Haruka',
        '1991-04-03',
        'SSN009',
        'MED009',
        '555-9999',
        '3 Bell Rd',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        'may@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Tracey',
        'Sketchit',
        '1990-08-17',
        'SSN010',
        'MED010',
        '555-1010',
        '88 Radio St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        'tracey@mvc.com',
        'Administrator',
        'Volunteer'
    ),
    -- Additional Staff
    (
        'Serena',
        'Yvonne',
        '1993-02-28',
        'SSN011',
        'MED011',
        '555-1112',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'serena@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Clemont',
        'Citron',
        '1990-05-14',
        'SSN012',
        'MED012',
        '555-1213',
        '5 Green Ave',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        'clemont@mvc.com',
        'Administrator',
        'Volunteer'
    ),
    (
        'Cilan',
        'Dento',
        '1989-03-07',
        'SSN013',
        'MED013',
        '555-1314',
        '30 Electric Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        'cilan@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Iris',
        'Iris',
        '1994-12-12',
        'SSN014',
        'MED014',
        '555-1415',
        '88 Radio St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        'iris@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Cynthia',
        'Shirona',
        '1985-07-20',
        'SSN015',
        'MED015',
        '555-1516',
        '10 Dragon St',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        'cynthia@mvc.com',
        'Administrator',
        'Salaried'
    );
-- ===================================================================
-- 3. FAMILY MEMBERS TABLE
-- ===================================================================
-- Purpose: 15 family members to support query testing, especially
--          for family relationships and location associations
-- ===================================================================
INSERT INTO FamilyMembers (
        firstName,
        lastName,
        dateOfBirth,
        socialSecurityNumber,
        medicareCardNumber,
        telephoneNumber,
        address,
        city,
        province,
        postalCode,
        email
    )
VALUES (
        'Delia',
        'Ketchum',
        '1960-05-15',
        'FSSN001',
        'FMED001',
        '555-1212',
        '123 Pikachu Rd',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'delia@mvc.com'
    ),
    (
        'Joy',
        'Nurse',
        '1965-08-20',
        'FSSN002',
        'FMED002',
        '555-2323',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'joy@mvc.com'
    ),
    (
        'Lt. Surge',
        'Electric',
        '1970-01-30',
        'FSSN003',
        'FMED003',
        '555-3434',
        '10 Harbor St',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        'surge@mvc.com'
    ),
    (
        'Officer',
        'Jenny',
        '1975-06-12',
        'FSSN004',
        'FMED004',
        '555-4545',
        '5 Green Ave',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        'jenny@mvc.com'
    ),
    (
        'Sabrina',
        'Psychic',
        '1980-11-08',
        'FSSN005',
        'FMED005',
        '555-5656',
        '15 Pink Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        'sabrina@mvc.com'
    ),
    (
        'Koga',
        'Ninja',
        '1968-04-25',
        'FSSN006',
        'FMED006',
        '555-6767',
        '30 Electric Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        'koga@mvc.com'
    ),
    (
        'Morty',
        'Ghost',
        '1972-10-31',
        'FSSN007',
        'FMED007',
        '555-7878',
        '2 Spirit Ln',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        'morty@mvc.com'
    ),
    (
        'Whitney',
        'Normal',
        '1985-02-14',
        'FSSN008',
        'FMED008',
        '555-8989',
        '88 Radio St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        'whitney@mvc.com'
    ),
    (
        'Chuck',
        'Fighting',
        '1963-09-05',
        'FSSN009',
        'FMED009',
        '555-9090',
        '3 Bell Rd',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        'chuck@mvc.com'
    ),
    (
        'Clair',
        'Dragon',
        '1983-12-18',
        'FSSN010',
        'FMED010',
        '555-0101',
        '10 Dragon St',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        'clair@mvc.com'
    ),
    (
        'Norman',
        'Gym',
        '1967-07-03',
        'FSSN011',
        'FMED011',
        '555-1122',
        '20 Forest Ave',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        'norman@mvc.com'
    ),
    (
        'Caroline',
        'Helper',
        '1970-03-22',
        'FSSN012',
        'FMED012',
        '555-2233',
        '30 Rock St',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        'caroline@mvc.com'
    ),
    (
        'Flannery',
        'Fire',
        '1987-11-11',
        'FSSN013',
        'FMED013',
        '555-3344',
        '1 Oak St',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'flannery@mvc.com'
    ),
    (
        'Winona',
        'Flying',
        '1989-05-08',
        'FSSN014',
        'FMED014',
        '555-4455',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'winona@mvc.com'
    ),
    (
        'Tate',
        'Psychic',
        '1995-01-16',
        'FSSN015',
        'FMED015',
        '555-5566',
        '10 Harbor St',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        'tate@mvc.com'
    );
-- ===================================================================
-- 4. CLUB MEMBERS TABLE
-- ===================================================================
-- Purpose: 25 members with strategic age distribution (minors/adults) 
--          and varied configurations for comprehensive query testing
-- ===================================================================
INSERT INTO ClubMembers (
        firstName,
        lastName,
        dateOfBirth,
        height,
        weight,
        socialSecurityNumber,
        medicareCardNumber,
        telephoneNumber,
        address,
        city,
        province,
        postalCode,
        locationID,
        isMinor
    )
VALUES -- Minor Members (Under 18)
    (
        'Pikachu',
        'Electric',
        '2015-08-10',
        -- Age 10 (Minor)
        0.4,
        6.0,
        'CSSN001',
        'CMED001',
        '555-3001',
        '123 Pikachu Rd',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        1,
        TRUE
    ),
    (
        'Charmander',
        'Fire',
        '2010-04-15',
        -- Age 15 (Minor)
        0.6,
        8.5,
        'CSSN002',
        'CMED002',
        '555-3002',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        2,
        FALSE
    ),
    (
        'Bulbasaur',
        'Grass',
        '2016-03-22',
        -- Age 9 (Minor)
        0.7,
        6.9,
        'CSSN003',
        'CMED003',
        '555-3003',
        '10 Harbor St',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        3,
        TRUE
    ),
    (
        'Squirtle',
        'Water',
        '2009-09-08',
        -- Age 16 (Minor)
        0.5,
        9.0,
        'CSSN004',
        'CMED004',
        '555-3004',
        '5 Green Ave',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        4,
        FALSE
    ),
    (
        'Jigglypuff',
        'Normal',
        '2017-01-05',
        -- Age 8 (Minor)
        0.5,
        5.5,
        'CSSN005',
        'CMED005',
        '555-3005',
        '15 Pink Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        5,
        TRUE
    ),
    (
        'Meowth',
        'Normal',
        '2008-07-12',
        -- Age 17 (Minor)
        0.4,
        4.2,
        'CSSN006',
        'CMED006',
        '555-3006',
        '30 Electric Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        6,
        FALSE
    ),
    (
        'Psyduck',
        'Water',
        '2016-11-30',
        -- Age 8 (Minor)
        0.8,
        19.6,
        'CSSN007',
        'CMED007',
        '555-3007',
        '2 Spirit Ln',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        7,
        TRUE
    ),
    (
        'Snorlax',
        'Normal',
        '2007-12-25',
        -- Age 17 (Minor)
        2.1,
        460.0,
        'CSSN008',
        'CMED008',
        '555-3008',
        '88 Radio St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        8,
        FALSE
    ),
    (
        'Eevee',
        'Normal',
        '2017-06-18',
        -- Age 8 (Minor)
        0.3,
        6.5,
        'CSSN009',
        'CMED009',
        '555-3009',
        '3 Bell Rd',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        9,
        TRUE
    ),
    (
        'Mewtwo',
        'Psychic',
        '2008-02-29',
        -- Age 17 (Minor)
        2.0,
        122.0,
        'CSSN010',
        'CMED010',
        '555-3010',
        '10 Dragon St',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        10,
        FALSE
    ),
    -- Additional Minor Members for Query Testing
    (
        'Geodude',
        'Rock',
        '2016-05-14',
        -- Age 9 (Minor)
        0.4,
        20.0,
        'CSSN011',
        'CMED011',
        '555-3011',
        '20 Forest Ave',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        11,
        TRUE
    ),
    (
        'Machop',
        'Fighting',
        '2016-08-03',
        -- Age 9 (Minor)
        0.8,
        19.5,
        'CSSN012',
        'CMED012',
        '555-3012',
        '30 Rock St',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        12,
        TRUE
    ),
    (
        'Alakazam',
        'Psychic',
        '2016-10-21',
        -- Age 8 (Minor)
        1.5,
        48.0,
        'CSSN013',
        'CMED013',
        '555-3013',
        '1 Oak St',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        1,
        TRUE
    ),
    (
        'Gengar',
        'Ghost',
        '2016-12-07',
        -- Age 8 (Minor)
        1.5,
        40.5,
        'CSSN014',
        'CMED014',
        '555-3014',
        '25 Water Rd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        2,
        TRUE
    ),
    (
        'Onix',
        'Rock',
        '2016-04-19',
        -- Age 9 (Minor)
        8.8,
        210.0,
        'CSSN015',
        'CMED015',
        '555-3015',
        '10 Harbor St',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        3,
        TRUE
    ),
    -- Adult Members (18+)
    (
        'Charizard',
        'Fire',
        '2005-01-10',
        -- Age 20 (Adult)
        1.7,
        90.5,
        'CSSN016',
        'CMED016',
        '555-3016',
        '5 Green Ave',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        4,
        FALSE
    ),
    (
        'Blastoise',
        'Water',
        '2004-11-28',
        -- Age 20 (Adult)
        1.6,
        85.5,
        'CSSN017',
        'CMED017',
        '555-3017',
        '15 Pink Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        5,
        FALSE
    ),
    (
        'Venusaur',
        'Grass',
        '2003-06-16',
        -- Age 22 (Adult)
        2.0,
        100.0,
        'CSSN018',
        'CMED018',
        '555-3018',
        '30 Electric Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        6,
        FALSE
    ),
    (
        'Lapras',
        'Water',
        '2002-09-24',
        -- Age 22 (Adult)
        2.5,
        220.0,
        'CSSN019',
        'CMED019',
        '555-3019',
        '2 Spirit Ln',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        7,
        FALSE
    ),
    (
        'Dragonite',
        'Dragon',
        '2001-03-12',
        -- Age 24 (Adult)
        2.2,
        210.0,
        'CSSN020',
        'CMED020',
        '555-3020',
        '88 Radio St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        8,
        FALSE
    ),
    -- Members with Special Payment Status for Query Testing
    (
        'Slowpoke',
        'Water',
        '2006-07-07',
        -- Age 19 (Adult)
        1.2,
        36.0,
        'CSSN021',
        'CMED021',
        '555-3021',
        '3 Bell Rd',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        9,
        FALSE
    ),
    (
        'Magikarp',
        'Water',
        '2005-12-31',
        -- Age 19 (Adult)
        0.9,
        10.0,
        'CSSN022',
        'CMED022',
        '555-3022',
        '10 Dragon St',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        10,
        FALSE
    ),
    (
        'Ditto',
        'Normal',
        '2004-02-14',
        -- Age 21 (Adult)
        0.3,
        4.0,
        'CSSN023',
        'CMED023',
        '555-3023',
        '20 Forest Ave',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        11,
        FALSE
    ),
    (
        'Porygon',
        'Normal',
        '2003-08-09',
        -- Age 21 (Adult)
        0.8,
        36.5,
        'CSSN024',
        'CMED024',
        '555-3024',
        '30 Rock St',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        12,
        FALSE
    ),
    (
        'Mew',
        'Psychic',
        '2002-05-20',
        -- Age 23 (Adult)
        0.4,
        4.0,
        'CSSN025',
        'CMED025',
        '555-3025',
        '1 Oak St',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        1,
        FALSE
    );
-- ===================================================================
-- 5. HOBBIES TABLE
-- ===================================================================
-- Purpose: 15 diverse hobbies to test member interests and preferences
-- ===================================================================
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
    ('Running'),
    ('Cycling'),
    ('Dancing'),
    ('Singing'),
    ('Reading'),
    ('Cooking');
-- ===================================================================
-- 6. FAMILY MEMBER LOCATION RELATIONSHIPS
-- ===================================================================
-- Purpose: Links family members to specific locations with date ranges
--          Includes multi-location associations for enhanced testing
-- ===================================================================
INSERT INTO FamilyMemberLocation (familyMemberID, locationID, startDate, endDate)
VALUES -- Primary Location Associations
    (1, 1, '2023-01-01', NULL),
    -- Delia at Pallet Club
    (2, 2, '2023-01-01', NULL),
    -- Joy at Cerulean Club
    (3, 3, '2023-01-01', NULL),
    -- Lt. Surge at Vermilion Club
    (4, 4, '2023-01-01', NULL),
    -- Officer Jenny at Celadon Club
    (5, 5, '2023-01-01', NULL),
    -- Sabrina at Fuchsia Club
    (6, 6, '2023-01-01', NULL),
    -- Koga at Saffron Club
    (7, 7, '2023-01-01', NULL),
    -- Morty at Lavender Club
    (8, 8, '2023-01-01', NULL),
    -- Whitney at Goldenrod Club
    (9, 9, '2023-01-01', NULL),
    -- Chuck at Ecruteak Club
    (10, 10, '2023-01-01', NULL),
    -- Clair at Blackthorn Club
    (11, 11, '2023-01-01', NULL),
    -- Norman at Viridian Club
    (12, 12, '2023-01-01', NULL),
    -- Caroline at Pewter Club
    (13, 1, '2023-01-01', NULL),
    -- Flannery at Pallet Club
    (14, 2, '2023-01-01', NULL),
    -- Winona at Cerulean Club
    (15, 3, '2023-01-01', NULL),
    -- Tate at Vermilion Club
    -- Multi-Location Associations for Enhanced Query Testing
    (1, 2, '2022-06-01', NULL),
    -- Delia also at Cerulean
    (2, 3, '2022-06-01', NULL),
    -- Joy also at Vermilion
    (3, 4, '2022-06-01', NULL),
    -- Lt. Surge also at Celadon
    (4, 5, '2022-06-01', NULL),
    -- Officer Jenny also at Fuchsia
    (5, 6, '2022-06-01', NULL),
    -- Sabrina also at Saffron
    (11, 12, '2022-06-01', NULL),
    -- Norman also at Pewter
    (12, 1, '2022-06-01', NULL),
    -- Caroline also at Pallet
    (13, 2, '2022-06-01', NULL),
    -- Flannery also at Cerulean
    (14, 3, '2022-06-01', NULL),
    -- Winona also at Vermilion
    (15, 4, '2022-06-01', NULL);
-- Tate also at Celadon
-- ===================================================================
-- 7. MEMBER FAMILY RELATIONSHIPS
-- ===================================================================
-- Purpose: Establishes family connections between club members and 
--          family members for relationship-based queries
-- ===================================================================
INSERT INTO MemberFamilyRelations (memberID, familyMemberID, relationship)
VALUES -- Direct Family Relationships
    (1, 1, 'Mother'),
    -- Pikachu - Delia (Mother)
    (3, 2, 'Mother'),
    -- Bulbasaur - Joy (Mother)
    (5, 3, 'Father'),
    -- Jigglypuff - Lt. Surge (Father)
    (7, 4, 'Tutor'),
    -- Psyduck - Officer Jenny (Tutor)
    (9, 5, 'Grandmother'),
    -- Eevee - Sabrina (Grandmother)
    -- Extended Family Relationships for Query Testing
    (11, 11, 'Father'),
    -- Geodude - Norman (Father)
    (12, 12, 'Mother'),
    -- Machop - Caroline (Mother)
    (13, 13, 'Tutor'),
    -- Alakazam - Flannery (Tutor)
    (14, 14, 'Grandmother'),
    -- Gengar - Winona (Grandmother)
    (15, 15, 'Father'),
    -- Onix - Tate (Father)
    (16, 11, 'Father'),
    -- Charizard - Norman (Father)
    (17, 12, 'Mother'),
    -- Blastoise - Caroline (Mother)
    (18, 13, 'Tutor'),
    -- Venusaur - Flannery (Tutor)
    (19, 14, 'Grandmother'),
    -- Lapras - Winona (Grandmother)
    (20, 15, 'Father');
-- Dragonite - Tate (Father)
-- ===================================================================
-- 8. PERSONNEL LOCATION ASSIGNMENTS
-- ===================================================================
-- Purpose: Assigns personnel to specific locations with employment dates
--          Ensures comprehensive coverage across all locations
-- ===================================================================
INSERT INTO PersonnelLocation (personnelID, locationID, startDate, endDate)
VALUES -- Primary Location Assignments
    (1, 1, '2023-01-01', NULL),
    -- Ash at Pallet Club
    (2, 2, '2023-02-01', NULL),
    -- Misty at Cerulean Club
    (3, 3, '2023-03-01', NULL),
    -- Brock at Vermilion Club
    (4, 1, '2023-01-15', NULL),
    -- Gary at Pallet Club
    (5, 5, '2023-04-01', NULL),
    -- Jessie at Fuchsia Club
    (6, 5, '2023-04-01', NULL),
    -- James at Fuchsia Club
    (7, 1, '2022-12-01', NULL),
    -- Professor Oak at Pallet Club
    (8, 6, '2023-03-15', NULL),
    -- Dawn at Saffron Club
    (9, 7, '2023-05-01', NULL),
    -- May at Lavender Club
    (10, 8, '2023-06-01', NULL),
    -- Tracey at Goldenrod Club
    -- Additional Personnel for Full Location Coverage
    (11, 2, '2023-07-01', NULL),
    -- Serena at Cerulean Club
    (12, 4, '2023-08-01', NULL),
    -- Clemont at Celadon Club
    (13, 6, '2023-09-01', NULL),
    -- Cilan at Saffron Club
    (14, 8, '2023-10-01', NULL),
    -- Iris at Goldenrod Club
    (15, 10, '2023-11-01', NULL);
-- Cynthia at Blackthorn Club
-- ===================================================================
-- 9. CLUB MEMBER HOBBIES
-- ===================================================================
-- Purpose: Strategic hobby assignments to test various query scenarios:
--          - Members with 3+ hobbies (at least 7 for Query #3)
--          - Members with no hobbies (at least 8 for Query #4)
--          - Varied hobby distributions across all members
-- ===================================================================
INSERT INTO ClubMemberHobbies
VALUES -- MEMBERS WITH 3+ HOBBIES (7 members total for Query #3)
    -- Pikachu: 3 hobbies (1, 14, 15)
    (1, 1),
    (1, 14),
    (1, 15),
    -- Charmander: 4 hobbies (1, 2, 3, 4)
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    -- Bulbasaur: 3 hobbies (2, 3, 4)
    (3, 2),
    (3, 3),
    (3, 4),
    -- Squirtle: 4 hobbies (2, 4, 5, 6)
    (4, 2),
    (4, 4),
    (4, 5),
    (4, 6),
    -- Jigglypuff: 4 hobbies (1, 9, 10, 11)
    (5, 1),
    (5, 9),
    (5, 10),
    (5, 11),
    -- Meowth: 4 hobbies (1, 5, 7, 8)
    (6, 1),
    (6, 5),
    (6, 7),
    (6, 8),
    -- Psyduck: 4 hobbies (4, 12, 13, 14)
    (7, 4),
    (7, 12),
    (7, 13),
    (7, 14),
    -- MEMBERS WITH 1-2 HOBBIES
    -- Snorlax: 4 hobbies (6, 9, 10, 11)
    (8, 6),
    (8, 9),
    (8, 10),
    (8, 11),
    -- Eevee: 1 hobby (2)
    (9, 2),
    -- Mewtwo: 4 hobbies (1, 3, 5, 7)
    (10, 1),
    (10, 3),
    (10, 5),
    (10, 7),
    -- Slowpoke: 2 hobbies (8, 15)
    (21, 8),
    (21, 15),
    -- Magikarp: 2 hobbies (12, 13)
    (22, 12),
    (22, 13),
    -- ADULT MEMBERS WITH 3+ HOBBIES
    -- Charizard: 4 hobbies (1, 2, 3, 9)
    (16, 1),
    (16, 2),
    (16, 3),
    (16, 9),
    -- Blastoise: 4 hobbies (4, 5, 6, 10)
    (17, 4),
    (17, 5),
    (17, 6),
    (17, 10),
    -- Venusaur: 4 hobbies (7, 8, 9, 11)
    (18, 7),
    (18, 8),
    (18, 9),
    (18, 11),
    -- Lapras: 4 hobbies (1, 5, 12, 13)
    (19, 1),
    (19, 5),
    (19, 12),
    (19, 13),
    -- Dragonite: 4 hobbies (2, 6, 14, 15)
    (20, 2),
    (20, 6),
    (20, 14),
    (20, 15);
-- MEMBERS WITH NO HOBBIES (8 members for Query #4):
-- Geodude (11), Machop (12), Alakazam (13), Gengar (14), Onix (15)
-- Ditto (23), Porygon (24), Mew (25)
-- ===================================================================
-- 10. PAYMENTS TABLE
-- ===================================================================
-- Purpose: Comprehensive payment records across multiple years to support:
--          - Active/Inactive status determination
--          - Payment history analysis
--          - Outstanding balance calculations
--          - Donation tracking
--          - Historical payment patterns
-- ===================================================================
INSERT INTO Payments (
        memberID,
        paymentDate,
        paymentAmount,
        paymentMethod,
        membershipYear
    )
VALUES -- ===============================================================
    -- 2025 PAYMENTS (Current Year - Active Status)
    -- ===============================================================
    -- Minor Members: $100/year, Adult Members: $200/year
    (1, '2025-01-15', 100.00, 'Credit Card', 2025),
    -- Pikachu (Minor)
    (2, '2025-02-20', 200.00, 'Debit', 2025),
    -- Charmander (Adult)
    (3, '2025-03-05', 100.00, 'Cash', 2025),
    -- Bulbasaur (Minor)
    (4, '2025-04-10', 200.00, 'Credit Card', 2025),
    -- Squirtle (Adult)
    (5, '2025-01-20', 100.00, 'Debit', 2025),
    -- Jigglypuff (Minor)
    (6, '2025-02-25', 200.00, 'Cash', 2025),
    -- Meowth (Adult)
    (7, '2025-03-15', 100.00, 'Credit Card', 2025),
    -- Psyduck (Minor)
    (8, '2025-04-01', 200.00, 'Debit', 2025),
    -- Snorlax (Adult)
    (9, '2025-05-10', 100.00, 'Cash', 2025),
    -- Eevee (Minor)
    (10, '2025-06-18', 200.00, 'Credit Card', 2025),
    -- Mewtwo (Adult)
    (16, '2025-01-25', 200.00, 'Debit', 2025),
    -- Charizard (Adult)
    (17, '2025-02-28', 200.00, 'Cash', 2025),
    -- Blastoise (Adult)
    (18, '2025-03-20', 200.00, 'Credit Card', 2025),
    -- Venusaur (Adult)
    (19, '2025-04-15', 200.00, 'Debit', 2025),
    -- Lapras (Adult)
    (20, '2025-05-18', 200.00, 'Cash', 2025),
    -- Dragonite (Adult)
    -- ===============================================================
    -- 2024 PAYMENTS (Last Year - Mixed Complete/Incomplete)
    -- ===============================================================
    -- Complete Payments
    (2, '2024-02-20', 200.00, 'Debit', 2024),
    -- Charmander (Complete)
    (4, '2024-04-10', 200.00, 'Credit Card', 2024),
    -- Squirtle (Complete)
    (6, '2024-02-25', 200.00, 'Cash', 2024),
    -- Meowth (Complete)
    (8, '2024-04-01', 200.00, 'Debit', 2024),
    -- Snorlax (Complete)
    (10, '2024-06-18', 200.00, 'Credit Card', 2024),
    -- Mewtwo (Complete)
    -- Incomplete Payments (Partial amounts creating outstanding balances)
    (1, '2024-01-15', 50.00, 'Credit Card', 2024),
    -- Pikachu (Owes $50)
    (3, '2024-03-05', 50.00, 'Cash', 2024),
    -- Bulbasaur (Owes $50)
    (5, '2024-01-20', 50.00, 'Debit', 2024),
    -- Jigglypuff (Owes $50)
    (7, '2024-03-15', 50.00, 'Credit Card', 2024),
    -- Psyduck (Owes $50)
    (9, '2024-05-10', 50.00, 'Cash', 2024),
    -- Eevee (Owes $50)
    -- Minor Members with Incomplete Payments (for Query #11)
    (11, '2024-01-10', 50.00, 'Cash', 2024),
    -- Geodude (Owes $50)
    (12, '2024-02-10', 50.00, 'Debit', 2024),
    -- Machop (Owes $50)
    (13, '2024-03-10', 50.00, 'Credit Card', 2024),
    -- Alakazam (Owes $50)
    (14, '2024-04-10', 50.00, 'Cash', 2024),
    -- Gengar (Owes $50)
    (15, '2024-05-10', 50.00, 'Debit', 2024),
    -- Onix (Owes $50)
    -- Inactive Members with Outstanding Balances (for Query #8)
    (21, '2024-01-10', 50.00, 'Cash', 2024),
    -- Slowpoke (Owes $150)
    (22, '2024-02-10', 100.00, 'Debit', 2024),
    -- Magikarp (Owes $100)
    (23, '2024-03-10', 75.00, 'Credit Card', 2024),
    -- Ditto (Owes $125)
    (24, '2024-04-10', 150.00, 'Cash', 2024),
    -- Porygon (Owes $50)
    (25, '2024-05-10', 25.00, 'Debit', 2024),
    -- Mew (Owes $175)
    -- ===============================================================
    -- 2023 PAYMENTS (Historical with Donations)
    -- ===============================================================
    -- Regular Payments + Donations
    (1, '2023-01-15', 100.00, 'Credit Card', 2023),
    -- Pikachu (Regular)
    (2, '2023-02-20', 250.00, 'Debit', 2023),
    -- Charmander ($200 + $50 donation)
    (3, '2023-03-05', 100.00, 'Cash', 2023),
    -- Bulbasaur (Regular)
    (4, '2023-04-10', 300.00, 'Credit Card', 2023),
    -- Squirtle ($200 + $100 donation)
    (5, '2023-01-20', 150.00, 'Debit', 2023),
    -- Jigglypuff ($100 + $50 donation)
    (6, '2023-02-25', 400.00, 'Cash', 2023),
    -- Meowth ($200 + $200 donation)
    (7, '2023-03-15', 200.00, 'Credit Card', 2023),
    -- Psyduck ($100 + $100 donation)
    (8, '2023-04-01', 350.00, 'Debit', 2023),
    -- Snorlax ($200 + $150 donation)
    (9, '2023-05-10', 100.00, 'Cash', 2023),
    -- Eevee (Regular)
    (10, '2023-06-18', 500.00, 'Credit Card', 2023),
    -- Mewtwo ($200 + $300 donation)
    -- Additional 2023 payments for 2+ year members (Query #11)
    (11, '2023-01-20', 100.00, 'Credit Card', 2023),
    -- Geodude (2+ years)
    (12, '2023-02-25', 100.00, 'Debit', 2023),
    -- Machop (2+ years)
    (13, '2023-03-30', 100.00, 'Cash', 2023),
    -- Alakazam (2+ years)
    (14, '2023-04-15', 100.00, 'Credit Card', 2023),
    -- Gengar (2+ years)
    (15, '2023-05-20', 100.00, 'Debit', 2023),
    -- Onix (2+ years)
    -- ===============================================================
    -- 2022 PAYMENTS (Historical)
    -- ===============================================================
    (1, '2022-01-15', 100.00, 'Credit Card', 2022),
    -- Pikachu
    (2, '2022-02-20', 200.00, 'Debit', 2022),
    -- Charmander
    (4, '2022-04-10', 250.00, 'Credit Card', 2022),
    -- Squirtle ($200 + $50 donation)
    (6, '2022-02-25', 300.00, 'Cash', 2022),
    -- Meowth ($200 + $100 donation)
    (8, '2022-04-01', 350.00, 'Debit', 2022),
    -- Snorlax ($200 + $150 donation)
    (10, '2022-06-18', 400.00, 'Credit Card', 2022),
    -- Mewtwo ($200 + $200 donation)
    -- ===============================================================
    -- 2021 PAYMENTS (Historical - Members who joined as minors)
    -- ===============================================================
    (2, '2021-01-15', 100.00, 'Credit Card', 2021),
    -- Charmander (was minor)
    (4, '2021-04-10', 280.00, 'Credit Card', 2021),
    -- Squirtle ($200 + $80 donation)
    (6, '2021-02-25', 300.00, 'Cash', 2021),
    -- Meowth ($200 + $100 donation)
    (8, '2021-04-01', 250.00, 'Debit', 2021),
    -- Snorlax ($200 + $50 donation)
    (10, '2021-06-18', 350.00, 'Credit Card', 2021),
    -- Mewtwo ($200 + $150 donation)
    (2, '2021-02-20', 220.00, 'Debit', 2021),
    -- Charmander ($200 + $20 donation)
    -- ===============================================================
    -- 2020 PAYMENTS (Historical - Early member payments)
    -- ===============================================================
    (2, '2020-02-20', 200.00, 'Debit', 2020),
    -- Charmander
    (4, '2020-04-10', 300.00, 'Credit Card', 2020),
    -- Squirtle ($200 + $100 donation)
    (6, '2020-02-25', 250.00, 'Cash', 2020),
    -- Meowth ($200 + $50 donation)
    (8, '2020-04-01', 400.00, 'Debit', 2020),
    -- Snorlax ($200 + $200 donation)
    (10, '2020-06-18', 300.00, 'Credit Card', 2020),
    -- Mewtwo ($200 + $100 donation)
    (4, '2020-06-10', 100.00, 'Debit', 2020),
    -- Squirtle (when minor)
    -- ===============================================================
    -- EARLIER YEARS (2017-2019) - Members who joined as minors
    -- ===============================================================
    (2, '2019-01-15', 100.00, 'Credit Card', 2019),
    -- Charmander (minor)
    (6, '2019-08-20', 100.00, 'Cash', 2019),
    -- Meowth (minor)
    (8, '2018-03-15', 100.00, 'Credit Card', 2018),
    -- Snorlax (minor)
    (10, '2017-09-10', 100.00, 'Debit', 2017);
-- Mewtwo (minor)
-- ===================================================================
-- END OF WARMUP PROJECT DATA POPULATION
-- ===================================================================
-- Summary:
-- - 12 Locations (1 Head + 11 Branches)
-- - 15 Personnel (Mixed roles and mandates)
-- - 15 Family Members (Various relationships)
-- - 25 Club Members (Strategic age/hobby distribution)
-- - 15 Hobbies (Diverse interests)
-- - 25 Family-Location relationships
-- - 20 Member-Family relationships
-- - 15 Personnel-Location assignments
-- - 65 Member-Hobby associations
-- - 85 Payment records (2017-2025)
-- 
-- This dataset provides comprehensive coverage for all warmup queries
-- and ensures robust testing of database functionality.
-- ===================================================================