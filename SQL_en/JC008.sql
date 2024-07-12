

--- DAY 08---

CREATE TABLE new_workers (  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20),
  number_of_employees numeric(5)
	
);


INSERT INTO new_workers VALUES(123451760, 'Ali Can', 'Pennsylvania', 8000, 'GOOGLE', 90000);
INSERT INTO new_workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM', 34500);
INSERT INTO new_workers VALUES(456789012, 'Veli Han', 'Arizona', 4000, 'GOOGLE', 90000);
INSERT INTO new_workers VALUES(234567890, 'Ayse Gul', 'Florida', 1500, 'APPLE', 45500);
INSERT INTO new_workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM', 23700);
INSERT INTO new_workers VALUES(567890123, 'Yusuf Arturk', 'Washington', 8000, 'APPLE', 45500);
INSERT INTO new_workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE', 90000);
INSERT INTO new_workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT', 60000);
INSERT INTO new_workers VALUES(456789012, 'Ayse Gul', 'Texas', 1500, 'GOOGLE', 90000);
INSERT INTO new_workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM', 23700);
INSERT INTO new_workers VALUES(123456710, 'Ali Can', 'Pennsylvania', 5000, 'IBM', 23700);
INSERT INTO new_workers VALUES(785690123, 'Fatih Tamer', 'Texas', 9000, 'MICROSOFT', 60000);
INSERT INTO new_workers VALUES(123456789, 'John Walker', 'Florida', 5000, 'GOOGLE', 90000);

SELECT * FROM new_workers;

--Find total salary for each name....

SELECT name, SUM(salary)
FROM new_workers
GROUP BY name;


--Find total number of employees for each state....

SELECT state, SUM(number_of_employees)
FROM new_workers
GROUP BY state;


--Find total number of employees(in the name/id column) for each company which is paying salary more than 4000...

SELECT company, COUNT(name)
FROM new_workers
WHERE salary > 4000
GROUP BY company ;


--Find minumum and maximum salary for each company....

SELECT company, MAX(salary), MIN(salary)
FROM new_workers
GROUP BY company;



--Find total salary for each employee whose total salary is more than 5000

SELECT name, SUM(salary) Total_salary
FROM new_workers
GROUP BY name 
HAVING SUM(salary) >5000

SELECT * FROM new_workers;


--HAVING CLAUSE is used to filter the result of AGGERAGATE FUNCTIONS 
--Having Clause works in combination with GROUP BY
--WHERE condition filters the indivudual data before grouping...
--Difference; Where condition filters the individual data and you neet you before group by 
              --Having you need to use after gruop by
			 
--Having clause works with AGGREGATE functions....


--Find the total number of employees per state that has more than 100,000 employees...


SELECT state, SUM(number_of_employees) AS totalEmployesPerState
FROM new_workers
GROUP BY state 
HAVING SUM(number_of_employees) > 100000;





--Find minumum salary values that are above 2000 per company


SELECT company, MIN(salary)
FROM new_workers
GROUP BY company
HAVING MIN(salary) > 2000;


--Find the maximum salary values that are above 7000 per company


SELECT company, MAX(salary)
FROM new_workers
GROUP BY company
HAVING MAX(salary) > 7000;



-------------------------------------UNION, UNION ALL, INTERSECT, EXCEPT-----------------------


CREATE TABLE alice_books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100)
);



INSERT INTO alice_books (book_id, book_title)
VALUES
    (1, 'The Great Gatsby'),
    (2, 'To Kill a Mockingbird'),
    (3, 'Pride and Prejudice'),
    (4, 'Jane Eyre'),
    (5, 'Animal Farm');



CREATE TABLE bob_books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100)
);

INSERT INTO bob_books (book_id, book_title)
VALUES
    (2, 'To Kill a Mockingbird'),
    (4, '1984'),
    (6, 'The Catcher in the Rye'),
    (5, 'Animal Farm');


