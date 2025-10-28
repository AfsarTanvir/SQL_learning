-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
-- The Blunder

SELECT CEIL(AVG(Salary) - AVG(CONVERT(REPLACE(CAST(Salary AS CHAR), '0', ''), SIGNED))) FROM EMPLOYEES;
