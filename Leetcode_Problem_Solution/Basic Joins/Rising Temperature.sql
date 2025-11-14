-- LEETCODE Basic Join, QUESTION-04
-- 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Weather (
    id INT UNIQUE,
    recordDate DATE,
    temperature INT
);


-- Insert Data
INSERT INTO Weather (id, recordDate, temperature) VALUES
    (1, '2015-01-01', 10),
    (2, '2015-01-02', 25),
    (3, '2015-01-03', 20),
    (4, '2015-01-04', 30);




-- Test data
SELECT * FROM Weather;


-- Solution
SELECT w1.id as Id
	FROM Weather as w1
	INNER JOIN Weather as w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
    WHERE w1.temperature > w2.temperature;




DROP TABLE IF EXISTS Weather;