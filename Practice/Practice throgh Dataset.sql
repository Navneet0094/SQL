create database pw; 
use pw;
select * from obesity_data;
select age,height,weight from obesity_data;
select age as ag from obesity_data ;
select distinct gender,height,weight from obesity_data;
SElect * from obesity_data where gender='male';
select * from obesity_data where height between 1.6 and 1.8;
select height from obesity_data order by height desc ;
select height,gender from obesity_data order by height,gender;
select * from obesity_data;
select * from obesity_data where smoke="yes" And gender like 'M%';
select * from obesity_data where caec='frequently' and gender='male' and favc='yes';
select * from obesity_data where not  gender = 'male';
select * from obesity_data  where caec  in ('sometimes' , 'frequently');
select * from obesity_data;
insert into obesity_data (gender,age)
values ('female', 23);
select * from obesity_data;
UPDATE obesity_data
SET gender = gen, age = ag ;

update obesity_data 
set FAVC = "nhi"
where FAVC = "no";

select * from obesity_data;
select min(height) from obesity_data;
select max(weight) from obesity_data;
select count(*) from obesity_data;
select count(distinct gender) from obesity_data where gender= 'male';

create database if not exists jumbo;
use jumbo;
create table students(
rollno int primary key,
name varchar(10)
);
select * from students;
insert into students 
(rollno , name)
values 
(1,'navneet'),
(2,'nav');
use students;

create table temp1(
id int ,
name varchar(50),
age int,
city varchar(50),
primary key(id,name)
);
select * from temp1;
create table emp (
id int,
salary int default 25000
);
insert into emp(id) values (101);
select * from emp;
use students;
set sql_safe_updates=0;
create table dept(
id int primary key,
name varchar(20)
);
create table teacher(
id int primary key,
name varchar(50),
dept_id int ,
foreign key(dept_id) references dept(id)
);

