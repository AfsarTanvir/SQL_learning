-- Hecker Rank Medium Intermediate
-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
-- Top Competitors

SELECT Hackers.hacker_id, Hackers.name
FROM Hackers
INNER JOIN Submissions
    ON Submissions.hacker_id = Hackers.hacker_id
INNER JOIN Challenges
    ON Submissions.challenge_id = Challenges.challenge_id
INNER JOIN Difficulty
    ON Difficulty.difficulty_level = Challenges.difficulty_level 
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name 
HAVING COUNT(Submissions.score) > 1
ORDER BY COUNT(Submissions.score) DESC, Hackers.hacker_id;


--- Another Solution
SELECT H.HACKER_ID, H.NAME
FROM SUBMISSIONS S
INNER JOIN CHALLENGES C ON S.CHALLENGE_ID = C.CHALLENGE_ID
INNER JOIN DIFFICULTY D ON C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL
INNER JOIN HACKERS H ON S.HACKER_ID = H.HACKER_ID
WHERE S.SCORE = D.SCORE -- This condition ensures a full score was achieved
GROUP BY H.HACKER_ID, H.NAME
HAVING COUNT(C.CHALLENGE_ID) > 1 -- This condition filters for hackers with full scores on more than one challenge
ORDER BY COUNT(C.CHALLENGE_ID) DESC, H.HACKER_ID ASC;