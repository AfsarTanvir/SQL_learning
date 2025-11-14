-- LEETCODE Basic Join, QUESTION-08
-- 570. Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(20),
    managerId INT
);



-- Insert Data
INSERT INTO Employee (id, name, department, managerId) VALUES
    (101, 'John', 'A', null),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101);





-- Test data
SELECT * FROM Employee;


-- Solution
SELECT e.name
    FROM Employee e
    JOIN (SELECT COUNT(*), managerId 
        FROM Employee 
        GROUP BY managerId HAVING COUNT(*) >= 5) as t 
    ON t.managerId = e.id;





DROP TABLE IF EXISTS Employee;