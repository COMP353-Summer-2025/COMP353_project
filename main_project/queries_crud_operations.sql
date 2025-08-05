-- COMP353 Main Project - Summer 2025
-- Database Application System for Montréal Volleyball Club (MVC)
-- CRUD OPERATIONS (Queries 1-7) - DDL/DML Commands Implementation
-- 
-- This file contains the Create, Read, Update, Delete operations for the main project
-- which extends the warm-up project with advanced functionalities including:
-- 
-- CRUD Operations (Queries 1-7):
--   1. Create/Delete/Edit/Display a Location
--   2. Create/Delete/Edit/Display a Personnel  
--   3. Create/Delete/Edit/Display a FamilyMember (Primary/Secondary)
--   4. Create/Delete/Edit/Display a ClubMember (Major/Minor)
--   5. Create/Delete/Edit/Display a TeamFormation
--   6. Assign/Delete/Edit a club member to a team formation
--   7. Make payment for a club member
--
-- Project Requirements:
-- - Supports members aged 11+ (Minor: 11-17, Major: 18+)
-- - Annual fees: $100 (Minor), $200 (Major)
-- - Team formations for games and training sessions
-- - Automated email notifications for weekly schedules
-- - Gender-separated teams with specific volleyball positions
-- - Multi-location club management with head/branch structure
-- ==========================================================================
-- CRUD OPERATIONS (Queries 1-7) - DDL/DML Commands Implementation
-- These queries demonstrate the core database operations required for the MVC system
-- ==========================================================================
-- ==========================================================================
-- Query #1: Create/Delete/Edit/Display a Location
-- Locations can be either 'Head' (main office) or 'Branch' (satellite locations)
-- Each location has capacity limits and serves specific geographical areas
-- ==========================================================================
-- CREATE Location - Insert a new volleyball club location
-- Uses timestamp to ensure unique naming for demonstration purposes
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
        'Branch',
        CONCAT(
            'Sample Club ',
            DATE_FORMAT(NOW(), '%Y%m%d_%H%i%s')
        ),
        '123 Sample St',
        'Sample City',
        'Sample Province',
        'S1M 2PL',
        '555-0000',
        'http://sampleclub.com',
        75
    );
-- DISPLAY all Locations - Retrieve complete location information
-- Shows all club locations with their operational details
SELECT locationID,
    type,
    name,
    address,
    city,
    province,
    postalCode,
    phoneNumber,
    webAddress,
    maxCapacity
FROM Locations
ORDER BY name ASC;
-- EDIT Location - Update existing location information
-- Demonstrates modification of location capacity and contact details
UPDATE Locations
SET address = '456 Updated Sample St',
    maxCapacity = 80,
    phoneNumber = '555-1111'
WHERE name LIKE 'Sample Club %'
    AND name REGEXP '[0-9]{8}_[0-9]{6}$'
LIMIT 1;
-- DELETE Location - Remove location from system
-- Note: May fail due to foreign key constraints if location has active members/teams
-- DELETE FROM Locations WHERE name LIKE 'Sample Club %' AND name REGEXP '[0-9]{8}_[0-9]{6}$' LIMIT 1;
-- ==========================================================================
-- Query #2: Create/Delete/Edit/Display Personnel  
-- Personnel include coaches, administrators, and other staff members
-- Each personnel member can work at multiple locations with different roles
-- ==========================================================================
-- CREATE Personnel - Add new staff member to the system
-- Uses timestamp to ensure unique identification numbers
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
        'Jane',
        'Doe',
        '1985-06-15',
        CONCAT('SSN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        CONCAT('MED', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        '555-9999',
        '999 New St',
        'New City',
        'New Province',
        'N1W 2E3',
        CONCAT(
            'jane.doe.',
            DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'),
            '@club.com'
        ),
        'Coach',
        'Salaried'
    );
-- DISPLAY all Personnel - Show complete staff directory
-- Lists all personnel with their roles and contact information
SELECT personnelID,
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
FROM Personnel
ORDER BY lastName ASC,
    firstName ASC;
-- Query 2c: EDIT Personnel - Update staff member information
-- Demonstrates role changes and contact information updates
UPDATE Personnel
SET role = 'Assistant Coach',
    telephoneNumber = '555-8888',
    email = 'jane.doe.updated@club.com'
