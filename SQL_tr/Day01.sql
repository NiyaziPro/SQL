--Day01--

/*Senaryo: "students" adında bir tablo oluşturun ve şu sütunları ekleyin:
id INTEGER: Öğrencinin benzersiz kimlik numarası.
name VARCHAR(20): Öğrencinin adı (maksimum 20 karaktere kadar değişken uzunluk).
grade REAL: Öğrencinin notu (ondalikli sayı tipinde).
register_date DATE: Öğrencinin kayıt tarihi .*/

Create Table students
	(id Integer,
	name varchar(20),
	grade real,
	register_date date);

/*Senaryo: "Teachers" adında bir tablo oluşturun ve şu sütunları ekleyin:

id INTEGER: öğretmenin benzersiz kimlik numarası.
name VARCHAR(20): öğretmenin adı (maksimum 20 karaktere kadar değişken uzunluk).

register_date DATE: Öğretmenin kayıt tarihi .*/

Create Table teachers
	(id Integer,
	name varchar(25),
	register_date date);

drop table teachers;