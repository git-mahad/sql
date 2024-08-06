Create Database if not exists DB3;

USE DB3;

CREATE TABLE customer_details (
    customer_id INT PRIMARY KEY auto_increment,
    customer_name VARCHAR(100),
    modee VARCHAR(50),
    city VARCHAR(100)
);

INSERT INTO customer_details (Customer_id, Customer_Name, modee, city) VALUES
(1, 'John Doe', 'Online', 'New York'),
(2, 'Jane Smith', 'In-store', 'Los Angeles'),
(3, 'Michael Johnson', 'Online', 'Chicago'),
(4, 'Emily Davis', 'Online', 'Houston'),
(5, 'Christopher Wilson', 'In-store', 'Phoenix'),
(6, 'Amanda Martinez', 'Online', 'Philadelphia'),
(7, 'David Anderson', 'In-store', 'San Antonio'),
(8, 'Sarah Taylor', 'Online', 'San Diego'),
(9, 'James Brown', 'In-store', 'Dallas'),
(10, 'Jennifer Thomas', 'Online', 'San Jose'),
(11, 'Matthew White', 'In-store', 'Austin'),
(12, 'Jessica Lee', 'Online', 'Jacksonville'),
(13, 'Daniel Harris', 'Online', 'San Francisco'),
(14, 'Ashley Martin', 'In-store', 'Indianapolis'),
(15, 'Joshua Thompson', 'Online', 'Columbus');

Select *from customer_Details;

select modee, count(customer_name) from customer_details
group by modee;
