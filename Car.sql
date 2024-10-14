CREATE DATABASE Car;
USE Car;

CREATE TABLE Cars (
    car_id INT PRIMARY KEY,
    car_model VARCHAR(50),
    daily_rental_rate DECIMAL(10, 2)
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    license_number VARCHAR(20) UNIQUE
);
CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    rental_date DATE,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
SELECT Customers.name AS Customer_Name, Cars.car_model AS Car_Model
FROM Rentals
INNER JOIN Customers ON Rentals.customer_id = Customers.customer_id
INNER JOIN Cars ON Rentals.car_id = Cars.car_id;

SELECT Cars.car_model AS Car_Model, Rentals.rental_id AS Rental_ID, 
       Rentals.rental_date AS Rental_Date
FROM Cars
LEFT JOIN Rentals ON Cars.car_id = Rentals.car_id;

SELECT Cars.car_model AS Car_Model, 
       SUM(Cars.daily_rental_rate) AS Total_Revenue
FROM Rentals
JOIN Cars ON Rentals.car_id = Cars.car_id
GROUP BY Cars.car_model;
