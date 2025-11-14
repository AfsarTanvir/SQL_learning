-- LEETCODE Basic Join, QUESTION-09
-- 1934. Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Signups (
    user_id INT UNIQUE,
    time_stamp DATETIME
);

CREATE TABLE IF NOT EXISTS Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action VARCHAR(15) CHECK(action IN ('confirmed', 'timeout'))
);



-- Insert Data
INSERT INTO Signups (user_id, time_stamp) VALUES
    (3, '2020-03-21 10:16:13'),
    (7, '2020-01-04 13:57:59'),
    (2, '2020-07-29 23:09:44'),
    (6, '2020-12-09 10:39:37');

INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
    (3, '2021-01-06 03:30:46', 'timeout'),
    (3, '2021-07-14 14:00:00', 'timeout'),
    (7, '2021-06-12 11:57:29', 'confirmed'),
    (7, '2021-06-13 12:58:28', 'confirmed'),
    (7, '2021-06-14 13:59:27', 'confirmed'),
    (2, '2021-01-22 00:00:00', 'confirmed'),
    (2, '2021-02-28 23:59:59', 'timeout');





-- Test data
SELECT * FROM Signups;
SELECT * FROM Confirmations;


-- Solution
SELECT c3.user_id, IFNULL(ROUND(c2.con/c1.sum, 2), 0.00) as confirmation_rate
    FROM (SELECT user_id, COUNT(*) as sum
        FROM Confirmations GROUP BY user_id) AS c1
    JOIN (SELECT user_id, COUNT(*) as con
        FROM Confirmations WHERE action = 'confirmed' GROUP BY user_id, action) AS c2
	ON c1.user_id = c2.user_id
    RIGHT JOIN Signups as c3 ON c3.user_id = c1.user_id;





DROP TABLE IF EXISTS Signups;
DROP TABLE IF EXISTS Confirmations;