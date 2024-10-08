CREATE DATABASE movieticketbooking;
CREATE TABLE movies (
     movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
     release_year INT NOT NULL,
   duration INT NOT NULL
     );
     
      CREATE TABLE theaters (
     theater_id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100) NOT NULL,
   location VARCHAR(100) NOT NULL
     );
     
     CREATE TABLE Showtimes (
    showtime_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    theater_id INT NOT NULL,
    showtime DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    showtime_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    seats INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (showtime_id) REFERENCES Showtimes(showtime_id)
);




CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    showtime_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    seats INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (showtime_id) REFERENCES Showtimes(showtime_id)
);
