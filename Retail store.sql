CREATE DATABASE Retailstore;
USE Retailstore;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL
);


CREATE TABLE SupplyOrders (
    order_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

INSERT INTO Products (product_id, product_name, price) VALUES (1, 'Laptop', 50000.00);
INSERT INTO Products (product_id, product_name, price) VALUES (2, 'Mouse', 500.00);
INSERT INTO Products (product_id, product_name, price) VALUES (3, 'Keyboard', 1500.00);


INSERT INTO Suppliers (supplier_id, supplier_name) VALUES (1, 'Tech Distributors');
INSERT INTO Suppliers (supplier_id, supplier_name) VALUES (2, 'Gadget World');


INSERT INTO SupplyOrders (order_id, product_id, supplier_id, quantity) VALUES (1, 1, 1, 10);
INSERT INTO SupplyOrders (order_id, product_id, supplier_id, quantity) VALUES (2, 2, 2, 50);
INSERT INTO SupplyOrders (order_id, product_id, supplier_id, quantity) VALUES (3, 3, 1, 30);

SELECT Products.product_name, Suppliers.supplier_name
FROM Products
INNER JOIN SupplyOrders ON Products.product_id = SupplyOrders.product_id
INNER JOIN Suppliers ON SupplyOrders.supplier_id = Suppliers.supplier_id;


SELECT Products.product_name, Suppliers.supplier_name
FROM Products
LEFT JOIN SupplyOrders ON Products.product_id = SupplyOrders.product_id
LEFT JOIN Suppliers ON SupplyOrders.supplier_id = Suppliers.supplier_id;

SELECT Suppliers.supplier_name, SUM(SupplyOrders.quantity) AS total_quantity
FROM Suppliers
LEFT JOIN SupplyOrders ON Suppliers.supplier_id = SupplyOrders.supplier_id
GROUP BY Suppliers.supplier_name;

