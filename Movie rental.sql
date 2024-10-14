CREATE DATABASE Movierental;
USE Movierental;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    membership_type VARCHAR(50)
);

CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY,
    movie_id INT,
    customer_id INT,
    rental_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Movies (movie_id, title, genre) VALUES 
(1, 'Inception', 'Sci-Fi'), 
(2, 'The Godfather', 'Crime'), 
(3, 'Avengers', 'Action');

INSERT INTO Customers (customer_id, name, membership_type) VALUES 
(1, 'Alice', 'Gold'), 
(2, 'Bob', 'Silver'), 
(3, 'Charlie', 'Platinum');

INSERT INTO Rentals (rental_id, movie_id, customer_id, rental_date) VALUES 
(1, 1, 1, '2024-10-01'), 
(2, 2, 2, '2024-10-02'), 
(3, 1, 3, '2024-10-03');

SELECT Customers.name, Movies.title 
FROM Rentals 
INNER JOIN Customers ON Rentals.customer_id = Customers.customer_id 
INNER JOIN Movies ON Rentals.movie_id = Movies.movie_id;

SELECT Movies.title, Customers.name 
FROM Movies 
LEFT JOIN Rentals ON Movies.movie_id = Rentals.movie_id 
LEFT JOIN Customers ON Rentals.customer_id = Customers.customer_id;

SELECT Customers.name, COUNT(Rentals.rental_id) 
FROM Customers 
LEFT JOIN Rentals ON Customers.customer_id = Rentals.customer_id 
GROUP BY Customers.name;
