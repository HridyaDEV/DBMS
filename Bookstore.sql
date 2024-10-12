 CREATE DATABASE Bookstore;
  USE Bookstore;
  
   CREATE TABLE Books (
    Book_id INT PRIMARY KEY,
     Title VARCHAR(100),
   
   Author VARCHAR(100)
   
   );
    
  CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
  Name VARCHAR(100),
    Email VARCHAR(100)
     );
     CREATE TABLE Sales (
     Sale_id INT PRIMARY KEY,
     Customer_id INT,
     Book_id INT,
     FOREIGN KEY (Book_id) REFERENCES Books(Book_id),
     FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
   );
   
    ALTER TABLE Sales ADD COLUMN Date DATE;
    
    INSERT INTO Books (Book_id, Title, Author) 
VALUES 
(1, 'The Alchemist', 'Paulo Coelho'),
(2, 'To Kill a Mockingbird', 'Harper Lee'),
(3, '1984', 'George Orwell'),
(4, 'Pride and Prejudice', 'Jane Austen');



INSERT INTO Customers (Customer_id, Name, Email) 
VALUES 
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(4, 'Diana Prince', 'diana@example.com');


 INSERT INTO Sales (Sale_id, Book_id, Customer_id, Date)
     VALUES
     (1, 1, 1, '2024-10-01'),
     (2, 2, 2, '2024-10-02'),
    (3, 3, 3, '2024-10-03'),
     (4, 1, 4, '2024-10-04'),
      (5, 4, 2, '2024-10-05');
      
      SELECT 
    Books.Title AS Book_Title, 
    Customers.Name AS Customer_Name
FROM 
    Books
LEFT JOIN 
    Sales ON Books.Book_id = Sales.Book_id
LEFT JOIN 
    Customers ON Sales.Customer_id = Customers.Customer_id;


SELECT Customers.Name, Books.Title
FROM Sales
INNER JOIN Customers ON Sales.Customer_id = Customers.Customer_id
INNER JOIN Books ON Sales.Book_id = Books.Book_id;


SELECT Customers.Name, Books.Title 
FROM Books
RIGHT JOIN Sales ON Books.Book_id = Sales.Book_id
RIGHT JOIN Customers ON Sales.Customer_id = Customers.Customer_id;
