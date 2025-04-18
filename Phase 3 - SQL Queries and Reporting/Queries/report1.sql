-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 1
-- Author: Benjamin Noel
-- Desc: Used to find instructors currently in Alberta, along with their contact info
-- Concepts: CONCAT(single-row), WHERE char(restrict/sort)

SELECT 
    instructorID, 
    CONCAT(firstname,' ',lastname) AS name, --merges first and last name into a column
    email, prov 
FROM instructor
WHERE prov LIKE 'AB'; --filters for data where province code is 'AB'