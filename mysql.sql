-- 1. Create the 'cgs' database
CREATE DATABASE cgs;

-- 2. Show all databases
SHOW DATABASES;

-- 3. Use the 'cgs' database
USE cgs;

-- 4. Create the 'products' table
CREATE TABLE cgs.products (
    id INT, 
    name VARCHAR(100), 
    price FLOAT
);

-- 5. Show tables to confirm creation
SHOW TABLES;

-- 6. Insert data into the 'products' table
INSERT INTO cgs.products (id, name, price) 
VALUES
(1, 'manohar', 90.5),
(2, 'amar', 85.0),
(3, 'satya', 95.5),
(4, 'pavan', 78.0),
(5, 'harin', 82.5),
(6, 'swathi', 88.0),
(7, 'raji', 91.0);

-- 7. Select data from 'products' table
SELECT * FROM cgs.products;

-- 8. Create the 'orders' table
CREATE TABLE cgs.orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    cust_id INT,
    product_id INT,
    order_value FLOAT
);

-- 9. Show tables to confirm creation of 'orders' table
SHOW TABLES;

-- 10. Insert data into the 'orders' table
INSERT INTO cgs.orders (order_date, cust_id, product_id, order_value)
VALUES
('2024-09-01', 101, 1, 500.75),
('2024-09-02', 102, 2, 250.00),
('2024-09-03', 103, 3, 340.25),
('2024-09-04', 104, 4, 150.50),
('2024-09-05', 105, 5, 890.00),
('2024-09-06', 106, 6, 120.99),
('2024-09-07', 107, 7, 780.65);

-- 11. Select data from the 'orders' table
SELECT * FROM cgs.orders;

-- 12. Create the 'customer' table
CREATE TABLE cgs.customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    location VARCHAR(100)
);

-- 13. Show tables to confirm creation of 'customer' table
SHOW TABLES;

-- 14. Insert data into the 'customer' table
INSERT INTO cgs.customer (customer_name, location)
VALUES
('John Doe', 'New York'),
('Jane Smith', 'Los Angeles'),
('Michael Johnson', 'Chicago'),
('Emily Davis', 'Houston'),
('David Wilson', 'Miami');

SELECT * FROM cgs.customer;
--------------------------------------------------------
CREATE TABLE cgs.employees (
    emp_no INT PRIMARY KEY,
    name VARCHAR(100),
    job VARCHAR(50),
    boss INT,
    hiredate DATE,
    salary DECIMAL(10,2),  
    comm DECIMAL(10,2), 
    deptno INT
);

INSERT INTO cgs.employees (emp_no, name, job, boss, hiredate, salary, comm, deptno)
VALUES
(1001, 'John Doe', 'Manager', 1001, '2020-01-15', 70000, 5000, 10),
(1002, 'Jane Smith', 'Developer', 1001, '2021-03-22', 60000, 3000, 20),
(1003, 'Michael Johnson', 'Developer', 1001, '2021-07-18', 62000, 2500, 20),
(1004, 'Emily Davis', 'HR', 1001, '2019-11-05', 50000, 2500, 30),
(1005, 'David Wilson', 'Sales', 1002, '2020-06-23', 55000, 2000, 40),
(1006, 'Rachel Adams', 'Sales', 1002, '2021-09-30', 58000, 2500, 40),
(1007, 'James White', 'Clerk', 1003, '2022-02-01', 30000, 2000, 30),
(1008, 'Laura Brown', 'Clerk', 1004, '2022-04-10', 32000, 3000, 30),
(1009, 'Robert Black', 'Developer', 1001, '2020-10-11', 61000, 2800, 20),
(1010, 'Sarah Green', 'HR', 1004, '2019-12-20', 50500, 1000, 30),
(1011, 'Alice Walker', 'Manager', 2000, '2018-05-17', 90000, 7000, 10),
(1012, 'Thomas King', 'Developer', 1011, '2020-09-09', 64000, 3500, 20),
(1013, 'Patricia Miller', 'HR', 1011, '2019-07-22', 51000, 1500, 30),
(1014, 'Mark Lewis', 'Sales', 1012, '2020-11-25', 57000, 2200, 40),
(1015, 'Samantha Scott', 'Clerk', 1007, '2021-01-15', 31000, 2000, 30);

SELECT * FROM cgs.employees;

SELECT *
FROM cgs.employees
ORDER BY deptno ASC, salary DESC;

SELECT *
FROM cgs.employees
WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';

SELECT 
    name, 
    hiredate, 
    YEAR(CURDATE()) - YEAR(hiredate) AS years_of_service
FROM 
    cgs.employees;

SELECT *
FROM cgs.employees
WHERE salary < (
    SELECT salary
    FROM cgs.employees
    WHERE name = 'Ford'
);

SELECT DATE_ADD(CURDATE(), 
INTERVAL (9 - DAYOFWEEK(CURDATE())) % 7 + 2 DAY) AS next_tuesday;

SELECT 
    CURDATE() AS today,
    DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS date_after_fifteen_days;
    
SELECT DISTINCT job
FROM cgs.employees;
