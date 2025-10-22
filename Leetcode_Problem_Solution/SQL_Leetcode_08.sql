-- LEETCODE QUESTION-08
-- 1581. Customer Who Visited but Did Not Make Any Transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Visits' AND xtype = 'U')
BEGIN
    CREATE TABLE Visits (
        visit_id INT UNIQUE,
        customer_id INT,
    );
END
GO

-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Transactions' AND xtype = 'U')
BEGIN
    CREATE TABLE Transactions (
        transaction_id INT UNIQUE,
        visit_id INT,
        amount INT,
    );
END
GO

-- Insert data into tables
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

-- Answer
SELECT *
    FROM Visits 
    LEFT JOIN Transactions
    ON Visits.visit_id = Transactions.visit_id
    WHERE transaction_id IS NULL
    GROUP BY customer_id;




DROP TABLE IF EXISTS Visits;
DROP TABLE IF EXISTS Transactions;