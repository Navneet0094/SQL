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

select * from obesity_data;
select min(height) from obesity_data;