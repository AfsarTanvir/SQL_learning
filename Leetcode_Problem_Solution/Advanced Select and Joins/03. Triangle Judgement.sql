-- LEETCODE Easy, Advanced Select and Joins, QUESTION-03
-- 610. Triangle Judgement
-- https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
Create table If Not Exists Triangle (
    x int, 
    y int, 
    z int
);


Truncate table Triangle;


-- Insert Data
insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');




-- Test data
SELECT * FROM Triangle;



-- Solution
SELECT x, y, z, 
    CASE
        WHEN x+y>z AND x+z>y AND y+z>x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM 
    Triangle;


-- Removing Table
DROP TABLE IF EXISTS Triangle;