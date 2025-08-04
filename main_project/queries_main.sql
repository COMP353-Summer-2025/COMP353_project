-- COMP353 Main Project - Summer 2025
-- Database Application System for Montréal Volleyball Club (MVC)
-- SQL Queries Implementation File
-- 
-- This file contains all the required DDL and DML SQL queries for the main project
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
-- Reporting Queries (Queries 8-15):
--   8. Complete location details with member and team statistics
--   9. Family member and associated club member details
--  10. Team formations for specific location and time period
--  11. Inactive members with multiple location history
--  12. Location training/game session statistics report
--  13. Active members never assigned to formations
--  14. Active major members who started as minors
--  15. Active members only assigned as setters
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
-- EDIT Personnel - Update staff member information
-- Demonstrates role changes and contact information updates
UPDATE Personnel
SET role = 'Assistant Coach',
    telephoneNumber = '555-8888',
    email = 'jane.doe.updated@club.com'
WHERE socialSecurityNumber = 'SSN999';
-- DELETE Personnel - Remove staff member from system  
-- Note: May fail due to foreign key constraints if personnel is referenced elsewhere
-- DELETE FROM Personnel WHERE socialSecurityNumber = 'SSN999';
-- ==========================================================================
-- Query #3: Create/Delete/Edit/Display FamilyMember (Primary/Secondary)
-- Family members are required for minor club members (ages 11-17)
-- Primary family members can have multiple secondary family members
-- Secondary family members represent spouses, children, etc. of primary members
-- ==========================================================================
-- CREATE Primary Family Member - Register adult family member
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
WHERE socialSecurityNumber = 'CSSN999';
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
            WHERE socialSecurityNumber = 'CSSN999'
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
            WHERE socialSecurityNumber = 'CSSN888'
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
        WHERE socialSecurityNumber = 'CSSN999'
    )
    AND membershipYear = YEAR(CURDATE());
-- ==========================================================================
-- REPORTING QUERIES (Queries 8-15) - Advanced Data Analysis
-- These queries provide comprehensive reports for club management and operations
-- ==========================================================================
-- ==========================================================================
-- Query #8: Complete location details with member and team statistics
-- Provides comprehensive location overview including:
-- - Location details (address, contact, capacity, type)
-- - General manager information  
-- - Member counts by type (minor/major)
-- - Associated team counts
-- Results sorted by province, then city as per requirements
-- ==========================================================================
SELECT l.locationID,
    l.name AS locationName,
    l.address,
    l.city,
    l.province,
    l.postalCode,
    l.phoneNumber,
    l.webAddress,
    l.type,
    l.maxCapacity,
    CONCAT(mgr.firstName, ' ', mgr.lastName) AS generalManagerName,
    COUNT(
        DISTINCT CASE
            WHEN cm.isMinor = TRUE THEN cm.memberID
        END
    ) AS minorMembersCount,
    COUNT(
        DISTINCT CASE
            WHEN cm.isMinor = FALSE THEN cm.memberID
        END
    ) AS majorMembersCount,
    COUNT(DISTINCT t.teamID) AS teamsCount
FROM Locations l
    LEFT JOIN Personnel mgr ON mgr.role = 'Administrator'
    AND EXISTS (
        SELECT 1
        FROM PersonnelLocation pl
        WHERE pl.personnelID = mgr.personnelID
            AND pl.locationID = l.locationID
            AND pl.endDate IS NULL
    )
    LEFT JOIN ClubMembers cm ON l.locationID = cm.locationID
    LEFT JOIN Teams t ON l.locationID = t.locationID
GROUP BY l.locationID,
    l.name,
    l.address,
    l.city,
    l.province,
    l.postalCode,
    l.phoneNumber,
    l.webAddress,
    l.type,
    l.maxCapacity,
    mgr.firstName,
    mgr.lastName
ORDER BY l.province ASC,
    l.city ASC;
