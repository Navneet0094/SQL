/*
DDL COMMANDS
DDL, or Data Definition Language, comprises SQL commands used to define and modify the 
structure of database schemas, including creating, altering, and deleting tables and other database objects.

1. CREATE: Used to create a new table or database.
2. ALTER: Used to modify an existing database object, such as adding a column to a table.
3. DROP: Used to delete an entire table, database, or other objects.
4. TRUNCATE: Used to delete all the rows in a table without deleting the table itself.

*/

-- 1. CREATE: Used to create a new table or database.

/*
lets choose specific domain for example healthcare
*/

-- now lets create database using create
-- ***************************************************************************************************************************

create database healthcare;

CREATE DATABASE IF NOT EXISTS healthcare;

drop database if exists healthcare;

drop database healthcare;

-- ***************************************************************************************************************************

-- now lets create table using create

/*
Database name: Healthcare

Tables:
Doctors
Patients
Insurance
Medicines
Claims
Departments
Diseases
Bills / Transactions

you can take reference of ER Diagram
*/
-- ***************************************************************************************************************************
use healthcare;

create table hospitals
(
	hospital_code	int,
	hospital_name	varchar(50), 
	location		varchar(200), 
	contact_no		bigint
);

create table healthcare.hospitals
(
	hospital_code	int,
	hospital_name	varchar(50), 
	location		varchar(200), 
	contact_no		bigint
);

select * from hospitals;

drop table hospitals;

/*
create or replace table hospitals
(
	hospital_code	int,
	hospital_name	varchar(50), 
	location		varchar(200), 
	contact_no		bigint
);

SELECT VERSION();

*/

drop table if exists hospitals;

-- ***************************************************************************************************************************
/*

Assignment 1

use alter for hospitals table

*/

/*
truncate we will learn later
*/

/*
DML stands for Data Manipulation Language, and it is a subset of SQL (Structured Query Language) commands
 used to manage data within database tables. DML commands allow you to insert, update, delete, and retrieve data
 The most common DML commands are:
 
 1. INSERT: Adds new rows of data to a table.
 2. UPDATE: Modifies existing data within a table.
 3. DELETE: Removes data from a table.
 4. merge: The MERGE statement, also known as an "upsert" (a combination of "update" and "insert"), is a Data Manipulation Language 
           (DML) command used to insert, update, or delete data in a table based on certain conditions.

*/

-- 1. INSERT: Adds new rows of data to a table.

drop table if exists hospitals;
create table if not exists hospitals
(
	hospital_code	int,
	hospital_name	varchar(50), 
	location		varchar(200), 
	contact_no		bigint
);

-- different ways for inserting data into table

insert into hospitals (hospital_code, hospital_name, location, contact_no)
	values (1, 'Apollo Hospital', 'Mumbai', 9900099000);
insert into hospitals (hospital_code, hospital_name, location)
	values (2, 'Fortis Hospital', 'New York');
insert into hospitals values (3, 'Duke Hospital', 'Washington DC', 171944449999);

select * from hospitals;

create table Doctors
(
	id				varchar(15),
	first_name		varchar(50) not null , 
	last_name		varchar(50) not null, 
	specilization	varchar(200), 
	gender			bigint,
	dob				date,
	salary			int,
	hospital_id		int
);

-- practice
describe Doctors;

ALTER TABLE DOCTORS modify column gender varchar(10);
alter table doctors add constraint pk_doctor primary key (id);

/*

ALTER TABLE table_name 
ADD CONSTRAINT constraint_name constraint_definition;

*/

drop table if exists Patients;
create table Patients
(
	id				varchar(15) unique,
	first_name		varchar(50), 
	last_name		varchar(50), 
	gender			varchar(10) check (gender in ('M', 'F', 'Male', 'Female')),
	dob				date,
	phone_no		bigint,
	blood_group		varchar(15)
);

select * from patients;


