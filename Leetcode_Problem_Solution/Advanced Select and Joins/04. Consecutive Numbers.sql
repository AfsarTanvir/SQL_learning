-- LEETCODE Medium, Advanced Select and Joins, QUESTION-04
-- 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
Create table If Not Exists Logs (id int, num int);


Truncate table Logs;


-- Insert Data 
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');




-- Test data
SELECT * FROM Logs;



-- Solution
WITH New_Table AS (
    SELECT id, num,
        LEAD(num) OVER (ORDER BY id) AS nxt,
        LAG(num) OVER (ORDER BY id) AS prev
    FROM Logs 
)
SELECT DISTINCT(num) AS ConsecutiveNums 
FROM New_Table 
WHERE num = nxt AND num = prev;



-- Removing Table
DROP TABLE IF EXISTS Logs;