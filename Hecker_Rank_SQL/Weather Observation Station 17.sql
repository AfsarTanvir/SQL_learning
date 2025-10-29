-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true
-- Weather Observation Station 17

SELECT ROUND(LONG_W, 4) FROM STATION 
    WHERE (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780) = LAT_N;
