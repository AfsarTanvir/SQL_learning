-- Hecker Rank Medium Basic
-- https://www.hackerrank.com/domains/sql?filters%5Bstatus%5D%5B%5D=solved&badge_type=sql
-- Weather Observation Station 19


SELECT ROUND(
    SQRT(
    POWER(((SELECT MAX(LAT_N) FROM STATION) - (SELECT MIN(LAT_N) FROM STATION)), 2) + 
    POWER(((SELECT MAX(LONG_W) FROM STATION) - (SELECT MIN(LONG_W) FROM STATION)), 2)
    ), 4);


-- another solution
SELECT 
  ROUND(
    SQRT(
      POWER(MAX(LAT_N) - MIN(LAT_N), 2) +
      POWER(MAX(LONG_W) - MIN(LONG_W), 2)
    ),
  4) AS Distance
FROM STATION;
