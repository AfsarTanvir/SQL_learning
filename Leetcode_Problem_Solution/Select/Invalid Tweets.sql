-- LEETCODE SELECT, QUESTION-05
-- 1683. Invalid Tweets
-- https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Tweets (
    tweet_id INT PRIMARY KEY,
    content VARCHAR(250)
);

-- Insert Data
INSERT INTO Tweets (tweet_id, content) VALUES
	(1, 'Let us Code'),
	(2, 'More than fifteen chars are here!');

SELECT * FROM Tweets;

-- Solution
-- SELECT tweet_id FROM Tweets WHERE LEN(content) > 15; -- FOR MSSQL
SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15; -- For MySQL



DROP TABLE IF EXISTS Tweets;