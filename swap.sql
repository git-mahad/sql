CREATE DATABASE IF NOT EXISTS EmployeeDB;

-- Use the created database
USE EmployeeDB;

-- Create the Salary table
CREATE TABLE if not exists Salary (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    sex CHAR(1),
    salary DECIMAL(10, 2)
);

-- Insert data into the Salary table
INSERT INTO Salary (id, name, sex, salary) VALUES
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 500);

Set Sql_safe_updates = 0;

Update Salary 
Set Sex = case
	when sex = 'f' then 'm'
    when sex = 'm' then 'f'
end;

Select * from Salary;