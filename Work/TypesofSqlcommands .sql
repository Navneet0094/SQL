CREATE DATABASE If not exists commands;
use commands;
drop database if exists healthcare;

-- DDl
create table if not exists hospitals(
	hospital_code	int,
	hospital_name	varchar(50), 
	location		varchar(200), 
	contact_no		bigint
);
select * from hospitals;

SELECT VERSION();

Alter table hospitals Add  Pincode int;
Alter table hospitals drop column Pincode;
Alter table hospitals Rename column contact_no to contact_info;

Truncate table hospitals;

-- DML commands
select * from hospitals;
-- m-1
insert into hospitals
values (1,"Apollo hospital",'Mumbai', 9900099000);
-- m-2
insert into hospitals (hospital_code, hospital_name, location)
values (2, 'Fortis Hospital', 'New York');
-- m-3
insert into hospitals
values (1,"Apollo hospital",'Mumbai', 9900099000);
-- m4
insert into hospitals
values (1,"Apollo hospital",'Mumbai', 9900099000) ,(3, 'Duke Hospital', 'Washington DC', 171944449999);

insert into hospitals values (1, 'Fortis Hospital', 'Bangalore', 9900099000);
insert into hospitals values (2, 'Manipal Hospital', 'Manipal', 9900099222);
insert into hospitals values (3, 'Apollo Hospital', 'Mumbai', 9900099333);
insert into hospitals values (4, 'St. Francis Hospital', 'New York', 17194440001);
insert into hospitals values (4, 'Duke Hospital', 'New York', 17194440022);

select * from hospitals;
update hospitals 
Set hospital_code = 5 
where hospital_name='Duke Hospital'; 

SET SQL_SAFE_UPDATES = 0;

update hospitals 
set hospital_code=50, location='Wahsington DC'
where hospital_name='Duke Hospital';

-- ex-2
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
describe Doctors;
Alter table Doctors modify column gender varchar(10);
alter table Doctors add constraint pk_doctor primary key (id);

insert into Doctors values ('D1', 'Ragav', 'Jain', 'Cardiology', 'Male', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 250000, 4);
insert into Doctors values ('D2', 'Priyanka', 'Verma', 'Physician', 'female', STR_TO_DATE('01-01-1995', '%d-%m-%Y'), 350000, 3);
insert into Doctors values ('D3', 'Sheetal', 'Shetty', 'Neurology', 'F', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 200000, 3);
insert into Doctors values ('D4', 'David', 'Smith', 'Psyatry', 'M', STR_TO_DATE('01-01-1970', '%d-%m-%Y'), 150000, 1);
insert into Doctors values ('D5', 'James', 'Dias', 'Oncology', 'm', STR_TO_DATE('01-01-1985', '%d-%m-%Y'), 150000, 2);
insert into Doctors values ('D6','Ali', 'Abdal', 'Dermatology', 'M', STR_TO_DATE('01-01-1990','%d-%m-%Y'), 250000, 5);

select * from Doctors;
delete from Doctors
where id = 'D6';
truncate table Doctors;

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

select * from Patients;
insert into Patients values ('P1', 'Vishva', 'Kumar', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099900, 'A+');
insert into Patients values ('P2', 'Steven', 'Smith', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099901, 'B+');
insert into Patients values ('P3', 'Ram', 'Kumar', 'Male', STR_TO_DATE('11-05-1990', '%d-%m-%Y'), 9990099902, 'O+');
insert into Patients values ('P4', 'Raju', 'Sharma', 'Male', STR_TO_DATE('14-05-1990', '%d-%m-%Y'), 9990099903, 'O-');
insert into Patients values ('P5', 'Eshal', 'Maryam', 'Female', STR_TO_DATE('10-07-1990', '%d-%m-%Y'), 9990099904, 'A-');
insert into Patients values ('P6', 'Reshal', 'Verma', 'F', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099905, 'A+');
insert into Patients values ('p7', 'navneet','sharma', 'm', Str_to_date('07-09-2004','%d-%m-%Y'),3832982392,'b+');

