-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true
-- Higher Than 75 Marks


SELECT name from students 
    where marks > 75
    order by RIGHT(name, 3), id
