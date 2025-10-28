-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true
-- Weather Observation Station 2

SELECT ROUND(SUM(LAT_N), 2) AS lat, ROUND(SUM(LONG_W), 2) AS lon 
FROM STATION;
