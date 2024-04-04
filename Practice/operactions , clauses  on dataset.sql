create database naruto;
use naruto;
select * from obesity_data;
select age from obesity_data where age is  null;
select * from obesity_data limit 3;
SELECT * FROM obesity_data
WHERE gender='male' limit 3;
SELECT * FROM obesity_data
ORDER BY age asc
LIMIT 3;
select min(weight) from obesity_data;
select max(weight) from obesity_data;
select sum(weight) from obesity_data;
select avg(weight) from obesity_data;
select sum(weight) as leastsum
from obesity_data 
where weight<50; 
select count(distinct weight)
from obesity_data;
select * from obesity_data where weight > (select avg(weight) from obesity_data);
select * from obesity_data;
select * from obesity_data 
where MTRANS in("Waliking" ,"motorbike","automobile");
select weight from obesity_data where weight not between 40 and 50;
select * from obesity_data  
where weight between 40 and 50 and age in (21,22,23) order by age asc;
select gender ,age+','+height as gah from obesity_data;
show databases;
show tables;