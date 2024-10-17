USE student;  -- Selects the 'student' database to execute subsequent commands

-- Creates the 'Customers' table to store customer information
CREATE TABLE Customers
(
  Customer_ID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for each customer, automatically incremented
  First_Name VARCHAR(50),                      -- Customer's first name
  Last_Name VARCHAR(50),                       -- Customer's last name
  Country VARCHAR(50),                         -- Country of the customer
  Age INT                                      -- Customer's age
);

-- Alters the 'Customers' table to add two new columns: Item and Amount
ALTER TABLE Customers
ADD Item VARCHAR(100),            -- Column for the name of the item purchased
ADD Amount DECIMAL(10, 2);       -- Column for the amount spent (supports decimal values, e.g., 99999.99)

-- Inserting sample customer data into the Customers table with items and amounts
INSERT INTO Customers (First_Name, Last_Name, Country, Age, Item, Amount) VALUES 
('John', 'Doe', 'USA', 22, 'Laptop', 999.99),              -- Customer 1
('Jane', 'Smith', 'Canada', 32, 'Smartphone', 799.50),    -- Customer 2
('Carlos', 'Garcia', 'Mexico', 25, 'Tablet', 299.99),     -- Customer 3
('Aisha', 'Khan', 'India', 30, 'Headphones', 89.99),      -- Customer 4
('Maria', 'Lopez', 'Spain', 22, 'Smartwatch', 199.99);     -- Customer 5

-- Queries to select data from the Customers table

SELECT * FROM Customers;                          -- Retrieves all records from the Customers table

SELECT * FROM Customers WHERE age=22;             -- Retrieves records of customers whose age is 22
SELECT * FROM Customers WHERE age!=22;            -- Retrieves records of customers whose age is not 22
SELECT * FROM Customers WHERE amount>350;         -- Retrieves records of customers who spent more than 350
SELECT * FROM Customers WHERE amount<400;         -- Retrieves records of customers who spent less than 400
SELECT * FROM Customers WHERE age>=25;            -- Retrieves records of customers whose age is 25 or older
SELECT * FROM Customers WHERE age<=25;            -- Retrieves records of customers whose age is 25 or younger
