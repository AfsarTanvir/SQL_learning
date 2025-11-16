-- LEETCODE Easy, Advanced Select and Joins, QUESTION-01
-- 1731. The Number of Employees Which Report to Each Employee
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT UNIQUE,
    name VARCHAR(30),
    reports_to INT,
    age INT
);


-- Insert Data
INSERT INTO Employees VALUES
    (9, 'Hercy', null, 43),
    (6, 'Alice', 9, 41),
    (4, 'Bob', 9, 36),
    (2, 'Winston', null, 37);




-- Test data
SELECT * FROM Employees;



-- Solution
-- m1 -> Manger with average age
WITH m1 AS (
    SELECT 
        reports_to, COUNT(*) as reports_count, ROUND(AVG(age)) AS average_age 
    FROM Employees
    GROUP BY reports_to
)
SELECT 
    employee_id, name, reports_count, average_age
FROM m1 
JOIN Employees ON m1.reports_to = Employees.employee_id
ORDER BY Employees.employee_id;



-- Removing Table
DROP TABLE IF EXISTS Employees;