-- LEETCODE Easy, Aggregate Functions, QUESTION-05
-- 1211. Queries Quality and Percentage
-- https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Queries (
    query_name VARCHAR(50),
    result VARCHAR(45),
    position INT,
    rating INT
);





-- Insert Data
INSERT INTO Queries VALUES
    ('Dog', 'Golden Retriever', 1, 5),
    ('Dog', 'German Shepherd', 2, 5),
    ('Dog', 'Mule', 200, 1),
    ('Cat', 'Shirazi', 5, 2),
    ('Cat', 'Siamese', 3, 3),
    ('Cat', 'Sphynx', 7, 4);
    




    




-- Test data
SELECT * FROM Queries;

-- Solution
SELECT 
    query_name, 
    ROUND(AVG(rating/position), 2) quality,
    ROUND(SUM(CASE WHEN rating<3 THEN 1 ELSE 0 END)/COUNT(*) * 100, 2) poor_query_percentage
FROM Queries
GROUP BY query_name;

    




-- Removing Table
DROP TABLE IF EXISTS Queries;