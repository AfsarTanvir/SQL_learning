-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
-- Weather Observation Station 18

SELECT ROUND(
    (SELECT MAX(LAT_N) FROM STATION) - (SELECT MIN(LAT_N) FROM STATION) + 
    (SELECT MAX(LONG_W) FROM STATION) - (SELECT MIN(LONG_W) FROM STATION), 4)
