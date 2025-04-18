# C P R G 2 5 0    P R O J E C T   2 #
# PHASE TWO: DATABASE IMPLEMENTATION
# Purpose: data population
# Author: Benjamin Noel
# uses psycopg2 and the sample-data folder to import csv files into the database

# pip install psycopg2
# python.exe -m pip install --upgrade pip 

import psycopg2
conn = psycopg2.connect("host=localhost dbname=sis user=postgres password=auroraborealis host=127.0.0.1 port=5432") #password is auroraborealis as that's my pgadmin password
cur = conn.cursor()

#PARENT TABLES
#lists all tables and their csv files in a dictionary
pathntable = {'sample-data\course.csv':'course', 'sample-data\credential.csv':'credential', 'sample-data\instructor.csv':'instructor', 'sample-data\student.csv':'student'}

for path, table in pathntable.items(): #path = csv path, table = target
    copy_sql = f"""
           COPY {table} FROM stdin 
           WITH CSV
           """
    with open(path, 'r') as f:
        next(f) #skips first row/headers
        cur.copy_expert(sql=copy_sql, file=f)
    conn.commit()

#CHILD TABLES
#lists all tables and their csv files in a dictionary
pathntable = {'sample-data\databridges\linkages.csv':'linkages', 'sample-data\databridges\sched_course.csv':'sched_course', 'sample-data\databridges\scr.csv':'student_course_record', 'sample-data\databridges\studentcredential.csv':'studentcredential'}

for path, table in pathntable.items(): #path = csv path, table = target
    copy_sql = f"""
           COPY {table} FROM stdin 
           WITH CSV
           """
    with open(path, 'r') as f:
        next(f) #skips first row/headers
        cur.copy_expert(sql=copy_sql, file=f)
    conn.commit()

conn.close()

