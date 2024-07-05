-- day01 -- SQL practice-01

-- create a table
CREATE TABLE student(
	student_id INT PRIMARY KEY,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(50),
	address VARCHAR(100),
	gender VARCHAR (10),
	phonenumber VARCHAR(15) UNIQUE
); 

-- add value
INSERT INTO student (student_id, firstname, lastname, address, gender, phonenumber )
VALUES (1, 'Smitha', 'Jolie', 'Somewhere in Germany', 'Female', '12506' );

INSERT INTO student (student_id, firstname, lastname, address, gender, phonenumber )
VALUES (2, 'Zakir', 'Beckham', 'Berlin', 'Male', '1250650' );

INSERT INTO student (student_id, firstname, lastname, address, gender, phonenumber )
VALUES (3, 'Isa', 'Dumbledore', 'Frankfurt', 'Male', '1250620' );

-- retrieve all data
SELECT * FROM student; 

-- retrieve specific data
SELECT firstname AS First_name, lastname FROM student WHERE address = 'Berlin';

-- update data
UPDATE student 
SET address = 'Berlin'
WHERE student_id = 3;

SELECT * FROM student 
WHERE student_id = 3;

-- delete data
DELETE FROM student
WHERE student_id = 1;

-- count number of students
SELECT COUNT(*) AS studentcount FROM student;

-- add new column and data to existing table
ALTER TABLE student ADD age INT;

UPDATE student SET age = 23 WHERE student_id = 1;
UPDATE student SET age = 18 WHERE student_id = 2;
UPDATE student SET age = 20 WHERE student_id = 3;

-- retrieve max and min age of students
SELECT MAX(age) AS maximumage FROM student;
SELECT MIN(age) AS minimumage FROM student;


-- create a table
CREATE TABLE classes (
	class_id INT PRIMARY KEY,
	classname VARCHAR(50),
	teachername VARCHAR(50)
);

-- add value 
INSERT INTO classes (class_id, classname, teachername)
VALUES (1, 'Math', 'Mr Malik'),
		(2, 'English', 'Ms Gizem'),
		(3, 'Science', 'Mr Ahmet');

SELECT * FROM classes;

-- add new column and data to existing table
ALTER TABLE student ADD class_id INT;
SELECT * FROM student ;
UPDATE student SET class_id = 2 WHERE student_id = 1;
UPDATE student SET class_id = 3 WHERE student_id = 3;
UPDATE student SET class_id = 3 WHERE student_id = 2;

-- join (inner) between two tables by class_id
SELECT student.firstname, classes.classname
FROM student
JOIN classes ON student.class_id = classes.class_id;

-- subquery
SELECT firstname, lastname, age
FROM student
WHERE age = (SELECT MAX(age) FROM student);