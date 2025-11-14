-- LEETCODE Basic Join, QUESTION-03
-- 1581. Customer Who Visited but Did Not Make Any Transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Visits (
    visit_id INT UNIQUE,
    customer_id INT
);

CREATE TABLE Transactions (
    transaction_id INT UNIQUE,
    visit_id INT,
    amount INT
);


-- Insert Data
INSERT INTO Visits (visit_id, customer_id) VALUES
    (1, 23),
    (2, 9),
    (4, 30),
    (5, 54),
    (6, 96),
    (7, 54),
    (8, 54);


INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES
    (2, 5, 310),
    (3, 5, 300),
    (9, 5, 200),
    (12, 1, 910),
    (13, 2, 970);

-- Test data
SELECT * FROM Visits;
SELECT * FROM Transactions;


-- Solution
SELECT customer_id, COUNT(Visits.customer_id) as count_no_trans 
    FROM Visits 
    LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
    WHERE transaction_id IS NULL
    GROUP BY customer_id
	ORDER BY count_no_trans DESC;




DROP TABLE IF EXISTS Visits;
DROP TABLE IF EXISTS Transactions;