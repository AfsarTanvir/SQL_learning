-- LEETCODE Easy, Aggregate Functions, QUESTION-04
-- 1633. Percentage of Users Attended a Contest
-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Register (
    contest_id INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);




-- Insert Data
INSERT INTO Users VALUES
    (6, 'Alice'),
    (2, 'Bob'),
    (7, 'Alex');
    
    
INSERT INTO Register VALUES
    (215, 6),
    (209, 2),
    (208, 2),
    (210, 6),
    (208, 6),
    (209, 7),
    (209, 6),
    (215, 7),
    (208, 7),
    (210, 2),
    (207, 2),
    (210, 7);
    


    




-- Test data
SELECT * FROM Users;
SELECT * FROM Register;


-- Solution
SELECT 
    r.contest_id,
    ROUND(COUNT(r.user_id) * 100 / t.total, 2) AS percentage
FROM Register r
CROSS JOIN (SELECT COUNT(user_id) AS total FROM Users) t
GROUP BY r.contest_id, t.total
ORDER BY percentage DESC, r.contest_id;

-- Another Solution using CTE
WITH total_users AS (
    SELECT COUNT(user_id) AS total
    FROM Users
)
SELECT 
    r.contest_id,
    ROUND(COUNT(r.user_id) * 100 / t.total, 2) AS percentage
FROM Register r
CROSS JOIN total_users t
GROUP BY r.contest_id, t.total
ORDER BY percentage DESC, r.contest_id;





-- Removing Table
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Register;