WHERE socialSecurityNumber LIKE 'SSN%'
    AND socialSecurityNumber REGEXP '[0-9]{14}$'
ORDER BY personnelID DESC
LIMIT 1;
-- Query 2d: DELETE Personnel - Remove staff member from system  
-- Note: May fail due to foreign key constraints if personnel is referenced elsewhere
-- DELETE FROM Personnel WHERE socialSecurityNumber LIKE 'SSN%' AND socialSecurityNumber REGEXP '[0-9]{14}$' ORDER BY personnelID DESC LIMIT 1;
-- ==========================================================================
-- Query #3: Create/Delete/Edit/Display FamilyMember (Primary/Secondary)
-- Family members are required for minor club members (ages 11-17)
-- Primary family members can have multiple secondary family members
-- Secondary family members represent spouses, children, etc. of primary members
-- ==========================================================================
-- Query 3a: CREATE Primary Family Member - Register adult family member
-- Primary family members can sponsor minor club members
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
        'John',
        'Parent',
        '1975-08-20',
        CONCAT('FSSN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        CONCAT('FMED', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        '555-7777',
        '777 Family Ave',
        'Family City',
        'Family Province',
        'F1M 2LY',
        CONCAT(
            'john.parent.',
            DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'),
            '@family.com'
        )
    );
-- CREATE Secondary Family Member - Register related family member
-- Links to primary family member with defined relationship
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
        'Sarah',
        'Parent',
        '1977-12-10',
        CONCAT('SFSSN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        CONCAT('SFMED', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        '555-6666',
        '777 Family Ave',
        'Family City',
        'Family Province',
        'F1M 2LY',
        CONCAT(
            'sarah.parent.',
            DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'),
            '@family.com'
        ),
        'Spouse',
        (
            SELECT familyMemberID
            FROM FamilyMembers
            WHERE socialSecurityNumber LIKE 'FSSN%'
            ORDER BY familyMemberID DESC
            LIMIT 1
        )
    );
-- DISPLAY Primary Family Members - Show registered primary family members
-- Lists all primary family members who can sponsor minor club members
SELECT familyMemberID,
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
FROM FamilyMembers
ORDER BY lastName ASC,
    firstName ASC;
-- DISPLAY Secondary Family Members - Show family relationships
-- Lists secondary family members with their relationship to primary members
SELECT sfm.secondaryFamilyMemberID,
    sfm.firstName,
    sfm.lastName,
    sfm.dateOfBirth,
    sfm.socialSecurityNumber,
    sfm.medicareCardNumber,
    sfm.telephoneNumber,
    sfm.address,
    sfm.city,
    sfm.province,
    sfm.postalCode,
    sfm.email,
    sfm.relationship,
    fm.firstName AS primaryFirstName,
    fm.lastName AS primaryLastName
FROM SecondaryFamilyMembers sfm
    JOIN FamilyMembers fm ON sfm.primaryFamilyMemberID = fm.familyMemberID
ORDER BY fm.lastName ASC,
    sfm.lastName ASC;
-- EDIT Primary Family Member - Update primary family member information
UPDATE FamilyMembers
SET telephoneNumber = '555-5555',
    email = 'john.parent.updated@family.com'
WHERE socialSecurityNumber LIKE 'FSSN%'
ORDER BY familyMemberID DESC
LIMIT 1;
-- EDIT Secondary Family Member - Update secondary family member information
UPDATE SecondaryFamilyMembers
SET telephoneNumber = '555-4444',
    email = 'sarah.parent.updated@family.com'
WHERE socialSecurityNumber LIKE 'SFSSN%'
ORDER BY secondaryFamilyMemberID DESC
LIMIT 1;
-- ==========================================================================
-- Query #4: Create/Delete/Edit/Display ClubMember (Major/Minor)
-- Club members are the core participants in volleyball activities
-- Minor members (11-17 years) require family member sponsorship and pay $100/year
-- Major members (18+ years) are independent and pay $200/year
-- ==========================================================================
-- CREATE Minor Club Member - Register young volleyball player (ages 11-17)
-- Minor members must be associated with a registered family member
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
        'Tommy',
        'Young',
        '2010-05-15',
        1.40,
        35.0,
        CONCAT('CSSN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        CONCAT('CMED', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')),
        '555-3333',
        '333 Youth St',
        'Youth City',
        'Youth Province',
        'Y1T 2H3',
        1,
        TRUE
    );
