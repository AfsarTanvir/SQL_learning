-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true
-- Weather Observation Station 4

SELECT count(city) - count(distinct(city)) from station;