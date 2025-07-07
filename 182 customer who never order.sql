select name as Customers from customers as c 
where c.id 
not in (Select customerId from orders)

SELECT c.name as Customers 
FROM customers as c
WHERE NOT EXISTS (
    SELECT 1 
    FROM orders AS o 
    WHERE c.id = o.customerid
);