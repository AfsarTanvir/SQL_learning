-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
-- African Cities

SELECT C.NAME FROM CITY AS C
    INNER JOIN COUNTRY
    ON C.COUNTRYCODE = COUNTRY.CODE
    WHERE COUNTRY.CONTINENT = 'Africa';