select * from Patients;
Update Patients 
Set blood_group = "b-"
where id = 'P1';

select * from Patients;

-- ex -4

create table Medical_Records
(
	id 						int, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15)
);
insert into Medical_Records values (1, 'Food Poisoning', STR_TO_DATE('10-01-2023', '%d-%m-%Y'), 'P1', 'D2');
insert into Medical_Records values (2, 'Fever and Flu', STR_TO_DATE('11-01-2023', '%d-%m-%Y'), 'P6', 'D6');
insert into Medical_Records values (3, 'Back Spasm', STR_TO_DATE('15-01-2023', '%d-%m-%Y'), 'P7', 'D6');
insert into Medical_Records values (4, 'Headache', STR_TO_DATE('20-01-2023', '%d-%m-%Y'), 'P0', 'D7');
select * from Medical_Records;

delete from Medical_records
where doctor_id = 'D7';

delete from Medical_Records;


-- DCL  -> first we need to create a user

create user 'navneetsharma@localhost' Identified by 'Navneet@123';
Grant all privileges on Da.* to 'navneetsharma@localhost';
SELECT CURRENT_USER();
Revoke all privileges on Da.* from 'navneetsharma@localhost';
GRANT SELECT, INSERT, UPDATE ON Da.* TO 'john'@'localhost';











-- example
create table students(
id int Primary key,
firstName varchar(20),
lastName varchar(100),
gender varchar(100),
age int,
dob Date,
grade float, 
isActive Boolean
);

Alter table students drop column grade;
select * from students;
Drop table students;




CREATE DATABASE If not exists commands;
use commands;
drop database if exists healthcare;

-- DDl
create table if not exists hospitals(
	hospital_code	int,
	hospital_name	varchar(50), 
	location		varchar(200), 
	contact_no		bigint
);
select * from hospitals;

SELECT VERSION();

Alter table hospitals Add  Pincode int;
Alter table hospitals drop column Pincode;
Alter table hospitals Rename column contact_no to contact_info;

Truncate table hospitals;

-- DML commands
select * from hospitals;
-- m-1
insert into hospitals
values (1,"Apollo hospital",'Mumbai', 9900099000);
-- m-2
insert into hospitals (hospital_code, hospital_name, location)
values (2, 'Fortis Hospital', 'New York');
-- m-3
insert into hospitals
values (1,"Apollo hospital",'Mumbai', 9900099000);
-- m4
insert into hospitals
values (1,"Apollo hospital",'Mumbai', 9900099000) ,(3, 'Duke Hospital', 'Washington DC', 171944449999);

insert into hospitals values (1, 'Fortis Hospital', 'Bangalore', 9900099000);
insert into hospitals values (2, 'Manipal Hospital', 'Manipal', 9900099222);
insert into hospitals values (3, 'Apollo Hospital', 'Mumbai', 9900099333);
insert into hospitals values (4, 'St. Francis Hospital', 'New York', 17194440001);
insert into hospitals values (4, 'Duke Hospital', 'New York', 17194440022);

select * from hospitals;
update hospitals 
Set hospital_code = 5 
where hospital_name='Duke Hospital'; 

SET SQL_SAFE_UPDATES = 0;

update hospitals 
set hospital_code=50, location='Wahsington DC'
where hospital_name='Duke Hospital';

-- ex-2
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
describe Doctors;
Alter table Doctors modify column gender varchar(10);
alter table Doctors add constraint pk_doctor primary key (id);

insert into Doctors values ('D1', 'Ragav', 'Jain', 'Cardiology', 'Male', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 250000, 4);
insert into Doctors values ('D2', 'Priyanka', 'Verma', 'Physician', 'female', STR_TO_DATE('01-01-1995', '%d-%m-%Y'), 350000, 3);
insert into Doctors values ('D3', 'Sheetal', 'Shetty', 'Neurology', 'F', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 200000, 3);
insert into Doctors values ('D4', 'David', 'Smith', 'Psyatry', 'M', STR_TO_DATE('01-01-1970', '%d-%m-%Y'), 150000, 1);
insert into Doctors values ('D5', 'James', 'Dias', 'Oncology', 'm', STR_TO_DATE('01-01-1985', '%d-%m-%Y'), 150000, 2);
insert into Doctors values ('D6','Ali', 'Abdal', 'Dermatology', 'M', STR_TO_DATE('01-01-1990','%d-%m-%Y'), 250000, 5);

