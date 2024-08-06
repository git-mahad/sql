Create Database if not exists DB0;
Use DB0;
Create table table2(
	id int primary key auto_increment,
    nam varchar(15),
    age int not null,
    salary float Not Null,
    city varchar(10)
);

Select * from table2;

insert into table2 (nam,age,salary,city) values
('Abu baker', 14, 00.0000,'fsd');

Insert into table2 (nam,age,salary,city) values
('Mahad', 19, 00, 'MUL'),
('Ali', 20, 4533.300, 'LHR'),
('Usman', 19, 568.00, 'MUL'),
('Imtiaz', 19, 456.00, 'FSD'),
('Raza',18, 9875.00, 'DGK'),
('Imtinan',21, 5678.00, 'ISL'),
('Hasnain', 21, 987.00, 'LHR'),
('Zaeem',21, 12350.0, 'KCR');

select * from table2 where city = 'MUL';
select * from table2 where salary = 0;
select nam,age from table2 where Salary > 324;
select distinct *from table2;

select * from table2 where city IN ('FSD', 'MUL');
select * from table2 where salary between 300 AND 1000;

Select *from table2 limit 3;

alter table table2
Add column company_name varchar(30) Not NULL;

Set SQL_Safe_Updates = 0;
update table2
set company_name = case
when id = 1 then 'ABC'
when id = 2 then 'BCD'
when id = 3 then 'CDE'
when id = 4 then 'DEF'
when id = 5 then 'EFG'
when id = 6 then 'FGH'
when id = 7 then 'GHI'
when id = 8 then 'HIJ'
when id = 9 then 'IJK'
End;

Set SQL_Safe_Updates = 1;

update table2
set company_name = case
when id = 1 then 'ABC'
when id = 2 then 'BCD'
when id = 3 then 'CDE'
when id = 4 then 'DEF'
when id = 5 then 'EFG'
when id = 6 then 'FGH'
when id = 7 then 'GHI'
when id = 8 then 'HIJ'
when id = 9 then 'IJK'
else 'XYZ'
End
where id In (1,2,3,4,5,6,7,8);

Select *from table2;

Select *from table2 order by salary ASC;

Select count(id) from table2;
select sum(salary) from table2;
-- similarly for min, max,avg
select max(salary) from table2 where id in (1,4,5,6,7);

select city,nam, count(id) from table2
Group by city,nam;