-- ==========================================================================
-- Query #9: Family member details with associated club members
-- For a given primary family member, shows:
-- - Secondary family member details (spouse, children, etc.)
-- - All associated club members with complete information
-- - Relationship information between family and club members
-- Essential for managing minor member sponsorship requirements
-- ==========================================================================
SET @GIVEN_FAMILY_MEMBER_ID = 1;
SELECT sfm.firstName AS secondaryFirstName,
    sfm.lastName AS secondaryLastName,
    sfm.telephoneNumber AS secondaryPhoneNumber,
    cm.memberID AS clubMembershipNumber,
    cm.firstName AS clubMemberFirstName,
    cm.lastName AS clubMemberLastName,
    cm.dateOfBirth,
    cm.socialSecurityNumber,
    cm.medicareCardNumber,
    cm.telephoneNumber AS clubMemberPhone,
    cm.address,
    cm.city,
    cm.province,
    cm.postalCode,
    mfr.relationship
FROM FamilyMembers fm
    LEFT JOIN SecondaryFamilyMembers sfm ON fm.familyMemberID = sfm.primaryFamilyMemberID
    LEFT JOIN MemberFamilyRelations mfr ON fm.familyMemberID = mfr.familyMemberID
    LEFT JOIN ClubMembers cm ON mfr.memberID = cm.memberID
WHERE fm.familyMemberID = @GIVEN_FAMILY_MEMBER_ID
ORDER BY cm.memberID;
-- ==========================================================================
-- Query #10: Team formation details for specific location and time period
-- Provides detailed session information including:
-- - Session timing and location details
-- - Head coach information
-- - Team names and scores (null for future sessions)
-- - Complete player roster with positions
-- Critical for weekly email notification system and session management
-- ==========================================================================
SET @GIVEN_LOCATION_ID = 1;
SET @START_DATE = '2025-01-01';
SET @END_DATE = '2025-05-31';
SELECT tf.sessionDate,
    tf.sessionTime,
    tf.sessionType,
    tf.sessionAddress,
    CONCAT(p_coach.firstName, ' ', p_coach.lastName) AS headCoachName,
    t1.teamName AS team1_Name,
    t2.teamName AS team2_Name,
    CASE
        WHEN tf.sessionDate > CURDATE() THEN NULL
        ELSE tf.scoreTeam1
    END AS team1_Score,
    CASE
        WHEN tf.sessionDate > CURDATE() THEN NULL
        ELSE tf.scoreTeam2
    END AS team2_Score,
    cm.firstName AS playerFirstName,
    cm.lastName AS playerLastName,
    tp.role AS playerRole
FROM TeamFormations tf
    JOIN Teams t1 ON tf.teamID = t1.teamID
    JOIN Teams t2 ON tf.team2ID = t2.teamID
    JOIN Personnel p_coach ON t1.headCoachID = p_coach.personnelID
    JOIN TeamPlayers tp ON tf.formationID = tp.formationID
    JOIN ClubMembers cm ON tp.clubMemberID = cm.memberID
WHERE tf.locationID = @GIVEN_LOCATION_ID
    AND tf.sessionDate BETWEEN @START_DATE AND @END_DATE
ORDER BY tf.sessionDate,
    tf.sessionTime;
-- ==========================================================================
-- Query #11: Inactive members with multi-location history
-- Identifies members who are:
-- - Currently inactive (unpaid previous year fees)
-- - Have been associated with at least 2 different locations
-- - Have been members for at least 2 years
-- Important for member retention analysis and re-engagement campaigns
-- ==========================================================================
SELECT cm.memberID,
    cm.firstName,
    cm.lastName
FROM ClubMembers cm
WHERE -- Condition 1: Must be a member for at least two years
    (
        SELECT MIN(p.paymentDate)
        FROM Payments p
        WHERE p.memberID = cm.memberID
    ) <= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
    AND -- Condition 2: Must be inactive (did not fully pay last year's fees)
    (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE()) - 1
    ) < (
        CASE
            WHEN cm.isMinor = TRUE THEN 100
            ELSE 200
        END
    )
    AND -- Condition 3: Must have been associated with at least two different locations
    (
        SELECT COUNT(DISTINCT fml.locationID)
        FROM FamilyMemberLocation fml
            JOIN MemberFamilyRelations mfr ON fml.familyMemberID = mfr.familyMemberID
        WHERE mfr.memberID = cm.memberID
    ) >= 2