select * from Doctors;
delete from Doctors
where id = 'D6';
truncate table Doctors;

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

select * from Patients;
insert into Patients values ('P1', 'Vishva', 'Kumar', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099900, 'A+');
insert into Patients values ('P2', 'Steven', 'Smith', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099901, 'B+');
insert into Patients values ('P3', 'Ram', 'Kumar', 'Male', STR_TO_DATE('11-05-1990', '%d-%m-%Y'), 9990099902, 'O+');
insert into Patients values ('P4', 'Raju', 'Sharma', 'Male', STR_TO_DATE('14-05-1990', '%d-%m-%Y'), 9990099903, 'O-');
insert into Patients values ('P5', 'Eshal', 'Maryam', 'Female', STR_TO_DATE('10-07-1990', '%d-%m-%Y'), 9990099904, 'A-');
insert into Patients values ('P6', 'Reshal', 'Verma', 'F', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099905, 'A+');
insert into Patients values ('p7', 'navneet','sharma', 'm', Str_to_date('07-09-2004','%d-%m-%Y'),3832982392,'b+');

select * from Patients;
Update Patients 
Set blood_group = "b-"
where id = 'P1';

select * from Patients;

-- ex -4

create table Medical_Records
(
	id 						int, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15)
);
insert into Medical_Records values (1, 'Food Poisoning', STR_TO_DATE('10-01-2023', '%d-%m-%Y'), 'P1', 'D2');
insert into Medical_Records values (2, 'Fever and Flu', STR_TO_DATE('11-01-2023', '%d-%m-%Y'), 'P6', 'D6');
insert into Medical_Records values (3, 'Back Spasm', STR_TO_DATE('15-01-2023', '%d-%m-%Y'), 'P7', 'D6');
insert into Medical_Records values (4, 'Headache', STR_TO_DATE('20-01-2023', '%d-%m-%Y'), 'P0', 'D7');
select * from Medical_Records;

delete from Medical_records
where doctor_id = 'D7';

delete from Medical_Records;


-- DCL  -> first we need to create a user

create user 'navneetsharma@localhost' Identified by 'Navneet@123';
Grant all privileges on TypeOfSQLCommads.* to 'navneetsharma@localhost';
Grant all privileges on *.* to 'navneetsharma@localhost';
SELECT CURRENT_USER();
Revoke all privileges on Da.* from 'navneetsharma@localhost';
Revoke SELECT, INSERT, UPDATE ON TypeOfSQLCommads.* from 'navneetsharma@localhost';



-- TCl ->Every query is a  transaction
--  IN mysql it is bydefault it is autocommit means we can't undo ;
select @@autocommit;
use commands;
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
COMMIT;
INSERT INTO employees (name, department, salary) VALUES ('David', 'Marketing', 45000);
select * from employees;
rollback; -- will not work bcoz. auto commit is on
Set autocommit = 0;
START TRANSACTION;
INSERT INTO employees (name, department, salary) VALUES ('Dav', 'Marketing', 45000);
rollback;
UPDATE employees SET salary = 70000 WHERE name = 'Alice';
SET SQL_SAFE_UPDATES = 0;
rollback;

--  START TRANSACTION: Begins a new transaction.
--  COMMIT: Saves all changes made during the transaction. Once committed, the changes are permanent.
--  ROLLBACK: Undoes all changes made during the transaction, reverting the database to its previous state before the transaction began.

INSERT INTO employees (name, department, salary) VALUES ('Eve', 'Sales', 48000);
SAVEPOINT savepoint1;
UPDATE employees SET department = 'Operations' WHERE name = 'Bob';
rollback to savepoint1;

