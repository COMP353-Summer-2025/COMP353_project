-- Data population for COMP353 Main Project additional tables
-- Insert data into Teams table
INSERT INTO Teams (teamName, headCoachID, locationID, gender)
VALUES ('Pallet Town Pikachus', 1, 1, 'Male'),
    ('Cerulean City Staryu', 2, 2, 'Female'),
    ('Vermilion Voltorbs', 3, 3, 'Male'),
    ('Celadon Grass Giants', 9, 4, 'Female'),
    ('Fuchsia Poison Spikes', 5, 5, 'Male'),
    ('Saffron Psychic Powers', 8, 6, 'Female'),
    ('Lavender Ghost Hunters', 6, 7, 'Male'),
    ('Goldenrod Golden Eagles', 10, 8, 'Female'),
    ('Ecruteak Ancient Spirits', 2, 9, 'Male'),
    ('Blackthorn Dragon Force', 3, 10, 'Female'),
    ('Pallet Town Thunder', 4, 1, 'Female'),
    ('Cerulean Waves', 1, 2, 'Male'),
    ('Vermilion Storm', 9, 3, 'Female'),
    ('Celadon Rangers', 8, 4, 'Male'),
    ('Fuchsia Lightning', 10, 5, 'Female');
-- Insert data into TeamFormations table
INSERT INTO TeamFormations (
        locationID,
        sessionType,
        sessionDate,
        sessionTime,
        sessionAddress,
        teamID,
        team2ID,
        scoreTeam1,
        scoreTeam2
    )
VALUES (
        1,
        'Game',
        '2024-03-15',
        '18:00:00',
        '1 Oak St, Pallet Town',
        1,
        3,
        25,
        22
    ),
    (
        2,
        'Training',
        '2024-03-20',
        '17:30:00',
        '25 Water Rd, Cerulean City',
        2,
        4,
        NULL,
        NULL
    ),
    (
        3,
        'Game',
        '2024-04-10',
        '19:00:00',
        '10 Harbor St, Vermilion City',
        3,
        5,
        21,
        25
    ),
    (
        4,
        'Training',
        '2024-04-15',
        '16:00:00',
        '5 Green Ave, Celadon City',
        4,
        6,
        NULL,
        NULL
    ),
    (
        5,
        'Game',
        '2024-05-05',
        '18:30:00',
        '15 Pink Blvd, Fuchsia City',
        5,
        7,
        25,
        18
    ),
    (
        6,
        'Training',
        '2024-05-12',
        '17:00:00',
        '30 Electric Rd, Saffron City',
        6,
        8,
        NULL,
        NULL
    ),
    (
        7,
        'Game',
        '2024-06-01',
        '19:30:00',
        '2 Spirit Ln, Lavender Town',
        7,
        9,
        22,
        25
    ),
    (
        8,
        'Training',
        '2024-06-08',
        '16:30:00',
        '88 Radio St, Goldenrod City',
        8,
        10,
        NULL,
        NULL
    ),
    (
        9,
        'Game',
        '2024-07-15',
        '18:00:00',
        '3 Bell Rd, Ecruteak City',
        9,
        1,
        25,
        20
    ),
    (
        10,
        'Training',
        '2024-07-22',
        '17:30:00',
        '10 Dragon St, Blackthorn City',
        10,
        2,
        NULL,
        NULL
    ),
    (
        1,
        'Game',
        '2024-08-05',
        '18:30:00',
        '1 Oak St, Pallet Town',
        1,
        5,
        25,
        23
    ),
    (
        2,
        'Game',
        '2024-08-12',
        '19:00:00',
        '25 Water Rd, Cerulean City',
        2,
        6,
        22,
        25
    ),
    (
        3,
        'Training',
        '2024-08-20',
        '17:00:00',
        '10 Harbor St, Vermilion City',
        11,
        12,
        NULL,
        NULL
    ),
    (
        4,
        'Game',
        '2024-09-01',
        '18:30:00',
        '5 Green Ave, Celadon City',
        13,
        14,
        25,
        21
    ),
    (
        5,
        'Training',
        '2024-09-08',
        '16:30:00',
        '15 Pink Blvd, Fuchsia City',
        15,
        1,
        NULL,
        NULL
    ),
    (
        6,
        'Game',
        '2024-09-15',
        '19:00:00',
        '30 Electric Rd, Saffron City',
        11,
        13,
        24,
        26
    ),
    (
        7,
        'Training',
        '2024-09-22',
        '17:30:00',
        '2 Spirit Ln, Lavender Town',
        12,
        14,
        NULL,
        NULL
    ),
    (
        8,
        'Game',
        '2024-09-29',
        '18:00:00',
        '88 Radio St, Goldenrod City',
        15,
        2,
        25,
        19
    ),
    (
        9,
        'Training',
        '2024-10-05',
        '16:00:00',
        '3 Bell Rd, Ecruteak City',
        11,
        15,
        NULL,
        NULL
    ),
    (
        10,
        'Game',
        '2024-10-12',
        '19:30:00',
        '10 Dragon St, Blackthorn City',
        12,
        13,
        23,
        25
    );
