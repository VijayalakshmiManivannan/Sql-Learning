CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;
CREATE TABLE  Sales(
Purchase_number int not null primary key auto_increment,
Date_of_Purchase date not null,
Customer_Id int,
Item_Code varchar(10) not null 
);
CREATE TABLE Customers(
Customer_Id int not null primary key auto_increment,
First_name varchar(255),
Last_name varchar(255),
Email_address varchar(255),
Number_of_Complaints int
);
describe sales;
select*from sales;
Select * from Customers;
select * from Sales . customers;
select * from Sales;
select * from Sales.Sales;
drop table Sales;
drop table Customers;



