
CREATE DATABASE Airlines;
USE Airlines;

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10),
    destination VARCHAR(50)
);
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    reservation_date DATE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

INSERT INTO Flights (flight_id, flight_number, destination) VALUES
(1, 'FL101', 'New York'),
(2, 'FL102', 'Los Angeles'),
(3, 'FL103', 'Chicago');

INSERT INTO Passengers (passenger_id, name, email) VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Davis', 'charlie@example.com');

INSERT INTO Reservations (reservation_id, flight_id, passenger_id, reservation_date) VALUES
(1, 1, 1, '2024-10-12'),
(2, 1, 2, '2024-10-12'),
(3, 2, 3, '2024-10-13');

SELECT Passengers.name, Flights.flight_number, Flights.destination
FROM Reservations
INNER JOIN Passengers ON Reservations.passenger_id = Passengers.passenger_id
INNER JOIN Flights ON Reservations.flight_id = Flights.flight_id;

SELECT Flights.flight_number, Flights.destination, Passengers.name
FROM Flights
LEFT JOIN Reservations ON Flights.flight_id = Reservations.flight_id
LEFT JOIN Passengers ON Reservations.passenger_id = Passengers.passenger_id;


SELECT Passengers.name, Flights.flight_number, Reservations.reservation_date
FROM Reservations
INNER JOIN Flights ON Reservations.flight_id = Flights.flight_id
INNER JOIN Passengers ON Reservations.passenger_id = Passengers.passenger_id
WHERE Flights.destination = 'New York';
