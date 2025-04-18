-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 6
-- Author: Benjamin Noel
-- Desc: Finds all possible combinations of required/optional courses per credential, for curriculum designers
-- Concepts: COUNT(group), CUBE(OLAP), NULLS LAST(restrict/sort)

SELECT 
    credentialnum,
    CASE -- replaces type_flag's boolean values with strings
        WHEN type_flag = 1 THEN 'Required'
        WHEN type_flag = 0 THEN 'Optional'
    END AS type_flag,
    COUNT(course_code) AS total_courses -- counts the total courses(rows) per course code
FROM linkages

GROUP BY CUBE(credentialnum, type_flag) --creates the possible combinations
ORDER BY 
    credentialnum NULLS LAST, --nulls placed at bottom of list/order
    type_flag NULLS LAST;