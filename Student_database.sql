CREATE DATABASE student_database;

USE student_database;

-- Create table & add constraints 
CREATE TABLE students(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(25) NOT NULL,
gender ENUM('M','F'),
dob DATE,
phone_number VARCHAR(15) NOT NULL UNIQUE
);

-- Data Insertion
INSERT INTO students (first_name,last_name,gender,dob,phone_number)
VALUES
('Suva','lakshmi','F','2000-07-02','8667458990'),
('Pramod','Srinivas','M','1999-11-09','8667471784'),
('Indra','devi','F','1999-07-03','8667611173'),
('Guna','sekaran','M','2000-03-09','9381877153'),
('Vaish','navi','F','2000-05-12','9176016654'),
('Geetha','priya','F','1998-03-14','9775623786');

SELECT * FROM students;


CREATE TABLE departments(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
name VARCHAR(20),
FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO departments(student_id,name)
VALUES
('6','IT'),
('5','CSE'),
('4','EEE'),
('2','ECE'),
('3','Mech'),
('1','Civil');

CREATE TABLE courses(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
staff_handling VARCHAR(40),
start_year YEAR,
department_id INT NOT NULL,
FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO courses(name,staff_handling,start_year,department_id)
VALUES
('Python','S.Vivek','2020','1'),
('CPP','R.Mohan','2021','2'),
('SQL','M.Shenba','2019','3'),
('Javascript','N.Thenmozhi','2020','4'),
('Java','L.Janani','2021','5'),
('HTML','G.Anusha','2020','6');


-- UPDATE data in a table - 2021 to 2022

SET SQL_SAFE_UPDATES = 0;

UPDATE courses
SET start_year = '2022'
WHERE start_year = '2021';

-- Delete entry by id 
DELETE FROM courses
WHERE name = 'HTML';

SELECT * FROM courses;

-- TRUNCATE TABLE

TRUNCATE TABLE courses;
TRUNCATE TABLE students;
TRUNCATE TABLE departments;

--  Drop table

DROP TABLE courses;
DROP TABLE departments;
DROP TABLE students;

-- Delete database 

DROP DATABASE student_database;

