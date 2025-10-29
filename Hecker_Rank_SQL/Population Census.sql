-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true
-- Population Census

SELECT SUM(C.POPULATION) FROM CITY AS C
    INNER JOIN COUNTRY
    ON C.COUNTRYCODE = COUNTRY.CODE
    WHERE COUNTRY.CONTINENT = 'ASIA';
