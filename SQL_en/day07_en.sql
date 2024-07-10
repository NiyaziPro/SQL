

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