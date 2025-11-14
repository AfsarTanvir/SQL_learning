-- LEETCODE Basic Join, QUESTION-01
-- 1378. Replace Employee ID With The Unique Identifier
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Employees (
    id INT PRIMARY KEY,
    name VARCHAR(16)
);

CREATE TABLE EmployeeUNI (
    id INT NOT NULL,
    unique_id INT NOT NULL,
    PRIMARY KEY (id, unique_id)
);


-- Insert Data
INSERT INTO Employees (id, name) VALUES
	(1, 'Alice'),
	(7, 'Bob'),
	(11, 'Meri'),
	(90, 'Winston'),
	(3, 'Jonathan');

INSERT INTO EmployeeUNI (id, unique_id) VALUES
	(3, 1),
	(11, 2),
	(90, 3);

INSERT INTO Employees (id, name) VALUES
	(1, 'Alice'),
	(7, 'Bob'),
	(11, 'Meri'),
	(90, 'Winston'),
	(3, 'Jonathan');

INSERT INTO EmployeeUNI (id, unique_id) VALUES
	(3, 101),
	(11, 102),
	(90, 103),
	(10, 104);

TRUNCATE TABLE EmployeeUNI;
TRUNCATE TABLE Employees;
	
SELECT * FROM Employees;
SELECT * FROM EmployeeUNI;


-- Solution
SELECT EmployeeUNI.unique_id, Employees.name 
FROM Employees 
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;



DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS EmployeeUNI;