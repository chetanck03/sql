CREATE TABLE customerss (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(100) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customerss(customer_id)
);

INSERT INTO customerss (customer_id, customer_name, customer_email)
VALUES 
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Mike Johnson', 'mikejohnson@example.com');

INSERT INTO orders (order_id, item, amount, customer_id, order_date)
VALUES 
(1, 'Laptop', 1000, 1, '2024-10-20');

select * from orders;


INSERT INTO orders (order_id, item, amount, customer_id, order_date)
VALUES 
(2, 'Mouse', 1200, 3, '2024-10-20');

drop table orders;