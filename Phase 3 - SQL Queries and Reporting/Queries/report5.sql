-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 5
-- Author: Benjamin Noel
-- Desc: Checks for the number of students that enrolled a credential per year
-- Concepts: EXTRACT(single-row), COUNT(group), GROUP BY(group), ORDER BY(restrict/sort), ROLLUP(OLAP)

SELECT
    EXTRACT (YEAR FROM start_date) Yr, -- pulls year from the students' start dates
    COUNT (studentid) AS "Total Students" -- counts the total students (rows) per year
FROM 
    studentcredential
GROUP BY
    ROLLUP (EXTRACT (YEAR FROM start_date)) -- groups data by year, and adds extra row for grand total
ORDER BY 
    EXTRACT (YEAR FROM start_date); -- sets table in chronological order