-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=true
-- Weather Observation Station 11

SELECT distinct city from station 
    where city not regexp '^[aeiouAEIOU]' 
    or city not regexp '[aeiouAEIOU]$';