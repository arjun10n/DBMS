-- ==============================
--  ONLINE SHOPPING SYSTEM SQL SCRIPT
-- ==============================

-- 1️⃣ Create Database
CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;

-- 2️⃣ Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(100),
    Location VARCHAR(100),
    ContactNumber VARCHAR(20)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    StoreID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- 3️⃣ Insert Sample Data

-- Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Amit Sharma', 'amit@example.com', '9876543210', 'Delhi'),
('Priya Verma', 'priya@example.com', '9123456789', 'Mumbai'),
('Rahul Mehta', 'rahul@example.com', '9988776655', 'Bangalore'),
('Sneha Kapoor', 'sneha@example.com', '9112233445', 'Pune'),
('Ravi Singh', 'ravi@example.com', '9001234567', 'Hyderabad');

-- Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Wooden Chair', 'Furniture', 2500.00, 20),
('Office Desk', 'Furniture', 7500.00, 10),
('Bluetooth Speaker', 'Electronics', 1500.00, 50),
('Laptop', 'Electronics', 55000.00, 15),
('T-shirt', 'Clothing', 800.00, 100);

-- Stores
INSERT INTO Stores (StoreName, Location, ContactNumber) VALUES
('Urban Store', 'Delhi', '9876001122'),
('City Bazaar', 'Mumbai', '9765432190'),
('Tech Plaza', 'Bangalore', '9898123456'),
('Home Mart', 'Pune', '9800765432'),
('Style Hub', 'Hyderabad', '9776655443');

-- Orders
INSERT INTO Orders (CustomerID, StoreID, OrderDate) VALUES
(1, 1, '2025-11-01'),
(2, 2, '2025-11-02'),
(3, 3, '2025-11-03'),
(4, 4, '2025-11-04'),
(5, 5, '2025-11-05');

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 2, 1),
(4, 5, 3),
(5, 4, 1);

-- Payments
INSERT INTO Payments (OrderID, PaymentMethod, PaymentDate, Amount) VALUES
(1, 'Credit Card', '2025-11-01', 5000.00),
(2, 'UPI', '2025-11-02', 1500.00),
(3, 'Debit Card', '2025-11-03', 7500.00),
(4, 'Cash', '2025-11-04', 2400.00),
(5, 'Credit Card', '2025-11-05', 55000.00);

-- 4️⃣ Update Operations

-- (a) Decrease stock after sale (example: 2 Wooden Chairs sold)
UPDATE Products
SET StockQuantity = StockQuantity - 2
WHERE ProductName = 'Wooden Chair';

-- (b) Increase price of Furniture products by 10%
UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Furniture';

-- 5️⃣ Delete Operation
-- Example: Delete a customer with CustomerID = 5
DELETE FROM Customers
WHERE CustomerID = 5;

-- 6️⃣ Retrieve All Records
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Stores;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Payments;

-- 7️⃣ (Optional) Retrieve Full Order Details with Joins
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    p.ProductName,
    od.Quantity,
    py.Amount,
    py.PaymentMethod,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Payments py ON o.OrderID = py.OrderID;
