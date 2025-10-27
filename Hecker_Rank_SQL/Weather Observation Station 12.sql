-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem?isFullScreen=true
-- Weather Observation Station 12

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '.[AEIOUaeiou].' 
  AND CITY NOT REGEXP '^[AEIOUaeiou]'
  AND CITY NOT REGEXP '[AEIOUaeiou]$';
