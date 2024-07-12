


--DAY 07--

-- NOT LIKE OPERATOR 


CREATE TABLE words( 
  word_id CHAR(10) UNIQUE,
  word VARCHAR(30) NOT NULL,
  number_of_letters SMALLINT
);


INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'learn', 5);
INSERT INTO words VALUES (1010, 'techpro', 7);
INSERT INTO words VALUES (1011, 'Selami' ,6);
INSERT INTO words VALUES (1012, 'Elmas' ,5);
INSERT INTO words VALUES (1012, 'Elmas' ,5);
INSERT INTO words VALUES (1013, 'Elma' ,4);
INSERT INTO words VALUES (1014, 'Elsma' ,5);
INSERT INTO words VALUES (1015, 'Elmsa' ,5);


SELECT * FROM words;

--FIND words which do not have end with 't' and 'f';

SELECT * 
FROM words
WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';

--Find the words which do not have 'a' and 'e' as second character in the word column...

SELECT *
FROM words
WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%';



--find the words whose first character is 'h', second character can be only 'o', 'a' or 'i' and the last character must be 't'

--1st way
SELECT *
FROM words
WHERE word LIKE 'ho%t' OR word LIKE 'ha%t' OR word LIKE 'hi%t';



--2nd way  --better way...
SELECT *
FROM words
WHERE REGEXP_LIKE (word, 'h[oai](.*)t' ); 



--NOTES about REGEX WITH LIKE OPERATOR----

-- 1)REGEXP_LIKE = we use this operator for search operation..
/*
SELECT 
FROM table_name
WHERE REGEXP_LIKE (column_name , 'pattern');


    2. we can use REGEX OPERATOR WITH ~ sign 
	
	SELECT * 
	FROM table_name
	WHERE column_name ~ 'pattern';
	
	Symbols
	(.*) similiar with %, and looks for multiple characters => works the same way %,
	$ => last character....
	
	^ => if you use this sign on outside of the bracelet, it means you declare the first character....
      => you can use also NOT means
    . => stores one character.....
	
	


*/


--3rd way


   
SELECT *
FROM words
WHERE word ~ 'h[aoi](.*)t';


--4th way to use $ sign 
SELECT *
FROM words
WHERE word ~ 'h[aoi](.*)t$';


--Find words whose first character is any 'a' , 's', or 'y'....

SELECT *
FROM words
WHERE word ~ '^[asy].*';

--Find words whose first character is NOT 'a', 's' or 'y';


SELECT *
FROM words
WHERE word ~ '^[^asy].*';


--Find words whose last character is 'm', 'o' or 'a'


SELECT *
FROM words
WHERE word ~'(.*)[moa]$';

--Find words which start with 's' and ends with 'a'

--1st way
SELECT *
FROM words
WHERE word ~ '^[s](.*)[a]$';



--2nd way 
SELECT * 
FROM words 
WHERE word ~ 's(.*)';

--3ND WAY 

SELECT * 
FROM words
WHERE word ~* '^S(.*)a$';



--Find words which start with 't' or 's' and end with 'a' or 'o';

SELECT *
FROM words
WHERE word ~ '^[ts](.*)[ao]$'


----CONCATENATION IN SQL------

CREATE TABLE employees1 (  
  employee_id numeric(9), 
  employee_first_name VARCHAR(20),
  employee_last_name VARCHAR(20)
); 


INSERT INTO employees1 VALUES(14, 'Chris', 'Tae');
INSERT INTO employees1 VALUES(11, 'John', 'Walker');
INSERT INTO employees1 VALUES(12, 'Amy', 'Star');
INSERT INTO employees1 VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees1 VALUES(15, 'Chris', 'Way');

SELECT * FROM employees1;


--Merge first and last name as Full name, we are doing concatenation......
--How can we do that? We are using ||' '|| ....

SELECT employee_first_name ||' '|| employee_last_name AS Full_Name
FROM employees1;


--MERGE ID, first_name and last_name as FULL INFO

SELECT employee_id ||'-'|| employee_first_name ||' '|| employee_last_name AS full_info
FROM employees1;

Select * from company_employees;

-------------- HOMEWORK ----------------
-- 1. Find names which does not start with ‘E’ and does not end with ‘y’ from company_employees table.

SELECT *
FROM company_employees
WHERE name ~ '^[^E](.*)[^y]$';



-- 2. Find names whose first character is not ‘J’, ‘B’ or ‘E’ and last character is not ‘r’ or ‘t’ from company_employees table.

SELECT *
FROM company_employees
WHERE name ~ '^[^JBE](.*)[^rt]$';



-- 3. Find names which start with chars from ‘A’ to ‘F’ and third character is ‘a’ from company_employees table.

SELECT *
FROM company_employees
WHERE name ~ '^[A-F].a(.*)';




---------------------------------------GROUP BY CLAUSE-----------------------------------------

--It is used for grouping the data together in one field...
--It mostly used with AGGERAGATE FUNCTIONS......

CREATE TABLE shopping_list (
    item_id SERIAL PRIMARY KEY,
    category VARCHAR(50),
    item_name VARCHAR(50),
    price DECIMAL(8, 2)
);


INSERT INTO shopping_list (category, item_name, price)
VALUES
    ('Fruits', 'Apple', 1.50),
    ('Vegetables', 'Tomato', 1.00),
    ('Dairy', 'Milk', 2.25),
    ('Bakery', 'Muffin', 1.50),
    ('Meat', 'Chicken', 5.50),
    ('Vegetables', 'Carrot', 0.75),
    ('Meat', 'Mutton', 6.80),
    ('Dairy', 'Cheese', 3.75),
    ('Fruits', 'Banana', 0.99),
    ('Bakery', 'Croissant', 2.00),
    ('Bakery', 'Baguette', 2.20),
    ('Meat', 'Salmon', 9.99),
    ('Fruits', 'Grapes', 2.50),
    ('Vegetables', 'Broccoli', 1.25),
    ('Dairy', 'Butter', 2.50),
    ('Dairy', 'Yogurt', 1.99),
    ('Vegetables', 'Spinach', 1.80),
    ('Fruits', 'Orange', 1.25),
    ('Bakery', 'Bread', 1.80),
    ('Meat', 'Beef', 7.20);


SELECT * FROM shopping_list;


--Find how much is the total price of each category.....

SELECT category, SUM(price)
FROM shopping_list
GROUP BY category
ORDER BY SUM(price) DESC;



--Find average price for each category....

SELECT category, ROUND(AVG(price) , 1)
FROM shopping_list
GROUP BY category;



--Find min, max price and total number of items for each category

SELECT category, MIN(price) AS Min_price, MAX(price) AS Max_Price, COUNT(item_id)
FROM shopping_list
GROUP BY category;





--Find total salary for each employee from company_employees table.....

SELECT * FROM company_employees;


SELECT name, AVG(salary)
FROM company_employees
GROUP BY salary;




--Find number of employees per state in descending order (according number of employees)


SELECT state, COUNT(name)
FROM company_employees
GROUP BY state
ORDER BY COUNT(name) DESC;



SELECT state, COUNT(name) AS number_of_employees
FROM company_employees
GROUP BY state
ORDER BY number_of_employees DESC;































































