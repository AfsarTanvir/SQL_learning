-- LEETCODE Medium, Sorting and Grouping, QUESTION-03
-- 1070. Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50

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
    PRIMARY KEY(sale_id, year)
);


-- Insert Data
INSERT INTO Sales VALUES
    (3, 100, 2008, 12, 6000),
    (4, 100, 2009, 12, 6000),
    (6, 200, 2011, 15, 6000),
    (8, 200, 2011, 12, 6000),
    (5, 200, 2011, 15, 12000);



-- Test data
SELECT * FROM Sales;



-- Solution
SELECT 
    s.product_id, 
    s.`year` AS first_year, 
    s.quantity, 
    s.price
FROM Sales AS s
JOIN 
    (
        SELECT product_id, MIN(`year`) AS year 
        FROM Sales 
        GROUP BY product_id
    ) AS p
ON s.product_id = p.product_id
AND s.`year` = p.year;


-- Another Solution
SELECT 
	t.product_id, 
    t.first_year, 
    t.quantity,
    t.price
FROM 
    (
        SELECT 
            product_id, 
            `year` as first_year, 
            quantity, 
            price,
            RANK() OVER (PARTITION BY product_id ORDER BY `year`) AS rnk
        FROM Sales
    ) AS t
WHERE rnk = 1;


-- Removing Table
DROP TABLE IF EXISTS Sales;