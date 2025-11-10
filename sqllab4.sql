Create database TechSolutions;
use TechSolutions;
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10, 2),
BirthDate DATE,
HireDate DATE
);
INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', '55000.30','1985-06-15','2010-01-20'),
('Jane','Smith', 65000.50,'1990-08-22','2012-07-10'),
('Alice','Johnson', 72000.10,'1982-11-30','2015-05-25'),
('Bob','Brown', 48000.90,'1978-03-12','2018-09-15');
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

SELECT EmployeeID, FirstName, LastName, round(salary,0) AS rounded_salary FROM Employees;
SELECT EmployeeID, FirstName, LastName, abs(salary) AS abs_salary FROM Employees;
SELECT OrderID, CEIL(TotalAmount) AS ceil_amount FROM Orders;

SELECT COUNT(*) AS total_employees FROM Employees;
SELECT SUM(salary) AS total_salary_expense FROM Employees;
SELECT AVG(totalamount) AS avg_order_amount FROM Orders;
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM Employees;

SELECT UPPER(FirstName) AS upper_name, LOWER(LastName) AS lower_name FROM Employees;   
SELECT CAST('2025-09-15' AS DATE) AS converted_date;

SELECT NOW() AS current_datetime;
SELECT OrderID, YEAR(OrderDate) AS order_year FROM orders;
SELECT OrderID, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS new_date FROM Orders;
SELECT OrderID, DATEDIFF(NOW(), OrderDate) AS days_since_order FROM Orders;
