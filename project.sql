CREATE DATABASE IF NOT EXISTS scms_db;
USE scms_db;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    expertise VARCHAR(100),
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    instructor_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id) ON DELETE SET NULL
);

--  this is not correct 
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    status ENUM('active', 'completed', 'dropped') DEFAULT 'active',
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);


INSERT INTO students (name, email, phone, date_of_birth)
VALUES 
('Ali Khan', 'ali.khan@example.com', '03001234567', '2000-05-10'),
('Sara Ahmed', 'sara.ahmed@example.com', '03123456789', '1999-09-25');


INSERT INTO instructors (name, email, expertise, phone)
VALUES 
('Prof. Adeel', 'adeel@example.com', 'Database Systems', '03007654321'),
('Dr. Nida', 'nida@example.com', 'Web Development', '03111222333');

INSERT INTO courses (title, description, instructor_id)
VALUES 
('Intro to MySQL', 'Learn the basics of relational databases and SQL.', 1),
('Web Development 101', 'HTML, CSS, JS for beginners.', 2);

-- error 
INSERT INTO enrollments (student_id, course_id, status)
VALUES 
(1, 1, 'active'),
(2, 1, 'completed'),
(2, 2, 'active');


SELECT 
    s.student_id,
    s.name AS student_name,
    c.title AS course_title,
    e.status,
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT 
    c.course_id,
    c.title AS course_title,
    i.name AS instructor_name
FROM courses c
LEFT JOIN instructors i ON c.instructor_id = i.instructor_id;

SELECT 
    s.name AS student_name,
    c.title AS course_title,
    e.status
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id
WHERE e.status = 'active';

SELECT 
    c.title AS course_title,
    COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;


SELECT 
    c.title AS course_title,
    e.status,
    e.enrollment_date
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
WHERE e.student_id = 1;  -- Replace with any student_id

SELECT 
    s.student_id,
    s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

SELECT 
    i.name AS instructor_name,
    COUNT(c.course_id) AS total_courses
FROM instructors i
LEFT JOIN courses c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id;

SELECT 
    s.name AS student_name,
    c.title AS course_title,
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.enrollment_date >= CURDATE() - INTERVAL 7 DAY;

SELECT 
    c.title,
    c.description,
    i.name AS instructor_name
FROM courses c
JOIN instructors i ON c.instructor_id = i.instructor_id
WHERE i.name = 'Prof. Adeel';

CREATE VIEW view_student_enrollments AS
SELECT 
    s.student_id,
    s.name AS student_name,
    c.title AS course_title,
    e.status,
    e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT * FROM view_student_enrollments;

CREATE VIEW view_instructor_courses AS
SELECT 
    i.instructor_id,
    i.name AS instructor_name,
    c.title AS course_title
FROM instructors i
LEFT JOIN courses c ON i.instructor_id = c.instructor_id;

DELIMITER //

CREATE PROCEDURE enroll_student(
    IN p_student_id INT,
    IN p_course_id INT
)
BEGIN
    INSERT INTO enrollments (student_id, course_id, status)
    VALUES (p_student_id, p_course_id, 'active');
END //

DELIMITER ;

CALL enroll_student(1, 2);

DELIMITER //

CREATE PROCEDURE get_student_report(
    IN p_student_id INT
)
BEGIN
    SELECT 
        s.name AS student_name,
        c.title AS course_title,
        e.status,
        e.enrollment_date
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    JOIN courses c ON e.course_id = c.course_id
    WHERE s.student_id = p_student_id;
END //

DELIMITER ;

CALL get_student_report(2);

CREATE TABLE enrollment_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_after_enrollment
AFTER INSERT ON enrollments
FOR EACH ROW
BEGIN
    INSERT INTO enrollment_logs (student_id, course_id, action)
    VALUES (NEW.student_id, NEW.course_id, 'ENROLLMENT CREATED');
END //

DELIMITER ;

mysqldump -u your_user -p scms_db > scms_backup.sql;

mysql -u your_user -p scms_db < scms_backup.sql
