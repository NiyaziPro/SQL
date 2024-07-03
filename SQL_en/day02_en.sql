
          -- DAY 2 --
		  

-- Create Table

CREATE TABLE students (   --DDL (DATA DEFINITION LANGUAGE)

     id CHAR(4), 
	name VARCHAR (30),
	age INT,
	register_date DATE
);


--HOW TO READ DATA FROM A TABLE

SELECT * FROM STUDENTS; --DQL (DATA QUERY LANGUAGE)

-- HOW TO DROP THE TABLE 

DROP TABLE students;

-- HOW TO ADD DATA IN A TABLE

INSERT INTO students VALUES ('01', 'Tom Hanks', 45, '2024-09-12');
INSERT INTO students VALUES ('02','John Doe', 37, '2024-02-24');
INSERT INTO students VALUES ('03','Emma Watson', 27, '2024-02-29');

--HOW TO ADD SPECIFIC DATA 

INSERT INTO students (name , age) VALUES ('Jason Momoa' , 45);
INSERT INTO students (id , name) VALUES ('05' , 'Nick Cage');
INSERT INTO students (age , register_date) VALUES (25 , '2024-03-30');


SELECT * FROM STUDENTS; --works like System.out.println in java


---------------CONSTRAINTS----------


CREATE TABLE employees (
    
	id SERIAL, --Numbers can be duplicate.....
	name VARCHAR (20) NOT NULL,
	age INT CHECK (age>=18 AND age<=65),
	email VARCHAR(40) UNIQUE,
	salary REAL
);


SELECT * FROM employees;

-- Normal sytanx that we follow when we try to add all values in a table....
-- ==> follow the order of the fields as decleared in the table creation....

--But with Serial data type, we do not need to add value because it will cause conflict...
--so we need to add values by using 2nd way of adding into SPECIFIC FIELDS.....


--Add data into this table

INSERT INTO employees (name , age, email ,salary) VALUES ('Ismail' ,44,'ia@gmail.com', 9000);
INSERT INTO employees (age, email ,salary) VALUES (35,'ab@yahoo.com', 6000); --will show error ==> name field can not be NULL
INSERT INTO employees (name, email ,salary) VALUES ('Maryam','md@gmail.com', 95000); --no error because age can be null....
INSERT INTO employees (name, age, email ,salary) VALUES ('Angelina Jolie',67,'aj@hotmail.com' ,265000); --will show error Because age has a check constraint between 18 and 65...
INSERT INTO employees (name, age, email ,salary) VALUES ('Tom Hanks',59,'ab@yahoo.com' ,12000);
INSERT INTO employees (name, age, email ,salary) VALUES ('Walter White',55,'ab@yahoo.com' ,24000); --THIS WILL GIVE US ERROR BECAUSE EMAIL CAN NOT BE DUPLICATE


SELECT * FROM employees;
DROP TABLE employees;



-- ADD PRIMARY KEY constaint 
-- 1st way of creating PRIMARY KEY
--add the keyword primary key next to the column name after data type


-- FIRST WAY TO CREATE A TABLE WITH PRIMARY KEY.....
CREATE TABLE books(
book_id SERIAL PRIMARY KEY,
	book_name VARCHAR (30) NOT NULL,
	publisher_name VARCHAR (30),
	page_number INT 
);


SELECT * FROM books;



CREATE TABLE books1(
book_id SERIAL,
	book_name VARCHAR (30) NOT NULL,
	publisher_name VARCHAR (30),
	page_number INT,
	CONSTRAINT id_pk PRIMARY KEY (book_id)
);


SELECT * FROM books1;





