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
(1, 'John', 'Doe', 30, 'USA'),          -- Customer 1: John Doe, age 30, from USA
(2, 'Jane', 'Smith', 25, 'Canada'),     -- Customer 2: Jane Smith, age 25, from Canada
(3, 'Michael', 'Johnson', 40, 'UK'),    -- Customer 3: Michael Johnson, age 40, from UK
(4, 'Emily', 'Davis', 35, 'Australia'),  -- Customer 4: Emily Davis, age 35, from Australia
(5, 'David', 'Wilson', 28, 'India');     -- Customer 5: David Wilson, age 28, from India

-- Insert sample data into the order_table
INSERT INTO order_table (order_id, customer_id, product_id, order_date, amount)
VALUES
(101, 1, 1, '2024-09-15', 150.50),  -- Order 101: John Doe ordered product 1 for $150.50 on 2024-09-15
(102, 2, 2, '2024-09-16', 75.00),   -- Order 102: Jane Smith ordered product 2 for $75.00 on 2024-09-16
(103, 3, 1, '2024-09-17', 200.00),  -- Order 103: Michael Johnson ordered product 1 for $200.00 on 2024-09-17
(104, 4, 3, '2024-09-18', 120.25),  -- Order 104: Emily Davis ordered product 3 for $120.25 on 2024-09-18
(105, 5, 2, '2024-09-19', 95.00),   -- Order 105: David Wilson ordered product 2 for $95.00 on 2024-09-19
(106, 1, 3, '2024-09-20', 300.75),  -- Order 106: John Doe ordered product 3 for $300.75 on 2024-09-20
(107, 2, 1, '2024-09-21', 180.00);  -- Order 107: Jane Smith ordered product 1 for $180.00 on 2024-09-21

-- Query to calculate total amount spent by each customer
SELECT 
    c.first_name,                   -- Selecting customer's first name
    c.last_name,                    -- Selecting customer's last name
    c.country,                      -- Selecting customer's country
    SUM(o.amount) AS total_amount_spent  -- Calculating total amount spent by each customer
FROM 
    customer c
JOIN 
    order_table o ON c.customer_id = o.customer_id  -- Joining customer and order_table on customer_id
GROUP BY 
    c.customer_id;                  -- Grouping results by customer_id

-- Query to calculate average order amount for each customer
SELECT 
    c.first_name,                   -- Selecting customer's first name
    c.last_name,                    -- Selecting customer's last name
    c.country,                      -- Selecting customer's country
    AVG(o.amount) AS average_order_amount  -- Calculating average order amount for each customer
FROM 
    customer c
JOIN 
    order_table o ON c.customer_id = o.customer_id  -- Joining customer and order_table on customer_id
GROUP BY 
    c.customer_id;                  -- Grouping results by customer_id

-- Query to find the maximum order amount for each customer
SELECT 
    c.first_name,                   -- Selecting customer's first name
    c.last_name,                    -- Selecting customer's last name
    c.country,                      -- Selecting customer's country
    MAX(o.amount) AS max_order_amount  -- Finding maximum order amount for each customer
FROM 
    customer c
JOIN 
    order_table o ON c.customer_id = o.customer_id  -- Joining customer and order_table on customer_id
GROUP BY 
    c.customer_id;                  -- Grouping results by customer_id

-- Query to find the number of orders placed by each customer
SELECT 
    c.first_name,                   -- Selecting customer's first name
    c.last_name,                    -- Selecting customer's last name
    c.country,                      -- Selecting customer's country
    COUNT(o.order_id) AS num_orders  -- Counting the number of orders placed by each customer
FROM 
    customer c
LEFT JOIN 
    order_table o ON c.customer_id = o.customer_id  -- Left joining customer and order_table on customer_id
GROUP BY 
    c.customer_id;                  -- Grouping results by customer_id

-- Query to calculate total spending for each customer with their details
SELECT 
    c.first_name,                   -- Selecting customer's first name
    c.last_name,                    -- Selecting customer's last name
    c.country,                      -- Selecting customer's country
    SUM(o.amount) AS total_spending  -- Calculating total spending for each customer
FROM 
    customer c
LEFT JOIN 
    order_table o ON c.customer_id = o.customer_id  -- Left joining customer and order_table on customer_id
GROUP BY 
    c.customer_id;                  -- Grouping results by customer_id

-- Query to count the number of customers grouped by country
SELECT 
    country,                        -- Selecting country
    COUNT(customer_id) AS num_customers  -- Counting the number of customers in each country
FROM 
    customer
GROUP BY 
    country;                        -- Grouping results by country
