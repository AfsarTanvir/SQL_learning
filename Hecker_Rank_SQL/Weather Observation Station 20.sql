-- Hecker Rank Medium Intermediate
-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- Weather Observation Station 20


SELECT ROUND(LAT_N, 4)
FROM (
  SELECT 
    LAT_N,
    ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num
  FROM STATION
) AS t
WHERE row_num = (SELECT CEIL(COUNT(*) / 2.0) FROM STATION);