CREATE TABLE john_books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100)
);


INSERT INTO john_books (book_id, book_title)
VALUES
    (9, 'Psychology of Money'),
    (12, 'Political Economy'),
    (7, 'Computational Thinking'),
    (5, 'Animal Farm');

SELECT * FROM alice_books;
SELECT * FROM bob_books;

--Find the title of books read by Alice....

SELECT book_title
FROM alice_books;




--Find the title of books read by Bob...

SELECT book_title
FROM bob_books;



--Create a list of all the book read by ALICE and BOB


SELECT book_title, book_id
FROM alice_books

UNION

SELECT  book_title, book_id
FROM bob_books


--UNION OPERATOR----

-- IT IS USED TO CMBINE OR UNITE THE RESULT OF 2 OR MORE QUERRIES
--IT RETURNS UNIQUE VALUES ONLY(REPEATED VALUES/DATA/RECORDS ARE PRINTED JUST ONCE)
--DATA TYPE OF THE COLUMNS SHOULD BE SAME,
--nUMBER OF THE COLUMNS SHOULD BE SAME, 
--ORDER OF THE COLUMNS SHOULD BE SAME 
--NAMES OF THE COLUMN CAN BE DIFFERENT 


--we can use UNION more than two tables...


-- --Create a list of all the book read by ALICE, BOB and John

SELECT book_title, book_id
FROM alice_books

UNION

SELECT  book_title, book_id
FROM bob_books

UNION 

SELECT  book_title, book_id
FROM John_books


--------------- UNION ALL OPERATOR -----------------
-- It is used to combine or unite the result of 2 or more queries.
-- It does NOT return UNIQUE values. (repeated values/data/records are also returned)
-- Data type of the columns should be SAME; number of columns should be SAME; order of the columns (in terms of data type type) should be SAME
-- Names of the columns can be DIFFERENT as long as their data type is SAME
-- The columns can be from different tables 




SELECT book_title, book_id
FROM alice_books

UNION ALL

SELECT  book_title, book_id
FROM bob_books

UNION ALL

SELECT  book_title, book_id
FROM John_books



--Create a list of the books read by BOTH Alice and bob


SELECT book_title, book_id
FROM alice_books

INTERSECT

SELECT  book_title, book_id
FROM bob_books

                                  --INTERSECT--
								  
								  
-- It is used to combine or unite the result of 2 or more queries.
-- It returns COMMON values. 
-- It returns UNIQUE values/data(repeated values/data/records are returned ONCE only)
-- Data type of the columns should be SAME; number of columns should be SAME; order of the columns (in terms of data type type) should be SAME
-- Names of the columns can be DIFFERENT as long as their data type is SAME
-- The columns can be from different tables 

--more than two tables you can also use INTERSECT

SELECT book_title, book_id
FROM alice_books

INTERSECT

SELECT  book_title, book_id
FROM bob_books

INTERSECT

SELECT  book_title, book_id
FROM John_books

 

--------------- EXCEPT (MINUS) OPERATOR -----------------

-- It is used to combine or unite the result of 2 or more queries.
-- It extracts the result of the FIRST query from the result of the second query (returns UN-COMMON values)
-- It returns UNIQUE values/data(repeated values/data/records are returned ONCE only)
-- Data type of the columns should be SAME; number of columns should be SAME; order of the columns (in terms of data type type) should be SAME
-- Names of the columns can be DIFFERENT as long as their data type is SAME
-- The columns can be from different tables 



--ONLY ALICE BOOKS SHOWED
SELECT book_title, book_id
FROM alice_books

EXCEPT 


SELECT  book_title, book_id
FROM bob_books


--BOB BOOKS SHOWED ONLY



SELECT  book_title, book_id
FROM John_books

EXCEPT 

SELECT book_title, book_id
FROM alice_books


EXCEPT 

SELECT  book_title, book_id
FROM bob_books



























