CREATE DATABASE if not exists studentdb;

USE studentdb;

CREATE TABLE if not exists students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    rollno VARCHAR(20),
    age INT,
    city VARCHAR(100),
    department VARCHAR(100),
    year INT
);

INSERT INTO students (name, rollno, age, city, department, year) VALUES
('Alice Smith', 'S12345', 20, 'New York', 'Computer Science', 2),
('Bob Johnson', 'S12346', 22, 'Los Angeles', 'Mechanical Engineering', 3),
('Charlie Brown', 'S12347', 19, 'Chicago', 'Electrical Engineering', 1),
('David Williams', 'S12348', 21, 'Houston', 'Civil Engineering', 3),
('Eva Green', 'S12349', 20, 'Phoenix', 'Computer Science', 2),
('Frank Thomas', 'S12350', 22, 'Philadelphia', 'Mechanical Engineering', 4),
('Grace Lee', 'S12351', 23, 'San Antonio', 'Electrical Engineering', 4),
('Henry Walker', 'S12352', 18, 'San Diego', 'Civil Engineering', 1),
('Ivy Harris', 'S12353', 21, 'Dallas', 'Computer Science', 3),
('Jack Lewis', 'S12354', 22, 'San Jose', 'Mechanical Engineering', 4);

select age as AGE,
	dense_rank() over ( order by age)
    as ranka from students;
    
select Rollno, row_number() over (order by age) 
as ans from students;

select Rollno, rank() over (order by age) 
as ans from students;

Select *, lag(age) over (order by rollno) as ANS
from Students;