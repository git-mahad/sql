Create database if not exists DB7;

Use DB7;

Create Table if not exists Child(
	child_id int primary key,
    city varchar(20)
);

Create Table if not exists Parent(
	id int not null,
	name varchar(20),
    age int,
    Department int not null,
    primary key (id),
    foreign key (department) References child (child_id)
);

INSERT INTO Child VALUES 
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'Phoenix'),
(6, 'Philadelphia'),
(7, 'San Antonio'),
(8, 'San Diego'),
(9, 'Dallas'),
(10, 'San Jose');


INSERT INTO Parent (id, name, age, department) VALUES 
(1, 'John Doe', 45, 1),
(2, 'Jane Smith', 38, 2),
(3, 'Jim Brown', 50, 2),
(4, 'Jake White', 29, 5),
(5, 'Jill Green', 34, 5),
(6, 'Jerry Black', 42, 6),
(7, 'Janet Blue', 31, 6),
(8, 'Joe Gray', 36, 8),
(9, 'Jenny Pink', 28, 9),
(10, 'Jack Yellow', 55, 10);

Select * From parent as p
inner join child as c on
p.department = c.child_id;

Select * From child as c
inner join  parent as p  on
p.department = c.child_id;

describe parent; 

Select p.id, p.name, p.age, c.city from parent as p
inner join child as c on
p.department = c.child_id;

SELECT p.id, p.name, p.age, p.department, c.city 
FROM Parent AS p
INNER JOIN Child AS c ON p.department = c.child_id
LIMIT 0, 5;

Select p.id, p.name, p.age, c.city from parent as p
left join child as C On
p.department = c.child_id
limit 5,9;

select P.id, p.name, p.age, c.city from parent as p
left join child as c on
p.department = c.child_id
Union
select P.id, p.name, p.age, c.city from parent as p
right join child as c on
p.department = c.child_id;
