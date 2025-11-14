-- LEETCODE Easy, Aggregate Functions, QUESTION-01
-- 620. Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(20),
    description VARCHAR(20),
    rating FLOAT
);




-- Insert Data
INSERT INTO Cinema (id, movie, description, rating) VALUES
    (1, 'War', 'great 3D', 8.9),
    (2, 'Science', 'fiction', 8.5),
    (3, 'irish', 'boring', 6.2),
    (4, 'Ice song', 'Fantacy', 8.6),
    (5, 'House card', 'Interesting', 9.1);








-- Test data
SELECT * FROM Cinema;


-- Solution
SELECT id, movie, description, rating
    FROM Cinema
    WHERE id%2 = 1 AND description <> 'boring'
    ORDER BY 4 DESC;



-- Removing Table
DROP TABLE IF EXISTS Cinema;