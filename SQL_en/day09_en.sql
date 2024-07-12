

--DAY 09 --

---------------------ALTER TABLE -------------------


--Alter Table is the keyword that we use to update/ change structure of the table
--ADD COLUMN => To add new column on the existing table...
--DROP COLUMN => to change the drop the existing column....
--RENAME COLUMN => to change the name of the existing column.....
--RENAME ... TO => Change the name of the table...
--ALTER COLUMN => To change data type, size etc. for existing column....


SELECT * FROM new_workers


--ADD new column 'age' with INT data type to the new_workers table....

ALTER TABLE new_workers
ADD COLUMN age INT;


-- ADD new column 'remote' with BOOLEAN DATA type and set it 'true'

ALTER TABLE new_workers
ADD COLUMN remote BOOLEAN DEFAULT true;  


--HOW TO MODIFY DATA TYPE----



--ADD new column 'country' with VARCHAR data type and set it 'US';

ALTER TABLE new_workers
ADD COLUMN country VARCHAR (30) DEFAULT 'US';

--DROP THE COLUMN 'AGE'...

ALTER TABLE new_workers
DROP COLUMN age;



--Change the data type of 'salary' field from smallint to REAL....

ALTER TABLE new_workers
ALTER COLUMN salary TYPE REAL;


--Change the name of the column 'salary' to 'income'

ALTER TABLE new_workers
RENAME COLUMN salary TO income;

--Change the data type of 'income' field from REAL to VARCHAR....
ALTER TABLE new_workers
ALTER COLUMN income TYPE VARCHAR;


--Change the data type of 'income' field back to REAL.....

ALTER TABLE new_workers          --error because sql does not allow auto-casting from String to Numeric data type.....
ALTER COLUMN income TYPE REAL; 

--Type Casting 

ALTER TABLE new_workers
ALTER COLUMN income TYPE REAL USING income :: REAL;  --no error because we are doing force the data type to real by USING income::real....



--Change the name of the table..... 'remote_workers'
ALTER TABLE new_workers
RENAME TO remote_workers;





SELECT * FROM remote_workers


---------------------------------------------------------------------

CREATE TABLE random (
	id VARCHAR (10),
	name VARCHAR (20),
	salary INT,
	address VARCHAR (60)

);

INSERT INTO random VALUES ('3', 'Tom', 9000, '23R, FL, US');
INSERT INTO random VALUES ('8', 'Ali', 8800, '65B, TX, US');
INSERT INTO random VALUES ('24', 'John', 9900, '21M, AZ, US');


SELECT * FROM random




--Change data type of salary column to REAL.....

ALTER TABLE random 
ALTER COLUMN salary TYPE REAL;


--Change data type of slary column FROM REAL TO VARCHAR 

ALTER TABLE random 
ALTER COLUMN salary TYPE VARCHAR

--Change data type of salary column from VARCHAR TO INT

ALTER TABLE random
ALTER COLUMN salary TYPE int USING salary::int;



---HOW TO MODIFY CONSTRAINTS-----


CREATE TABLE it_employees (  
  id CHAR(9), 
  name VARCHAR (30), 
  state VARCHAR (20), 
  company VARCHAR (20),
  number_of_employees numeric (5)
	
);


INSERT INTO it_employees VALUES(123456789, 'John Walker', 'Florida', 'IBM', 34500);
INSERT INTO it_employees VALUES(456789012, 'Veli Han', 'Arizona', 'GOOGLE', 90000);
INSERT INTO it_employees VALUES(234567890, 'Brad Pitt', 'Florida', 'APPLE', 45500);
INSERT INTO it_employees VALUES(345678901, 'Eddie Murphy', 'Texas', 'IBM', 23700);
INSERT INTO it_employees VALUES(567890123, 'Yusuf Arturk', 'Washington', 'APPLE', 45500);
INSERT INTO it_employees VALUES(589670123, 'Tuba Omar', 'Texas', 'MICROSOFT', 60000);
INSERT INTO it_employees VALUES(476589012, 'Brad Pitt', 'Texas', 'GOOGLE', 90000);
INSERT INTO it_employees VALUES(623456710, 'Mark Stone', 'Pennsylvania', 'IBM', 23700);
INSERT INTO it_employees VALUES(123456710, 'Ali Can', 'Pennsylvania', 'IBM', 25700);



