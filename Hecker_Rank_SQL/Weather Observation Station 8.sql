-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true
-- Weather Observation Station 8

SELECT DISTINCT CITY
    FROM STATION
    WHERE CITY REGEXP '^[AEIOUaeiou]'
        AND CITY REGEXP '[AEIOUaeiou]$';