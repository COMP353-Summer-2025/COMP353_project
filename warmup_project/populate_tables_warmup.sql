-- Insert Data into Locations (12 locations to ensure query coverage)
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
VALUES (
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
    );
-- Insert Data into Personnel (15 personnel to ensure enough for queries)
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
VALUES (
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
        '456 Starmie St',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'misty@mvc.com',
        'Assistant Coach',
        'Volunteer'
    ),
    (
        'Brock',
        'Harrison',
        '1986-07-30',
        'SSN003',
        'MED003',
        '555-3333',
        '789 Onix Ln',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        'brock@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Gary',
        'Oak',
        '1987-09-10',
        'SSN004',
        'MED004',
        '555-4444',
        '321 Eevee Ave',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'gary@mvc.com',
        'Administrator',
        'Salaried'
    ),
    (
        'Jessie',
        'James',
        '1989-11-05',
        'SSN005',
        'MED005',
        '555-5555',
        '654 Wobbuffet Rd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        'jessie@mvc.com',
        'Other',
        'Volunteer'
    ),
    (
        'James',
        'Rocket',
        '1989-11-05',
        'SSN006',
        'MED006',
        '555-6666',
        '654 Wobbuffet Rd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        'james@mvc.com',
        'Other',
        'Volunteer'
    ),
    (
        'Professor',
        'Oak',
        '1950-03-12',
        'SSN007',
        'MED007',
        '555-7777',
        '12 Research Lab',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'oak@mvc.com',
        'Administrator',
        'Salaried'
    ),
    (
        'Dawn',
        'Haruno',
        '1990-06-14',
        'SSN008',
        'MED008',
        '555-8888',
        '789 Piplup Blvd',
        'Twinleaf Town',
        'Sinnoh',
        'T1W 4DN',
        'dawn@mvc.com',
        'Assistant Coach',
        'Volunteer'
    ),
    (
        'May',
        'Maple',
        '1991-08-21',
        'SSN009',
        'MED009',
        '555-9999',
        '456 Torchic St',
        'Petalburg City',
        'Hoenn',
        'P3L 7RT',
        'may@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Tracey',
        'Sketchit',
        '1989-12-30',
        'SSN010',
        'MED010',
        '555-0000',
        '123 Scyther Rd',
        'Johto',
        'Johto',
        'J4T 3FR',
        'tracey@mvc.com',
        'Other',
        'Volunteer'
    ),
    -- Additional personnel to ensure enough for query 2
    (
        'Serena',
        'Performer',
        '1992-04-18',
        'CSSN002',
        -- Same as Charmander to create member-personnel link
        'MED011',
        '555-1122',
        '456 Flame St',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'serena@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Clemont',
        'Inventor',
        '1985-08-30',
        'CSSN004',
        -- Same as Squirtle to create member-personnel link
        'MED012',
        '555-1133',
        '321 Water Rd',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        'clemont@mvc.com',
        'Assistant Coach',
        'Volunteer'
    ),
    (
        'Cilan',
        'Connoisseur',
        '1983-11-11',
        'CSSN006',
        -- Same as Meowth to create member-personnel link
        'MED013',
        '555-1144',
        '987 Cat Ave',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        'cilan@mvc.com',
        'Administrator',
        'Salaried'
    ),
    (
        'Iris',
        'Dragon',
        '1989-07-15',
        'CSSN008',
        -- Same as Snorlax to create member-personnel link
        'MED014',
        '555-1155',
        '333 Sleep Rd',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        'iris@mvc.com',
        'Coach',
        'Salaried'
    ),
    (
        'Cynthia',
        'Champion',
        '1980-01-20',
        'CSSN010',
        -- Same as Mewtwo to create member-personnel link
        'MED015',
        '555-1166',
        '555 Psychic Ln',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        'cynthia@mvc.com',
        'Administrator',
        'Salaried'
    );
