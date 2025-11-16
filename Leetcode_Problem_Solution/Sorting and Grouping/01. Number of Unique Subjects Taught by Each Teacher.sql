-- LEETCODE Easy, Sorting and Grouping, QUESTION-01
-- 2356. Number of Unique Subjects Taught by Each Teacher
-- https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Teacher (
    teacher_id INT,
    subject_id INT,
    dept_id INT,
    PRIMARY KEY(subject_id, dept_id)
);


-- Insert Data
INSERT INTO Teacher VALUES
    (1, 2, 3),
    (1, 2, 4),
    (1, 3, 3),
    (2, 1, 1),
    (2, 2, 1),
    (2, 3, 1),
    (2, 4, 1);




-- Test data
SELECT * FROM Teacher;



-- Solution
SELECT 
	t.teacher_id, COUNT(t.dept_cnt) AS cnt
FROM
    (
    SELECT 
        teacher_id, COUNT(dept_id) AS dept_cnt
    FROM
        Teacher
    GROUP BY 
        teacher_id, subject_id) AS t
GROUP BY teacher_id;

-- Another Solution
SELECT teacher_id, COUNT(DISTINCT subject_id) cnt
FROM Teacher
GROUP BY teacher_id;



-- Removing Table
DROP TABLE IF EXISTS Teacher;