-- CREATE Major Club Member - Register adult volleyball player (18+ years)
-- Major members are independent and can participate without family sponsorship
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
        'Mike',
        'Adult',
        '1995-03-22',
        1.80,
        75.0,
        CONCAT('CSSN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), 'A'),
        CONCAT('CMED', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), 'A'),
        '555-2222',
        '222 Adult Ave',
        'Adult City',
        'Adult Province',
        'A1D 2LT',
        2,
        FALSE
    );
-- DISPLAY all Club Members - Show complete member roster
-- Includes age calculation and member type classification
SELECT memberID,
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
    isMinor,
    TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS age,
    CASE
        WHEN isMinor THEN 'Minor'
        ELSE 'Major'
    END AS memberType
FROM ClubMembers
ORDER BY lastName ASC,
    firstName ASC;
-- EDIT Club Member - Update member information
UPDATE ClubMembers
SET telephoneNumber = '555-1111',
    address = '333 Updated Youth St'
WHERE socialSecurityNumber LIKE 'CSSN%'
    AND socialSecurityNumber REGEXP '[0-9]{14}$'
ORDER BY memberID DESC
LIMIT 1;
-- ==========================================================================
-- Query #5: Create/Delete/Edit/Display TeamFormation
-- Team formations organize games and training sessions between two teams
-- Each formation includes session details, participating teams, and scores
-- Teams must be gender-separated and from appropriate locations
-- ==========================================================================
-- CREATE Team Formation - Schedule a game or training session
-- Links two teams for competitive play or practice
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
        '2025-08-15',
        '19:00:00',
        '1 Oak St, Pallet Town',
        1,
        2,
        25,
        23
    );
-- DISPLAY Team Formations - Show scheduled games and training sessions
-- Includes team information, session details, and match results
SELECT tf.formationID,
    tf.locationID,
    l.name AS locationName,
    tf.sessionType,
    tf.sessionDate,
    tf.sessionTime,
    tf.sessionAddress,
    t1.teamName AS team1Name,
    t2.teamName AS team2Name,
    tf.scoreTeam1,
    tf.scoreTeam2,
    CASE
        WHEN tf.scoreTeam1 IS NULL THEN 'Not Played'
        WHEN tf.scoreTeam1 > tf.scoreTeam2 THEN CONCAT(t1.teamName, ' Won')
        WHEN tf.scoreTeam1 < tf.scoreTeam2 THEN CONCAT(t2.teamName, ' Won')
        ELSE 'Tie'
    END AS result
FROM TeamFormations tf
    JOIN Locations l ON tf.locationID = l.locationID
    JOIN Teams t1 ON tf.teamID = t1.teamID
    JOIN Teams t2 ON tf.team2ID = t2.teamID
ORDER BY tf.sessionDate DESC,
    tf.sessionTime DESC;
-- EDIT Team Formation - Update formation details (typically scores after completion)
UPDATE TeamFormations
SET scoreTeam1 = 25,
    scoreTeam2 = 20
WHERE formationID = (
        SELECT MAX(formationID)
        FROM (
                SELECT formationID
                FROM TeamFormations
            ) AS temp
    );
-- ==========================================================================
-- Query #6: Assign/Delete/Edit club member to team formation
-- Team assignments specify player positions for each formation
-- Volleyball positions: Setter, Outside Hitter, Opposite Hitter, Middle Blocker, 
-- Defensive Specialist, Libero
-- Conflict checking should prevent overlapping assignments (3-hour minimum gap)
-- ==========================================================================
-- ASSIGN club member to team formation - Add player to formation with specific role
INSERT INTO TeamPlayers (formationID, clubMemberID, role)
VALUES (
        (
            SELECT MAX(formationID)
            FROM TeamFormations
        ),
        1,
        'Setter'
    );
INSERT INTO TeamPlayers (formationID, clubMemberID, role)
VALUES (
        (
            SELECT MAX(formationID)
            FROM TeamFormations
        ),
        2,
        'Outside Hitter'
    );
