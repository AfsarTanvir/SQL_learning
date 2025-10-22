-- LEETCODE QUESTION-10
-- 1661. Average Time of Process per Machine
-- https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Activity' AND xtype = 'U')
BEGIN
    CREATE TABLE Activity (
        machine_id INT,
        process_id INt,
        activity_type CHAR(5) CHECK (activity_type IN ('start', 'end')),
        timestamp FLOAT,
        PRIMARY KEY (machine_id, process_id, activity_type)
    );
END
GO


-- Insert data into tables
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
    (0, 0, 'start', 0.712),
    (0, 0, 'end', 1.520),
    (0, 1, 'start', 3.150),
    (0, 1, 'end', 4.120),
    (1, 0, 'start', 0.550),
    (1, 0, 'end', 1.550),
    (1, 1, 'start', 0.430),
    (1, 1, 'end', 1.420),
    (2, 0, 'start', 4.100),
    (2, 0, 'end', 4.512),
    (2, 1, 'start', 2.500),
    (2, 1, 'end', 5.000);



-- Test data
SELECT * FROM Activity;

-- Answer
SELECT 
    a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity as a1
INNER JOIN Activity as a2
	ON a1.machine_id = a2.machine_id 
    AND a1.process_id = a2.process_id 
    AND a1.activity_type <> a2.activity_type 
    AND a1.activity_type = 'start'
GROUP BY a1.machine_id;




DROP TABLE IF EXISTS Activity;