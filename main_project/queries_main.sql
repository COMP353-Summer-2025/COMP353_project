-- COMP353 Main Project Queries
-- ==========================================================================
-- CRUD OPERATIONS (Queries 1-7)
-- ==========================================================================
-- Query #1: Create/Delete/Edit/Display a Location
-- CREATE Location (with timestamp to ensure unique name)
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
-- DISPLAY all Locations
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
-- EDIT Location (Update example)
UPDATE Locations
SET address = '456 Updated Sample St',
    maxCapacity = 80,
    phoneNumber = '555-1111'
WHERE name LIKE 'Sample Club %'
    AND name REGEXP '[0-9]{8}_[0-9]{6}$'
LIMIT 1;
-- DELETE Location (Note: This might fail due to foreign key constraints)
-- DELETE FROM Locations WHERE name LIKE 'Sample Club %' AND name REGEXP '[0-9]{8}_[0-9]{6}$' LIMIT 1;
-- ==========================================================================
-- Query #2: Create/Delete/Edit/Display a Personnel
-- CREATE Personnel (with timestamp to ensure unique SSN)
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
-- DISPLAY all Personnel
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
-- EDIT Personnel (Update example)
UPDATE Personnel
SET role = 'Assistant Coach',
    telephoneNumber = '555-8888',
    email = 'jane.doe.updated@club.com'
WHERE socialSecurityNumber = 'SSN999';
-- DELETE Personnel (Note: This might fail due to foreign key constraints)
-- DELETE FROM Personnel WHERE socialSecurityNumber = 'SSN999';
-- ==========================================================================
-- Query #3: Create/Delete/Edit/Display a FamilyMember (Primary/Secondary)
-- CREATE Primary Family Member (with timestamp to ensure unique SSN)
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
-- CREATE Secondary Family Member (with timestamp to ensure unique SSN)
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
-- DISPLAY Primary Family Members
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
-- DISPLAY Secondary Family Members
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
-- EDIT Primary Family Member
UPDATE FamilyMembers
SET telephoneNumber = '555-5555',
    email = 'john.parent.updated@family.com'
WHERE socialSecurityNumber LIKE 'FSSN%'
ORDER BY familyMemberID DESC
LIMIT 1;
-- EDIT Secondary Family Member
UPDATE SecondaryFamilyMembers
SET telephoneNumber = '555-4444',
    email = 'sarah.parent.updated@family.com'
WHERE socialSecurityNumber LIKE 'SFSSN%'
ORDER BY secondaryFamilyMemberID DESC
LIMIT 1;
-- ==========================================================================
-- Query #4: Create/Delete/Edit/Display a ClubMember (Major/Minor)
-- CREATE Minor Club Member (with timestamp to ensure unique SSN)
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
-- CREATE Major Club Member (with timestamp to ensure unique SSN)
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
-- DISPLAY all Club Members
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
-- EDIT Club Member
UPDATE ClubMembers
SET telephoneNumber = '555-1111',
    address = '333 Updated Youth St'
WHERE socialSecurityNumber = 'CSSN999';
-- ==========================================================================
-- Query #5: Create/Delete/Edit/Display a TeamFormation
-- CREATE Team Formation
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
-- DISPLAY Team Formations
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
-- EDIT Team Formation (Update scores)
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
-- Query #6: Assign/Delete/Edit a club member to a team formation
-- ASSIGN club member to team formation
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
-- DISPLAY team assignments
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
-- EDIT team assignment (change role)
UPDATE TeamPlayers
SET role = 'Libero'
WHERE formationID = (
        SELECT MAX(formationID)
        FROM TeamFormations
    )
    AND clubMemberID = 1;
-- DELETE team assignment
-- DELETE FROM TeamPlayers 
-- WHERE formationID = (SELECT MAX(formationID) FROM TeamFormations) 
--   AND clubMemberID = 2;
-- Attempt to assign conflicting assignment (same member, overlapping time)
-- This should demonstrate conflict checking (if triggers were implemented)
-- INSERT INTO TeamFormations (locationID, sessionType, sessionDate, sessionTime, sessionAddress, teamID, team2ID)
-- VALUES (2, 'Game', '2025-08-15', '18:30:00', '25 Water Rd, Cerulean City', 3, 4);
-- INSERT INTO TeamPlayers (formationID, clubMemberID, role)
-- VALUES ((SELECT MAX(formationID) FROM TeamFormations), 1, 'Setter');
-- ==========================================================================
-- Query #7: Make payment for a club member
-- CREATE Payment for Minor Member
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
-- CREATE Payment for Major Member with Donation
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
-- DISPLAY payments
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
-- EDIT Payment (update amount)
UPDATE Payments
SET paymentAmount = 120.00
WHERE memberID = (
        SELECT memberID
        FROM ClubMembers
        WHERE socialSecurityNumber = 'CSSN999'
    )
    AND membershipYear = YEAR(CURDATE());
-- ==========================================================================
-- Query #8: Get complete details for every location in the system
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
-- Query #9: For a given family member, get details of secondary family member and club members
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
-- Query #10: Get session details for a specific location within a date range
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
-- Query #11: Get details of club members who are currently inactive and have been 
-- associated with at least two different locations and are members for at least two years
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
-- Query #12: Get location statistics for training and game sessions within a date range
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
-- Query #13: Get report on active club members who have never been assigned to any formation
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
-- Query #14: Delete clubs who have no members and no personnel assigned to any location
-- Delete ClubMembers first due to FK constraints (though there should be none)
DELETE cm
FROM ClubMembers cm
WHERE cm.locationID IN (
        SELECT l.locationID
        FROM Locations l
        WHERE l.locationID NOT IN (
                SELECT DISTINCT cm2.locationID
                FROM ClubMembers cm2
                UNION
                SELECT DISTINCT p.locationID
                FROM Personnel p
            )
    );
-- Delete Personnel (though there should be none)
DELETE p
FROM Personnel p
WHERE p.locationID IN (
        SELECT l.locationID
        FROM Locations l
        WHERE l.locationID NOT IN (
                SELECT DISTINCT cm.locationID
                FROM ClubMembers cm
                UNION
                SELECT DISTINCT p2.locationID
                FROM Personnel p2
                WHERE p2.personnelID != p.personnelID -- Exclude self from check
            )
    );
-- Finally delete the Locations
DELETE l
FROM Locations l
WHERE l.locationID NOT IN (
        SELECT DISTINCT cm.locationID
        FROM ClubMembers cm
        UNION
        SELECT DISTINCT p.locationID
        FROM Personnel p
    );
-- ==========================================================================
-- Query #15: Get report on active club members who have only been assigned as setters
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
-- COUNT QUERIES FOR TABLE VERIFICATION (Optional - for debugging purposes)
-- ==========================================================================
-- Show all table counts in a single result set for verification
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