

--DAY 06----

--Supquerries accross table....

CREATE TABLE company_employees (
  id CHAR(9) PRIMARY KEY,
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);


INSERT INTO company_employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO company_employees VALUES(324567891, 'Neena Omar', 'Ohio', 6000, 'GOOGLE');
INSERT INTO company_employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO company_employees VALUES(345678901, 'Ali Can', 'Texas', 3500, 'IBM');
INSERT INTO company_employees VALUES(345678905, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO company_employees VALUES(456789019, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO company_employees VALUES(456789130, 'Veli Han', 'Arozona', 4000, 'GOOGLE');
INSERT INTO company_employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO company_employees VALUES(234560789, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO company_employees VALUES(456789018, 'Aygul Aydem', 'Pennsylvania', 2500, 'IBM');
INSERT INTO company_employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
INSERT INTO company_employees VALUES(123710456, 'Yusuf Arturk', 'Washington', 9000, 'APPLE');



CREATE TABLE companies (
  company_id CHAR(9),
  company VARCHAR(20),
  number_of_employees SMALLINT
);


INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);


SELECT * FROM company_employees;
SELECT * FROM companies;


--Find the employee name and company name whose company has more than 15000 employees

SELECT name,company 
FROM company_employees
WHERE company IN (SELECT company FROM companies WHERE number_of_employees > 15000);


--Find the company names and company_id which are in 'Texas'

SELECT company, company_id
FROM companies
WHERE company IN (SELECT state FROM company_employees WHERE state = 'Texas');


--Find the employee name and their states whose company_id is '103';

SELECT name, state 
FROM company_employees
WHERE company IN(SELECT company FROM companies WHERE company_id = '103');


-- If it return one value from subquery, you also can use normal sytanx (without IN)....
SELECT name, state 
FROM company_employees
WHERE company =(SELECT company FROM companies WHERE company_id = '103');



--Find employee name and their states which company_id greater than '101';

SELECT name, state 
FROM company_employees
WHERE company IN(SELECT company FROM companies WHERE company_id > '101');


--Find the company name, number of employees and average salary paid by each company....

SELECT company, number_of_employees,
(SELECT  ROUND(AVG(salary) ,1) avg_for_each_company FROM company_employees WHERE company_employees.company = companies.company)
FROM companies;




--IS NULL AND NOT NULL----



CREATE TABLE people (
	ssn INT UNIQUE,
	name VARCHAR (30),
	address VARCHAR (50)
);


INSERT INTO people VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES (345678912, 'Olivia Brooks', 'Arizona');
INSERT INTO people VALUES (456789123, 'Mary Tien', 'New Jersey');


INSERT INTO people (ssn, address) VALUES (567890123, 'California');
INSERT INTO people (ssn, address) VALUES (678901234, 'Michigan');
INSERT INTO people (ssn, address) VALUES (789012345, 'Ohio');


INSERT INTO people (ssn, name) VALUES (890123456, 'Emily Simpson');
INSERT INTO people (ssn, name) VALUES (901234567, 'Axcel Jackson');
INSERT INTO people (ssn, name) VALUES (012389456, 'John Smith');


INSERT INTO people (name, address) VALUES ('John Doe', 'Texas');
INSERT INTO people (name, address) VALUES ('Tom Hanks', 'Washington');
INSERT INTO people (name, address) VALUES ('Emma Watson', 'New York');



SELECT * FROM people;


--UPDATE ALL NULL NAMES TO 'Names will be added later';
UPDATE people
SET name = 'Names will be added later'
WHERE name IS NULL;


--UPDATE ALL NULL ADDRESS TO 'Adresses are private information'

UPDATE people 
SET address = 'Adresses are private information'
WHERE address IS NULL;

--DELETE ALL RECORDS WHICH HAS NULL VALUE IN SSN...

DELETE
FROM people
WHERE ssn IS NULL;


--DELETE ALL RECORDS WHICH HAS NOT NULL VALUE IN ADDRESS..

DELETE FROM people
WHERE address IS NOT NULL;

SELECT * FROM people;



--  LIKE OPERATOR ---

--LIKE Operator is used with WILDCARDS....
--WILDCARD => useful expressions for search operations in SQL querries...


-- 1) % => percantage sign  can represent zero , many characters....
-- 2) - => underscore sign => it represent one single character....



 CREATE TABLE email_list(
	 email_id INT PRIMARY KEY,
	 email_address VARCHAR (50)
 );
 
 
 
 INSERT INTO email_list (email_id, email_address) 
 VALUES 
 		(1, 'alice*gmail.com'),
		(2, 'bob@example.com'),
		(3, 'charlie@hotmail.com'),
		(4, 'dave@gmail.com'),
		(5, 'eve@yahoo.com'),
		(6, 'frank@gmail.com'),
		(7, 'grace@example.com'),
		(8, 'john@outlook.com'),
		(9, 'emily@gmail.com'),
		(10, 'ava@yahoo.com');

 INSERT INTO email_list (email_id, email_address)  VALUES (11, 'neymar@gmail.com');

SELECT * FROM email_list;



--return all records that end with gmail.com....

SELECT * 
FROM email_list
WHERE email_address LIKE '%gmail.com';


--return all records which has start 'f';
SELECT * 
FROM email_list
WHERE email_address LIKE 'f%';


--return all records that start with 'John';

SELECT * 
FROM email_list
WHERE email_address ILIKE 'John%';  -- ILIKE DOES NOT CARE CASE SENSETIVE....


--RETURN ALL RECORD THAT 'v' anywhere...
SELECT * 
FROM email_list
WHERE email_address ILIKE '%V%';





-- ERROR:  missing FROM-clause entry for table "companies"
--LINE 1: ...mpany_employees WHERE company_employees.company = companies....
                                                             ^ 

--SQL state: 42P01
--Character: 77
