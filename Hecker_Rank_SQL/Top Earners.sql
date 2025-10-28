-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
-- Top Earners

SELECT salary*months, COUNT(salary*months) FROM Employee 
    WHERE (SELECT MAX(salary * months) FROM Employee) = salary * months
    GROUP BY salary * months;
