-- Question 1 Achieving 1NF (First Normal Form) 🛠️
SELECT OrderID, CustomerName, Product
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ', ') AS Product;


-- Question 2 Achieving 2NF (Second Normal Form) 🧩
-- Create Customers table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into Customers table
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Create OrderDetails table
CREATE TABLE NewOrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Insert data into NewOrderDetails table
INSERT INTO NewOrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