-- DISPLAY team assignments - Show player assignments for formations
-- Lists players with their positions for each scheduled formation
SELECT tp.formationID,
    tf.sessionDate,
    tf.sessionTime,
    tf.sessionType,
    cm.memberID,
    cm.firstName,
    cm.lastName,
    tp.role,
    t1.teamName AS team1Name,
    t2.teamName AS team2Name
FROM TeamPlayers tp
    JOIN TeamFormations tf ON tp.formationID = tf.formationID
    JOIN ClubMembers cm ON tp.clubMemberID = cm.memberID
    JOIN Teams t1 ON tf.teamID = t1.teamID
    JOIN Teams t2 ON tf.team2ID = t2.teamID
ORDER BY tf.sessionDate DESC,
    tf.sessionTime DESC,
    tp.role ASC;
-- EDIT team assignment - Change player's position in formation
UPDATE TeamPlayers
SET role = 'Libero'
WHERE formationID = (
        SELECT MAX(formationID)
        FROM TeamFormations
    )
    AND clubMemberID = 1;
-- DELETE team assignment - Remove player from formation
-- DELETE FROM TeamPlayers 
-- WHERE formationID = (SELECT MAX(formationID) FROM TeamFormations) 
--   AND clubMemberID = 2;
-- Conflict Assignment Example - Attempt overlapping assignments 
-- System should reject assignments with less than 3-hour gap on same day
-- This demonstrates the need for trigger-based conflict checking
-- INSERT INTO TeamFormations (locationID, sessionType, sessionDate, sessionTime, sessionAddress, teamID, team2ID)
-- VALUES (2, 'Game', '2025-08-15', '18:30:00', '25 Water Rd, Cerulean City', 3, 4);
-- INSERT INTO TeamPlayers (formationID, clubMemberID, role)
-- VALUES ((SELECT MAX(formationID) FROM TeamFormations), 1, 'Setter');
-- ==========================================================================
-- Query #7: Make payment for club member
-- Payment system tracks membership fees and donations
-- Minor members: $100/year, Major members: $200/year
-- Excess payments are considered donations to the club
-- Members must be current on payments to participate in activities
-- ==========================================================================
-- CREATE Payment for Minor Member - Process membership fee payment
INSERT INTO Payments (
        memberID,
        paymentDate,
        paymentAmount,
        paymentMethod,
        membershipYear
    )
VALUES (
        (
            SELECT memberID
            FROM ClubMembers
            WHERE socialSecurityNumber = 'CSSN001'
        ),
        CURDATE(),
        100.00,
        'Credit Card',
        YEAR(CURDATE())
    );
-- CREATE Payment for Major Member - Process payment with donation component
-- Amount exceeds required fee, so excess becomes donation
INSERT INTO Payments (
        memberID,
        paymentDate,
        paymentAmount,
        paymentMethod,
        membershipYear
    )
VALUES (
        (
            SELECT memberID
            FROM ClubMembers
            WHERE socialSecurityNumber = 'CSSN002'
        ),
        CURDATE(),
        250.00,
        'Debit',
        YEAR(CURDATE())
    );
-- DISPLAY payments - Show payment history with fee calculations
-- Calculates required fees and donation amounts based on member type
SELECT p.paymentID,
    cm.memberID,
    cm.firstName,
    cm.lastName,
    p.paymentDate,
    p.paymentAmount,
    p.paymentMethod,
    p.membershipYear,
    CASE
        WHEN cm.isMinor THEN 100
        ELSE 200
    END AS requiredFee,
    CASE
        WHEN cm.isMinor
        AND p.paymentAmount > 100 THEN p.paymentAmount - 100
        WHEN NOT cm.isMinor
        AND p.paymentAmount > 200 THEN p.paymentAmount - 200
        ELSE 0
    END AS donationAmount
FROM Payments p
    JOIN ClubMembers cm ON p.memberID = cm.memberID
ORDER BY p.paymentDate DESC;
-- EDIT Payment - Update payment amount (typically for installment adjustments)
UPDATE Payments
SET paymentAmount = 120.00
WHERE memberID = (
        SELECT memberID
        FROM ClubMembers
        WHERE socialSecurityNumber = 'CSSN001'
    )
    AND membershipYear = YEAR(CURDATE());