SELECT * FROM it_employees


--ADD column name_of_ceo with data type VARCHAR TO THIS TABLE

ALTER TABLE it_employees
ADD COLUMN name_of_ceo VARCHAR (30);


--ADD THE CONSTRAINT 'NOT NULL'

ALTER TABLE it_employees
ALTER COLUMN name_of_ceo SET NOT NULL; -- NULL VALUE IS ALREADY EXISTING IN THIS TABLE...

--1ST WAY of update data
UPDATE it_employees
SET name_of_ceo = ''
WHERE name_of_ceo IS NULL;

--2ND 
UPDATE it_employees
SET name_of_ceo = 'Tom Hanks'
WHERE EXISTS (SELECT id FROM it_employees WHERE company = 'GOOGLE');


DROP TABLE it_employees;



--Create one more time it_employees table after droping....

CREATE TABLE it_employees (  
  id CHAR(9), 
  name VARCHAR (30), 
  state VARCHAR (20), 
  company VARCHAR (20),
  number_of_employees numeric (5)
	
);

--ADD new column as name_of_ceo

ALTER TABLE it_employees
ADD COLUMN name_of_ceo VARCHAR (30);

--ADD THE CONSTRAINT 'NOT NULL'

ALTER TABLE it_employees
ALTER COLUMN name_of_ceo SET NOT NULL; 



INSERT INTO it_employees VALUES(123456789, 'John Walker', 'Florida', 'IBM', 34500, 'Arvind Krishna');
INSERT INTO it_employees VALUES(456789012, 'Veli Han', 'Arizona', 'GOOGLE', 90000, 'Sundar Pichai');
INSERT INTO it_employees VALUES(234567890, 'Brad Pitt', 'Florida', 'APPLE', 45500, 'Tim Cook');
INSERT INTO it_employees VALUES(345678901, 'Eddie Murphy', 'Texas', 'IBM', 23700, 'Arvind Krishna');
INSERT INTO it_employees VALUES(567890123, 'Yusuf Arturk', 'Washington', 'APPLE', 45500, 'Tim Cook');
INSERT INTO it_employees VALUES(589670123, 'Tuba Omar', 'Texas', 'MICROSOFT', 60000, 'Satya Nadella');
INSERT INTO it_employees VALUES(476589012, 'Brad Pitt', 'Texas', 'GOOGLE', 90000, 'Sundar Pichai');
INSERT INTO it_employees VALUES(623456710, 'Mark Stone', 'Pennsylvania', 'IBM', 23700, 'Arvind Krishna');
INSERT INTO it_employees VALUES(123456710, 'Ali Can', 'Pennsylvania', 'IBM', 25700, 'Arvind Krishna');


SELECT * FROM it_employees


--ADD constaints NOT NULL to number_of_employees

ALTER TABLE it_employees
ALTER COLUMN number_of_employees SET NOT NULL; -- There is no error because number_of_employees does not have NULL.....


--Add new value in company field to check if our constraint are working or not.....

INSERT INTO it_employees (company) VALUES ('Oracle'); -- This will not work because we didnt add any value for number_of_employees.....


INSERT INTO it_employees (company, number_of_employees) VALUES ('Oracle', 50000); -- this will not work because this time we didnt add any value for name_of_ceo.....


INSERT INTO it_employees (company, number_of_employees, name_of_ceo) VALUES ('Oracle', 50000, 'Sandra Sahin'); 


--ADD UNIQUE constraint to id field....

ALTER TABLE it_employees
ADD CONSTRAINT id_constraint UNIQUE (id);


