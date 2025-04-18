-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 7
-- Author: Benjamin Noel
-- Desc: Finds the student with the highest GPA in each credential
-- Concepts: UPPER(single-row), JOIN(joins), MAX(group), subqueries, ORDER BY(restrict/sort)

SELECT t1.credentialnum, t1.GPA, t1.studentID, UPPER(t2.firstname || ' ' || t2.lastname) AS studentname
FROM studentcredential t1
JOIN student t2 ON t1.studentid = t2.studentid -- joins student and studentcred

WHERE GPA = ( --subquery
    SELECT MAX(GPA) -- gets the highest gpa of all students in a credential
    FROM studentcredential t3
     WHERE t3.credentialnum = t1.credentialnum 
)
ORDER BY credentialnum;