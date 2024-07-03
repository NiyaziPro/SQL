----- Day 03 -----

-- CREATING TABLE IS DDL 

CREATE TABLE new_employees(
	id CHAR (5) PRIMARY KEY,
	name VARCHAR (40) UNIQUE,
	salary INT NOT NULL,
	start_date DATE
);

SELECT * FROM new_employees;  --USING SELECT KEYWORD IS DQL


--INSERTING DATA INTO A TABLE IS DML
INSERT INTO new_employees VALUES ('1002', 'Donatello', 12000, '2018-04-14');
INSERT INTO new_employees VALUES ('1003', null, 5000, '2018-04-14'); --Unique can accept null....
INSERT INTO new_employees VALUES ('1004', 'Donatello', 5000, '2020-04-14'); -- name data is not unique when you try to add .. So it will be error...
INSERT INTO new_employees VALUES ('1005', 'Michael Angelo', 11000, '2018-04-14');
INSERT INTO new_employees VALUES ('1006', 'Leonardo', null, '2019-03-24'); --salary should be not null, THIS WILL BE ERROR...
INSERT INTO new_employees VALUES ('1007', 'Raphael', '', '2022-11-23');  --ERROR BECAUSE DATA TYPE MISMATCH
INSERT INTO new_employees VALUES ('', 'April', 8000, '2022-04-14'); 
INSERT INTO new_employees VALUES ('', 'Miss April', 10000, '2023-06-19'); -- EMPTY IS VALUE THATS WHY WE ARE GETTING ERROR BECAUSE PRIMARY KEY IS UNIQUE
INSERT INTO new_employees VALUES ('1002', 'Splinter', 12000, '2024-03-14'); -- 1002 IS EXISTING, WE ARE GETTING ERROR...
INSERT INTO new_employees VALUES (null, 'Fred', 14000, '2022-05-16'); -- PRIMARY KEY WILL NOT ACCEPT NULL...
INSERT INTO new_employees VALUES ('1008', 'Barnie', 10000, '2023-11-26');
INSERT INTO new_employees VALUES ('1009', 'Wilma', 11000, '2023-11-30');
INSERT INTO new_employees VALUES ('1010', 'Betty', 13000, '2023-09-24');

SELECT * FROM new_employees; 


-- WE CREATED ONE MORE TABLE TO ESTABLISH RELATIONSHIP BETWEEN THE TABLES BY USING FK AND PK

CREATE TABLE addresses(
	address_id CHAR (5),
	dist VARCHAR (30),
	street VARCHAR (20),
	city VARCHAR (20),
	CONSTRAINT add_fk FOREIGN KEY (address_id) REFERENCES new_employees (id)
);

SELECT * FROM addresses; 

INSERT INTO addresses VALUES ('1003', 'Ninja Dist', '40.Cad.', 'Washington');
INSERT INTO addresses VALUES ('1003', 'Kaya Dist', '50.Cad.', 'Ankara');
INSERT INTO addresses VALUES ('1002', 'Tas Dist', '30.Cad.', 'Konya');
INSERT INTO addresses VALUES ('1012', 'Tas Sok', '30.Cad.', 'Konya'); --THIS WILL BE ERROR BECAUSE THERE IS NO 1012 DATA IN ID OF PARENT TABLE 
INSERT INTO addresses VALUES (Null, 'Tas Sok', '23.Cad.', 'Bursa');   --FOREIGN KEY CAN ACCEPT NULL 
INSERT INTO addresses VALUES (Null, 'Ninja Dist', '40.Cad.', 'Florida'); --FOREIGN KEY CAN ACCEPT DUPLICATE...
INSERT INTO addresses VALUES ('1005', 'DisneyLand', '30.Cad.', 'Florida');




--HOW TO READ SPECIFIC DATA FROM TABLE.....

SELECT * FROM addresses;
SELECT * FROM new_employees; 



-------how to filter data through SQL QUERIES---------

--WHERE CONDITIONS -----

--FROM new_employees table, display the record whose salary is greater than 8000...
SELECT * FROM new_employees
WHERE salary>8000;


-- From new_employees table, display the record whose salary is less than 8000
SELECT * FROM new_employees
WHERE salary<8000;


-- From new_employees table, display the record whose salary is 5000
SELECT * FROM new_employees
WHERE salary = 5000;


-- From new_employees table, display the record whose name is Donatello
SELECT * FROM new_employees
WHERE name = 'Donatello';


-- From addresses table, display the record whose id is 1003 and city Ankara
SELECT * FROM addresses
WHERE address_id='1003' AND city='Ankara';

-- From addresses table, display the record where city is 'Konya' or 'Bursa'
SELECT * FROM addresses
WHERE city='Konya' OR address_id='1003';