-- Insert data into TeamPlayers table
INSERT INTO TeamPlayers (formationID, clubMemberID, role)
VALUES -- Formation 1: Pallet Town vs Vermilion
    (1, 1, 'Setter'),
    (1, 2, 'Outside Hitter'),
    (1, 4, 'Middle Blocker'),
    (1, 6, 'Opposite Hitter'),
    (1, 8, 'Defensive Specialist'),
    (1, 10, 'Libero'),
    -- Formation 2: Cerulean Training
    (2, 2, 'Setter'),
    (2, 4, 'Outside Hitter'),
    (2, 6, 'Middle Blocker'),
    (2, 8, 'Opposite Hitter'),
    (2, 10, 'Defensive Specialist'),
    -- Formation 3: Vermilion vs Fuchsia
    (3, 3, 'Setter'),
    (3, 5, 'Outside Hitter'),
    (3, 7, 'Middle Blocker'),
    (3, 9, 'Opposite Hitter'),
    (3, 1, 'Defensive Specialist'),
    -- Formation 4: Celadon Training
    (4, 4, 'Setter'),
    (4, 6, 'Outside Hitter'),
    (4, 8, 'Middle Blocker'),
    (4, 10, 'Opposite Hitter'),
    -- Formation 5: Fuchsia vs Lavender
    (5, 5, 'Setter'),
    (5, 7, 'Outside Hitter'),
    (5, 9, 'Middle Blocker'),
    (5, 1, 'Opposite Hitter'),
    (5, 3, 'Defensive Specialist'),
    -- Formation 6: Saffron Training
    (6, 6, 'Setter'),
    (6, 8, 'Outside Hitter'),
    (6, 10, 'Middle Blocker'),
    (6, 2, 'Opposite Hitter'),
    -- Formation 7: Lavender vs Ecruteak
    (7, 7, 'Setter'),
    (7, 9, 'Outside Hitter'),
    (7, 1, 'Middle Blocker'),
    (7, 3, 'Opposite Hitter'),
    (7, 5, 'Defensive Specialist'),
    -- Formation 8: Goldenrod Training
    (8, 8, 'Setter'),
    (8, 10, 'Outside Hitter'),
    (8, 2, 'Middle Blocker'),
    (8, 4, 'Opposite Hitter'),
    -- Formation 9: Ecruteak vs Pallet Town
    (9, 9, 'Setter'),
    (9, 1, 'Outside Hitter'),
    (9, 3, 'Middle Blocker'),
    (9, 5, 'Opposite Hitter'),
    (9, 7, 'Defensive Specialist'),
    -- Formation 10: Blackthorn Training
    (10, 10, 'Setter'),
    (10, 2, 'Outside Hitter'),
    (10, 4, 'Middle Blocker'),
    (10, 6, 'Opposite Hitter'),
    -- Formation 11: Pallet Town vs Fuchsia
    (11, 1, 'Setter'),
    (11, 3, 'Outside Hitter'),
    (11, 5, 'Middle Blocker'),
    (11, 7, 'Opposite Hitter'),
    (11, 9, 'Defensive Specialist'),
    -- Formation 12: Cerulean vs Saffron
    (12, 2, 'Setter'),
    (12, 4, 'Outside Hitter'),
    (12, 6, 'Middle Blocker'),
    (12, 8, 'Opposite Hitter'),
    (12, 10, 'Libero'),
    -- Formation 13: Additional formations
    (13, 3, 'Libero'),
    (13, 5, 'Setter'),
    (13, 7, 'Outside Hitter'),
    (13, 9, 'Middle Blocker'),
    -- Formation 14: More team players
    (14, 2, 'Middle Blocker'),
    (14, 4, 'Defensive Specialist'),
    (14, 6, 'Setter'),
    (14, 8, 'Libero'),
    -- Formation 15: Additional team assignments
    (15, 9, 'Outside Hitter'),
    (15, 10, 'Opposite Hitter'),
    (15, 3, 'Middle Blocker'),
    (15, 4, 'Defensive Specialist'),
    -- Formation 16: More diverse roles
    (16, 5, 'Libero'),
    (16, 6, 'Setter'),
    (16, 7, 'Middle Blocker'),
    (16, 8, 'Outside Hitter'),
    -- Formation 17: Additional players
    (17, 9, 'Opposite Hitter'),
    (17, 10, 'Setter'),
    (17, 1, 'Libero'),
    (17, 2, 'Defensive Specialist'),
    -- Formation 18: More team combinations
    (18, 3, 'Outside Hitter'),
    (18, 4, 'Opposite Hitter'),
    (18, 5, 'Middle Blocker'),
    (18, 6, 'Libero'),
    -- Formation 19: Training session players
    (19, 7, 'Setter'),
    (19, 8, 'Defensive Specialist'),
    (19, 9, 'Outside Hitter'),
    (19, 10, 'Middle Blocker'),
    -- Formation 20: Final formation players
    (20, 1, 'Setter'),
    (20, 2, 'Outside Hitter'),
    (20, 3, 'Opposite Hitter'),
    (20, 4, 'Libero');
