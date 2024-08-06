Create Database if not exists Company;
 
 Use company;
 
 create table Employees(
	EmployeeID int Auto_increment primary key ,
    FirstName varchar(20) Not Null,
    LastName varchar(20) not Null,
    BirthDate Date not Null,
    Salary float not null
 );
 
 insert into Employees (firstName, LastName, BirthDate, Salary) values
 ('john','Doe' , '1980-05-05', 60000),
 ('Ali','Raza' , '1990-06-07', 70000),
 ('Saqlain','Waleed' , '1982-07-05', 67000),
 ('Mahad','Ali' , '1984-05-07', 91000),
 ('Noor','Gul' , '1980-03-05', 80000),
 ('Tasawar','Khan' , '1984-04-05', 50000);
 
 Select *from employees;
 
 select firstname, lastname, salary from Employees where salary > 70000;
 
 Select firstname, lastname from employees where salary between 6000 AND 75000 AND employeeID in (1,2,3,4) ; 
 
 Select distinct birthdate from employees;
 
 Select salary from Employees order by salary  ASC limit 3;
 
 -- select * From Employees  where  salary >= (Select salary from Employees order by salary ASC limit 1);
 Select *from Employees order by Salary desc limit 2;
 
 alter table employees
 ADD column Department varchar(20);
 
 Set SQL_Safe_Updates = 1;
 
 Select EmployeeID from employees where FirstName = 'John';
 Select EmployeeID from employees where FirstName = 'NOOR';
 Select EmployeeID from employees where FirstName = 'Mahad';
 update Employees
 Set Department = Case
 when EmployeeID  = 1 then 'HR'
 when EmployeeID  = 5 then 'finance'
 when EmployeeID  = 4 then 'it'
 else NULL
 END
 where employeeID in (1,4,5);
 
 select *from Employees;
 
 select FirstName, LastName, BirthDate, Salary, Department from employees
 order by FirstName Desc;
 
 Select count(EmployeeID) from Employees;
 
 Select avg(salary) from employees;
 
 Select Salary from Employees order by Salary DESC limit 1;
 
 Select * from Employees order by Salary < (Select Salary from Employees order by Salary DESC limit 1) limit 3;
 
 