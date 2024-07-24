Create database DataAnalysisAssignment;
use DataAnalysisAssignment;
create table  Employee(
EmployeeID INT Primary key,
EmployeeName VARCHAR(45)
);
-- qus1
insert into Employee 
values (3,"Alice Johnson");

-- qus 3
Alter table Employee
Add Email varchar(100);
select * from Employee;

-- qus 5

update employee
set salary = salary + salary * 0.1
WHERE EmployeeID IN (SELECT EmployeeID FROM Department WHERE Department_Name = 'IT');



create table  Department(
Department_ID INT primary key ,
Department_Name VARCHAR(45),
EmployeeID Int,
Constraint empId 
Foreign key (EmployeeID) 
References Employee(EmployeeID)
);

-- qus4
Alter table Department 
Modify column Department_Name varchar(255);
describe Department;



 
create table Project(
ProjectId INT Primary key,
ProjectName VARCHAR(255),
Department_ID INT,
Status enum("active","Inactive"),
constraint dep_id 
Foreign key (Department_ID) 
References Department(Department_ID)
);

create table Assignment(
Assignment_ID INT primary key,
assigning_date DATETIME,
Department_ID INT,
Project_Id INT,
constraint depart_id foreign key (Department_ID) 
References Department(Department_ID),
constraint project_id foreign key (Project_Id) 
References Project(ProjectId)
);
-- qus 2
insert into Assignment (Assignment_ID,assigning_date,Department_ID, Project_Id)
values (3,str_to_date('2024-07-23'), 
		(SELECT Department_ID FROM Department WHERE Department_Name = 'HR'), 
		(SELECT ProjectId FROM Project WHERE ProjectName = 'Project Alpha'));

create table Employee_Assignment(
Employee_EmployeeID INT,
Assignment_Assignment_ID INT,
Constraint emplo_Id 
Foreign key (Employee_EmployeeID) 
References Employee(EmployeeID),
Constraint assi_Id 
Foreign key (Assignment_Assignment_ID) 
References Assignment(Assignment_ID)
);

