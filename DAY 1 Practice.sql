USE testDB;
CREATE TABLE Persons(
PersonID INT PRIMARY KEY,
LastName Varchar(255),
FirstName Varchar(255),
Address Varchar(255),
City Varchar(255)
);
DESCRIBE Persons;
DROP TABLE Persons;
DROP TABLE if exists Persons;
SHOW TABLES;
ALTER TABLE Persons ADD DateOfBirth DATE;
DESCRIBE Persons;
ALTER TABLE Persons DROP DateOfBirth;
CREATE TABLE Students(
Id INT NOT NULL,
Name Varchar(255),
Gpa DECIMAL(3,2)
);
DESCRIBE Students;
INSERT INTO Students VALUES(1, "Braga", 8.0);
DESCRIBE Students;
SELECT * FROM Students;
INSERT INTO Students VALUES
(2,"Barathi",8.2),
(3,"Chitra", 7.5);
SELECT * FROM Students; 
INSERT INTO Students(Id,Name)VALUES(4,'Raj');
SELECT * FROM Students;
SELECT Id, Name FROM Students;
SELECT Gpa FROM Students;
SELECT * FROM Students
ORDER BY Name DESC;
CREATE TABLE Employees(
Emp_Id INT,
EName VARCHAR(255),
JobDesc VARCHAR(255),
Salary INT
);
DESCRIBE Employees;
INSERT INTO Employees VALUES
(1,'Ram','ADMIN',1000000),
(2,'Harini','MANAGER',2500000),
(3,'George','SALES',2000000),
(4,'Ramya','SALES',1300000),
(5,'Meena','HR',2000000),
(6,'Ashok','MANAGER',3000000),
(7,'Abdul','HR',2000000),
(8,'Ramya','ENGINEER',1000000),
(9,'Raghu','CEO',8000000),
(10,'Arvind','MANAGER',2800000),
(11,'Akshay','ENGINEER',1000000),
(12,'John','ADMIN',2200000),
(13,'Abinaya','ENGINEER',2100000);
SELECT * FROM Employees;
SELECT * FROM Employees
WHERE EName='Ramya';
SELECT *FROM Employees
WHERE EName='Ramya' AND Salary<=1100000;
SELECT * FROM Employees
WHERE Salary<2600000 AND JobDesc='MANAGER';
SELECT * FROM Employees
WHERE JobDesc='HR' OR JobDesc='SALES';
SELECT * FROM Employees
WHERE JobDesc IN  ('HR','SALES');
SELECT * FROM Employees
WHERE JobDesc NOT IN ('HR','SALES');
SELECT * FROM Employees
WHERE Salary BETWEEN 1000000 AND 3000000
LIMIT 5;
SELECT * FROM Employees
WHERE EName LIKE 'Ab%';
UPDATE Employees
SET JobDesc="ANALYST"
WHERE JobDesc="ENGINEER";
UPDATE Employees
SET JobDesc = "Analyst"
WHERE JobDesc ="ENGINEER";
SELECT * FROM Employees;
ALTER TABLE Employees
RENAME COLUMN JobDesc to job_desc;
UPDATE Employees
SELECT * FROM Employees;
describe Employees;
select * from Employees;
update Employees
set Salary=6000000
where job_desc='CEO';
UPDATE Employees
SET job_desc = "Analyst"
WHERE job_desc ="ENGINEER";
SELECT * FROM Employees;   
DELETE FROM Employees WHERE Emp_Id=12;
SELECT * FROM Employees;
SELECT DISTINCT job_desc
FROM Employees;
SELECT * FROM employees
ORDER BY EName ASC;
SELECT *FROM Employees
ORDER BY EName, Salary;
SELECT * FROM Employees
where job_desc='MANAGER'
order by salary desc;
select * from employees
order by ( case job_desc
when 'CEO' then 1
when 'MANAGER 'then 2
when 'HR 'then 3
else 100 
end);
select * from employees
order by ( case job_desc
when 'ceo' then 1
when 'manager' then 2
when 'hr' then 3
when 'analyst' then 4
when 'sales' then 5
else 100 end
),EName;
select count(*)
from Employees;
select count(*) Total
from Employees;
select count(*)
from Employees
where job_desc='manager';
select count(*)total
from Employees
where Salary;
select count(Salary)Total
from employees;
select avg(Salary)
from employees
Where job_desc='Manager';
select sum(Salary)
from employees
Where job_desc='Analyst';
select max(Salary)
from employees;
select max(Salary)salary 
from Employees
where job_desc='MANAGER';
select min(Salary)
from employees;
select * from Employees;







  
