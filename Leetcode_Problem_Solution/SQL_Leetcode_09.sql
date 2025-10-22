-- LEETCODE QUESTION-09
-- 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Weather' AND xtype = 'U')
BEGIN
    CREATE TABLE Weather (
        id INT UNIQUE,
        recordDate DATE,
        temperature INT,
    );
END
GO


-- Insert data into tables
INSERT INTO Weather (id, recordDate, temperature) VALUES
    (1, '2015-01-01', 10),
    (2, '2015-01-02', 25),
    (3, '2015-01-03', 20),
    (4, '2015-01-04', 30);



-- Test data
SELECT * FROM Weather;

-- Answer
SELECT w1.id
	FROM Weather as w1
	INNER JOIN Weather as w2
	ON DATEDIFF(day, w2.recordDate, w1.recordDate) = 1
    WHERE w1.temperature > w2.temperature;




DROP TABLE IF EXISTS Weather;