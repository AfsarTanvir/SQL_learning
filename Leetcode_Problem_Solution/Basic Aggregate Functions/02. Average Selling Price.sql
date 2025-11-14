-- LEETCODE Easy, Aggregate Functions, QUESTION-02
-- 1251. Average Selling Price
-- https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY(product_id, start_date, end_date)
);

CREATE TABLE IF NOT EXISTS UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);




-- Insert Data
INSERT INTO Prices VALUES
    (3, '2019-02-17', '2019-02-28', 5),
    (1, '2019-02-17', '2019-02-28', 5),
    (1, '2019-03-01', '2019-03-22', 20),
    (2, '2019-02-01', '2019-02-20', 15),
    (2, '2019-02-21', '2019-03-31', 30);
    

INSERT INTO UnitsSold VALUES
    (1, '2019-02-25', 100),
    (1, '2019-03-01', 15),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30);
    




-- Test data
SELECT * FROM Prices;
SELECT * FROM UnitsSold;


-- Solution
SELECT Prices.product_id, IFNULL(ROUND(SUM(units * price)/SUM(units), 2), 0) as average_price
    FROM Prices
    LEFT JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id AND purchase_date >= start_date AND purchase_date <= end_date
    GROUP BY Prices.product_id;
    





-- Removing Table
DROP TABLE IF EXISTS Prices;
DROP TABLE IF EXISTS UnitsSold;