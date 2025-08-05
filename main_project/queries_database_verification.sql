-- COMP353 Main Project - Summer 2025
-- Database Application System for Montréal Volleyball Club (MVC)
-- DATABASE VERIFICATION & ADMINISTRATIVE OPERATIONS
-- 
-- This file contains database verification queries and administrative operations
-- for the main project which extends the warm-up project with advanced functionalities.
-- 
-- Contents:
-- - Administrative database cleanup operations
-- - Database verification queries
-- - System health and data integrity checks
-- - Table count verification
--
-- Project Requirements:
-- - Supports members aged 11+ (Minor: 11-17, Major: 18+)
-- - Annual fees: $100 (Minor), $200 (Major)
-- - Team formations for games and training sessions
-- - Automated email notifications for weekly schedules
-- - Gender-separated teams with specific volleyball positions
-- - Multi-location club management with head/branch structure
-- ==========================================================================
-- ADMINISTRATIVE OPERATIONS - Database Maintenance and Cleanup
-- These operations help maintain database integrity and remove unused data
-- ==========================================================================
-- ==========================================================================
-- ADMINISTRATIVE OPERATIONS - Database Cleanup
-- Administrative cleanup operation that removes:
-- - Locations with no assigned club members
-- - Locations with no assigned personnel  
-- - Maintains referential integrity by deleting in proper order
-- Important for database maintenance and resource optimization
-- ==========================================================================
-- Temporarily disable safe update mode for administrative operations
SET SQL_SAFE_UPDATES = 0;
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
-- Re-enable safe update mode for security
SET SQL_SAFE_UPDATES = 1;
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
-- ==========================================================================
-- DETAILED VERIFICATION QUERIES - Additional Database Health Checks
-- These queries provide more detailed analysis of database integrity
-- ==========================================================================
-- Verify foreign key relationships integrity
-- Check for orphaned club members (members without valid locations)
SELECT 'Database Verification - Foreign Key Integrity' AS query_title,
    'Orphaned ClubMembers' as CheckType,
    COUNT(*) as IssueCount
FROM ClubMembers cm
    LEFT JOIN Locations l ON cm.locationID = l.locationID
WHERE l.locationID IS NULL
UNION ALL
-- Check for orphaned payments (payments without valid members)
SELECT 'Orphaned Payments' as CheckType,
    COUNT(*) as IssueCount
FROM Payments p
    LEFT JOIN ClubMembers cm ON p.memberID = cm.memberID
WHERE cm.memberID IS NULL
UNION ALL
-- Check for orphaned team players (players without valid formations or members)
SELECT 'Orphaned TeamPlayers' as CheckType,
    COUNT(*) as IssueCount
FROM TeamPlayers tp
    LEFT JOIN TeamFormations tf ON tp.formationID = tf.formationID
    LEFT JOIN ClubMembers cm ON tp.clubMemberID = cm.memberID
WHERE tf.formationID IS NULL
    OR cm.memberID IS NULL
UNION ALL
-- Check for orphaned personnel locations (assignments without valid personnel or locations)
SELECT 'Orphaned PersonnelLocation' as CheckType,
    COUNT(*) as IssueCount
FROM PersonnelLocation pl
    LEFT JOIN Personnel p ON pl.personnelID = p.personnelID
    LEFT JOIN Locations l ON pl.locationID = l.locationID
WHERE p.personnelID IS NULL
    OR l.locationID IS NULL
ORDER BY CheckType;
-- ==========================================================================
-- BUSINESS RULE VERIFICATION QUERIES
-- These queries verify that business rules are being enforced correctly
-- ==========================================================================
-- Verify member age consistency (isMinor flag should match actual age)
SELECT 'Database Verification - Business Rules' AS query_title,
    'Age Consistency Issues' as CheckType,
    COUNT(*) as IssueCount
FROM ClubMembers cm
WHERE (
        TIMESTAMPDIFF(YEAR, cm.dateOfBirth, CURDATE()) < 18
        AND cm.isMinor = FALSE
    )
    OR (
        TIMESTAMPDIFF(YEAR, cm.dateOfBirth, CURDATE()) >= 18
        AND cm.isMinor = TRUE
    )
