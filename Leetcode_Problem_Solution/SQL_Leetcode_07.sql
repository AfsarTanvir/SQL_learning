-- LEETCODE QUESTION-07
-- 1068. Product Sales Analysis I
-- https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Sales' AND xtype = 'U')
BEGIN
    CREATE TABLE Sales (
        sale_id INT,
        product_id INT,
        year INT,
        quantity INT,
        price INT,
        PRIMARY KEY (sale_id, year)
    );
END
GO

-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Product' AND xtype = 'U')
BEGIN
    CREATE TABLE Product (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(25)
    );
END
GO

-- Insert data into tables
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
	(1, 100, 2008, 10, 5000),
    (2, 100, 2009, 12, 5000),
    (7, 200, 2011, 15, 9000);

INSERT INTO Product (product_id, product_name) VALUES
	(100, 'Nokia'),
    (200, 'Apple'),
    (300, 'Samsung');

-- Test data
SELECT * FROM Sales;
SELECT * FROM Product;

-- Answer
SELECT product_name, year, price 
    FROM Sales INNER JOIN Product
    ON Sales.product_id = Product.product_id;




DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Product;