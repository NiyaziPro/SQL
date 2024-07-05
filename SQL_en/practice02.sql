-- day01 -- SQL practice-02

-- create a table

CREATE TABLE teacher (
	teacher_id INT PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50),
	subject VARCHAR(30)
);

-- add value
INSERT INTO teacher (teacher_id,firstname,lastname,subject ) 
	VALUES (1,'Mr Melik','Whıte','Java'),
			(2,'Ms Gızem','Bono','SQL'),
			(3,'Mr Ahmet','Ar','Selenıum' );

-- retrieve specific data
SELECT firstname FROM teacher
WHERE subject='SQL'; 

-- update data
UPDATE teacher SET subject='Java' WHERE teacher_id =3;
SELECT * FROM teacher WHERE teacher_id=3;

-- delete data
DELETE FROM teacher WHERE teacher_id = 2;
SELECT * FROM teacher;

-- add value
INSERT INTO teacher(teacher_id,firstname,lastname,subject)
VALUES (2,'Ms Gızem','Bono','SQL'),
(4,'Isa','Argundogan','SQL');

-- Retrieve Teachers' Full Names
SELECT CONCAT (firstname,' ',lastname) AS FullName FROM teacher; 

-- Update Multiple Teachers' Subjects
UPDATE teacher SET subject = 'History' WHERE subject = 'SQL';

-- Retrieve Teachers Sorted by Last Name
SELECT firstname,lastname,subject FROM teacher ORDER BY lastname;

-- Delete Teachers Who Teach 'Java'
DELETE FROM teacher
WHERE subject='Java';

-- Update specific Teacher's Last Name
UPDATE teacher SET lastname='Shah' WHERE teacher_id=4;
SELECT *FROM teacher;

-- Count the Number of Teachers
SELECT COUNT(*) AS NumberOfTeacher FROM teacher;

-- Retrieve Teachers with IDs Greater Than 2
SELECT *FROM teacher
WHERE teacher_id>2;

-- Retrieve Teachers Sorted by first Name
SELECT * FROM teacher ORDER BY firstname;

-- Update Teacher's Subject Based on ID Range
UPDATE teacher SET subject = 'Math' 
WHERE teacher_id BETWEEN 1 AND 3;