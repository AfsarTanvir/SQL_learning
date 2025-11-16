-- LEETCODE Medium, Advanced Select and Joins, QUESTION-07
-- 1907. Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
Create table If Not Exists Accounts (account_id int, income int);


Truncate table Accounts;


-- Insert Data 
insert into Accounts (account_id, income) values ('3', '108939');
insert into Accounts (account_id, income) values ('2', '12747');
insert into Accounts (account_id, income) values ('8', '87709');
insert into Accounts (account_id, income) values ('6', '91796');


-- Test data
SELECT * FROM Accounts;



-- Solution
SELECT 'High Salary' AS category, COUNT(*) accounts_count
FROM Accounts
WHERE income > 50000

UNION ALL

SELECT 'Average Salary' AS category, COUNT(*) accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000

UNION ALL

SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000;




-- Removing Table
DROP TABLE IF EXISTS Accounts;