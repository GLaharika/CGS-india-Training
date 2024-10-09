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




-- 1. Calculate Average Salary per Department
SELECT deptno, AVG(salary) AS avg_salary
FROM cgs.employees
GROUP BY deptno
ORDER BY avg_salary DESC;

-- 2. List Employees with Salary Above the Average Salary of Their Department
SELECT name, salary, deptno
FROM cgs.employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM cgs.employees
    WHERE deptno = e.deptno
);

-- 3. Count Employees per Job Title
SELECT job, COUNT(*) AS num_employees
FROM cgs.employees
GROUP BY job;

-- 4. Find the Employee with the Highest Commission in Each Department
SELECT deptno, name, MAX(comm) AS max_comm
FROM cgs.employees
GROUP BY deptno;

-- 5. Calculate Total Salary and Total Commission per Department
SELECT deptno, SUM(salary) AS total_salary, SUM(comm) AS total_commission
FROM cgs.employees
GROUP BY deptno;

-- 6. Find Employees Who Have Been Working for More Than 3 Years
SELECT name, hiredate, 
    YEAR(CURDATE()) - YEAR(hiredate) AS years_of_service
FROM cgs.employees
WHERE YEAR(CURDATE()) - YEAR(hiredate) > 3;

-- 7. List Employees with the Same Job Title but Different Bosses
SELECT e1.name AS employee, e1.job, e1.boss AS boss1, e2.boss AS boss2
FROM cgs.employees e1
JOIN cgs.employees e2
ON e1.job = e2.job AND e1.boss <> e2.boss;

-- 8. Find the Next Tuesday's Date
SELECT DATE_ADD(CURDATE(), INTERVAL (9 - DAYOFWEEK(CURDATE())) % 7 + 2 DAY) AS next_tuesday;

-- 9. Calculate Date After Fifteen Days from Today
SELECT CURDATE() AS today, DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS date_after_fifteen_days;

-- 10. List Distinct Job Titles Available
SELECT DISTINCT job
FROM cgs.employees;


-- 1. Calculate Average Salary per Department
SELECT deptno, AVG(salary) AS avg_salary
FROM cgs.employees
GROUP BY deptno
ORDER BY avg_salary DESC;

-- 2. List Employees with Salary Above the Average Salary of Their Department
SELECT name, salary, deptno
FROM cgs.employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM cgs.employees
    WHERE deptno = e.deptno
);

-- 3. Count Employees per Job Title
SELECT job, COUNT(*) AS num_employees
FROM cgs.employees
GROUP BY job;

-- 4. Find the Employee with the Highest Commission in Each Department
SELECT deptno, name, MAX(comm) AS max_comm
FROM cgs.employees
GROUP BY deptno;

-- 5. Calculate Total Salary and Total Commission per Department
SELECT deptno, SUM(salary) AS total_salary, SUM(comm) AS total_commission
FROM cgs.employees
GROUP BY deptno;

-- 6. Find Employees Who Have Been Working for More Than 3 Years
SELECT name, hiredate, 
    YEAR(CURDATE()) - YEAR(hiredate) AS years_of_service
FROM cgs.employees
WHERE YEAR(CURDATE()) - YEAR(hiredate) > 3;

-- 7. List Employees with the Same Job Title but Different Bosses
SELECT e1.name AS employee, e1.job, e1.boss AS boss1, e2.boss AS boss2
FROM cgs.employees e1
JOIN cgs.employees e2
ON e1.job = e2.job AND e1.boss <> e2.boss;

-- 8. Find the Next Tuesday's Date
SELECT DATE_ADD(CURDATE(), INTERVAL (9 - DAYOFWEEK(CURDATE())) % 7 + 2 DAY) AS next_tuesday;

-- 9. Calculate Date After Fifteen Days from Today
SELECT CURDATE() AS today, DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS date_after_fifteen_days;

-- 10. List Distinct Job Titles Available
SELECT DISTINCT job
FROM cgs.employees;

-- 11. Identify Departments with More Than 3 Employees
SELECT deptno, COUNT(*) AS num_employees
FROM cgs.employees
GROUP BY deptno
HAVING COUNT(*) > 3;

-- 12. Rank Employees by Salary within Their Department (using window function)
SELECT name, deptno, salary,
       RANK() OVER (PARTITION BY deptno ORDER BY salary DESC) AS salary_rank
FROM cgs.employees;

-- 13. Calculate the Average Years of Service per Department
SELECT deptno, AVG(YEAR(CURDATE()) - YEAR(hiredate)) AS avg_years_of_service
FROM cgs.employees
GROUP BY deptno;

-- 14. Identify Employees with the Highest Salary in Each Job Role
SELECT job, name, salary
FROM cgs.employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM cgs.employees
    WHERE job = e.job
);

-- 15. Find Departments with No Managers (Assuming 'Manager' is the job title)
SELECT deptno
FROM cgs.employees
WHERE deptno NOT IN (
    SELECT deptno
    FROM cgs.employees
    WHERE job = 'Manager'
);

-- 16. List Employees Who Joined the Company This Year
SELECT name, hiredate
FROM cgs.employees
WHERE YEAR(hiredate) = YEAR(CURDATE());

-- 17. Show the Department Hierarchy Based on Boss-Employee Relationships
SELECT e1.name AS employee, e1.deptno, e2.name AS boss
FROM cgs.employees e1
LEFT JOIN cgs.employees e2
ON e1.boss = e2.emp_no
ORDER BY e1.deptno, e1.emp_no;

-- 18. Calculate Employee Turnover Rate per Department
SELECT deptno,
    (SELECT COUNT(*)
     FROM cgs.employees
     WHERE YEAR(hiredate) = YEAR(CURDATE())) / COUNT(*) * 100 AS turnover_rate
FROM cgs.employees
GROUP BY deptno;

-- 19. Find the Employee with the Longest Service Time
SELECT name, hiredate,
       DATEDIFF(CURDATE(), hiredate) AS days_of_service
FROM cgs.employees
ORDER BY days_of_service DESC
LIMIT 1;

-- 20. Calculate the Total Number of Employees Who Have Earned a Commission Greater Than Their Base Salary
SELECT COUNT(*) AS employees_with_high_commission
FROM cgs.employees
WHERE comm > salary;

-- 21. Find Employees Who Earn the Same Salary as Their Boss
SELECT e1.name AS employee, e2.name AS boss, e1.salary
FROM cgs.employees e1
JOIN cgs.employees e2
ON e1.boss = e2.emp_no
WHERE e1.salary = e2.salary;

-- 22. Calculate the Average Commission for Each Job Title
SELECT job, AVG(comm) AS avg_commission
FROM cgs.employees
GROUP BY job;

-- 23. Find Employees with the Most Recent Hire Dates in Each Department
SELECT name, hiredate, deptno
FROM cgs.employees e
WHERE hiredate = (
    SELECT MAX(hiredate)
    FROM cgs.employees
    WHERE deptno = e.deptno
);

-- 24. Identify Employees Earning Above the Median Salary for Their Job Title
SELECT name, job, salary
FROM cgs.employees e
WHERE salary > (
    SELECT MEDIAN(salary)
    FROM cgs.employees
    WHERE job = e.job
);

-- 25. Show the Highest, Lowest, and Average Salary in the Company
SELECT 
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    AVG(salary) AS average_salary
FROM cgs.employees;
