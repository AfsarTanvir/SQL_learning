-- Hecker Rank Medium Intermediate
-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true
-- Contest Leaderboard

SELECT 
    h.hacker_id, 
    h.name, 
    SUM(s.max_score) AS total_score
FROM Hackers as h
JOIN (
    SELECT 
        hacker_id, 
        challenge_id, 
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) as s ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(s.max_score) > 0
ORDER BY total_score DESC, h.hacker_id;


-- Another Solution
SELECT Hackers.hacker_id, Hackers.Name, S2.sum_score
FROM Hackers
INNER JOIN (SELECT hacker_id, SUM(S1.max_score) AS sum_score FROM 
    (SELECT hacker_id, MAX(score) AS max_score FROM Submissions GROUP BY challenge_id, hacker_id) AS S1
    GROUP BY S1.hacker_id) AS S2
ON Hackers.hacker_id = S2.hacker_id
WHERE S2.sum_score <> 0
ORDER BY S2.sum_score DESC, Hackers.hacker_id;

