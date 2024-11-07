-- Active: 1730980958970@@127.0.0.1@5432@university_db

-- Creating  students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE NOT NULL,
    frontend_mark INT CHECK (frontend_mark >= 0),
    backend_mark INT CHECK (backend_mark >= 0),
    status VARCHAR(20)
);

-- Creating courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);

-- Creating enrollment table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- Inserting sample data into students

INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES
(1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
(2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
(3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
(4, 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
(5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
(6, 'Hasan', 23, 'hasan@gmail.com', NULL, NULL, NULL);


-- Insert sample data into courses

INSERT INTO courses (course_id, course_name, credits)
VALUES
(1, 'Next.js', 3),
(2, 'React.js', 4),
(3, 'Databases', 3),
(4, 'Prisma', 3);


-- Insert sample data into enrollment
INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);


-- Run SQL queries 

-- Query 1: Insert a new student record.


INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES
(7, 'Saifuddin Ahammed', 31, 'saifuddinmonna@gmail.com', 30, 40, NULL);


--Query 2: Retrieve the names of all students enrolled in 'Next.js'.

SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';


--Query 3: Update the status of the student with the highest total marks to 'Awarded'.


UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark)
    FROM students
);

--Query 4: Delete courses with no students enrolled.

DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);


--Query 5: Retrieving the names of students with a limit of 2, starting from the 3rd student.


SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;


--Query 6: Retrieving course names and the number of students enrolled in each course.

SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;


--Query 7: Calculate the average age of all students.

SELECT AVG(age) AS average_age
FROM students;


--Query 8: Retrieving the names of students with email addresses containing 'example.com'.


SELECT student_name
FROM students
WHERE email LIKE '%example.com%';