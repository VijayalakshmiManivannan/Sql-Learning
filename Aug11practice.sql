select * from Employees;
select Ename,salary
from Employees;
select ucase(EName)name, salary
from employees;
select ucase(EName),char_length(EName)char_count
from employees;
select EName,CONCAT('Rs.',Salary)Salary
from Employees;
select EName,concat('Rs.',format(salary,0)) Salary
from Employees;
select EName, left(job_desc,3)
from Employees;
ALTER TABLE employees ADD COLUMN Hire_date date;
select * 
from employees;
update employees 
set Hire_date='2017-07-24';
select * 
from employees;
update employees
set Hire_date='2017-08-11'
where job_desc='Analyst';
select *
from Employees;
select now();
select date(now());
select current_date();
select curdate();
select date_format(curdate(),"%d/%m/%Y") as date;
select datediff(curdate(),"2018-02-11")as days;
select job_desc, avg(salary)
from employees
group by job_desc;
select job_desc, count(Emp_Id)
from Employees
group by Job_desc;
select *
from employees
order by job_desc;
select job_desc, count(Emp_Id)
from Employees
group by job_desc
having count(Emp_Id)>1;
select job_desc, count(Emp_Id)
from Employees
group by job_desc
having count(Emp_Id)>1
order by job_desc;
SELECT job_desc,COUNT(Emp_Id)
FROM Employees
WHERE Salary>1500000
group by job_desc
having count(Emp_Id)>1
order by job_desc;
DROP TABLE Employees;

# use constraints

create table employees(
emp_id int primary key,
ename varchar(30),
job_desc varchar(20),
salary int);
drop table employees;
create table employees(
emp_id int primary key auto_increment,
ename varchar(30)not null,
job_desc varchar(20) default 'unassigned',
salary int,
pan varchar(10) unique,
check (salary>1000000));
describe employees;

insert into employees values
(1, 'Ram','ADMIN',1000000),
(2,'Harini','Manager',2500000),
(3,'George','SALES',2000000),
(4,'Ramya','SALES',1300000),
(5,'Meena','HR',2000000);

insert into employees (ename,salary) values('Ramya',3000000);
select * from employees;
drop table employees;
create table employees(
emp_id int primary key,
ename varchar(30),
job_desc varchar(20),
salary int);

# add not null constraint
alter table employees
modify ename varchar(30) not null;
describe employees;

#drop not null constraint

alter table employees
modify ename varchar(30) not null;

-- add default constraint
alter table employees
alter job_desc set default 'unassigned';

select * from employees;
select * from Employees
where ename='Ashok';
-- drop default constraint
alter table employees
alter job_desc drop default;

-- add check constaint with name or else u cannot drop it
alter table employees
add constraint chk_salary check (salary>100000);
describe employees;
-- drop check constraint
alter table employees
drop check chk_salary;

-- 1. foreign key
drop table employees;
-- branc details create
create table branch(
branch_id int primary key auto_increment,
br_name varchar(30) not null,
addr varchar(200) );

create table employees(
emp_id int primary key auto_increment,
ename varchar(30)not null,
job_desc varchar(20),
salary int,
branch_id int,
constraint FK_branchId foreign key(branch_id)references branch(branch_id));

insert into branch values(1,'Chennai','16 ABC Road');
insert into branch values(2,'Coimbatore','20,15th Block');
insert into branch values(3,'Mumbai','25,XYZ Road');
select * from branch;
delete from branch;
describe branch;
insert into branch values(1,'Chennai','16 ABC Road');
insert into branch values(2,'Coimbatore','20,15th Block');
insert into branch values(3,'Mumbai','25,XYZ Road');
select * from branch;

describe employees;
insert into employees values
(1,'Ram','ADMIN',1000000,2),
(2,'Harini','MANAGER',2500000,2),
(3,'George','SALES',2000000,1),
(4,'Ramya','SALES',1300000,2),
(5,'Meena','HR',2000000,3),
(6,'Ashok','MANAGER',3000000,1),
(7,'Abdul','HR',2000000,1),
(8,'Ramya','ENGINEER',1000000,2),
(9,'Raghu','CEO',8000000,3),
(10,'Arvind','MANAGER',2800000,3);

SELECT * FROM employees;
DELETE FROM EMPLOYEES;
insert into employees values
(1,'Ram','ADMIN',1000000,2),
(2,'Harini','MANAGER',2500000,2),
(3,'George','SALES',2000000,1),
(4,'Ramya','SALES',1300000,2),
(5,'Meena','HR',2000000,3),
(6,'Ashok','MANAGER',3000000,1),
(7,'Abdul','HR',2000000,1),
(8,'Ramya','ENGINEER',1000000,2),
(9,'Raghu','CEO',8000000,3),
(10,'Arvind','MANAGER',2800000,3);

SELECT * from employees;
alter table branch
add manager_id int;
alter table branch
add foreign key(manager_id)references employees(emp_id);

select * from branch;
update branch
set manager_id=6
where branch_id=1;

update branch
set manager_id=2
where branch_id=2;
update branch
set manager_id=10
where branch_id=3;

-- INDEX--
show index from branch;
create index name_index on employees(ename);

show index from employees;
alter table employees
drop index name_index;

alter table employees
add index(ename);
show index from employees;

-- on delete-- and cascade--

-- joins--
-- 1 st Example
select employees.emp_id,employees.ename,employees.job_desc,branch.br_name
from employees
join branch
on employees.branch_id=branch.branch_id;

-- 2) inner join or join--
select employees.emp_id,employees.ename,employees.job_desc,branch.br_name
from employees
inner join branch
on employees.branch_id=branch.branch_id
order by employees.emp_id;

-- 3) left join--

select employees.emp_id,employees.ename,employees.job_desc,branch.br_name
from employees
left join branch
on employees.branch_id=branch.branch_id
order by employees.emp_id;

insert into employees(emp_id,ename,job_desc,salary) values(11,'Vidya','ADMIN',1000000);
insert into employees(emp_id,ename,job_desc,salary) values(12,'Ranjani','ENGINEER', 4000000);

select * from employees;

select employees.emp_id,employees.ename,employees.job_desc,branch.br_name
from employees
left join branch
on employees.branch_id=branch.branch_id
order by employees.emp_id;

insert into branch(branch_id,br_name,addr) values(4,'Hydrabad','32,10th Street');
select * from branch;

-- right join--

select employees.emp_id,employees.ename,employees.job_desc,branch.br_name
from employees
right join branch
on employees.branch_id=branch.branch_id
order by employees.emp_id;

select * from employees;
select * from branch;

-- table names shows in brief using alias--

select e.emp_id,e.ename,e.job_desc,b.br_name
from employees as e
right join branch as b
on e.branch_id=b.branch_id
order by e.emp_id;

-- we can extract datas using where clause instead of using join(inner join) clause--

select e.emp_id,e.ename,e.job_desc,b.br_name
from employees as e,branch as b
where e.branch_id=b.branch_id
order by e.emp_id;

-- cross join--

select e.emp_id,e.ename,e.job_desc,b.br_name
from employees as e
cross join branch as b;

select e.emp_id,e.ename,e.job_desc,b.br_name
from employees as e
cross join branch as b;

-- br_name emp_count-- using join clause and group by statement--

select b.br_name,count(e.emp_id) total_employee
from branch as b
join employees as e
on b.branch_id=e.branch_id
group by e.branch_id;











