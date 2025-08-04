-- COMP353 Main Project Queries

-- Query #11: Get details of club members who are currently inactive and have been 
-- associated with at least two different locations and are members for at least two years
SELECT cm.memberID,
    cm.firstName,
    cm.lastName
FROM ClubMembers cm
WHERE 
    -- Condition 1: Must be a member for at least two years
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
-- COUNT QUERIES FOR TABLE VERIFICATION
-- ==========================================================================
-- Additional SELECT COUNT(*) statements for the new tables
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
FROM SecondaryFamilyMembers;
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