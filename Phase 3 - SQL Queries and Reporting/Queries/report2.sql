-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 1
-- Author: Benjamin Noel
-- Desc: Lists all students and their enrolled courses, to check for inactive students/courses
-- Concepts: FULL OUTER JOIN(joins), ORDER BY(restrict/sort)

SELECT t1.studentID, t1.firstname, t1.lastname, 
    t2.course_code
FROM student t1

FULL OUTER JOIN student_course_record t2 --returns all data matching both tables
    ON t1.studentID = t2.studentID --connects studentid key

FULL OUTER JOIN course AS t3 --returns all data matching both tables
    ON t2.course_code = t3.course_code --connects course_code key
ORDER BY t1.studentID; --ordered numerically