-- LEETCODE Basic Join, QUESTION-02
-- 1068. Product Sales Analysis I
-- https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(25)
);


-- Insert Data
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
	(1, 100, 2008, 10, 5000),
    (2, 100, 2009, 12, 5000),
    (7, 200, 2011, 15, 9000);

INSERT INTO Product (product_id, product_name) VALUES
	(100, 'Nokia'),
    (200, 'Apple'),
    (300, 'Samsung');


SELECT * FROM Sales;
SELECT * FROM Product;


-- Solution
SELECT product_name, year, price 
FROM Sales 
INNER JOIN Product ON Sales.product_id = Product.product_id;




DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Product;