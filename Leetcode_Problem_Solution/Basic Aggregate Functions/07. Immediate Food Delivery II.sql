-- LEETCODE Medium, Aggregate Functions, QUESTION-07
-- 1174. Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Delivery (
    delivery_id INT UNIQUE,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);


-- Insert Data
INSERT INTO Delivery VALUES
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 2, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-12'),
    (4, 3, '2019-08-24', '2019-08-24'),
    (5, 3, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13'),
    (7, 4, '2019-08-09', '2019-08-09');

    


-- Test data
SELECT * FROM Delivery;



-- Solution
SELECT 
	ROUND(SUM(if(first_delivery_date=first_order_date, 1, 0))/COUNT(customer_id) * 100, 2) AS immediate_percentage
FROM
	(
    SELECT 
		customer_id, 
        MIN(order_date) AS first_order_date, 
		MIN(customer_pref_delivery_date) as first_delivery_date
	FROM Delivery
	GROUP BY customer_id
	ORDER BY first_order_date) as t;




-- Removing Table
DROP TABLE IF EXISTS Delivery;