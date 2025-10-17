-- LEETCODE QUESTION-01
-- 1757. Recyclable and Low Fat Products
-- https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create Products table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Products' AND xtype = 'U')
BEGIN
    CREATE TABLE Products (
        product_id INT PRIMARY KEY,
        low_fats CHAR(1) CHECK (low_fats IN ('Y', 'N')),
        recyclable CHAR(1) CHECK (recyclable IN ('Y', 'N'))
    );
END
GO


-- Insert Data 
INSERT INTO Products (product_id, low_fats, recyclable) VALUES
	(0, 'Y', 'N'),
	(1, 'Y', 'Y'),
	(2, 'N', 'Y'),
	(3, 'Y', 'Y'),
	(4, 'N', 'N');

SELECT * FROM Products;


-- ANSWER
SELECT product_id FROM Products WHERE low_fats = 'Y' AND recyclable = 'Y';



DROP TABLE IF EXISTS Products;