-- Day01--
-- one single line comments
/*
   if you wanna write multiple comments use this one.....
*/
--CREATE DATABASE WITH SQL QUERY
create database b101; --DDL (DATA DEFINITION LANGUAGE)
create database b102;
--DELETE DATABASE WITH SQL QUERY
DROP DATABASE b104;   --DATA DEFINITION LANGUAGE....
DROP DATABASE b101;
DROP DATABASE b102;
--CREATE TABLES WITH SQL QUERY
CREATE TABLE students (
      id CHAR (4),
	name VARCHAR (10),
	age INT,
	register_date DATE
);
-- TO SEE TABLE ON THE CONSOLE
SELECT * FROM students;
--to delete the table
DROP TABLE students;
--CREATE A TABLE FROM EXISTING TABLE
CREATE TABLE students1 AS SELECT id, name FROM students;
SELECT * FROM students1; -- DQL (DATA QUERY LANGUAGE) -- Because we are reading data by using SELECT command.....