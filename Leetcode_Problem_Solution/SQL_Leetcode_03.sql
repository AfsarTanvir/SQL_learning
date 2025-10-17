-- LEETCODE QUESTION-03
-- 595. Big Countries
-- https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'basic01')
BEGIN
    CREATE DATABASE basic01;
END
GO

USE basic01;
GO


-- Create World table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'World' AND xtype = 'U')
BEGIN
    CREATE TABLE World (
        name VARCHAR(50) PRIMARY KEY,
        continent VARCHAR(50),
        area INT,
        population INT,
        gdp BIGINT,
    );
END
GO


-- Insert Data 
INSERT INTO World (name, continent, area, population, gdp) VALUES
	('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
    ('Albania', 'Europe', 28748, 2831741, 12960000000),
    ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
    ('Andorra', 'Europe', 468, 78115, 3712000000),
    ('Angola', 'Africa', 1246700, 20609294, 100990000000),
    ('Argentina', 'South America', 2780400, 44494502, 518475000000),
    ('Armenia', 'Asia', 29743, 2968000, 11530000000),
    ('Australia', 'Oceania', 7692024, 21515754, 1392687000000),
    ('Austria', 'Europe', 83879, 8205000, 416900000000),
    ('Azerbaijan', 'Asia', 86600, 9730500, 77350000000);

SELECT * FROM World;


-- ANSWER
SELECT name, population, area FROM World WHERE area>=3000000 OR population>=25000000;



DROP TABLE IF EXISTS World;