create database assignment2;
use assignment2;
CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);
INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'Sales', 60000, '2019-06-15'),
('Bob', 'HR', 45000, '2021-03-12'),
('Charlie', 'Engineering', 72000, '2018-01-10'),
('David', 'Marketing', 50000, '2020-07-20'),
('Eve', 'Sales', 55000, '2018-09-30'),
('Frank', 'HR', 35000, '2020-02-25'),
('Grace', 'Design', 65000, '2017-11-05'),
('Hank', 'Engineering', 68000, '2020-08-22'),
('Ivy', 'Design', 70000, '2021-05-18'),
('Jack', 'Finance', 80000, '2016-12-01'),
('Kate', 'Sales', 50000, '2019-10-10'),
('Leo', 'IT', 75000, '2019-01-15'),
('Mia', 'Sales', 62000, '2022-01-01'),
('Nina', 'HR', 40000, '2023-06-10'),
('Oscar', 'Marketing', 58000, '2021-07-15'),
('Paul', 'Engineering', 90000, '2017-03-18'),
('Quinn', 'Design', 75000, '2019-04-25'),
('Rita', 'IT', 60000, '2021-10-20'),
('Sam', 'HR', 62000, '2022-11-30'),
('Tina', 'Finance', 42000, '2018-08-18');
select * from employees;
-- qus2
 select * from employees 
 where (department = "sales" and salary>50000)
 or (department = "HR" and hire_date > "2020-01-01" );
 
 -- qus 3 
 
 SELECT name, salary
FROM employees
WHERE salary > 50000
AND (department = 'Sales' OR department = 'HR')
ORDER BY department DESC, salary ASC;

-- qus 4

select * from employees
where (salary between 40000 and 60000) and  (department <> "Marketing") 
order by hire_date desc , salary asc;
 
-- qus 5

select * from employees where department <> "Finance" or salary <30000
 order by department asc , name asc;

 
 
 
 -- qus 6
select * from employees 
where (name like 'A%') and  (hire_date > "2015-01-01")
order by name asc;

-- qus 7

select * from employees 
where (department = "Engineering" and salary<70000) or (department = "design" and salary >60000) 
order by salary desc;

-- qus 9
 
select * from projects  
where (start_date < "2022-01-01") or (end_date > "2022-12-31") 
order by project_name asc;



-- qus 10

select * from employees where name = "%son" and department = "IT" order by salary desc,hire_date asc;

-- qus 11

select * from employees  
where year(hire_date) = 2021 and salary > (select avg(salary) from employees) 
order by name asc;

