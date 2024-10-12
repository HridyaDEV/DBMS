CREATE DATABASE University;
USE University;

 CREATE TABLE Professors (
     Professor_id INT PRIMARY KEY,
     professor_name VARCHAR(100)
     );
      INSERT INTO Professors (Professor_id, Professor_name)
     VALUES
    (5, 'Nisha'),
     (6, 'Anis'),
     (7, 'Ayisha'),
     (8, 'Jaison'),
     (9, 'Hridya');
     
      CREATE TABLE Courses (
         Course_id INT PRIMARY KEY,
        Course_name VARCHAR(100),
        Professor_id INT,
    FOREIGN KEY (Professor_id) REFERENCES Professors (Professor_id)
     );
     
      INSERT INTO Courses (Course_id,Course_name,Professor_id)
     VALUES
	(221,'EEE',5),
    
    (231,'CSE',6),
    
    (301,'EC',7),
    
    (323,'MECH',8),
    
    (202,'CSE',9);
    
     CREATE TABLE Students (
     Student_id INT PRIMARY KEY,
    
    Student_name VARCHAR(100)
    
    );
     CREATE TABLE Enrollment (
     Enrollment_id INT PRIMARY KEY,
     Student_id INT,
     Course_id INT,
     FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
     FOREIGN KEY (Course_id) REFERENCES Courses(Course_id)
     );
     
      INSERT INTO Students (Student_id,Student_name)
    VALUES
     (31,'Afnan'),
  (45,'Sruthy'),
    (33,'Arwel'),
    (22,'Ashique'),
  
  (56,'Anju');
  
  INSERT INTO Enrollment (Enrollment_id, Student_id, Course_id)
    
    VALUES
    
    (123,31,301),
   
   (432,33,301),
   
   (543,22,323),
    
    (746,56,221),
    
    (412,45,231);
    
    SELECT Students.Student_name, Courses.Course_name
      FROM Students
      INNER JOIN Enrollment ON Students.Student_id = Enrollment.Student_id

     INNER JOIN Courses ON Enrollment.Course_id = Courses.Course_id;
     
     SELECT Courses.Course_name, Students.Student_name
     FROM Courses
     LEFT JOIN Enrollment ON Courses.Course_id = Enrollment.Course_id
   LEFT JOIN Students ON Enrollment.Student_id = Students.Student_id;
   
   
   SELECT Courses.Course_name, COUNT(Enrollment.Student_id) AS Student_Count
FROM Courses
LEFT JOIN Enrollment ON Courses.Course_id = Enrollment.Course_id
GROUP BY Courses.Course_name;