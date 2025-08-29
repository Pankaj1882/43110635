# JOINS

use sathyabama;
create database joins;
use joins;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO Students (student_id, student_name, course_id) VALUES
(1, 'Amit', 101),
(2, 'Bharat', 102),
(3, 'Divya', 103),
(4, 'Kiran', NULL);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO Courses (course_id, course_name) VALUES
(101, 'Database Systems'),
(102, 'Computer Networks'),
(104, 'Operating Systems');

# CROSS JOIN
select students.student_id , students.student_name , courses.course_name from Students cross join Courses;

# INNER JOIN
select * from students inner join courses on students.course_id = courses.course_id ;

# LEFT OUTER JOIN
select * from students left outer join courses on students.course_id = courses.course_id;

# RIGHT OUTER JOIN
select * from students right outer join courses on students.course_id = courses.course_id;

