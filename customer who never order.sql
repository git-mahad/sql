Create Database if not exists Never_order;

Use Never_order;

Create Table Customers(
	id int,
    name varchar(20),
     primary key (id)
);

Create table Orders(
	id int,
    customerid int not null,
    primary key (id),
    foreign key (customerid) references Customers (id)
);

INSERT INTO Customers (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Hannah'),
(9, 'Ivy'),
(10, 'Jack'),
(11, 'Karen'),
(12, 'Leo'),
(13, 'Mona'),
(14, 'Nina'),
(15, 'Oscar'),
(16, 'Paul'),
(17, 'Quincy'),
(18, 'Rachel'),
(19, 'Steve'),
(20, 'Tom');

INSERT INTO Orders (id, customerid) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 7),
(5, 9),
(6, 11),
(7, 13),
(8, 15),
(9, 17),
(10, 19);

select c.id from Customers as c
inner join Orders as o on 
c.id = o.customerid;

Select * from customers where customers.id not In (select c.id from Customers as c
inner join Orders as o on 
c.id = o.customerid); 