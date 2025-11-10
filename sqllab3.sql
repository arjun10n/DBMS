create database techsolutions;
use techsolutions;
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10 , 2 ),
BirthDate DATE,
HireDate DATE);
INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');
CREATE TABLE Orders (
OrderID INT PRIMARY KEY AUTO_INCREMENT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
EmployeeID INT,
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
select EmployeeID, FirstName, LastName, round(salary,0) as Rounded_Salary from
Employees;
select EmployeeID, FirstName, LastName, abs(salary) as Absolute_Salary from Employees;
select OrderID, ceil(TotalAmount) as ceilling_values from Orders;
select count(*) as totalemployees from Employees;
select sum(salary) as totalsalary from Employees;
select avg(totalamount) as average_amount from Orders;
select max(salary) as max_salary, min(salary) as min_salary from Employees;
select upper(FirstName) as first_capital_name, lower(LastName) as last_capital_name from
Employees;
select concat(FirstName,' ',LastName) as full_names from Employees;
select EmployeeID, FirstName, substring(FirstName, 1, 3) as first3chars from Employees;