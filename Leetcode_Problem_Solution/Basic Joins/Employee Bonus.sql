-- LEETCODE Basic Join, QUESTION-06
-- 577. Employee Bonus
-- https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Employee (
    empId INT UNIQUE,
    name VARCHAR(50),
    supervisor INT,
    salary INT
);

CREATE TABLE IF NOT EXISTS Bonus (
    empId INT UNIQUE,
    bonus INT
);



-- Insert Data
INSERT INTO Employee (empId, name, supervisor, salary) VALUES
    (3, 'Brad', null, 4000),
    (1, 'John', 3, 1000),
    (2, 'Dan', 3, 2000),
    (4, 'Thomas', 3, 4000);

INSERT INTO Bonus (empId, bonus) VALUES
    (2, 500),
    (4, 2000);



-- Test data
SELECT * FROM Employee;
SELECT * FROM Bonus;


-- Solution
SELECT e.name, b.bonus
    FROM Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId
    WHERE b.bonus < 1000 OR b.bonus IS NULL;





DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Bonus;