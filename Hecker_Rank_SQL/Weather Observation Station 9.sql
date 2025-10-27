-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true
-- Weather Observation Station 9

SELECT distinct city from station 
    where city not REGEXP '^[aeiouAEIOU]'