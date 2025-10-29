-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=true
-- Weather Observation Station 16

SELECT ROUND(MIN(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7780;