UNION ALL
-- Verify minimum age requirement (all members should be 11+)
SELECT 'Under-age Members' as CheckType,
    COUNT(*) as IssueCount
FROM ClubMembers cm
WHERE TIMESTAMPDIFF(YEAR, cm.dateOfBirth, CURDATE()) < 11
UNION ALL
-- Verify payment amounts are positive
SELECT 'Negative Payments' as CheckType,
    COUNT(*) as IssueCount
FROM Payments p
WHERE p.paymentAmount < 0
UNION ALL
-- Check for conflicting team assignments (same member, same day, < 3 hours apart)
SELECT 'Assignment Conflicts' as CheckType,
    COUNT(*) as IssueCount
FROM TeamPlayers tp1
    JOIN TeamFormations tf1 ON tp1.formationID = tf1.formationID
    JOIN TeamPlayers tp2 ON tp1.clubMemberID = tp2.clubMemberID
    JOIN TeamFormations tf2 ON tp2.formationID = tf2.formationID
WHERE tf1.formationID != tf2.formationID
    AND tf1.sessionDate = tf2.sessionDate
    AND ABS(
        TIMESTAMPDIFF(HOUR, tf1.sessionTime, tf2.sessionTime)
    ) < 3
ORDER BY CheckType;
-- ==========================================================================
-- MEMBERSHIP STATUS VERIFICATION
-- These queries verify member payment status and activity levels
-- ==========================================================================
-- Active members summary (current year payments)
SELECT 'Database Verification - Membership Status' AS query_title,
    'Active Minor Members' as MemberType,
    COUNT(*) as MemberCount
FROM ClubMembers cm
WHERE cm.isMinor = TRUE
    AND (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE())
    ) >= 100
UNION ALL
SELECT 'Active Major Members' as MemberType,
    COUNT(*) as MemberCount
FROM ClubMembers cm
WHERE cm.isMinor = FALSE
    AND (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE())
    ) >= 200
UNION ALL
SELECT 'Inactive Minor Members' as MemberType,
    COUNT(*) as MemberCount
FROM ClubMembers cm
WHERE cm.isMinor = TRUE
    AND (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE())
    ) < 100
UNION ALL
SELECT 'Inactive Major Members' as MemberType,
    COUNT(*) as MemberCount
FROM ClubMembers cm
WHERE cm.isMinor = FALSE
    AND (
        SELECT COALESCE(SUM(p.paymentAmount), 0)
        FROM Payments p
        WHERE p.memberID = cm.memberID
            AND p.membershipYear = YEAR(CURDATE())
    ) < 200
ORDER BY MemberType;
-- ==========================================================================
-- TEAM FORMATION AND ASSIGNMENT VERIFICATION
-- These queries verify team formation assignments and completeness
-- ==========================================================================
-- Team formation statistics
SELECT 'Database Verification - Team Formation Stats' AS query_title,
    'Total Formations' as StatType,
    COUNT(*) as StatValue
FROM TeamFormations
UNION ALL
SELECT 'Game Sessions' as StatType,
    COUNT(*) as StatValue
FROM TeamFormations tf
WHERE tf.sessionType = 'Game'
UNION ALL
SELECT 'Training Sessions' as StatType,
    COUNT(*) as StatValue
FROM TeamFormations tf
WHERE tf.sessionType = 'Training'
UNION ALL
SELECT 'Completed Games' as StatType,
    COUNT(*) as StatValue
FROM TeamFormations tf
WHERE tf.sessionType = 'Game'
    AND tf.scoreTeam1 IS NOT NULL
    AND tf.scoreTeam2 IS NOT NULL
UNION ALL
SELECT 'Upcoming Sessions' as StatType,
    COUNT(*) as StatValue
FROM TeamFormations tf
WHERE tf.sessionDate > CURDATE()
ORDER BY StatType;
-- ==========================================================================
-- EMAIL SYSTEM VERIFICATION
-- These queries verify the email logging system functionality
-- ==========================================================================
-- Email system statistics
SELECT 'Database Verification - Email System Stats' AS query_title,
    'Total Emails Logged' as EmailStat,
    COUNT(*) as EmailCount
FROM EmailLogs
UNION ALL
SELECT 'Emails Sent Successfully' as EmailStat,
    COUNT(*) as EmailCount
