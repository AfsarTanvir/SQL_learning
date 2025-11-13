-- LEETCODE SELECT, QUESTION-02
-- 584. Find Customer Referee
-- https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Customer (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    referee_id INT
);

-- Insert Data
INSERT INTO Customer (id, name, referee_id) VALUES
	(1, 'Will', NULL),
	(2, 'Jane', null),
	(3, 'Alex', 2),
	(4, 'Bill', null),
	(5, 'Zack', 1),
	(6, 'Mark', 2);
    
SELECT * FROM Customer;

-- Solution
SELECT name FROM Customer WHERE referee_id != 2 OR referee_id is NULL;



DROP TABLE IF EXISTS Customer;