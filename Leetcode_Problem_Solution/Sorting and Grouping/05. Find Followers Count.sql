-- LEETCODE Easy, Sorting and Grouping, QUESTION-05
-- 1729. Find Followers Count
-- https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Followers (
    user_id INT,
    follower_id INT,
    PRIMARY KEY(user_id, follower_id)
);


-- Insert Data
INSERT INTO Followers VALUES
    (0, 1),
    (1, 0),
    (2, 0),
    (2, 1);




-- Test data
SELECT * FROM Followers;



-- Solution
SELECT 
    user_id, COUNT(follower_id) AS followers_count
FROM 
    Followers
GROUP BY 
    user_id
ORDER BY user_id;


-- Removing Table
DROP TABLE IF EXISTS Followers;