-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE THREE: SQL QUERIES AND REPORTING
-- Purpose: Report 3
-- Author: Benjamin Noel
-- Desc: finds all students who completed credential #25 using studentcredential and credential
-- Concepts: LEFT JOIN(joins), WHERE int(restrict/sort), NOT NULL(restrict/sort)

SELECT * FROM studentcredential t1
LEFT JOIN credential t2 -- joins all data from left and matching from right
    ON t1.credentialnum = t2.credentialnum -- joins studentcredential to credential

-- filters for only data with completed #25 credentials    
WHERE t1.credentialnum = 25 AND completion_date IS NOT NULL
ORDER BY start_date; -- chronological order