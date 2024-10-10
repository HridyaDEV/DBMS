CREATE DATABASE employeemanagement;
USE employeemanagement;


CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department VARCHAR(50) NOT NULL
);
INSERT INTO employees (first_name, last_name, salary, department)
    
    VALUES
    
    ('Hridya','Dev',50000,'IT'),
    
    ('Afnan','Abdulkhader',50000,'IT'),
    
    ('Sadiya','Sidrath',20000,'Sales'),
    
    ('Jishnu','Madhav',65000,'HR'),
    
    ('Adharv','Krishna',30000,'Sales');
    
    
    SELECT * FROM Employees;
ALTER TABLE Employees
ADD COLUMN date_of_joining DATE;



UPDATE Employees
SET salary = 60000
WHERE department = 'IT';


SELECT * FROM Employees
WHERE salary > 60000;


DROP TABLE Employees;
