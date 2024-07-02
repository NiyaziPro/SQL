/*Senaryo: "actors1" adında bir tablo oluşturun ve şu sütunları ekleyin:
id INTEGER
name VARCHAR(30) 
surname VARCHAR(30)
film VARCHAR(50)
Not: Id'yi primary key olarak belirleyin*/


create table actors1(
id  INTEGER primary key,
name VARCHAR(30), 
surname VARCHAR(30),
film VARCHAR(50));

/*Senaryo: "actors2" adında bir tablo oluşturun ve şu sütunları ekleyin:
id INTEGER
name VARCHAR(30) 
surname VARCHAR(30)
film VARCHAR(50)
Not: Id'yi primary key olarak belirleyin*/

create table actors2(
id  INTEGER ,
name VARCHAR(30), 
surname VARCHAR(30),
film VARCHAR(50),
constraint act_pk primary key(id));

create table company(
job_id integer  ,
name varchar(30) ,
company varchar (30),
constraint com_pk primary key (job_id,name));


/*Senaryo: "companies" ve "employees" adlarinda iki tablo oluşturun.
companies tablosu sütunları: 
sirket_id INTEGER, sirket VARCHAR(50), personel_sayisi INTEGER
employees tablosu sütunları:
id INTEGER, isim VARCHAR(50), sehir VARCHAR(50), maas REAL, sirket VARCHAR(50)*/


CREATE TABLE companies(
	sirket_id INTEGER, 
	sirket VARCHAR(50)  PRIMARY KEY,
	personel_sayisi INTEGER);

CREATE TABLE employees(
	id INTEGER, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas REAL, 
	sirket VARCHAR(50),
	CONSTRAINT emp_fk FOREIGN KEY(sirket) REFERENCES companies(sirket));





