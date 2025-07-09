create database if not exists testing;
USE testing;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, ManagerID, Salary, HireDate) VALUES
(101, 'Alice', 'Smith', 10, NULL, 120000.00, '2018-01-15'),
(102, 'Bob', 'Johnson', 10, 101, 95000.00, '2019-03-01'), 
(103, 'Charlie', 'Brown', 10, 102, 70000.00, '2020-07-20'),
(104, 'Diana', 'Prince', 20, 101, 110000.00, '2017-06-10'),
(105, 'Eve', 'Adams', 20, 104, 80000.00, '2019-11-05'),
(106, 'Frank', 'White', 20, 104, 75000.00, '2021-02-28'),
(107, 'Grace', 'Lee', 30, 101, 100000.00, '2018-09-01'),
(108, 'Henry', 'Wilson', 30, 107, 65000.00, '2020-04-12'),
(109, 'Ivy', 'Davis', 30, 107, 68000.00, '2021-01-01'),
(110, 'Jack', 'Taylor', 10, 102, 60000.00, '2022-05-10');

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(10, 'Executive', 'Headquarters'),
(20, 'Sales', 'North Office'),
(30, 'Marketing', 'South Office'),
(40, 'HR', 'Headquarters');

CREATE TABLE StudentMarks (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Marks DECIMAL(5, 2),
    Gender CHAR(1)
);

INSERT INTO StudentMarks (StudentID, FirstName, LastName, Email, Marks, Gender) VALUES
(101, 'Ahmed', 'Ali', 'ahmed.ali@example.com', 85.50, 'M'),
(102, 'Sana', 'Khan', 'sana.khan@example.com', 92.00, 'F'),
(103, 'Omar', 'Farooq', 'omar.farooq@example.com', 78.25, 'M'),
(104, 'Noor', 'Fatima', 'noor.fatima@example.com', 95.75, 'F'),
(105, 'Imran', 'Hussain', 'imran.hussain@example.com', 60.00, 'M'),
(106, 'Zahra', 'Batool', 'zahra.batool@example.com', 89.90, 'F'),
(107, 'Usman', 'Akram', 'usman.akram@example.com', 72.10, 'M'),
(108, 'Aisha', 'Zafar', 'aisha.zafar@example.com', 91.50, 'F'),
(109, 'Bilal', 'Javed', 'bilal.javed@example.com', 68.00, 'M'),
(110, 'Hira', 'Nadeem', 'hira.nadeem@example.com', 80.00, 'F');

INSERT INTO StudentMarks (StudentID, FirstName, LastName, Email, Marks, Gender) VALUES
(111, 'nor', 'Javed', 'nor.javed@example.com', 68.00, 'M'),
(112, 'amna', 'Nadeem', 'amna.nadeem@example.com', 80.00, 'F');

select 
	studentId, concat(firstName, LastName) as FullName,
    row_number() over(order by marks desc) as number,
    Rank() over(order by marks desc) as rnk,
    Dense_Rank() over(order by marks desc) as des_rank
    from StudentMarks
    order by Marks desc;

Select *,
	lag(marks, 1, null)
    over(order by marks desc)As previous_marks 
    from StudentMarks;
    

-- Create the sales table
CREATE TABLE SALES_TABLE (
    sale_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO SALES_TABLE (sale_id, product_id, sale_date, amount) VALUES
(1, 101, '2023-01-05', 150),
(2, 101, '2023-01-12', 200),
(3, 102, '2023-01-08', 300),
(4, 101, '2023-01-20', 180),
(5, 102, '2023-01-15', 250),
(6, 103, '2023-01-10', 400);    

Select *,
	lag(amount, 1, 0)
		over(order by sale_id )
		as previous_sale_amount
        from Sales_table;
	
select *, 
  lead(amount, 1, 0)
  over(order by sale_id) as NextAmount,
   amount - lead(amount, 1, 0)
  over(order by sale_id) as CWNext
  from Sales_Table;
  
  SELECT 
    sale_id,
    product_id,
    amount,
    LAG(amount) OVER (ORDER BY sale_date) AS prev_amount_all_products,
    LEAD(amount) OVER (ORDER BY sale_date) AS next_amount_all_products
FROM SALES_TABLE;

SELECT 
    sale_id, product_id, amount,
    LAG(amount) OVER (PARTITION BY product_id ORDER BY sale_date) AS prev_amount_same_product,
    LEAD(amount) OVER (PARTITION BY product_id ORDER BY sale_date) AS next_amount_same_product
FROM SALES_TABLE;