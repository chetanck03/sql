-- Create the customer table to store customer information
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,  -- Unique identifier for each customer
    first_name VARCHAR(50),       -- Customer's first name
    last_name VARCHAR(50),        -- Customer's last name
    age INT,                      -- Customer's age
    country VARCHAR(50)           -- Customer's country
);

-- Create the order_table to store order details
CREATE TABLE order_table (
    order_id INT PRIMARY KEY,      -- Unique identifier for each order
    customer_id INT,               -- Reference to the customer placing the order
    product_id INT,                -- Identifier for the product ordered
    order_date DATE,               -- Date when the order was placed
    amount DECIMAL(10, 2),         -- Amount for the order
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)  -- Foreign key constraint linking to customer table
);

-- Insert sample data into the customer table
INSERT INTO customer (customer_id, first_name, last_name, age, country)
VALUES
(1, 'John', 'Doe', 30, 'USA'),
(2, 'Jane', 'Smith', 25, 'Canada'),
(3, 'Michael', 'Johnson', 40, 'UK'),
(4, 'Emily', 'Davis', 35, 'Australia'),
(5, 'David', 'Wilson', 28, 'India');

-- Insert sample data into the order_table
INSERT INTO order_table (order_id, customer_id, product_id, order_date, amount)
VALUES
(101, 1, 1, '2024-09-15', 150.50),
(102, 2, 2, '2024-09-16', 75.00),
(103, 3, 1, '2024-09-17', 200.00),
(104, 4, 3, '2024-09-18', 120.25),
(105, 5, 2, '2024-09-19', 95.00),
(106, 1, 3, '2024-09-20', 300.75),
(107, 2, 1, '2024-09-21', 180.00);

-- Query to find customers who have placed an order with an amount greater than any order amount above 100
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.amount > ANY (SELECT amount FROM order_table WHERE amount > 100);

-- Query to find customers who have placed an order with an amount greater than all orders on a specific date
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.amount > ALL (SELECT amount FROM order_table WHERE order_date = '2024-09-15');

-- Query to find customers who ordered product 1 or product 2
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.product_id = 1
UNION  -- Combines results from two queries, removing duplicates
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.product_id = 2;

-- Query to find customers who ordered both product 1 and product 2
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.product_id = 1
INTERSECT  -- Gets only the rows that are in both result sets
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.product_id = 2;

-- Query to find customers who ordered product 1, 2, or 3
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
WHERE o.product_id IN (1, 2, 3);

-- Query to find customers who have placed at least one order
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
WHERE EXISTS (SELECT 1 FROM order_table o WHERE o.customer_id = c.customer_id);

-- Query to find customers who have never placed an order
SELECT c.first_name, c.last_name, c.age, c.country
FROM customer c
WHERE NOT EXISTS (SELECT 1 FROM order_table o WHERE o.customer_id = c.customer_id);
