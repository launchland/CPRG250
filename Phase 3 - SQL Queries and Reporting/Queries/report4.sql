-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 4
-- Author: Benjamin Noel
-- Desc: Queries for students with an A+ on a course, along with their names
-- Concepts: CONCAT(single-row), INNER JOIN(joins), WHERE char(restrict/sort), ORDER BY(restrict/sort)

SELECT t1.course_code, t1.letter_grade, t1.studentid, CONCAT(firstname,' ',lastname) AS name
FROM student_course_record AS t1
INNER JOIN student AS t2 -- joins scr with student with studentid
    ON t1.studentid = t2.studentid
    
WHERE letter_grade LIKE 'A+' -- filters for students with A+
ORDER BY course_code, studentid; --organizes course code and student id