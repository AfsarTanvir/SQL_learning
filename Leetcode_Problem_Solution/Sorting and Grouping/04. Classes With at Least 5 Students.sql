-- LEETCODE Easy, Sorting and Grouping, QUESTION-04
-- 596. Classes With at Least 5 Students
-- https://leetcode.com/problems/classes-with-at-least-5-students/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Courses (
    student VARCHAR(20),
    class VARCHAR(20),
    PRIMARY KEY(student, class)
);


-- Insert Data
INSERT INTO Courses VALUES
    ('A', 'Math'),
    ('B', 'English'),
    ('C', 'Math'),
    ('D', 'Biology'),
    ('E', 'Math'),
    ('F', 'Computer'),
    ('G', 'Math'),
    ('H', 'Math'),
    ('I', 'Math');




-- Test data
SELECT * FROM Courses;



-- Solution
SELECT 
    class
FROM 
    Courses
GROUP BY 
    class HAVING COUNT(student)>=5;


-- Removing Table
DROP TABLE IF EXISTS Courses;