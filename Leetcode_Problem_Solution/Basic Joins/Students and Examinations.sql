-- LEETCODE Basic Join, QUESTION-07
-- 1280. Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Leetcode_Database;

USE Leetcode_Database;

-- Create table if not exists
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Subjects (
    subject_name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Examinations (
    student_id INT,
    subject_name VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ,
    FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name) 
);



-- Insert Data
INSERT INTO Students (student_id, student_name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (13, "John"),
    (6, 'Alex');

INSERT INTO Subjects (subject_name) VALUES 
    ('Math'),
    ('Physics'),
    ('Programming');

INSERT INTO Examinations (student_id, subject_name) VALUES
    (1, 'Math'),
    (1, 'Physics'),
    (1, 'Programming'),
    (2, 'Programming'),
    (1, 'Physics'),
    (1, 'Math'),
    (13, 'Math'),
    (13, 'Programming'),
    (13, 'Physics'),
    (2, 'Math'),
    (1, 'Math');



-- Test data
SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Examinations;


-- Solution
SELECT st.student_id, st.student_name, sub.subject_name, IFNULL(t.attended_exams, 0) as attended_exams
	FROM Students st
    JOIN Subjects sub
    LEFT JOIN 
		(SELECT e.student_id, e.subject_name, COUNT(*) as attended_exams
			FROM Examinations e
			GROUP BY e.student_id, e.subject_name ) AS t ON t.student_id = st.student_id  AND t.subject_name = sub.subject_name
	ORDER BY 1, 3;
    
-- Another Solution
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM
    Students s
CROSS JOIN
    Subjects sub
LEFT JOIN
    Examinations e
ON
    s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;




DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Examinations;