
-- Step 1: Create Database
DROP DATABASE IF EXISTS Lab05_Joins;
CREATE DATABASE Lab05_Joins;
USE Lab05_Joins;

-- Step 2: Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 3: Insert Sample Data
INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'A', 'Bangalore'),
(2, 'B', 'Delhi'),
(3, 'C', 'Mumbai'),
(4, 'D', 'Chennai');

INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES
(101, 1, 'Laptop', '2023-12-15'),
(102, 2, 'Smartphone', '2024-01-10'),
(103, 1, 'Headphones', '2024-02-20'),
(104, 3, 'Tablet', '2024-03-05');


SELECT 
    Customers.customer_id,
    Customers.customer_name,
    Customers.city,
    Orders.order_id,
    Orders.product_name,
    Orders.order_date
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE Customers.city = 'Bangalore';


SELECT 
    Customers.customer_id,
    Customers.customer_name,
    Customers.city,
    Orders.order_id,
    Orders.product_name,
    Orders.order_date
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- 3. RIGHT OUTER JOIN
-- Purpose: Returns all rows from the right table, even if there are no matches in the left table.
-- Task: Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
SELECT 
    Customers.customer_id,
    Customers.customer_name,
    Customers.city,
    Orders.order_id,
    Orders.product_name,
    Orders.order_date
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;


SELECT 
    Customers.customer_id,
    Customers.customer_name,
    Customers.city,
    Orders.order_id,
    Orders.product_name,
    Orders.order_date
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
UNION
SELECT 
    Customers.customer_id,
    Customers.customer_name,
    Customers.city,
    Orders.order_id,
    Orders.product_name,
    Orders.order_date
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;


SELECT *
FROM Customers
NATURAL JOIN Orders;