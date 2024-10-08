CREATE DATABASE airlinereservation;
 USE airlinereservation;
  CREATE TABLE flights (
     flight_id INT PRIMARY KEY AUTO_INCREMENT,
     flight_number VARCHAR(50) NOT NULL,
     departure VARCHAR(50) NOT NULL,
     arrival VARCHAR(50) NOT NULL,
     departure_time DATETIME NOT NULL
     );
     
      CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(50) NOT NULL,
   passport_number VARCHAR(50) UNIQUE NOT NULL,
     email VARCHAR(100) NOT NULL
     );
     
     
      CREATE TABLE reservations (
     reservation_id INT PRIMARY KEY AUTO_INCREMENT,
     flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
     reservation_date DATE NOT NULL,
     status VARCHAR(100) NOT NULL,
     FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
     FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
    );