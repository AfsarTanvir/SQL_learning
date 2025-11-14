-- LEETCODE Medium, Aggregate Functions, QUESTION-08
-- 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY(player_id, event_date)
);


-- Insert Data
INSERT INTO Activity VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);




-- Test data
SELECT * FROM Activity;



-- Solution
SELECT 
	ROUND(COUNT(DISTINCT a1.player_id)/ (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    Activity AS a1
JOIN
	(
        SELECT player_id, MIN(event_date) AS first_play_date FROM Activity GROUP BY player_id
    ) AS a2 ON a1.player_id = a2.player_id
WHERE DATEDIFF(a1.event_date, a2.first_play_date) = 1;



-- Removing Table
DROP TABLE IF EXISTS Activity;