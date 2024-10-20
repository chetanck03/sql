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
ADD Amount DECIMAL(10, 2);        -- Column for the amount spent (supports decimal values, e.g., 99999.99)

-- Inserting sample customer data into the Customers table with items and amounts
INSERT INTO Customers (First_Name, Last_Name, Country, Age, Item, Amount) VALUES 
('John', 'Doe', 'USA', 22, 'Laptop', 9990.99),               -- Customer 1: Purchased a Laptop, amount spent is 9990.99
('Jane', 'Smith', 'Canada', 32, 'Smartphone', 7990.50),      -- Customer 2: Purchased a Smartphone, amount spent is 7990.50
('Carlos', 'Garcia', 'Mexico', 25, 'Tablet', 2990.99),       -- Customer 3: Purchased a Tablet, amount spent is 2990.99
('Aisha', 'Khan', 'India', 30, 'Headphones', 890.99),        -- Customer 4: Purchased Headphones, amount spent is 890.99
('Maria', 'Lopez', 'Spain', 22, 'Smartwatch', 1990.99);      -- Customer 5: Purchased a Smartwatch, amount spent is 1990.99

-- Creates the 'Shippings' table to store shipping information
CREATE TABLE Shippings
(
  Shipping_ID INT PRIMARY KEY AUTO_INCREMENT,   -- Unique ID for each shipping record, automatically incremented
  Customer_ID INT,                              -- Foreign key referencing Customer_ID in Customers table
  Shipping_Address VARCHAR(255),                -- Address where the item will be shipped
  Shipping_Date DATE,                           -- Date when the item is shipped
  Status VARCHAR(50),                           -- Status of the shipping (e.g., Pending, Delivered, etc.)
  Amount DECIMAL(10, 2),                        -- Shipping cost
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID) -- Establishes relationship with Customers table
);

-- Inserting sample shipping data into the Shippings table
INSERT INTO Shippings (Customer_ID, Shipping_Address, Shipping_Date, Status, Amount) VALUES 
(1, '123 Elm St, Springfield, USA', '2024-10-01', 'Delivered', 15.00),   -- Shipping details for Customer 1
(2, '456 Maple Ave, Toronto, Canada', '2024-10-02', 'Pending', 10.00),   -- Shipping details for Customer 2
(3, '789 Oak Dr, Mexico City, Mexico', '2024-10-03', 'Shipped', 12.50),  -- Shipping details for Customer 3
(4, '101 Pine Rd, New Delhi, India', '2024-10-04', 'Delivered', 20.00),  -- Shipping details for Customer 4
(5, '202 Birch St, Madrid, Spain', '2024-10-05', NULL, 18.00);           -- Shipping details for Customer 5 (Status is NULL)

-- Queries to select data from the Customers table
SELECT * FROM Customers;  -- Retrieves all records from the Customers table

-- Removes all records from the Customers table
TRUNCATE TABLE Student.Customers;

-- Queries to manipulate and retrieve specific data from Customers table

-- Returns the uppercase version of all customer first names
SELECT upper(First_Name) AS upper_first_name FROM Student.Customers;

-- Returns the lowercase version of customer country names
SELECT lower(country) AS lower_country_name FROM Student.Customers;

-- Returns a substring of the first three characters of customer first names
SELECT substr(First_Name, 1, 3) AS short_first_name FROM Student.Customers;

-- Concatenates first name and last name to create full names
SELECT concat(First_Name, ' ', Last_Name) AS full_name FROM Student.Customers;

-- Retrieves the absolute value of the 'Amount' column
SELECT ABS(amount) AS absolute_amount FROM Student.Customers;

-- Retrieves the ceiling and floor values of the 'Amount' column
SELECT ceil(amount) AS ceiling_value, Floor(amount) AS floor_value FROM Student.Customers;

-- Rounds the 'Amount' column to the nearest whole number
SELECT Round(amount, 0) AS round_amount FROM Student.Customers;

-- Counts the number of shipping orders per customer
SELECT customer_id, count(shipping_id) AS order_count FROM Student.Shippings GROUP BY customer_id;

-- Retrieves the average shipping amount per customer
SELECT customer_id, avg(amount) AS avg_amount FROM Student.Shippings GROUP BY customer_id;

-- Retrieves the minimum and maximum shipping amount per customer
SELECT customer_id, min(amount) AS min_amount, max(amount) AS max_amount FROM Student.Shippings GROUP BY customer_id;
