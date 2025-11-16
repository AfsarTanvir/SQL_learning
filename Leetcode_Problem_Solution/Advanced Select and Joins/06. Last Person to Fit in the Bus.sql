-- LEETCODE Medium, Advanced Select and Joins, QUESTION-06
-- 1204. Last Person to Fit in the Bus
-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
Create table If Not Exists Queue (person_id int, person_name varchar(30), weight int, turn int);


Truncate table Queue;


-- Insert Data 
insert into Queue (person_id, person_name, weight, turn) values ('5', 'Alice', '250', '1');
insert into Queue (person_id, person_name, weight, turn) values ('4', 'Bob', '175', '5');
insert into Queue (person_id, person_name, weight, turn) values ('3', 'Alex', '350', '2');
insert into Queue (person_id, person_name, weight, turn) values ('6', 'John Cena', '400', '3');
insert into Queue (person_id, person_name, weight, turn) values ('1', 'Winston', '500', '6');
insert into Queue (person_id, person_name, weight, turn) values ('2', 'Marie', '200', '4');



-- Test data
SELECT * FROM Queue;



-- Solution
SELECT 
	t.person_name
FROM (
	SELECT *,
		SUM(weight) over (order by turn) as total_weight
	FROM 
		Queue
) as t
WHERE t.total_weight <=1000
ORDER BY t.total_weight DESC
LIMIT 1;




-- Removing Table
DROP TABLE IF EXISTS Queue;