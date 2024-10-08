CREATE DATABASE realestates;
CREATE TABLE Properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL, 
    price DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    agent_id INT NOT NULL,
    client_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    final_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);