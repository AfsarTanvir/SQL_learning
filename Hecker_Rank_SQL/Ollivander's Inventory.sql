-- Hecker Rank Medium Intermediate
-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
-- Ollivander's Inventory


SELECT Wands.id, Wands_Property.age, Wands.coins_needed, Wands.power
FROM Wands
JOIN Wands_Property
    ON Wands.code = Wands_Property.code
WHERE Wands_Property.is_evil = 0 AND wands.coins_needed = (
        SELECT
            MIN(w2.coins_needed)
        FROM
            Wands AS w2
        JOIN
            Wands_Property AS wp2 ON w2.code = wp2.code
        WHERE
            wp2.is_evil = 0
            AND Wands_Property.age = wp2.age
            AND wands.power = w2.power
    )
ORDER BY Wands.power DESC, Wands_Property.age DESC;
