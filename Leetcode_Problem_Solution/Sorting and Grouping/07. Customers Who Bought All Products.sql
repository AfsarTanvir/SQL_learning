-- LEETCODE Medium, Sorting and Grouping, QUESTION-07
-- 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Product (
    product_key INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT NOT NULL,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Product(product_key)
);


-- Insert Data
INSERT INTO Product VALUES
    (5),
    (6);

INSERT INTO Customer VALUES
    (1, 5),
    (2, 6),
    (3, 5),
    (3, 6),
    (1, 6);


-- Test data
SELECT * FROM Product;
SELECT * FROM Customer;



-- Solution
SELECT 
    c.customer_id
FROM 
    Customer AS c 
JOIN 
    Product AS p ON p.product_key = c.product_key 
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(product_key) FROM Product);

-- Another Solution
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
  SELECT COUNT(product_key)
  FROM Product
)

-- Removing Table
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;