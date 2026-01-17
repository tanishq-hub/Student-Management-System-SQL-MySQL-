CREATE DATABASE student_management_system;
USE student_management_system;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    enrollment_year INT
);
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100)
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO students (first_name, last_name, email, department, enrollment_year)
VALUES
('Tanishq', 'Sharma', 'tanishq@gmail.com', 'Computer Science', 2024),
('Rahul', 'Verma', 'rahul@gmail.com', 'IT', 2023),
('Ayesha', 'Khan', 'ayesha@gmail.com', 'Data Science', 2024);


INSERT INTO subjects (subject_name)
VALUES
('Database Management'),
('Python Programming'),
('Data Analytics');


INSERT INTO marks (student_id, subject_id, marks)
VALUES
(1, 1, 85),
(1, 2, 90),
(2, 1, 78),
(2, 3, 82),
(3, 2, 88),
(3, 3, 91);


select * from students;

SELECT 
    s.first_name,
    s.last_name,
    sub.subject_name,
    m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id;


SELECT 
    s.first_name,
    s.last_name,
    AVG(m.marks) AS average_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id;

SELECT 
    sub.subject_name,
    MAX(m.marks) AS highest_marks
FROM marks m
JOIN subjects sub ON m.subject_id = sub.subject_id
GROUP BY sub.subject_id;


SELECT 
    s.first_name,
    s.last_name,
    m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
WHERE m.marks > 85;

CREATE INDEX idx_student_id ON marks(student_id);


SHOW INDEX FROM marks;


select * from students;

CREATE VIEW student_performance_view AS
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    s.department,
    sub.subject_name,
    m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id;

SELECT * FROM student_performance_view;


