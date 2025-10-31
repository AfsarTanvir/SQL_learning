-- Hecker Rank Medium Intermediate
-- https://www.hackerrank.com/domains/sql?badge_type=sql&filters%5Bstatus%5D%5B%5D=solved
-- Challenges

SELECT 
    h1.hacker_id, h1.name, COUNT(c1.challenge_id) as total_count
FROM 
    Hackers h1
JOIN 
    Challenges c1 ON c1.hacker_id = h1.hacker_id
GROUP BY h1.hacker_id, h1.name
HAVING total_count = 
    (SELECT 
        COUNT(c2.challenge_id) as _count
    FROM 
        Challenges c2
    GROUP BY c2.hacker_id
    ORDER BY _count DESC
    LIMIT 1)
  OR
    total_count in 
    (SELECT DISTINCT 
        temp.other_count 
    FROM
        (SELECT
            COUNT(c3.challenge_id) as other_count
        FROM Hackers h3
        JOIN Challenges c3
            ON h3.hacker_id = c3.hacker_id
        GROUP BY h3.hacker_id, h3.name) as temp
    GROUP BY temp.other_count
    HAVING COUNT(temp.other_count)=1
    )
ORDER BY total_count DESC, h1.hacker_id
