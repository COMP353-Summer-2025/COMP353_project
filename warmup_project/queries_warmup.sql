-- 8 Required Queries
-- 1. Location details with personnel and member counts
SELECT L.*,
    COUNT(DISTINCT PL.personnelID) AS personnelCount,
    COUNT(DISTINCT CM.memberID) AS memberCount
FROM Locations L
    LEFT JOIN PersonnelLocation PL ON L.locationID = PL.locationID
    AND PL.endDate IS NULL
    LEFT JOIN ClubMembers CM ON L.locationID = CM.locationID
GROUP BY L.locationID
ORDER BY memberCount DESC;
-- 2. Major members who are also active personnel
SELECT CM.memberID,
    CM.firstName,
    CM.lastName,
    TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
    CM.city,
    CM.province,
    IF(
        SUM(YEAR(PAY.paymentDate) = YEAR(CURDATE())) >= 1,
        'Active',
        'Inactive'
    ) AS status,
    L.name AS memberLocation,
    L2.name AS personnelLocation
FROM ClubMembers CM
    JOIN Personnel P ON CM.socialSecurityNumber = P.socialSecurityNumber
    JOIN PersonnelLocation PL ON P.personnelID = PL.personnelID
    AND PL.endDate IS NULL
    JOIN Locations L2 ON PL.locationID = L2.locationID
    JOIN Locations L ON CM.locationID = L.locationID
    LEFT JOIN Payments PAY ON CM.memberID = PAY.memberID
WHERE CM.isMinor = FALSE
GROUP BY CM.memberID
ORDER BY L2.name ASC,
    age ASC;
-- 3. Members with at least 3 hobbies
SELECT CM.memberID,
    CM.firstName,
    CM.lastName,
    TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
    CM.city,
    CM.province,
    IF(
        SUM(YEAR(P.paymentDate) = YEAR(CURDATE())) >= 1,
        'Active',
        'Inactive'
    ) AS status,
    L.name AS locationName,
    COUNT(CMH.hobbyID) AS hobbyCount
FROM ClubMembers CM
    JOIN ClubMemberHobbies CMH ON CM.memberID = CMH.memberID
    JOIN Locations L ON CM.locationID = L.locationID
    LEFT JOIN Payments P ON CM.memberID = P.memberID
GROUP BY CM.memberID
HAVING hobbyCount >= 3
ORDER BY age DESC,
    locationName ASC;
-- 4. Members with no hobbies
SELECT CM.memberID,
    CM.firstName,
    CM.lastName,
    TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
    CM.city,
    CM.province,
    IF(
        SUM(YEAR(P.paymentDate) = YEAR(CURDATE())) >= 1,
        'Active',
        'Inactive'
    ) AS status,
    L.name AS locationName
FROM ClubMembers CM
    LEFT JOIN ClubMemberHobbies CMH ON CM.memberID = CMH.memberID
    JOIN Locations L ON CM.locationID = L.locationID
    LEFT JOIN Payments P ON CM.memberID = P.memberID
WHERE CMH.hobbyID IS NULL
GROUP BY CM.memberID
ORDER BY locationName ASC,
    age ASC;
-- 5. Total number of members by age
SELECT TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS age,
    COUNT(*) AS memberCount
FROM ClubMembers
GROUP BY age
ORDER BY age ASC;
-- 6. Major family members and their children
SELECT FM.firstName AS parentFirst,
    FM.lastName AS parentLast,
    CM.memberID,
    CM.firstName,
    CM.lastName,
    CM.dateOfBirth,
    CM.socialSecurityNumber,
    CM.medicareCardNumber,
    CM.telephoneNumber,
    CM.address,
    CM.city,
    CM.province,
    CM.postalCode,
    MFR.relationship,
    IF(
        SUM(YEAR(PAY.paymentDate) = YEAR(CURDATE())) >= 1,
        'Active',
        'Inactive'
    ) AS status
FROM FamilyMembers FM
    JOIN MemberFamilyRelations MFR ON FM.familyMemberID = MFR.familyMemberID
    JOIN ClubMembers CM ON MFR.memberID = CM.memberID
    LEFT JOIN Payments PAY ON CM.memberID = PAY.memberID
WHERE NOT EXISTS (
        SELECT 1
        FROM ClubMembers CM2
        WHERE CM2.socialSecurityNumber = FM.socialSecurityNumber
    )
GROUP BY CM.memberID;
-- 7. Total membership fees and donations by major members (2020–2024)
SELECT SUM(PAY.paymentAmount) AS totalPayments,
    SUM(
        CASE
            WHEN CM.isMinor = TRUE
            AND PAY.paymentAmount > 100 THEN PAY.paymentAmount - 100
            WHEN CM.isMinor = FALSE
            AND PAY.paymentAmount > 200 THEN PAY.paymentAmount - 200
            ELSE 0
        END
    ) AS totalDonations
FROM Payments PAY
    JOIN ClubMembers CM ON PAY.memberID = CM.memberID
WHERE PAY.membershipYear BETWEEN 2020 AND 2024;
-- 8. Inactive members and amount due
SELECT CM.memberID,
    CM.firstName,
    CM.lastName,
    TIMESTAMPDIFF(YEAR, CM.dateOfBirth, CURDATE()) AS age,
    CM.city,
    CM.province,
    L.name AS locationName,
    (
        CASE
            WHEN CM.isMinor = TRUE THEN 100
            ELSE 200
        END - COALESCE(SUM(PAY.paymentAmount), 0)
    ) AS amountDue
FROM ClubMembers CM
    JOIN Locations L ON CM.locationID = L.locationID
    LEFT JOIN Payments PAY ON CM.memberID = PAY.memberID
    AND PAY.membershipYear = YEAR(CURDATE()) - 1
GROUP BY CM.memberID
HAVING amountDue > 0
ORDER BY locationName ASC,
    age ASC;
-- COUNT(*) statements for each relation R in the database
-- As required: "For each relation R created in your database, report the result of SELECT COUNT(*) FROM R;"
SELECT COUNT(*)
FROM Locations;
SELECT COUNT(*)
FROM Personnel;
SELECT COUNT(*)
FROM PersonnelLocation;
SELECT COUNT(*)
FROM FamilyMembers;
SELECT COUNT(*)
FROM FamilyMemberLocation;
SELECT COUNT(*)
FROM ClubMembers;
SELECT COUNT(*)
FROM MemberFamilyRelations;
SELECT COUNT(*)
FROM Hobbies;
SELECT COUNT(*)
FROM ClubMemberHobbies;
SELECT COUNT(*)
FROM Payments;