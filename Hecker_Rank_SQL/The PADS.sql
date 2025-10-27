-- Hecker Rank Easy Basic
-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true
-- The PADS

SELECT concat(concat_ws('(',name, Left(occupation, 1)), ')') 
    from occupations order by name; 

SELECT concat_ws(' ',concat('There are a total of ', count(occupation)), concat(lower(occupation), 's.')) 
    from occupations group by occupation order by count(occupation), occupation;