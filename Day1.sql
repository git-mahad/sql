create database mahad;
create database ali;
create database college;

-- following command will create db if already college db is not coreated if it already exist then
-- it will warn us

create database if not exists college;

drop database mahad;

-- same as above seen

drop database if exists mahad;
drop database ali ;

USE college;

-- create command is use to define the schema of db

Create table Teacher(
id INT primary key,
Name varchar(20), -- char store fixed length but varchar use requird length
age int not null
);
-- to add one data 
insert into Teacher values (1,'Ali',18);
-- to add multiple data
insert into Teacher values 
(2,'Raza',22),
(3,'Saqlain',21),
(4,'Tasawar',20),
(5,'Hasnain',19);
-- select DQL command
select *from teacher;

show databases;
-- following query will just give the tables of college db as we have used use college db query
show tables;



create database if not exists db1;
USE db1;
create table table1(
	id int auto_increment primary key,
    age int default 18,
    nam varchar(15)
);

insert into table1 (nam) values
('Murtaza'),
('imtinan'),
('Hasnain Javed');

insert into table1 values 
(5,19,'Mahad');

insert into table1 (age,nam) value
(17,'Mahad');

update table1 
set nam = 'abdul rehman'
where nam = 'Mahad' and id = 6;

select * from table1;

alter table table1 
add column salary int check (salary >= 10000 and salary <= 25000);
-- now new column has come now i have to give new values to the existing column
SET SQL_SAFE_UPDATES = 0;

update table1 
set salary = CASE
when id = 1 THEN 12000
when id = 2 THEN 13000
when id = 3 THEN 14000
when id = 5 THEN 15000
when id = 6 THEN 16000
else 00000
END;
-- Safe update mode in MySQL is designed to prevent accidental updates or deletions of data
SET SQL_SAFE_UPDATES = 1;

UPDATE table1
SET salary = CASE
    WHEN id = 1 THEN 12000
    WHEN id = 2 THEN 13000
    WHEN id = 3 THEN 14000
    WHEN id = 5 THEN 15000
    WHEN id = 6 THEN 16000
    ELSE 00000
END
WHERE id IN (1, 2, 3, 5, 6);

select *from table1;