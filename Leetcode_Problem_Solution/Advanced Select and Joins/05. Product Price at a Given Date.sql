-- LEETCODE Medium, Advanced Select and Joins, QUESTION-05
-- 1164. Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
Create table If Not Exists Products (product_id int, new_price int, change_date date);


Truncate table Products;


-- Insert Data 
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15');
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16');
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17');
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18');




-- Test data
SELECT * FROM Products;



-- Solution
SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN
(   
	SELECT product_id, MAX(change_date) AS change_date
	FROM Products
	WHERE change_date <= '2019-08-16'
	GROUP BY product_id
)
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT  IN
(
	SELECT product_id
	FROM Products
	WHERE change_date <= '2019-08-16'
);


-- Another Solution
WITH ranked AS (
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER (
            PARTITION BY product_id 
            ORDER BY change_date DESC
        ) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT 
    p.product_id,
    COALESCE(r.new_price, 10) AS price
FROM 
    (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN ranked r 
    ON p.product_id = r.product_id AND r.rn = 1
ORDER BY p.product_id;



-- Removing Table
DROP TABLE IF EXISTS Products;