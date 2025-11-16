CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL
);

ALTER TABLE Courses AUTO_INCREMENT = 1001;

INSERT INTO Courses (course_name) VALUES
('C'),
('C++'),
('C#'),
('Java'),
('Python'),
('Ruby'),
('SQL'),
('DBMS'),
('Operating System');

select * from Courses;