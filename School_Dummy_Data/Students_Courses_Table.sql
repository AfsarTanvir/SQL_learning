CREATE TABLE student_courses (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    constraint students_fk FOREIGN KEY (student_id) REFERENCES Students(id) ON DELETE CASCADE,
    constraint courses_fk FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

show tables;

INSERT INTO student_courses (student_id, course_id) values
(1001, 1002),
(1001, 1005),
(1001, 1007),
(1002, 1001),
(1002, 1004),
(1002, 1008),
(1003, 1007),
(1003, 1008),
(1003, 1009),
(1004, 1001),
(1004, 1002),
(1004, 1003),
(1004, 1004),
(1004, 1005),
(1004, 1006),
(1004, 1007),
(1004, 1008),
(1004, 1009),
(1005, 1001),
(1005, 1002),
(1005, 1003),
(1005, 1004),
(1005, 1005),
(1005, 1006),
(1005, 1007),
(1008, 1003),
(1008, 1004),
(1008, 1005);

	
select * from Students;
select * from Courses;
select * from student_courses;
select * 
	from Students s
	left join student_courses sc on s.id = sc.student_id
    left join Courses c on c.course_id = sc.course_id
    where last_name = '';

