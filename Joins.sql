Create database if not exists DB6;

Use DB6;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
    on update cascade
    on delete cascade
);

INSERT INTO student (student_id, name) VALUES (1, 'Student 1');
INSERT INTO student (student_id, name) VALUES (2, 'Student 2');
INSERT INTO student (student_id, name) VALUES (3, 'Student 3');
INSERT INTO student (student_id, name) VALUES (4, 'Student 4');
INSERT INTO student (student_id, name) VALUES (5, 'Student 5');
INSERT INTO student (student_id, name) VALUES (6, 'Student 6');
INSERT INTO student (student_id, name) VALUES (7, 'Student 7');
INSERT INTO student (student_id, name) VALUES (8, 'Student 8');
INSERT INTO student (student_id, name) VALUES (9, 'Student 9');
INSERT INTO student (student_id, name) VALUES (10, 'Student 10');
INSERT INTO student (student_id, name) VALUES (11, 'Student 11');
INSERT INTO student (student_id, name) VALUES (12, 'Student 12');
INSERT INTO student (student_id, name) VALUES (13, 'Student 13');
INSERT INTO student (student_id, name) VALUES (14, 'Student 14');
INSERT INTO student (student_id, name) VALUES (15, 'Student 15');

-- Insert data into course table
INSERT INTO course (course_id, student_id, course_name) VALUES (1, 1, 'Course 1');
INSERT INTO course (course_id, student_id, course_name) VALUES (2, 2, 'Course 2');
INSERT INTO course (course_id, student_id, course_name) VALUES (3, 3, 'Course 3');
INSERT INTO course (course_id, student_id, course_name) VALUES (4, 4, 'Course 4');
INSERT INTO course (course_id, student_id, course_name) VALUES (5, 5, 'Course 5');
INSERT INTO course (course_id, student_id, course_name) VALUES (6, 1, 'Course 6');
INSERT INTO course (course_id, student_id, course_name) VALUES (7, 2, 'Course 7');
INSERT INTO course (course_id, student_id, course_name) VALUES (8, 3, 'Course 8');
INSERT INTO course (course_id, student_id, course_name) VALUES (9, 4, 'Course 9');
INSERT INTO course (course_id, student_id, course_name) VALUES (10, 6, 'Course 10');
INSERT INTO course (course_id, student_id, course_name) VALUES (11, 7, 'Course 11');
INSERT INTO course (course_id, student_id, course_name) VALUES (12, 8, 'Course 12');
INSERT INTO course (course_id, student_id, course_name) VALUES (13, 9, 'Course 13');
INSERT INTO course (course_id, student_id, course_name) VALUES (14, 10, 'Course 14');
INSERT INTO course (course_id, student_id, course_name) VALUES (15, 11, 'Course 15');

Select *from course
inner join student on 
Student.student_id = course.Student_id;

Select *from course as a 
inner join student as b on 
b.student_id = a.Student_id;

select student.student_id, student.name, course.course_name from Student
Inner join course on
student.student_id = course.student_id;

SELECT student.student_id, student.name, course.course_name FROM student
LEFT JOIN course ON 
student.student_id = course.student_id;

SELECT * FROM student
LEFT JOIN course ON 
student.student_id = course.student_id;