FROM EmailLogs el
WHERE el.status = 'Sent'
UNION ALL
SELECT 'Email Failures' as EmailStat,
    COUNT(*) as EmailCount
FROM EmailLogs el
WHERE el.status != 'Sent'
UNION ALL
SELECT 'Emails This Month' as EmailStat,
    COUNT(*) as EmailCount
FROM EmailLogs el
WHERE el.sentDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY EmailStat;
-- ==========================================================================
-- LOCATION UTILIZATION VERIFICATION
-- These queries verify location usage and capacity management
-- ==========================================================================
-- Location utilization summary
SELECT 'Database Verification - Location Utilization' AS query_title,
    l.name as LocationName,
    l.type as LocationType,
    l.maxCapacity,
    COUNT(DISTINCT cm.memberID) as CurrentMembers,
    COUNT(DISTINCT tf.formationID) as TotalFormations,
    ROUND(
        (COUNT(DISTINCT cm.memberID) / l.maxCapacity) * 100,
        2
    ) as CapacityUtilization
FROM Locations l
    LEFT JOIN ClubMembers cm ON l.locationID = cm.locationID
    LEFT JOIN TeamFormations tf ON l.locationID = tf.locationID
GROUP BY l.locationID,
    l.name,
    l.type,
    l.maxCapacity
ORDER BY CapacityUtilization DESC;
-- ==========================================================================
-- SYSTEM PERFORMANCE VERIFICATION
-- These queries help identify potential performance issues
-- ==========================================================================
-- Identify members with excessive team assignments (potential data quality issues)
SELECT 'Database Verification - Performance Issues' AS query_title,
    cm.memberID,
    CONCAT(cm.firstName, ' ', cm.lastName) as MemberName,
    COUNT(DISTINCT tp.formationID) as TotalAssignments
FROM ClubMembers cm
    JOIN TeamPlayers tp ON cm.memberID = tp.clubMemberID
GROUP BY cm.memberID,
    cm.firstName,
    cm.lastName
HAVING COUNT(DISTINCT tp.formationID) > 10
ORDER BY TotalAssignments DESC;
-- Identify locations with no recent activity (potential cleanup candidates)
SELECT 'Database Verification - Inactive Locations' AS query_title,
    l.name as LocationName,
    l.type as LocationType,
    MAX(tf.sessionDate) as LastActivity,
    DATEDIFF(CURDATE(), MAX(tf.sessionDate)) as DaysSinceLastActivity
FROM Locations l
    LEFT JOIN TeamFormations tf ON l.locationID = tf.locationID
GROUP BY l.locationID,
    l.name,
    l.type
HAVING MAX(tf.sessionDate) IS NULL
    OR DATEDIFF(CURDATE(), MAX(tf.sessionDate)) > 90
ORDER BY DaysSinceLastActivity DESC;
-- ==========================================================================
-- FINAL VERIFICATION SUMMARY
-- Comprehensive summary of database health
-- ==========================================================================
-- Database health summary
SELECT 'Database Verification - Health Summary' AS query_title,
    'DATABASE HEALTH SUMMARY' as Summary,
    CONCAT(
        'Tables: ',
        (
            SELECT COUNT(*)
            FROM information_schema.tables
            WHERE table_schema = DATABASE()
                AND table_type = 'BASE TABLE'
        ),
        ' | Total Records: ',
        (
            SELECT SUM(RecordCount)
            FROM (
                    SELECT COUNT(*) as RecordCount
                    FROM Locations
                    UNION ALL
                    SELECT COUNT(*)
                    FROM Personnel
                    UNION ALL
                    SELECT COUNT(*)
                    FROM ClubMembers
                    UNION ALL
                    SELECT COUNT(*)
                    FROM Payments
                    UNION ALL
                    SELECT COUNT(*)
                    FROM TeamFormations
                    UNION ALL
                    SELECT COUNT(*)
                    FROM TeamPlayers
                    UNION ALL
                    SELECT COUNT(*)
                    FROM EmailLogs
                ) as total_counts
        ),
        ' | Active Members: ',
        (
            SELECT COUNT(*)
            FROM ClubMembers cm
            WHERE (
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
        )
    ) as Details;