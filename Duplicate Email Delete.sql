CREATE DATABASE IF NOT EXISTS people_db;

USE people_db;

CREATE TABLE IF NOT EXISTS people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    phoneNo VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

Describe people;

alter table people Rename to people_table;

INSERT INTO people_Table (name, age, phoneNo, city, email) VALUES
('John Doe', 30, '555-1234', 'New York', 'johndoe@example.com'),
('Jane Smith', 25, '555-5678', 'Los Angeles', 'janesmith@example.com'),
('Alice Johnson', 28, '555-8765', 'Chicago', 'alicej@example.com'),
('Bob Brown', 35, '555-4321', 'Houston', 'bobbrown@example.com'),
('Carol White', 22, '555-8765', 'Phoenix', 'carolw@example.com'),
('David Wilson', 32, '555-2468', 'Dallas', 'johndoe@example.com'),
('Emma Davis', 27, '555-1357', 'San Diego', 'emmad@example.com'),
('Frank Miller', 40, '555-9753', 'Seattle', 'bobbrown@example.com'),
('Grace Lee', 29, '555-8642', 'Denver', 'gracelee@example.com'),
('Henry Clark', 33, '555-3579', 'Miami', 'janesmith@example.com');

Select distinct email, count(email) From people_table group by email;

select distinct email from people_table order by email asc;

SET sql_safe_updates = 0;

Delete p1
from people_table as p1  
join people_table as p2 on
p1.email = p2.email
where p1.id > p2.id;

select * from people_table;