ORDER BY cm.memberID;
-- ==========================================================================
-- Query #12: Location activity statistics for specified time period
-- Generates comprehensive location performance report including:
-- - Training session counts and participant numbers
-- - Game session counts and participant numbers  
-- - Filters locations with at least 4 game sessions (high activity threshold)
-- - Sorted by game session count (most active locations first)
-- Useful for resource allocation and location performance evaluation
-- ==========================================================================
SET @START_DATE = '2025-01-01';
SET @END_DATE = '2025-05-31';
SELECT l.name AS locationName,
    SUM(
        CASE
            WHEN tf.sessionType = 'Training' THEN 1
            ELSE 0
        END
    ) AS totalTrainingSessions,
    COUNT(
        DISTINCT CASE
            WHEN tf.sessionType = 'Training' THEN tp.clubMemberID
        END
    ) AS totalPlayersInTraining,
    SUM(
        CASE
            WHEN tf.sessionType = 'Game' THEN 1
            ELSE 0
        END
    ) AS totalGameSessions,
    COUNT(
        DISTINCT CASE
            WHEN tf.sessionType = 'Game' THEN tp.clubMemberID
        END
    ) AS totalPlayersInGames
FROM Locations l
    JOIN TeamFormations tf ON l.locationID = tf.locationID
    JOIN TeamPlayers tp ON tf.formationID = tp.formationID
WHERE tf.sessionDate BETWEEN @START_DATE AND @END_DATE
GROUP BY l.locationID,
    l.name
HAVING totalGameSessions >= 4
ORDER BY totalGameSessions DESC;
-- ==========================================================================
-- Query #13: Active members never assigned to team formations
-- Identifies members who are:
-- - Current on membership payments (active status)
-- - Have never been assigned to any team formation
-- Useful for member engagement and ensuring all active members participate
-- Results sorted by location and age for targeted outreach
-- ==========================================================================
SELECT cm.memberID AS clubMembershipNumber,
    cm.firstName,
    cm.lastName,
    TIMESTAMPDIFF(YEAR, cm.dateOfBirth, CURDATE()) AS age,
    cm.telephoneNumber AS phoneNumber,
    'N/A' AS email,
    -- ClubMembers table doesn't have email field
    l.name AS currentLocationName
FROM ClubMembers cm
    JOIN Locations l ON cm.locationID = l.locationID
WHERE -- Active members (paid current year fees)
    (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE())
    ) >= (
        CASE
            WHEN cm.isMinor THEN 100
            ELSE 200
        END
    )
    AND -- Never been assigned to any team formation
    NOT EXISTS (
        SELECT 1
        FROM TeamPlayers tp
        WHERE tp.clubMemberID = cm.memberID
    )
ORDER BY l.name ASC,
    age ASC;
-- ==========================================================================
-- Query #14: Delete locations with no members or personnel
-- Administrative cleanup operation that removes:
-- - Locations with no assigned club members
-- - Locations with no assigned personnel  
-- - Maintains referential integrity by deleting in proper order
-- Important for database maintenance and resource optimization
-- ==========================================================================
-- Delete ClubMembers first due to FK constraints (should be none for empty locations)
DELETE cm
FROM ClubMembers cm
    LEFT JOIN (
        SELECT DISTINCT cm2.locationID
        FROM ClubMembers cm2
        UNION
        SELECT DISTINCT pl.locationID
        FROM PersonnelLocation pl
        WHERE pl.endDate IS NULL
    ) AS active_locations ON cm.locationID = active_locations.locationID
WHERE active_locations.locationID IS NULL;
-- Delete Personnel assignments (should be none for empty locations)
DELETE pl
FROM PersonnelLocation pl
    LEFT JOIN (
        SELECT DISTINCT cm.locationID
        FROM ClubMembers cm
        UNION
        SELECT DISTINCT pl2.locationID
        FROM PersonnelLocation pl2
        WHERE pl2.endDate IS NULL
    ) AS active_locations ON pl.locationID = active_locations.locationID
WHERE active_locations.locationID IS NULL
    AND pl.endDate IS NULL;
-- Finally delete the empty Locations
DELETE l
FROM Locations l
    LEFT JOIN (
        SELECT DISTINCT cm.locationID
        FROM ClubMembers cm
        UNION
        SELECT DISTINCT pl.locationID
        FROM PersonnelLocation pl
        WHERE pl.endDate IS NULL
    ) AS active_locations ON l.locationID = active_locations.locationID
