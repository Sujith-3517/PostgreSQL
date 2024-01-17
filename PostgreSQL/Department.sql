-- Create Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

-- Create Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE,
    credits INT
);

-- Create Enrollments Table
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    enrollment_date DATE
);
-- Insert Sample Students
INSERT INTO students (first_name, last_name, date_of_birth, email)
VALUES
('John', 'Doe', '2000-05-15', 'john.doe@example.com'),
('Alice', 'Smith', '1998-11-20', 'alice.smith@example.com'),
('Bob', 'Johnson', '2001-03-10', 'bob.johnson@example.com');

-- Insert Sample Courses
INSERT INTO courses (course_name, credits)
VALUES
('Mathematics', 4),
('Computer Science', 3),
('History', 3);

-- Enroll Students in Courses
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2022-01-15'),
(1, 2, '2022-01-16'),
(2, 2, '2022-01-17'),
(3, 3, '2022-01-18');
SELECT s.*, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

Find the total number of enrolled students in each course:
SELECT c.course_name, COUNT(e.student_id) AS num_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

Identify students who are not enrolled in any courses:
SELECT s.*
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

Update the credits for the "Mathematics" course:
UPDATE courses
SET credits = 5
WHERE course_name = 'Mathematics';


