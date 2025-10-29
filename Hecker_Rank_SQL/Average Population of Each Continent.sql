-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/average-population-of-each-continent/submissions/code/452467735
-- Average Population of Each Continent

SELECT 
    COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) 
FROM CITY
    INNER JOIN COUNTRY
    ON CITY.COUNTRYCODE = COUNTRY.CODE
    GROUP BY COUNTRY.CONTINENT;
