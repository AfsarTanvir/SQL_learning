-- Hecker Rank Medium Intermediate
-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
-- The Report

SELECT 
    IF(Grades.Grade >= 8, Students.Name, NULL) AS Name,
    Grades.Grade,
    Students.Marks
FROM Students
JOIN Grades
  ON Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_Mark
ORDER BY Grades.Grade DESC, Students.Name;


-- Another Solution

SELECT 
    CASE
        WHEN Grades.Grade>=8 THEN Students.Name
        Else NULL
    END AS Name, Grades.Grade, Students.Marks
FROM Students
JOIN Grades
WHERE Grades.Min_Mark <= Students.Marks AND Grades.Max_Mark >= Students.Marks
ORDER BY Grades.Grade DESC, Students.Name;
