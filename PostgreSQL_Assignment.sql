-- Active: 1730980958970@@127.0.0.1@5432@university_db

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE NOT NULL,
    frontend_mark INT CHECK (frontend_mark >= 0),
    backend_mark INT CHECK (backend_mark >= 0),
    status VARCHAR(20)
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);

-- Create enrollment table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- Insert sample data into students

INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES
(1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
(2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
(3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
(4, 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
(5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
(6, 'Hasan', 23, 'hasan@gmail.com', NULL, NULL, NULL);
