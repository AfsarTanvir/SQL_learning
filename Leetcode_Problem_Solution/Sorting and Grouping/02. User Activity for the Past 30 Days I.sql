-- LEETCODE Easy, Sorting and Grouping, QUESTION-02
-- 1141. User Activity for the Past 30 Days I
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Activity (
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type VARCHAR(20) CHECK (activity_type IN ('open_session', 'end_session', 'scroll_down', 'send_message'))
);


-- Insert Data
INSERT INTO Activity VALUES
    (1, 1, '2019-07-20', 'open_session'),
    (1, 1, '2019-07-20', 'scroll_down'),
    (1, 1, '2019-07-20', 'end_session'),
    (2, 4, '2019-07-20', 'open_session'),
    (2, 4, '2019-07-21', 'send_message'),
    (2, 4, '2019-07-21', 'end_session'),
    (3, 2, '2019-07-21', 'open_session'),
    (3, 2, '2019-07-21', 'send_message'),
    (3, 2, '2019-07-21', 'end_session'),
    (4, 3, '2019-06-25 ', 'open_session'),
    (4, 3, '2019-06-25 ', 'end_session');




-- Test data
SELECT * FROM Activity;



-- Solution
SELECT 
	activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;


-- Another Solution
SELECT activity_date as day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date


-- Removing Table
DROP TABLE IF EXISTS Activity;