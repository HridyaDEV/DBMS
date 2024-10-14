CREATE DATABASE School;
USE School;

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100),
    subject VARCHAR(50)
);

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

INSERT INTO Teachers (teacher_id, teacher_name, subject) VALUES
(1, 'Mr. Sharma', 'Mathematics'),
(2, 'Ms. Kapoor', 'Science'),
(3, 'Mr. Verma', 'English');

INSERT INTO Classes (class_id, class_name, teacher_id) VALUES
(1, 'Class 1A', 1),  -- Taught by Mr. Sharma (Mathematics)
(2, 'Class 2B', 2),  -- Taught by Ms. Kapoor (Science)
(3, 'Class 3C', 1),  -- Taught by Mr. Sharma (Mathematics)
(4, 'Class 4D', 3);  -- Taught by Mr. Verma (English)

INSERT INTO Students (student_id, student_name, class_id) VALUES
(1, 'Rohan', 1),
(2, 'Priya', 1),
(3, 'Aman', 2),
(4, 'Simran', 3),
(5, 'Raj', 3);

SELECT 
    Students.student_name, 
    Teachers.teacher_name 
FROM 
    Students
JOIN 
    Classes ON Students.class_id = Classes.class_id
JOIN 
    Teachers ON Classes.teacher_id = Teachers.teacher_id;

SELECT 
    Classes.class_name, 
    Students.student_name 
FROM 
    Classes
LEFT JOIN 
    Students ON Classes.class_id = Students.class_id;

SELECT 
    Students.student_name, 
    Classes.class_name 
FROM 
    Students
JOIN 
    Classes ON Students.class_id = Classes.class_id
JOIN 
    Teachers ON Classes.teacher_id = Teachers.teacher_id
WHERE 
    Teachers.subject = 'Mathematics';