-- Insert Data into FamilyMembers (15 family members to ensure query 6 has enough results)
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
        'Waterflower',
        '1975-07-22',
        'FSSN002',
        'FMED002',
        '555-1313',
        '456 Cerulean St',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'joy@mvc.com'
    ),
    (
        'Lt. Surge',
        'Surge',
        '1965-11-11',
        'FSSN003',
        'FMED003',
        '555-1414',
        '10 Vermilion Rd',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        'surge@mvc.com'
    ),
    (
        'Officer',
        'Jenny',
        '1970-09-09',
        'FSSN004',
        'FMED004',
        '555-1515',
        '5 Celadon Ave',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        'jenny@mvc.com'
    ),
    (
        'Sabrina',
        'Gym',
        '1980-01-01',
        'FSSN005',
        'FMED005',
        '555-1616',
        '15 Fuchsia Blvd',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        'sabrina@mvc.com'
    ),
    (
        'Koga',
        'Ninja',
        '1978-04-20',
        'FSSN006',
        'FMED006',
        '555-1717',
        '30 Saffron Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        'koga@mvc.com'
    ),
    (
        'Morty',
        'Ghost',
        '1979-10-31',
        'FSSN007',
        'FMED007',
        '555-1818',
        '2 Lavender Ln',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        'morty@mvc.com'
    ),
    (
        'Whitney',
        'Faun',
        '1982-08-12',
        'FSSN008',
        'FMED008',
        '555-1919',
        '88 Goldenrod St',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        'whitney@mvc.com'
    ),
    (
        'Chuck',
        'Fighter',
        '1977-05-25',
        'FSSN009',
        'FMED009',
        '555-2020',
        '3 Ecruteak Rd',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        'chuck@mvc.com'
    ),
    (
        'Clair',
        'Dragon',
        '1981-03-03',
        'FSSN010',
        'FMED010',
        '555-2121',
        '10 Blackthorn St',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        'clair@mvc.com'
    ),
    -- Additional family members for query 6
    (
        'Norman',
        'Parent',
        '1970-12-15',
        'FSSN011',
        'FMED011',
        '555-2222',
        '11 Family St',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        'norman@mvc.com'
    ),
    (
        'Caroline',
        'Parent',
        '1972-03-20',
        'FSSN012',
        'FMED012',
        '555-2323',
        '12 Family Ave',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        'caroline@mvc.com'
    ),
    (
        'Flannery',
        'Guardian',
        '1975-06-25',
        'FSSN013',
        'FMED013',
        '555-2424',
        '13 Guardian Rd',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        'flannery@mvc.com'
    ),
    (
        'Winona',
        'Guardian',
        '1978-09-30',
        'FSSN014',
        'FMED014',
        '555-2525',
        '14 Guardian Blvd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        'winona@mvc.com'
    ),
    (
        'Tate',
        'Guardian',
        '1980-11-05',
        'FSSN015',
        'FMED015',
        '555-2626',
        '15 Guardian Lane',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        'tate@mvc.com'
    );
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
    (10, 10, '2023-01-01', NULL),
    (11, 11, '2023-01-01', NULL),
    (12, 12, '2023-01-01', NULL),
    (13, 1, '2023-01-01', NULL),
    (14, 2, '2023-01-01', NULL),
    (15, 3, '2023-01-01', NULL),
    -- Additional location associations to create multi-location members for Query #11
    (1, 2, '2022-06-01', NULL),
    -- Delia (member 1's family) also at location 2
    (2, 3, '2022-06-01', NULL),
    -- Joy (member 3's family) also at location 3
    (3, 4, '2022-06-01', NULL),
    -- Lt. Surge (member 5's family) also at location 4
    (4, 5, '2022-06-01', NULL),
    -- Officer Jenny (member 7's family) also at location 5
    (5, 6, '2022-06-01', NULL),
    -- Sabrina (member 9's family) also at location 6
    (11, 12, '2022-06-01', NULL),
    -- Norman (member 11's family) also at location 12
    (12, 1, '2022-06-01', NULL),
    -- Caroline (member 12's family) also at location 1
    (13, 2, '2022-06-01', NULL),
    -- Flannery (member 13's family) also at location 2
    (14, 3, '2022-06-01', NULL),
    -- Winona (member 14's family) also at location 3
    (15, 4, '2022-06-01', NULL);
-- Tate (member 15's family) also at location 4
-- Insert Data into ClubMembers (25 members with various ages and hobby configurations)
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
VALUES (
        'Pikachu',
        'Electric',
        '2015-08-10',
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
        'Flame',
        '2005-02-15',
        -- Age 20 (was minor when joined)
        0.6,
        8.5,
        'CSSN002',
        'CMED002',
        '555-3002',
        '456 Flame St',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        2,
        FALSE
    ),
    (
        'Bulbasaur',
        'Leaf',
        '2012-11-20',
        0.7,
        9.0,
        'CSSN003',
        'CMED003',
        '555-3003',
        '789 Leaf Ln',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        3,
        TRUE
    ),
    (
        'Squirtle',
        'Shell',
        '2004-07-07',
        -- Age 21 (was minor when joined)
        0.5,
        9.5,
        'CSSN004',
        'CMED004',
        '555-3004',
        '321 Water Rd',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        4,
        FALSE
    ),
    (
        'Jigglypuff',
        'Song',
        '2016-04-01',
        0.6,
        5.5,
        'CSSN005',
        'CMED005',
        '555-3005',
        '654 Song St',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        5,
        TRUE
    ),
    (
        'Meowth',
        'Cat',
        '2003-12-12',
        -- Age 21 (was minor when joined)
        0.4,
        4.2,
        'CSSN006',
        'CMED006',
        '555-3006',
        '987 Cat Ave',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        6,
        FALSE
    ),
    (
        'Psyduck',
        'Duck',
        '2014-09-15',
        0.5,
        7.0,
        'CSSN007',
        'CMED007',
        '555-3007',
        '222 Duck Blvd',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        7,
        TRUE
    ),
    (
        'Snorlax',
        'Sleep',
        '2002-01-25',
        -- Age 23 (was minor when joined)
        2.1,
        460,
        'CSSN008',
        'CMED008',
        '555-3008',
        '333 Sleep Rd',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        8,
        FALSE
    ),
    (
        'Eevee',
        'Evolution',
        '2013-05-18',
        0.3,
        6.5,
        'CSSN009',
        'CMED009',
        '555-3009',
        '444 Evolution St',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        9,
        TRUE
    ),
    (
        'Mewtwo',
        'Psychic',
        '2001-06-23',
        -- Age 24 (was minor when joined)
        2.0,
        122,
        'CSSN010',
        'CMED010',
        '555-3010',
        '555 Psychic Ln',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        10,
        FALSE
    ),
    -- Additional members with no hobbies for query 4
    (
        'Geodude',
        'Rock',
        '2017-01-10',
        -- Age 8
        0.4,
        20.0,
        'CSSN011',
        'CMED011',
        '555-3011',
        '111 Rock St',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        11,
        TRUE
    ),
    (
        'Machop',
        'Fighting',
        '2018-02-15',
        -- Age 7
        0.8,
        19.5,
        'CSSN012',
        'CMED012',
        '555-3012',
        '222 Fight Ave',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        12,
        TRUE
    ),
    (
        'Alakazam',
        'Psychic',
        '2019-03-20',
        -- Age 6
        1.5,
        48.0,
        'CSSN013',
        'CMED013',
        '555-3013',
        '333 Mind Rd',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        1,
        TRUE
    ),
    (
        'Gengar',
        'Ghost',
        '2020-04-25',
        -- Age 5
        1.5,
        40.5,
        'CSSN014',
        'CMED014',
        '555-3014',
        '444 Spook Blvd',
        'Cerulean City',
        'Kanto',
        'C3R 1LE',
        2,
        TRUE
    ),
    (
        'Onix',
        'Rock',
        '2021-05-30',
        -- Age 4
        8.8,
        210,
        'CSSN015',
        'CMED015',
        '555-3015',
        '555 Stone Lane',
        'Vermilion City',
        'Kanto',
        'V2R 5IT',
        3,
        TRUE
    ),
    -- Members with 3+ hobbies for query 3
    (
        'Charizard',
        'Dragon',
        '1994-06-01',
        -- Age 31
        1.7,
        90.5,
        'CSSN016',
        'CMED016',
        '555-3016',
        '666 Fire St',
        'Celadon City',
        'Kanto',
        'C6L 8TY',
        4,
        FALSE
    ),
    (
        'Blastoise',
        'Turtle',
        '1993-07-15',
        -- Age 32
        1.6,
        85.5,
        'CSSN017',
        'CMED017',
        '555-3017',
        '777 Shell Ave',
        'Fuchsia City',
        'Kanto',
        'F1C 9HS',
        5,
        FALSE
    ),
    (
        'Venusaur',
        'Seed',
        '1992-08-20',
        -- Age 33
        2.0,
        100,
        'CSSN018',
        'CMED018',
        '555-3018',
        '888 Plant Rd',
        'Saffron City',
        'Kanto',
        'S4F 3RT',
        6,
        FALSE
    ),
    (
        'Lapras',
        'Transport',
        '1991-09-25',
        -- Age 34
        2.5,
        220,
        'CSSN019',
        'CMED019',
        '555-3019',
        '999 Ocean Blvd',
        'Lavender Town',
        'Kanto',
        'L2V 7RN',
        7,
        FALSE
    ),
    (
        'Dragonite',
        'Dragon',
        '1990-10-30',
        -- Age 35
        2.2,
        210,
        'CSSN020',
        'CMED020',
        '555-3020',
        '1010 Sky Lane',
        'Goldenrod City',
        'Johto',
        'G8D 9LR',
        8,
        FALSE
    ),
    -- Members who need payments for inactive status (query 8)
    (
        'Slowpoke',
        'Dopey',
        '2000-01-01',
        -- Age 25
        1.2,
        36.0,
        'CSSN021',
        'CMED021',
        '555-3021',
        '1111 Slow St',
        'Ecruteak City',
        'Johto',
        'E3C 1TY',
        9,
        FALSE
    ),
    (
        'Magikarp',
        'Fish',
        '2001-02-02',
        -- Age 24
        0.9,
        10.0,
        'CSSN022',
        'CMED022',
        '555-3022',
        '1212 Water Ave',
        'Blackthorn City',
        'Johto',
        'B1C 4TN',
        10,
        FALSE
    ),
    (
        'Ditto',
        'Transform',
        '2002-03-03',
        -- Age 23
        0.3,
        4.0,
        'CSSN023',
        'CMED023',
        '555-3023',
        '1313 Change Rd',
        'Viridian City',
        'Kanto',
        'V1R 2DN',
        11,
        FALSE
    ),
    (
        'Porygon',
        'Virtual',
        '2003-04-04',
        -- Age 22
        0.8,
        36.5,
        'CSSN024',
        'CMED024',
        '555-3024',
        '1414 Digital Blvd',
        'Pewter City',
        'Kanto',
        'P1W 3TR',
        12,
        FALSE
    ),
    (
        'Mew',
        'New Species',
        '2004-05-05',
        -- Age 21
        0.4,
        4.0,
        'CSSN025',
        'CMED025',
        '555-3025',
        '1515 Rare Lane',
        'Pallet Town',
        'Kanto',
        'K1N 7D4',
        1,
        FALSE
    );
-- Insert Data into MemberFamilyRelations (more relationships for query 6)
INSERT INTO MemberFamilyRelations (memberID, familyMemberID, relationship)
VALUES (1, 1, 'Mother'),
    (3, 2, 'Mother'),
    (5, 3, 'Father'),
    (7, 4, 'Tutor'),
    (9, 5, 'Grandmother'),
    -- Additional relationships for query 6 - family members NOT in club
    (11, 11, 'Father'),
    (12, 12, 'Mother'),
    (13, 13, 'Tutor'),
    (14, 14, 'Grandmother'),
    (15, 15, 'Father'),
    (16, 11, 'Father'),
    (17, 12, 'Mother'),
    (18, 13, 'Tutor'),
    (19, 14, 'Grandmother'),
    (20, 15, 'Father');
-- Insert Data into PersonnelLocation (ensure all personnel and additional locations are covered)
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
    (10, 8, '2023-06-01', NULL),
    -- Additional personnel locations
    (11, 2, '2023-07-01', NULL),
    -- Serena at Cerulean
    (12, 4, '2023-08-01', NULL),
    -- Clemont at Celadon
    (13, 6, '2023-09-01', NULL),
    -- Cilan at Saffron
    (14, 8, '2023-10-01', NULL),
    -- Iris at Goldenrod
    (15, 10, '2023-11-01', NULL);
-- Cynthia at Blackthorn
-- Insert Data into Hobbies (15 hobbies to ensure variety)
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
-- Insert Data into ClubMemberHobbies (strategic hobby assignments)
INSERT INTO ClubMemberHobbies
VALUES -- Members with 3+ hobbies (for query 3 - need at least 5)
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    -- Charmander: 4 hobbies
    (4, 2),
    (4, 4),
    (4, 6),
    (4, 5),
    -- Squirtle: 4 hobbies
    (6, 1),
    (6, 5),
    (6, 7),
    (6, 8),
    -- Meowth: 4 hobbies
    (8, 6),
    (8, 10),
    (8, 9),
    (8, 11),
    -- Snorlax: 4 hobbies
    (10, 1),
    (10, 3),
    (10, 5),
    (10, 7),
    -- Mewtwo: 4 hobbies
    (16, 1),
    (16, 2),
    (16, 3),
    (16, 9),
    -- Charizard: 4 hobbies
    (17, 4),
    (17, 5),
    (17, 6),
    (17, 10),
    -- Blastoise: 4 hobbies
    (18, 7),
    (18, 8),
    (18, 9),
    (18, 11),
    -- Venusaur: 4 hobbies
    (19, 1),
    (19, 5),
    (19, 12),
    (19, 13),
    -- Lapras: 4 hobbies
    (20, 2),
    (20, 6),
    (20, 14),
    (20, 15),
    -- Dragonite: 4 hobbies
    -- Members with 1-2 hobbies (some will have hobbies, some won't for query 4)
    (1, 1),
    -- Pikachu: 1 hobby
    (3, 2),
    (3, 3),
    -- Bulbasaur: 2 hobbies
    (5, 1),
    (5, 9),
    -- Jigglypuff: 2 hobbies
    (7, 4),
    -- Psyduck: 1 hobby
    (9, 2),
    -- Eevee: 1 hobby
    (21, 8),
    -- Slowpoke: 1 hobby
    (22, 12),
    -- Magikarp: 1 hobby
    -- Members 11-15 and 23-25 will have NO hobbies (for query 4 - need at least 5)
    -- Geodude (11), Machop (12), Alakazam (13), Gengar (14), Onix (15) - NO hobbies
    -- Ditto (23), Porygon (24), Mew (25) - NO hobbies
    -- Additional hobby assignments for variety
    (1, 14),
    (1, 15),
    -- Pikachu gets 3 hobbies total (1, 14, 15)
    (3, 4),
    -- Bulbasaur gets 3 hobbies total (2, 3, 4)
    (5, 10),
    (5, 11),
    -- Jigglypuff gets 4 hobbies total (1, 9, 10, 11)
    (7, 12),
    (7, 13),
    (7, 14),
    -- Psyduck gets 4 hobbies total (4, 12, 13, 14)
    (21, 15),
    -- Slowpoke gets another hobby
    (22, 13);
-- Magikarp gets another hobby
-- Additional hobby assignments to ensure at least 5 members with 3+ hobbies for Query 3
-- These assignments supplement the existing ones above
-- Members with additional hobbies:
-- 1. Pikachu: Already has 3 hobbies (1, 14, 15)
-- 2. Charmander: Already has 4 hobbies (1, 2, 3, 4) 
-- 3. Bulbasaur: Already has 3 hobbies (2, 3, 4)
-- 4. Squirtle: Already has 4 hobbies (2, 4, 6, 5)
-- 5. Jigglypuff: Already has 4 hobbies (1, 9, 10, 11)
-- 6. Meowth: Already has 4 hobbies (1, 5, 7, 8)
-- 7. Psyduck: Already has 4 hobbies (4, 12, 13, 14)
-- Total: 7 members with 3+ hobbies (more than the required 5)
-- Insert Data into Payments (comprehensive payment data for all queries)
INSERT INTO Payments (
        memberID,
        paymentDate,
        paymentAmount,
        paymentMethod,
        membershipYear
    )
VALUES -- 2025 payments (current year) - for active status
    (1, '2025-01-15', 100.00, 'Credit Card', 2025),
    (2, '2025-02-20', 200.00, 'Debit', 2025),
    (3, '2025-03-05', 100.00, 'Cash', 2025),
    (4, '2025-04-10', 200.00, 'Credit Card', 2025),
    (5, '2025-01-20', 100.00, 'Debit', 2025),
    (6, '2025-02-25', 200.00, 'Cash', 2025),
    (7, '2025-03-15', 100.00, 'Credit Card', 2025),
    (8, '2025-04-01', 200.00, 'Debit', 2025),
    (9, '2025-05-10', 100.00, 'Cash', 2025),
    (10, '2025-06-18', 200.00, 'Credit Card', 2025),
    (16, '2025-01-25', 200.00, 'Debit', 2025),
    (17, '2025-02-28', 200.00, 'Cash', 2025),
    (18, '2025-03-20', 200.00, 'Credit Card', 2025),
    (19, '2025-04-15', 200.00, 'Debit', 2025),
    (20, '2025-05-18', 200.00, 'Cash', 2025),
    -- 2024 payments (last year) - some incomplete for query 11
    (1, '2024-01-15', 50.00, 'Credit Card', 2024),
    -- Pikachu incomplete (minor, owes 50)
    (2, '2024-02-20', 200.00, 'Debit', 2024),
    (3, '2024-03-05', 50.00, 'Cash', 2024),
    -- Bulbasaur incomplete (minor, owes 50)  
    (4, '2024-04-10', 200.00, 'Credit Card', 2024),
    (5, '2024-01-20', 50.00, 'Debit', 2024),
    -- Jigglypuff incomplete (minor, owes 50)
    (6, '2024-02-25', 200.00, 'Cash', 2024),
    (7, '2024-03-15', 50.00, 'Credit Card', 2024),
    -- Psyduck incomplete (minor, owes 50)
    (8, '2024-04-01', 200.00, 'Debit', 2024),
    (9, '2024-05-10', 50.00, 'Cash', 2024),
    -- Eevee incomplete (minor, owes 50)
    (10, '2024-06-18', 200.00, 'Credit Card', 2024),
    -- Members 11-15 have incomplete payments for Query #11
    (11, '2024-01-10', 50.00, 'Cash', 2024),
    -- Geodude incomplete (minor, owes 50)
    (12, '2024-02-10', 50.00, 'Debit', 2024),
    -- Machop incomplete (minor, owes 50) 
    (13, '2024-03-10', 50.00, 'Credit Card', 2024),
    -- Alakazam incomplete (minor, owes 50)
    (14, '2024-04-10', 50.00, 'Cash', 2024),
    -- Gengar incomplete (minor, owes 50)
    (15, '2024-05-10', 50.00, 'Debit', 2024),
    -- Onix incomplete (minor, owes 50)
    -- Incomplete payments for inactive members (query 8)
    (21, '2024-01-10', 50.00, 'Cash', 2024),
    -- Slowpoke owes 150
    (22, '2024-02-10', 100.00, 'Debit', 2024),
    -- Magikarp owes 100
    (23, '2024-03-10', 75.00, 'Credit Card', 2024),
    -- Ditto owes 125
    (24, '2024-04-10', 150.00, 'Cash', 2024),
    -- Porygon owes 50
    (25, '2024-05-10', 25.00, 'Debit', 2024),
    -- Mew owes 175
    -- No 2024 payments for some members to create more inactive status
    -- Historical payments (2020-2023) for query 7
    (1, '2023-01-15', 100.00, 'Credit Card', 2023),
    (2, '2023-02-20', 250.00, 'Debit', 2023),
    -- Donation of 50
    (3, '2023-03-05', 100.00, 'Cash', 2023),
    (4, '2023-04-10', 300.00, 'Credit Card', 2023),
    -- Donation of 100
    (5, '2023-01-20', 150.00, 'Debit', 2023),
    -- Donation of 50
    (6, '2023-02-25', 400.00, 'Cash', 2023),
    -- Donation of 200
    (7, '2023-03-15', 200.00, 'Credit Card', 2023),
    -- Donation of 100
    (8, '2023-04-01', 350.00, 'Debit', 2023),
    -- Donation of 150
    (9, '2023-05-10', 100.00, 'Cash', 2023),
    (10, '2023-06-18', 500.00, 'Credit Card', 2023),
    -- Donation of 300
    -- Additional 2023 payments for members 11-15 to satisfy 2+ years condition for Query #11
    (11, '2023-01-20', 100.00, 'Credit Card', 2023),
    -- Geodude 2+ years
    (12, '2023-02-25', 100.00, 'Debit', 2023),
    -- Machop 2+ years
    (13, '2023-03-30', 100.00, 'Cash', 2023),
    -- Alakazam 2+ years
    (14, '2023-04-15', 100.00, 'Credit Card', 2023),
    -- Gengar 2+ years
    (15, '2023-05-20', 100.00, 'Debit', 2023),
    -- Onix 2+ years
    (1, '2022-01-15', 100.00, 'Credit Card', 2022),
    -- Early minor payments for Query #14 - members who joined as minors
    (2, '2021-01-15', 100.00, 'Credit Card', 2021),
    -- Charmander joined as minor (age 15-16)
    (4, '2020-06-10', 100.00, 'Debit', 2020),
    -- Squirtle joined as minor (age 15-16)  
    (6, '2019-08-20', 100.00, 'Cash', 2019),
    -- Meowth joined as minor (age 15-16)
    (8, '2018-03-15', 100.00, 'Credit Card', 2018),
    -- Snorlax joined as minor (age 15-16)
    (10, '2017-09-10', 100.00, 'Debit', 2017),
    -- Mewtwo joined as minor (age 15-16)
    (2, '2022-02-20', 200.00, 'Debit', 2022),
    (4, '2022-04-10', 250.00, 'Credit Card', 2022),
    -- Donation of 50
    (6, '2022-02-25', 300.00, 'Cash', 2022),
    -- Donation of 100
    (8, '2022-04-01', 350.00, 'Debit', 2022),
    -- Donation of 150
    (10, '2022-06-18', 400.00, 'Credit Card', 2022),
    -- Donation of 200
    (2, '2021-02-20', 220.00, 'Debit', 2021),
    -- Donation of 20
    (4, '2021-04-10', 280.00, 'Credit Card', 2021),
    -- Donation of 80
    (6, '2021-02-25', 300.00, 'Cash', 2021),
    -- Donation of 100
    (8, '2021-04-01', 250.00, 'Debit', 2021),
    -- Donation of 50
    (10, '2021-06-18', 350.00, 'Credit Card', 2021),
    -- Donation of 150
    (2, '2020-02-20', 200.00, 'Debit', 2020),
    (4, '2020-04-10', 300.00, 'Credit Card', 2020),
    -- Donation of 100
    (6, '2020-02-25', 250.00, 'Cash', 2020),
    -- Donation of 50
    (8, '2020-04-01', 400.00, 'Debit', 2020),
    -- Donation of 200
    (10, '2020-06-18', 300.00, 'Credit Card', 2020);
-- Donation of 100