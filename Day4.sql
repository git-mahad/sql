CREATE DATABASE db5;

USE db5;

CREATE TABLE Citi (
    cid INT NOT NULL AUTO_INCREMENT,
    cname VARCHAR(30) NOT NULL,
    PRIMARY KEY (cid)
);

CREATE TABLE student (
    id INT AUTO_INCREMENT,
    Namee VARCHAR(20) NOT NULL,
    age INT,
    city INT,
    PRIMARY KEY (id),
    FOREIGN KEY (city) REFERENCES Citi (cid)
    ON update cascade
    On delete cascade
);

INSERT INTO student (Namee, age, city) VALUES 
('Ali', 21, 1),
('Raza', 22, 2),
('Saqlan', 20, 3),
('Mahad', 19, 3),
('Ali Abbas', 23, 3),
('Umar', 19, 2);

DESCRIBE Citi;

select * From Student;

INSERT INTO Citi (cname) VALUES 
('FSD'),
('Mul'),
('LHR'),
('FSD'),
('Mul'),
('Lhr');