drop table if exists Medical_Records;
create table Medical_Records
(
	id 						int, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15)
);

select * from Medical_Records;


insert into hospitals values (1, 'Fortis Hospital', 'Bangalore', 9900099000);
insert into hospitals values (2, 'Manipal Hospital', 'Manipal', 9900099222);
insert into hospitals values (3, 'Apollo Hospital', 'Mumbai', 9900099333);
insert into hospitals values (4, 'St. Francis Hospital', 'New York', 17194440001);
insert into hospitals values (4, 'Duke Hospital', 'New York', 17194440022);

select * from hospitals;

insert into Doctors values ('D1', 'Ragav', 'Jain', 'Cardiology', 'Male', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 250000, 4);
insert into Doctors values ('D2', 'Priyanka', 'Verma', 'Physician', 'female', STR_TO_DATE('01-01-1995', '%d-%m-%Y'), 350000, 3);
insert into Doctors values ('D3', 'Sheetal', 'Shetty', 'Neurology', 'F', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 200000, 3);
insert into Doctors values ('D4', 'David', 'Smith', 'Psyatry', 'M', STR_TO_DATE('01-01-1970', '%d-%m-%Y'), 150000, 1);
insert into Doctors values ('D5', 'James', 'Dias', 'Oncology', 'm', STR_TO_DATE('01-01-1985', '%d-%m-%Y'), 150000, 2);
insert into Doctors values ('D6','Ali', 'Abdal', 'Dermatology', 'M', STR_TO_DATE('01-01-1990','%d-%m-%Y'), 250000, 5);

select * from Doctors;

insert into Patients values ('P1', 'Vishva', 'Kumar', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099900, 'A+');
insert into Patients values ('P2', 'Steven', 'Smith', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099901, 'B+');
insert into Patients values ('P3', 'Ram', 'Kumar', 'Male', STR_TO_DATE('11-05-1990', '%d-%m-%Y'), 9990099902, 'O+');
insert into Patients values ('P4', 'Raju', 'Sharma', 'Male', STR_TO_DATE('14-05-1990', '%d-%m-%Y'), 9990099903, 'O-');
insert into Patients values ('P5', 'Eshal', 'Maryam', 'Female', STR_TO_DATE('10-07-1990', '%d-%m-%Y'), 9990099904, 'A-');
insert into Patients values ('P6', 'Reshal', 'Verma', 'F', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099905, 'A+');

select * from Patients;

insert into Medical_Records values (1, 'Food Poisoning', STR_TO_DATE('10-01-2023', '%d-%m-%Y'), 'P1', 'D2');
insert into Medical_Records values (2, 'Fever and Flu', STR_TO_DATE('11-01-2023', '%d-%m-%Y'), 'P6', 'D6');
insert into Medical_Records values (3, 'Back Spasm', STR_TO_DATE('15-01-2023', '%d-%m-%Y'), 'P7', 'D6');
insert into Medical_Records values (4, 'Headache', STR_TO_DATE('20-01-2023', '%d-%m-%Y'), 'P0', 'D7');

select * from Medical_Records;

-- 2. UPDATE: Modifies existing data within a table.

/*

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

*/

select * from Patients;

update Patients
set blood_group='O+'
where id='P1';

select * from hospitals;

update hospitals 
set hospital_code=5
where hospital_name='Duke Hospital';

SET SQL_SAFE_UPDATES = 0;

/*
 This mode is designed to prevent potentially dangerous operations, such as updating or 
 deleting rows without using a key column in the WHERE clause. To resolve this issue, you 
 can either disable safe update mode temporarily or modify your query to use a key column in the WHERE clause.

*/


update hospitals 
set hospital_code=50, location='Wahsington DC'
where hospital_name='Duke Hospital';


-- DELETE , TRUNCATE

select * from doctors;

delete from doctors
where id = 'D6';

select * from medical_records;

delete from medical_records
where doctor_id = 'D7';

truncate table doctors;

