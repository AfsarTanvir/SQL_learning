-- LEETCODE Easy, Advanced Select and Joins, QUESTION-02
-- 1789. Primary Department for Each Employee
-- https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
Create table If Not Exists Employee (
    employee_id int, 
    department_id int, 
    primary_flag ENUM('Y','N')
);

Truncate table Employee;


-- Insert Data
insert into Employee (employee_id, department_id, primary_flag) values ('1', '1', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '1', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('3', '3', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '3', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '4', 'N');



-- Test data
SELECT * FROM Employee;



-- Solution
SELECT DISTINCT e1.employee_id, e1.department_id
FROM Employee AS e1
JOIN 
(SELECT employee_id, SUM(CASE WHEN primary_flag =  'Y' THEN 1 END) as y
FROM Employee 
GROUP BY employee_id) AS e2
ON e1.employee_id = e2.employee_id
WHERE y is null OR e1.primary_flag = 'Y';

-- Another Solution
SELECT e.employee_id, e.department_id
FROM Employee e
WHERE e.primary_flag = 'Y'
UNION
SELECT e.employee_id, e.department_id
FROM Employee e
JOIN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1
) x ON e.employee_id = x.employee_id;


-- Another Solution
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (
        SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1
   );

-- Another Solution
SELECT e.employee_id, e.department_id
FROM Employee e
WHERE e.primary_flag = 'Y'
   OR EXISTS (
        SELECT 1
        FROM (
            SELECT employee_id
            FROM Employee
            GROUP BY employee_id
            HAVING COUNT(*) = 1
        ) x
        WHERE x.employee_id = e.employee_id
   );


-- Removing Table
DROP TABLE IF EXISTS Employee;