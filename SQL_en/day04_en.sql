----------- Day 04 ----------

CREATE TABLE primary_students(
	student_id CHAR (5) PRIMARY KEY,
	student_name VARCHAR (30),
	email_address VARCHAR NOT NULL,
	student_age NUMERIC (2) CHECK (student_age>5),
	phone_number CHAR (10) UNIQUE
);

INSERT INTO primary_students VALUES ('1111', 'Ryan Brooks', 'rb@gmail.com', 11, '1234567890');
INSERT INTO primary_students VALUES ('1112', 'Emma Williams', 'ew@gmail.com', 12, '2345678901');
INSERT INTO primary_students VALUES ('113', 'Tom Hanks', 'tm@gmail.com', 12, '1234567891'); --There 3 errors in this query.....
INSERT INTO primary_students VALUES ('1114', 'Alice Baker', 'ab@gmail.com', 10, '3456789012');


INSERT INTO primary_students (student_id,email_address,phone_number) VALUES ('1115','za@gmail.com' ,    '9912345678');
INSERT INTO primary_students (student_id,email_address, phone_number ) VALUES ('1116', 'xyz@yahoo.com', '6789012345');


INSERT INTO primary_students (student_id,email_address, phone_number ) VALUES 
          ('1117', 'bc@gmail.com', '6778901234'), 
          ('1118', 'pg@yahoo.com' , '8889012345');



SELECT * FROM primary_students;



--UPDATE student_id 113 to 1113

UPDATE primary_students
SET student_id = '1113'
WHERE student_id = '113';


--UPDATE student name to Zakir Arslan where student id 1115
UPDATE primary_students
SET student_name = 'Zakir Arslanov'
WHERE student_id = '1115';


--CHANGE 'Tom Hanks' name to 'John Doe'
UPDATE primary_students
SET student_name = 'John Doe'
WHERE student_name = 'Tom Hanks';


--CHANGE email 'bc@gmail.com' to 'bcd@yahoo.com'
UPDATE primary_students
SET email_address = 'bcd@yahoo.com'
WHERE email_address ='bc@gmail.com';


--CHANGE email bcd@yahoo.com to null 
UPDATE primary_students
SET email_address = NULL
WHERE email_address ='bcd@gmail.com';

SELECT * FROM primary_students;


DELETE FROM primary_students


SELECT * FROM primary_students;


DELETE email_address FROM primary_students
WHERE student_id = '1114';

ALTER TABLE primary_students DROP COLUMN student_age;

DROP TABLE primary_students;


DELETE FROM primary_students
WHERE student_id = '1112';


---AGGREGATE FUNCTIONS-------------
--- FUNCTIONS ==> MIN, MAX, SUM, COUNT, AVG 


--Find the minumm age from primary_students table......
SELECT MIN(student_age) FROM primary_students;


--FIND THE MAXIMUM AGE FROM PRIMARY STUDENTS TABLE
SELECT MAX(student_age) FROM primary_students;


SELECT * FROM primary_students;

--update all students age to the maximum value.....

-- HARD CODING 
UPDATE primary_students
SET student_age = 12;


-- DYNAMIC CODE
UPDATE primary_students
SET student_age = (SELECT MAX(student_age) FROM primary_students);


CREATE TABLE parents (
	parent_id CHAR (5) PRIMARY KEY,
	parent_name TEXT,
	student_id CHAR (5),
	parent_address TEXT,
	parent_dob DATE
); 

INSERT INTO parents VALUES('2111', 'Adam Brooks', '1111', 'Miami, FL', '1994-10-23');
INSERT INTO parents VALUES('2112', 'Angie Williams', '1112', 'New York, US', '1987-02-13');
INSERT INTO parents VALUES('2113', 'Andrew Duffy', '1113', 'Berlin, Germany', '1976-12-05');
INSERT INTO parents VALUES('2114', 'John Baker', '1114', 'London, UK', '1980-07-07');
INSERT INTO parents VALUES('2115', 'Lydia Smith', '1115', 'Toront, Canada', '1986-09-24');
INSERT INTO parents VALUES('2116', 'Dogan Can', '1116', 'Istanbul, Turkiye', '1990-11-11');


SELECT * FROM parents;


--WHO IS THE OLDEST PERSON IN THE PARENTS TABLE...
SELECT MIN(parent_dob) FROM parents;

--To find name of oldest person.....
SELECT * FROM parents 
WHERE parent_dob = (SELECT MIN(parent_dob) FROM parents);


--Change all date of births to highest date of birth.....

UPDATE parents	
SET parent_dob = (SELECT MIN(parent_dob) FROM parents);



CREATE TABLE workers(
  worker_id SMALLINT,
  worker_name VARCHAR(30),
  worker_salary NUMERIC,

  CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)
);


INSERT INTO workers VALUES(101, 'Ali Can', 10000);
INSERT INTO workers VALUES(102, 'Veli Han', 4000);
INSERT INTO workers VALUES(103, 'Aisha Can', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 12000);
INSERT INTO workers VALUES(105, 'Musa Ahmet', 9000);
INSERT INTO workers VALUES(106, 'Ali Can', 19000);
INSERT INTO workers VALUES(107, 'Aygul Aksoy',13000);
INSERT INTO workers VALUES(108, 'Hasan Basri', 16000);
INSERT INTO workers VALUES(109, 'Fatih Tamer', 18000);
INSERT INTO workers VALUES(110, 'Emel Ebru', 8000);



SELECT * FROM workers;


--Find the maximum salary?
SELECT MAX(worker_salary) FROM workers;


--ALIAS 
--We use AS(alias) to give a temporary name to the field that containes result......

SELECT MAX(worker_salary) AS maximum_salary FROM workers;

--Find the total number of workers (use ALIAS)
SELECT COUNT(worker_id) AS workers_number FROM workers;
