-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true
-- Weather Observation Station 10

SELECT distinct city 
    from station 
    where city not regexp '[aeiouAEIOU]$';
