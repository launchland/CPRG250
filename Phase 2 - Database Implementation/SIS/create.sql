-- C P R G 2 5 0    P R O J E C T   2 --
-- PHASE TWO: DATABASE IMPLEMENTATION
-- Purpose: table creation
-- Author: Benjamin Noel

--deletes all existing tables from public
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS credential CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS instructor CASCADE;
DROP TABLE IF EXISTS studentcredential CASCADE;
DROP TABLE IF EXISTS sched_course CASCADE;
DROP TABLE IF EXISTS student_course_record CASCADE;
DROP TABLE IF EXISTS linkages CASCADE;


-- P A R E N T    T A B L E S --
--STUDENT
CREATE TABLE student (
    studentID INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    status CHAR(2) CHECK (status IN ('A', 'AP', 'S', 'E')),
    status_date DATE,
    phone_number VARCHAR(12),
    email VARCHAR(255)
);

--CREDENTIAL
CREATE TABLE credential (
    credentialnum INT PRIMARY KEY,
    school VARCHAR(255),
    name VARCHAR(255),
    type CHAR(2) CHECK (type IN ('MI', 'FT', 'CT', 'DP', 'AD', 'D'))
);

--COURSE
CREATE TABLE course (
    course_code VARCHAR(7) PRIMARY KEY,
    name VARCHAR(255),
    num_of_credits INT CHECK(num_of_credits BETWEEN 1 AND 9),
    credentialnum INT,
    prereq_course_code VARCHAR(7)
);
ALTER TABLE course --setting pk and fk
        ADD CONSTRAINT fkey_prereq
        FOREIGN KEY(prereq_course_code)
            REFERENCES course(course_code);
            
--INSTRUCTOR
CREATE TABLE instructor (
    instructorID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(40),
    prov CHAR(2) CHECK(prov IN ('AB', 'BC', 'SK', 'MB', 'ON', 'QC', 'NL', 'NB', 'NS', 'PE')),
    postal_code VARCHAR(12),
    email VARCHAR(255)
);

-- C H I L D   T A B L E S --
--STUDENT CREDENTIAL
CREATE TABLE studentcredential (
    studentID INT, --will be pk, fk from student
    credentialnum INT, --will be pk, fk from credential
    start_date DATE,
    completion_date DATE NULL,
    name VARCHAR(255),
    credential_status CHAR(1) CHECK (credential_status IN ('A', 'G', 'E')),
    GPA NUMERIC(3, 2)
);

ALTER TABLE studentcredential --setting pk and fk
    ADD PRIMARY KEY (studentID, credentialnum),
    ADD CONSTRAINT fk_student
        FOREIGN KEY(studentID)
            REFERENCES student(studentID),
    ADD CONSTRAINT fk_credential
        FOREIGN KEY(credentialnum)
            REFERENCES credential(credentialnum);


--SCHEDULED COURSE
CREATE TABLE sched_course (
    CRN INT PRIMARY KEY,
    semester_code VARCHAR(6),
    course_code VARCHAR(7), --fk from course
    section_code CHAR(1),
    instructorID INT --fk from instructor
);
ALTER TABLE sched_course --setting pk and fk
    ADD CONSTRAINT fk_course
        FOREIGN KEY (course_code) 
            REFERENCES course(course_code),
    ADD CONSTRAINT fk_instructor
        FOREIGN KEY (instructorID) 
            REFERENCES instructor(instructorID);


--STUDENT COURSE RECORD
CREATE TABLE student_course_record (
    CRN INT, --will be pk, fk from sched_course
    semester_code CHAR(6),
    studentID INT, --will be pk, fk from student
    course_code CHAR(7), --fk from course
    credentialnum INT, --fk from credential
    letter_grade CHAR(2) CHECK (letter_grade IN ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F', 'I'))
);
ALTER TABLE student_course_record --setting pk and fk
    ADD PRIMARY KEY(CRN, semester_code, studentID),
    ADD CONSTRAINT fk_sched_course
        FOREIGN KEY(CRN)
            REFERENCES sched_course(CRN),
    ADD CONSTRAINT fk_student
        FOREIGN KEY(studentID)
            REFERENCES student(studentID),
    ADD CONSTRAINT fk_credential
        FOREIGN KEY(credentialnum)
            REFERENCES credential(credentialnum),
    ADD CONSTRAINT fk_course
        FOREIGN KEY (course_code) 
            REFERENCES course(course_code);

--LINKAGES
CREATE TABLE linkages (
    credentialnum INT,
    course_code CHAR(7),
    type_flag int CHECK (type_flag IN (0, 1))
);
ALTER TABLE linkages --setting pk and fk
    ADD CONSTRAINT fk_course
        FOREIGN KEY (course_code) 
            REFERENCES course(course_code),
    ADD CONSTRAINT fk_credential
        FOREIGN KEY(credentialnum)
            REFERENCES credential(credentialnum);
