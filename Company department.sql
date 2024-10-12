CREATE DATABASE companydepartment;
 USE companydepartment;
 CREATE TABLE Department (
    Department_id INT PRIMARY KEY AUTO_INCREMENT,
    Department_name VARCHAR(100) NOT NULL
     );
      CREATE TABLE Employees (
         Employee_id INT PRIMARY KEY AUTO_INCREMENT,
         First_name VARCHAR(100) NOT NULL,
        Last_name VARCHAR(100) NOT NULL,
         Department_id INT NOT NULL,
         FOREIGN KEY (Department_id) REFERENCES Department (Department_id)

    );
    INSERT INTO Department (Department_name)
     VALUES ('IT'),('HR'),('Finance');
     
      ALTER TABLE Employees MODIFY Department_id INT NULL;
      
       INSERT INTO Employees (First_name, Last_name, Department_id)
     VALUES
    ('Charlie', 'Grey', 2),
    ('Kate', 'Jhon', 1),
    ('Demon', 'Salvatore', 1),
     ('Stephan', 'Salvatore', 3),
     ('Naveen', 'Andrews', NULL);
     
     SELECT Employees.First_name, Employees.Last_name, Department.Departme
nt_name FROM Employees INNER JOIN Department ON Employees.Department_id = Department.Department_id;


 SELECT Department.Department_name, Employees.First_name, Employees.Last_name
     FROM Department
     LEFT JOIN Employees ON Department.Department_id = Employees.Department_id;
     
     SELECT Employees.First_name, Employees.Last_name, Department.Department_name
     FROM Employees
     RIGHT JOIN Department ON Employees.Department_id = Department.Department_id;