WHERE active_locations.locationID IS NULL;
-- ==========================================================================
-- Query #15: Active members exclusively assigned as setters
-- Identifies members who are:
-- - Current on membership payments (active status)  
-- - Have been assigned to at least one formation as setter
-- - Have NEVER been assigned to any other position
-- Useful for analyzing position specialization and player development
-- Results sorted by location and age for training program planning
-- ==========================================================================
SELECT cm.memberID AS clubMembershipNumber,
    cm.firstName,
    cm.lastName,
    TIMESTAMPDIFF(YEAR, cm.dateOfBirth, CURDATE()) AS age,
    cm.telephoneNumber AS phoneNumber,
    'N/A' AS email,
    -- ClubMembers table doesn't have email field
    l.name AS currentLocationName,
    -- Count total formations they've been in
    COUNT(DISTINCT tp.formationID) AS totalFormationsAssigned
FROM ClubMembers cm
    JOIN Locations l ON cm.locationID = l.locationID
    JOIN TeamPlayers tp ON cm.memberID = tp.clubMemberID
    JOIN TeamFormations tf ON tp.formationID = tf.formationID
WHERE -- Active members (paid current year fees)
    (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE())
    ) >= (
        CASE
            WHEN cm.isMinor THEN 100
            ELSE 200
        END
    )
    AND -- Member has been assigned to formations
    EXISTS (
        SELECT 1
        FROM TeamPlayers tp2
        WHERE tp2.clubMemberID = cm.memberID
    )
    AND -- Member has ONLY been assigned as setter (never as any other position)
    NOT EXISTS (
        SELECT 1
        FROM TeamPlayers tp3
        WHERE tp3.clubMemberID = cm.memberID
            AND tp3.role != 'Setter'
    )
    AND -- Ensure they have at least one setter assignment
    tp.role = 'Setter'
GROUP BY cm.memberID,
    cm.firstName,
    cm.lastName,
    cm.dateOfBirth,
    cm.telephoneNumber,
    l.name
ORDER BY l.name ASC,
    age ASC;
-- ==========================================================================
-- DATABASE VERIFICATION QUERIES - System Health and Data Integrity
-- These queries provide comprehensive table counts for database maintenance
-- and verification that all tables are properly populated with test data
-- ==========================================================================
-- Show all table counts in a single result set for system verification
SELECT 'Locations' as TableName,
    COUNT(*) as RecordCount
FROM Locations
UNION ALL
SELECT 'Personnel' as TableName,
    COUNT(*) as RecordCount
FROM Personnel
UNION ALL
SELECT 'PersonnelLocation' as TableName,
    COUNT(*) as RecordCount
FROM PersonnelLocation
UNION ALL
SELECT 'FamilyMembers' as TableName,
    COUNT(*) as RecordCount
FROM FamilyMembers
UNION ALL
SELECT 'FamilyMemberLocation' as TableName,
    COUNT(*) as RecordCount
FROM FamilyMemberLocation
UNION ALL
SELECT 'ClubMembers' as TableName,
    COUNT(*) as RecordCount
FROM ClubMembers
UNION ALL
SELECT 'MemberFamilyRelations' as TableName,
    COUNT(*) as RecordCount
FROM MemberFamilyRelations
UNION ALL
SELECT 'Hobbies' as TableName,
    COUNT(*) as RecordCount
FROM Hobbies
UNION ALL
SELECT 'ClubMemberHobbies' as TableName,
    COUNT(*) as RecordCount
FROM ClubMemberHobbies
UNION ALL
SELECT 'Payments' as TableName,
    COUNT(*) as RecordCount
FROM Payments
UNION ALL
SELECT 'Teams' as TableName,
    COUNT(*) as RecordCount
FROM Teams
UNION ALL
SELECT 'TeamFormations' as TableName,
    COUNT(*) as RecordCount
FROM TeamFormations
UNION ALL
SELECT 'TeamPlayers' as TableName,
    COUNT(*) as RecordCount
FROM TeamPlayers
UNION ALL
SELECT 'EmailLogs' as TableName,
    COUNT(*) as RecordCount
FROM EmailLogs
UNION ALL
SELECT 'SecondaryFamilyMembers' as TableName,
    COUNT(*) as RecordCount
FROM SecondaryFamilyMembers
ORDER BY TableName;