-- Insert data into EmailLogs table
INSERT INTO EmailLogs (
        emailDate,
        senderLocationID,
        receiverMemberID,
        subject,
        bodyPreview
    )
VALUES (
        '2024-01-15',
        1,
        1,
        'Welcome to Pallet Club!',
        'Dear Pikachu, welcome to our volleyball club! We are excited to have you join...'
    ),
    (
        '2024-01-20',
        2,
        2,
        'Training Schedule Update',
        'Hi Charmander, please note that our training schedule has been updated for...'
    ),
    (
        '2024-02-01',
        3,
        3,
        'Game Reminder',
        'Hello Bulbasaur, this is a reminder about the upcoming game on February 15th...'
    ),
    (
        '2024-02-10',
        4,
        4,
        'Payment Due Notice',
        'Dear Squirtle, your membership payment for 2024 is now due. Please make...'
    ),
    (
        '2024-02-15',
        5,
        5,
        'Team Selection',
        'Hi Jigglypuff, congratulations! You have been selected for the starting...'
    ),
    (
        '2024-03-01',
        6,
        6,
        'Equipment Check',
        'Hello Meowth, please remember to bring your volleyball gear for the next...'
    ),
    (
        '2024-03-10',
        7,
        7,
        'Match Results',
        'Dear Psyduck, here are the results from last week''s matches. Our team...'
    ),
    (
        '2024-03-20',
        8,
        8,
        'Injury Report',
        'Hi Snorlax, we hope you are recovering well from your recent injury...'
    ),
    (
        '2024-04-01',
        9,
        9,
        'Tournament Invitation',
        'Hello Eevee, we are pleased to invite you to participate in the upcoming...'
    ),
    (
        '2024-04-15',
        10,
        10,
        'Season Summary',
        'Dear Mewtwo, as we approach the end of the season, here is a summary...'
    ),
    (
        '2024-05-01',
        1,
        2,
        'Cross-Location Training',
        'Hi Charmander, we are organizing a cross-location training session...'
    ),
    (
        '2024-05-10',
        2,
        3,
        'Volleyball Workshop',
        'Hello Bulbasaur, we are hosting a special volleyball skills workshop...'
    ),
    (
        '2024-06-01',
        3,
        4,
        'Summer Camp Registration',
        'Dear Squirtle, registration is now open for our summer volleyball camp...'
    ),
    (
        '2024-06-15',
        4,
        5,
        'Equipment Donation',
        'Hi Jigglypuff, thank you for your generous equipment donation to the club...'
    ),
    (
        '2024-07-01',
        5,
        6,
        'Championship Preparation',
        'Hello Meowth, we are beginning our preparation for the championship...'
    ),
    (
        '2024-07-15',
        6,
        7,
        'Volunteer Opportunity',
        'Dear Psyduck, we have a great volunteer opportunity for you at the upcoming...'
    ),
    (
        '2024-08-01',
        7,
        8,
        'New Member Welcome',
        'Hi Snorlax, we would like you to help welcome our new members this month...'
    ),
    (
        '2024-08-10',
        8,
        9,
        'Award Ceremony',
        'Hello Eevee, you are cordially invited to our annual award ceremony...'
    ),
    (
        '2024-08-20',
        9,
        10,
        'Feedback Request',
        'Dear Mewtwo, we value your opinion and would appreciate your feedback...'
    ),
    (
        '2024-08-25',
        10,
        1,
        'Season End Party',
        'Hi Pikachu, join us for our end-of-season celebration party next week...'
    ),
    (
        '2024-01-25',
        1,
        3,
        'Skill Assessment',
        'Hello Bulbasaur, we would like to schedule a skill assessment session...'
    ),
    (
        '2024-02-05',
        2,
        4,
        'Nutrition Workshop',
        'Dear Squirtle, join us for a nutrition workshop designed for athletes...'
    ),
    (
        '2024-02-20',
        3,
        5,
        'Travel Team Selection',
        'Hi Jigglypuff, you are being considered for our travel team this season...'
    ),
    (
        '2024-03-05',
        4,
        6,
        'Equipment Return',
        'Hello Meowth, please remember to return the borrowed equipment by Friday...'
    ),
    (
        '2024-03-15',
        5,
        7,
        'Parent Meeting',
        'Dear Psyduck, there will be a parent meeting next Tuesday at 7 PM...'
    ),
    (
        '2024-03-25',
        6,
        8,
        'Medical Clearance',
        'Hi Snorlax, your medical clearance forms are due before the next practice...'
    ),
    (
        '2024-04-05',
        7,
        9,
        'Team Photo Day',
        'Hello Eevee, team photo day is scheduled for this Saturday at 10 AM...'
    ),
    (
        '2024-04-20',
        8,
        10,
        'Fundraising Event',
        'Dear Mewtwo, we are organizing a fundraising event and need volunteers...'
    ),
    (
        '2024-05-05',
        9,
        1,
        'Achievement Recognition',
        'Hi Pikachu, congratulations on your recent achievement in the tournament...'
    ),
    (
        '2024-05-15',
        10,
        2,
        'Summer Training Camp',
        'Hello Charmander, registration for summer training camp is now open...'
    );
