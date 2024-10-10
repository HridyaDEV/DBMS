CREATE DATABASE customerorders;
USE customerorders;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Orders (
        order_id INT PRIMARY KEY AUTO_INCREMENT,
      order_date DATE NOT NULL,
        amount DECIMAL(10, 2) NOT NULL,
        customer_id INT,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
     );
     
     INSERT INTO Customers (Name, Email, Phone)
     VALUES
     ('Alice', 'alice123@gmail.com', '9876565439'),
    ('Kate', 'Katherine31@gmail.com', '8654231342'),
    ('Jack', 'jack@gmail.com', '9678754663');
    
     INSERT INTO Orders (order_date, amount, customer_id)
     Values
     ('2024-10-01',120.00,1),
     ('2024-10-02',135.00,2),
     ('2024-10-05',170.00,1),
    
    ('2024-10-07',199.00,3),
    
    ('2024-10-07',210.00,2);
    
    SELECT Customers.name, Orders.amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id;

UPDATE Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
SET Orders.amount = Orders.amount * 1.10
WHERE Customers.name = 'Alice';

    
    
    
 UPDATE Orders
     JOIN Customers ON Orders.customer_id = Customers.customer_id
     SET Orders.amount = Orders.amount * 1.10
    WHERE Customers.name = 'Alice';
    