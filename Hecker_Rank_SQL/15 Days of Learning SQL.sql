-- Hecker Rank MEdium Intermediate 
-- https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true
-- 15 Days of Learning SQL

SELECT 
    s1.submission_date,
    (SELECT COUNT(DISTINCT hacker_id)
    FROM Submissions s2
    WHERE 
        s1.submission_date = s2.submission_date AND
        (SELECT 
            COUNT(DISTINCT s3.submission_date)
        FROM Submissions s3 
        WHERE 
            s3.hacker_id = s2.hacker_id AND
            s3.submission_date < s1.submission_date
        ) = DATEDIFF(s1.submission_date, '2016-03-01')
    ),
    (SELECT hacker_id 
    FROM Submissions s2
    WHERE s2.submission_date = s1.submission_date
    GROUP BY hacker_id 
    ORDER BY COUNT(submission_date) DESC, hacker_id 
    LIMIT 1
    ) AS TMP,
    (SELECT name 
    FROM Hackers 
    WHERE hacker_id = TMP)
FROM
    (SELECT 
        DISTINCT submission_date
    FROM Submissions) as s1
GROUP BY s1.submission_date;
