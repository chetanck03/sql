-- Creating chetan1 table
CREATE TABLE chetan1 (
    id INT PRIMARY KEY,  -- Primary key for unique identification
    name VARCHAR(50)     -- Name column with variable character length
);

-- Inserting data into chetan1
INSERT INTO chetan1 (id, name) VALUES
(1, 'Alice'),  -- Insert Alice into chetan1
(2, 'Bob'),    -- Insert Bob into chetan1
(3, 'Charlie'),-- Insert Charlie into chetan1
(4, 'David');  -- Insert David into chetan1

-- Creating chetan2 table
CREATE TABLE chetan2 (
    id INT PRIMARY KEY,  -- Primary key for unique identification
    name VARCHAR(50)     -- Name column with variable character length
);

-- Inserting data into chetan2
INSERT INTO chetan2 (id, name) VALUES
(3, 'Charlie'), -- Insert Charlie into chetan2
(4, 'David'),   -- Insert David into chetan2
(5, 'Eve'),     -- Insert Eve into chetan2
(6, 'Frank');   -- Insert Frank into chetan2

-- Selecting all data from chetan1
SELECT * FROM chetan1;

-- Selecting all data from chetan2
SELECT * FROM chetan2;

-- UNION: Combine rows from chetan1 and chetan2, removing duplicates
SELECT * FROM chetan1
UNION
SELECT * FROM chetan2;

-- UNION ALL: Combine rows from chetan1 and chetan2, keeping duplicates
SELECT * FROM chetan1
UNION ALL
SELECT * FROM chetan2;

-- INTERSECT: Return rows that are common in both chetan1 and chetan2
SELECT * FROM chetan1
INTERSECT
SELECT * FROM chetan2;

-- MINUS (EXCEPT in some databases): Return rows from chetan1 that are not in chetan2
SELECT * FROM chetan1
MINUS
SELECT * FROM chetan2;
