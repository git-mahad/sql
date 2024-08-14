Create database if not exists DB4;
USE db4;

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    age INT,
    email VARCHAR(100)
);

-- Insert sample values into the Employees table
INSERT INTO Employees (id, name, salary, age, email) VALUES
(1, 'John Doe', 55000, 30, 'john.doe@example.com'),
(2, 'Jane Smith', 62000, 28, 'jane.smith@example.com'),
(3, 'Emily Johnson', 58000, 35, 'emily.johnson@example.com'),
(4, 'Michael Brown', 70000, 40, 'michael.brown@example.com'),
(5, 'Sarah Davis', 53000, 25, 'sarah.davis@example.com'),
(6, 'William Wilson', 67000, 32, 'william.wilson@example.com'),
(7, 'Linda Martinez', 61000, 29, 'linda.martinez@example.com'),
(8, 'Robert Anderson', 69000, 38, 'robert.anderson@example.com'),
(9, 'Patricia Taylor', 52000, 27, 'patricia.taylor@example.com'),
(10, 'James Thomas', 74000, 45, 'james.thomas@example.com'),
(11, 'Barbara Hernandez', 56000, 31, 'barbara.hernandez@example.com'),
(12, 'Richard Moore', 68000, 34, 'richard.moore@example.com'),
(13, 'Susan Martin', 53000, 26, 'susan.martin@example.com'),
(14, 'Joseph Jackson', 71000, 39, 'joseph.jackson@example.com'),
(15, 'Maria Lee', 59000, 33, 'maria.lee@example.com'),
(16, 'Charles Perez', 63000, 36, 'charles.perez@example.com'),
(17, 'Karen White', 54000, 28, 'karen.white@example.com'),
(18, 'Christopher Harris', 72000, 41, 'christopher.harris@example.com'),
(19, 'Lisa Clark', 55000, 29, 'lisa.clark@example.com'),
(20, 'Daniel Lewis', 65000, 37, 'daniel.lewis@example.com');

Select * from employees order by salary desc limit 1;
Select max(salary) from employees;
Select name, id, email from employees where salary = (Select max(salary) from employees);
Select *from employees;
Select * from Employees order by salary desc limit 2;

 Select max(salary) from employees where salary <  (Select max(salary) from employees);

Select * from employees order by salary  < (Select salary from employees order by salary desc ) limit 1;