-- Insert data into SecondaryFamilyMembers table
INSERT INTO SecondaryFamilyMembers (
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
        relationship,
        primaryFamilyMemberID
    )
VALUES (
        'Ash',
        'Ketchum',
        '1995-04-01',
        'SSN901234567',
        'MED901234567',
        '555-1001',
        '1 Oak Street',
        'Pallet Town',
        'Kanto',
        'K1A0A6',
        'ash.ketchum@pokemon.com',
        'Child',
        1
    ),
    (
        'Delia',
        'Ketchum',
        '1970-03-15',
        'SSN901234568',
        'MED901234568',
        '555-1002',
        '1 Oak Street',
        'Pallet Town',
        'Kanto',
        'K1A0A6',
        'delia.ketchum@pokemon.com',
        'Spouse',
        1
    ),
    (
        'May',
        'Maple',
        '1998-07-20',
        'SSN901234569',
        'MED901234569',
        '555-1003',
        '25 Water Road',
        'Cerulean City',
        'Kanto',
        'K2B1B7',
        'may.maple@pokemon.com',
        'Child',
        2
    ),
    (
        'Norman',
        'Maple',
        '1972-11-10',
        'SSN901234570',
        'MED901234570',
        '555-1004',
        '25 Water Road',
        'Cerulean City',
        'Kanto',
        'K2B1B7',
        'norman.maple@pokemon.com',
        'Spouse',
        2
    ),
    (
        'Brock',
        'Harrison',
        '1996-02-28',
        'SSN901234571',
        'MED901234571',
        '555-1005',
        '10 Harbor Street',
        'Vermilion City',
        'Kanto',
        'K3C2C8',
        'brock.harrison@pokemon.com',
        'Child',
        1
    ),
    (
        'Flannery',
        'Harrison',
        '1973-08-05',
        'SSN901234572',
        'MED901234572',
        '555-1006',
        '10 Harbor Street',
        'Vermilion City',
        'Kanto',
        'K3C2C8',
        'flannery.harrison@pokemon.com',
        'Parent',
        1
    ),
    (
        'Misty',
        'Waterflower',
        '1997-12-12',
        'SSN901234573',
        'MED901234573',
        '555-1007',
        '5 Green Avenue',
        'Celadon City',
        'Kanto',
        'K4D3D9',
        'misty.waterflower@pokemon.com',
        'Sibling',
        2
    ),
    (
        'Daisy',
        'Waterflower',
        '1975-06-18',
        'SSN901234574',
        'MED901234574',
        '555-1008',
        '5 Green Avenue',
        'Celadon City',
        'Kanto',
        'K4D3D9',
        'daisy.waterflower@pokemon.com',
        'Parent',
        2
    ),
    (
        'Dawn',
        'Pearl',
        '1999-09-14',
        'SSN901234575',
        'MED901234575',
        '555-1009',
        '15 Pink Boulevard',
        'Fuchsia City',
        'Kanto',
        'K5E4E0',
        'dawn.pearl@pokemon.com',
        'Child',
        1
    ),
    (
        'Johanna',
        'Pearl',
        '1974-01-22',
        'SSN901234576',
        'MED901234576',
        '555-1010',
        '15 Pink Boulevard',
        'Fuchsia City',
        'Kanto',
        'K5E4E0',
        'johanna.pearl@pokemon.com',
        'Spouse',
        1
    ),
    (
        'Gary',
        'Oak',
        '1995-11-05',
        'SSN901234577',
        'MED901234577',
        '555-1011',
        '30 Electric Road',
        'Saffron City',
        'Kanto',
        'K6F5F1',
        'gary.oak@pokemon.com',
        'Grandchild',
        2
    ),
    (
        'Professor',
        'Oak',
        '1950-04-30',
        'SSN901234578',
        'MED901234578',
        '555-1012',
        '30 Electric Road',
        'Saffron City',
        'Kanto',
        'K6F5F1',
        'prof.oak@pokemon.com',
        'Grandparent',
        2
    ),
    (
        'Serena',
        'Grace',
        '1998-05-17',
        'SSN901234579',
        'MED901234579',
        '555-1013',
        '2 Spirit Lane',
        'Lavender Town',
        'Kanto',
        'K7G6G2',
        'serena.grace@pokemon.com',
        'Other',
        1
    ),
    (
        'Grace',
        'Yvonne',
        '1976-10-03',
        'SSN901234580',
        'MED901234580',
        '555-1014',
        '2 Spirit Lane',
        'Lavender Town',
        'Kanto',
        'K7G6G2',
        'grace.yvonne@pokemon.com',
        'Parent',
        1
    ),
    (
        'Paul',
        'Shinji',
        '1996-08-25',
        'SSN901234581',
        'MED901234581',
        '555-1015',
        '88 Radio Street',
        'Goldenrod City',
        'Johto',
        'J8H7H3',
        'paul.shinji@pokemon.com',
        'Sibling',
        2
    );