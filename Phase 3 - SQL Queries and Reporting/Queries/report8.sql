-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 7
-- Author: Benjamin Noel
-- Desc: Finds the numbers of courses each student is enrolled in
-- Concepts: COUNT(group), subqueries, ORDER BY(restrict/sort)

SELECT t1.studentID, t1.firstname, t1.lastname,
       (SELECT COUNT(*) --subquery, counts total courses for each student
           FROM student_course_record t2
           WHERE t2.studentID = t1.studentID
       ) AS total_courses -- column is named total_courses
FROM student t1
ORDER BY total_courses DESC; --orders from most courses to least courses