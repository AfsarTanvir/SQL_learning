-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true
-- Weather Observation Station 3

SELECT distinct(city) from station where id % 2 = 0
