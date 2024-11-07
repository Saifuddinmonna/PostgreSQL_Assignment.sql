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

