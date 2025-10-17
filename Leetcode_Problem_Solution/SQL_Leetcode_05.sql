-- LEETCODE QUESTION-05
-- 1683. Invalid Tweets
-- https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Tweets' AND xtype = 'U')
BEGIN
    CREATE TABLE Tweets (
	    tweet_id INT PRIMARY KEY,
	    content VARCHAR(250),
    );
END
GO


-- Insert sample data
INSERT INTO Tweets (tweet_id, content) VALUES
	(1, 'Let us Code'),
	(2, 'More than fifteen chars are here!');


SELECT * FROM Tweets;

-- Answer
SELECT tweet_id FROM Tweets WHERE LEN(content) > 15;
-- SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15; -- For MySQL

DROP TABLE IF EXISTS Tweets;