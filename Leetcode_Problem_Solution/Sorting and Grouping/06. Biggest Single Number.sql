-- LEETCODE Easy, Sorting and Grouping, QUESTION-06
-- 619. Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS MyNumbers (
    num INT
);


-- Insert Data
INSERT INTO MyNumbers VALUES
    (8),
    (8),
    (3),
    (3),
    (1),
    (4),
    (5),
    (6);




-- Test data
SELECT * FROM MyNumbers;



-- Solution
SELECT 
	COALESCE(
		(SELECT num 
        FROM MyNumbers
        GROUP BY num HAVING COUNT(num) = 1
        ORDER BY num DESC
        LIMIT 1), NULL) AS num;


-- Removing Table
DROP TABLE IF EXISTS MyNumbers;