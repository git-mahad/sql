Create database if not exists Report_email;

Use Report_email;

-- Create the Users table
CREATE TABLE Users (
    id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL
);

Alter table users Rename to user;

-- Insert sample data into the Users table
INSERT INTO User (id, email) VALUES
(1, 'alice@example.com'),
(2, 'bob@example.com'),
(3, 'charlie@example.com'),
(4, 'alice@example.com'),
(5, 'eve@example.com'),
(6, 'frank@example.com'),
(7, 'bob@example.com'),
(8, 'hannah@example.com'),
(9, 'ivy@example.com'),
(10, 'jack@example.com');

SELECT email FROM User
GROUP BY email
HAVING COUNT(email) > 1;
