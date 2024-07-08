

--DAY 05---


-- HOW TO GET THE DATA OF THE PERSON WHO IS GETTING 3RD LOWEST SALARY

SELECT * FROM workers
WHERE worker_salary = (SELECT MIN(worker_salary) FROM workers 
					   WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers
											 WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers)));


SELECT * FROM workers;


--ORDER BY CLAUSE


-- Find the SECOND highest salary by using ORDER BY CLAUSE
SELECT * FROM workers
ORDER BY worker_salary DESC
LIMIT 2  -- YOU NEED TO DECLARE ABOUT HOW MANY ROWS YOU WANNA SEE ON THE CONSOLE
OFFSET 1 -- YOU NEED TO DECLARE ABOUT HOW MANY ROWS YOU WANNA IGNORE/SKIP.....


--SECOND WAY TO FIND SPECIFIC DATA.....
SELECT * FROM workers
ORDER BY worker_salary ASC
OFFSET 2 ROW 
FETCH NEXT 1 ROW ONLY;


--FIND THE 4TH HIGHEST SALARY BY USING ORDER BY CLAUSE

SELECT * FROM workers
ORDER BY worker_salary DESC
LIMIT 1
OFFSET 3;


----NOTES----
--subquery is universal language....
--ORDER BY- OFFSET is most commonly used in MYSql and PostGreSql, Oracle. So those are not universal.....
--ORDER BY SORTS THE DATA IN ASCENDING ORDER BY DEFAULT.... If we wanna change to order to Descend, we must add DESC keyword....

  
CREATE TABLE customers_products (
  product_id INT,
  customer_name VARCHAR(30),
  product_name VARCHAR(30)
);

INSERT INTO customers_products VALUES (10, 'Mark Twain', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark Wilson', 'Mango');
INSERT INTO customers_products VALUES (20, 'John Clark', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy Williams', 'Plum');
INSERT INTO customers_products VALUES (20, 'Mark Donne', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adam Smith', 'Orange');
INSERT INTO customers_products VALUES (40, 'John Evans', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie Murphy', 'Apple');
INSERT INTO customers_products VALUES (30, 'Anna Goldman', 'Mango');
INSERT INTO customers_products VALUES (50, 'Helen Green', 'Grapes');
INSERT INTO customers_products VALUES (10, 'Laura Owen', 'PineApple');



SELECT * FROM customers_products;


--IN AND NOT IN OPERATORS


--Find the records that has 'Orange', 'Mango' , 'Apple'

--1st way not recommended 
SELECT * 
FROM customers_products
WHERE product_name = 'Orange' OR product_name = 'Mango' OR product_name = 'Apple';


--2nd way
SELECT * 
FROM customers_products
WHERE product_name IN ('Orange', 'Mango','Apple');


---NOT IN------

--Find records that does not have 'Orange', 'Plum' and 'Apricot' as their product name.....

--1st way not recommend  <>   != 
SELECT * 
FROM customers_products
WHERE product_name <> 'Plum' AND product_name <> 'Orange' AND product_name <> 'Apricot';


--2ND way 
SELECT *
FROM customers_products
WHERE product_name NOT IN ('Plum','Orange', 'Apricot');


---BETWEEN AND NOT BETWEEN-----

--Between; starting value and ending value inclusive in the range...

--Not between; starting value and ending value exclusive in the range...


--Find the products name where product_id is greater than or equal to 20 and less than or equal to 50;....

--1st way not recommended...
SELECT *
FROM customers_products
WHERE product_id >= 20 AND product_id<=50;


--2nd way
SELECT *
FROM customers_products
WHERE product_id BETWEEN 20 AND 50;



-- Find the records whose product_id less than 20 and greater than 40;

SELECT *
FROM customers_products
WHERE product_id <20 OR product_id >40;



SELECT * 
FROM customers_products
WHERE product_id NOT BETWEEN 20 AND 40;


CREATE TABLE customers_likes(
  product_id CHAR(10),
  customer_name VARCHAR(50),
  liked_product VARCHAR(50)
);

INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');

SELECT * FROM customers_likes;