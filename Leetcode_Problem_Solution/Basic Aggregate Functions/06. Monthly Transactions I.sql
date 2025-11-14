-- LEETCODE Medium, Aggregate Functions, QUESTION-06
-- 1193. Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(25),
    state VARCHAR(15) check (state in ('approved', 'declined')),
    amount INT,
    trans_date DATE
);




-- Insert Data
INSERT INTO Transactions VALUES
    (121, 'US', 'approved', 1000, '2018-12-18'),
    (122, 'US', 'declined', 2000, '2018-12-19'),
    (123, 'US', 'approved', 2000, '2019-01-01'),
    (124, 'DE', 'approved', 2000, '2019-01-07');

    


    




-- Test data
SELECT * FROM Transactions;

-- Solution
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') as month,
    country,
    COUNT(id) as trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM 
    Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;

    




-- Removing Table
DROP TABLE IF EXISTS Transactions;