/*
-- Difference between DELETE and TRUNCATE
1) DELETE can either delete few records or all records but TRUNCATE ALWAYS REMOVES all data/records/rows.
2) TRUNCATE is much faster than DELETE
*/

-- merge is not suported in mysql


/*

DCL stands for Data Control Language, and it is a subset of SQL (Structured Query Language) 
used to control access to data in a database. DCL commands are used to grant and revoke privileges 
to users, controlling what they can and cannot do within the database. The primary DCL commands are GRANT and REVOKE.


Common DCL Commands:

1. GRANT: Used to give specific privileges to users or roles.
2. REVOKE: Used to remove specific privileges from users or roles.

*/

-- 1. GRANT
-- Example 1: Granting All Privileges on a Database

GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'hostname';


-- lets create new user 
CREATE USER 'john'@'localhost' IDENTIFIED BY 'abc';

-- to chech which is my current user
SELECT CURRENT_USER();

-- to grant Privileges to specific user
GRANT SELECT, INSERT, UPDATE ON healthcare.* TO 'john'@'localhost';

/*

healthcare.*: This specifies all tables within the healthcare database.
healthcare: The name of the database.
*: A wildcard that represents all tables within the specified database.

*/

--  Granting Specific Privileges on a Table

-- GRANT SELECT, INSERT, UPDATE ON database_name.table_name TO 'username'@'hostname';

GRANT SELECT, INSERT, UPDATE ON healthcare.patients TO 'john'@'localhost';

/*
REVOKE
The REVOKE command is used to remove specific privileges from a user or role. Here’s how you can use it:

*/

-- Revoking All Privileges on a Database

-- REVOKE ALL PRIVILEGES ON database_name.* FROM 'username'@'hostname';

REVOKE ALL PRIVILEGES ON healthcare.* FROM 'john'@'localhost';

-- Revoking Specific Privileges on a Table

-- REVOKE SELECT, INSERT, UPDATE ON database_name.table_name FROM 'username'@'hostname';

REVOKE SELECT, INSERT, UPDATE ON healthcare.patients FROM 'john'@'localhost';


-- ----------------------------------------------------------------------------------------------------------------------


-- You can check the current status of auto-commit for your session by running the following SQL command:
SELECT @@autocommit;

-- You can toggle the auto-commit setting using the following commands:

-- Enable Auto-Commit:

SET autocommit = 1;

-- Disable Auto-Commit:

SET autocommit = 0;

/*

TCL Commands Explanation

1. COMMIT: Saves all changes made during the current transaction.
2. ROLLBACK: Undoes all changes made during the current transaction.
3. SAVEPOINT: Sets a point within a transaction to which you can later roll back.

*/

use healthcare;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (name, department, salary) VALUES
('Alice', 'HR', 50000),
('Bob', 'Engineering', 60000),
('Charlie', 'Finance', 55000);

-- COMMIT

-- Start a transaction
START TRANSACTION;

select * from employees;
-- Insert a new employee
INSERT INTO employees (name, department, salary) VALUES ('David', 'Marketing', 45000);

-- Commit the transaction
COMMIT;

-- ROLLBACK

-- Start a transaction
START TRANSACTION;

-- Update an employee's salary
UPDATE employees SET salary = 70000 WHERE name = 'Alice';
SET SQL_SAFE_UPDATES = 0;

-- Roll back the transaction
ROLLBACK;


--  SAVEPOINT and ROLLBACK TO SAVEPOINT

-- Start a transaction
START TRANSACTION;

-- Insert a new employee
INSERT INTO employees (name, department, salary) VALUES ('Eve', 'Sales', 48000);

-- Create a savepoint
SAVEPOINT savepoint1;

-- Update an employee's department
UPDATE employees SET department = 'Operations' WHERE name = 'Bob';

-- Roll back to the savepoint
ROLLBACK TO savepoint1;

-- Commit the transaction
COMMIT;










