-- LEETCODE QUESTION-04
-- 1148. Article Views I
-- https://leetcode.com/problems/article-views-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'World' AND xtype = 'U')
BEGIN
    CREATE TABLE Views (
	    article_id INT,
		author_id INT,
		viewer_id INT,
		view_date DATE
	);
END
GO


-- Insert sample data
INSERT INTO Views (article_id,	author_id,	viewer_id,	view_date) VALUES
	(1, 3, 5, '2019-08-01'),
	(1, 3, 6, '2019-08-02'),
	(2, 7, 7, '2019-08-01'),
	(2, 7, 6, '2019-08-02'),
	(4, 7, 1, '2019-07-22'),
	(3, 4, 4, '2019-07-21'),
	(3, 4, 4, '2019-07-21');


SELECT * FROM Views;

-- Answer
SELECT DISTINCT author_id as id FROM Views WHERE author_id = viewer_id ORDER BY author_id ASC;


DROP TABLE IF EXISTS Views;