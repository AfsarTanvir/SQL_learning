-- LEETCODE QUESTION-02
-- 584. Find Customer Referee
-- https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create Customer table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Customer' AND xtype = 'U')
BEGIN
    CREATE TABLE Customer (
        id INT PRIMARY KEY,
        name VARCHAR(500),
        referee_id INT,
    );
END
GO


-- Insert Data 
INSERT INTO Customer (id, name, referee_id) VALUES
	(1, 'Will', NULL),
	(2, 'Jane', null),
	(3, 'Alex', 2),
	(4, 'Bill', null),
	(5, 'Zack', 1),
	(6, 'Mark', 2);

SELECT * FROM Customer;


-- ANSWER
SELECT name FROM Customer WHERE referee_id != 2 OR referee_id is NULL;



DROP TABLE IF EXISTS Customer;