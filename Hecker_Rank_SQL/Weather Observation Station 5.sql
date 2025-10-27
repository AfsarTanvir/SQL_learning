-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
-- Weather Observation Station 5

SELECT city, length(city) from station
    where (SELECT city from station where (SELECT min(length(city)) from station) = length(city) order by city limit 1) = city
    or (SELECT city from station where (SELECT max(length(city)) from station) = length(city) order by city limit 1) = city