--add value '123456789' to id where company is ORACLE....

UPDATE it_employees
SET id = '123456789'
WHERE company ILIKE 'ORACLE' -- ID HAS DUPLICATE VALUES....

SELECT * FROM it_employees;
--------------------------------MODIFY SIZE------------------


--Size means number of character allowed in a field....


SELECT * FROM employees1;


--Add a column employee_address with string data type and size 5....
ALTER TABLE employees1
ADD COLUMN employee_address VARCHAR(5);

--ADD A VALUE

INSERT INTO employees1 VALUES (17, 'Tom', 'Hanks', 'US');



--Increase size of employee_address....
ALTER TABLE employees1
ALTER COLUMN employee_address TYPE VARCHAR(10);




--Decrease size of employee_address...
ALTER TABLE employees1
ALTER COLUMN employee_address TYPE VARCHAR(3);

INSERT INTO employees1 VALUES (18, 'Melik' ,'Sah','meliksah05');


ALTER TABLE employees1
ALTER COLUMN employee_address TYPE VARCHAR(10);

--DECREASE THE SIZE 
ALTER TABLE employees1
ALTER COLUMN employee_address TYPE VARCHAR(3);


UPDATE employees1
SET employee_address = LEFT(employee_address, 3)
WHERE LENGTH(employee_address) > 3

--RIGHT keyword is focus on the last part of the word....


SELECT * FROM employees1;


--------------------------JOINS---------------------------

--Joins are used to combine/join data from two or more tables.....

--They are always used with ON statement

--INNER JOIN; it returns common data from two tables according to given filter.....

--LEFT JOIN; it returns all values from first table  and common values according to the given filter.....

--RIGHT JOIN; it returns all values from second table and common values according to the given filter....


--FULL JOIN; int returns all data from BOTH tables according to the given filter....

--SELF JOIN; it works with single table, it works with it SELF.... and returns data according to the table given filter.....



CREATE TABLE my_companies(
  company_id CHAR(3),
  company_name VARCHAR(20)
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');

SELECT * FROM my_companies;



CREATE TABLE orders(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);

INSERT INTO orders VALUES(101, 11, '17-Apr-2023');
INSERT INTO orders VALUES(102, 22, '25-Nov-2023');
INSERT INTO orders VALUES(103, 33, '19-Jan-2023');
INSERT INTO orders VALUES(104, 44, '20-Aug-2023');
INSERT INTO orders VALUES(105, 55, '21-Oct-2023');


SELECT * FROM orders;

SELECT * FROM my_companies;


--Inner join
--Find company_name, order_id , order_date for company that exists in both tables...

SELECT my_companies.company_name, orders.order_id, orders.order_date
FROM my_companies INNER JOIN orders
ON my_companies.company_id = orders.company_id



--Left join 

--Find company_name, order_id , order_date for company from first table.....


SELECT  my_companies.company_name, orders.order_id, orders.order_date
FROM my_companies LEFT JOIN orders 
ON my_companies.company_id = orders.company_id



--Right Join

SELECT my_companies.company_name, orders.order_id, orders.order_date
FROM my_companies RIGHT JOIN orders
ON my_companies.company_id = orders.company_id


--FULL JOIN

SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc FULL JOIN orders o
ON mc.company_id = o.company_id



--SELF JOIN


CREATE TABLE jobs(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(40),
  manager_id CHAR(2)
);

INSERT INTO jobs VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO jobs VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO jobs VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO jobs VALUES(4, 'Amy Sky', 'CEO', 5);


SELECT * FROM jobs;


--fIND name of the manager of each employee 


SELECT j1.name, j2.name
FROM jobs j1 SELF JOIN jobs j2
ON  j1.manager_id = j2.id         -- self join is acceptable for ORACLE database




SELECT j1.name AS employee , j2.name as manager
FROM jobs j1 INNER JOIN jobs j2
ON  j1.manager_id = j2.id 