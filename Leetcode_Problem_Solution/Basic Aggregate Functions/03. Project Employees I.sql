-- LEETCODE Easy, Aggregate Functions, QUESTION-03
-- 1075. Project Employees I
-- https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(20),
    experience_years INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Project (
    project_id INT,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);




-- Insert Data
INSERT INTO Employee VALUES
    (1, 'Khaled', 3),
    (2, 'Ali', 2),
    (3, 'John', 1),
    (4, 'Doe', 2);
    
    
INSERT INTO Project VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);
    


    




-- Test data
SELECT * FROM Project;
SELECT * FROM Employee;


-- Solution
SELECT p.project_id, ROUND(AVG(experience_years),  2) AS average_years
    FROM Project p
    JOIN Employee e ON p.employee_id = e.employee_id
    GROUP BY project_id;
    





-- Removing Table
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;