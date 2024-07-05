 --- Day 03 ---

/*Senaryo: "person" adinda bir tablo oluşturun.
person tablosu sütunları: 
id INTEGER, name VARCHAR(50), salary REAL, age INTEGER olsun. Salary 5000’den kucuk ve yas negatif girilemesin*/


CREATE TABLE person (
	id INTEGER,
	name VARCHAR(50),
	salary REAL CHECK (salary>5000), -- salary degeri 5000'den az olamaz
	age INTEGER CHECK (age>0) -- negatif deger kabul etmez
);


INSERT INTO person VALUES(11,'Ali Can',6000,35);
INSERT INTO person VALUES(11,'Ali Can',6000,-3); -- HATA : »person_age_check«
INSERT INTO person VALUES(11,'Ali Can',4000,45); -- HATA : »person_salary_check« 


/*Senaryo: "worker" ve "address" adlarinda iki tablo oluşturun.
worker tablosu sütunları: 
id CHAR(5), isim VARCHAR(50), maas INT, ise_baslama DATE
address tablosu sütunları:
adres_id CHAR(5), sokak VARCHAR(30), cadde VARCHAR(30), sehir VARCHAR(30)
Tablolari birbirine baglayarak, UNIQUE, NOT NULL uygulamasi yapiniz*/

CREATE table worker (id CHAR(5)PRIMARY KEY, isim VARCHAR(50) UNIQUE, maas INT NOT NULL, ise_baslama DATE NOT NULL);
CREATE TABLE address(adres_id CHAR(5), sokak VARCHAR(30), cadde VARCHAR(30), sehir VARCHAR(30), FOREIGN KEY(adres_id)REFERENCES worker(id));


INSERT INTO worker VALUES('10002', 'Donatello' ,12000, '2018-04-14');   --başarılı
INSERT INTO worker VALUES('10003', null, 5000, '2018-04-14');   --başarılı
--unique:NULL kabul eder
INSERT INTO worker VALUES('10004', 'Donatello', 5000, '2018-04-14');  --Hata: name:unique cunku. Unique-Constraint »worker_isim_key«
--Donatello iki defa gonderilemez
INSERT INTO worker VALUES('10005', 'Michelangelo', 5000, '2018-04-14');   --başarılı
INSERT INTO worker VALUES('10006', 'Leonardo', null, '2019-04-12'); --Hata, maas:NOT NULL cunku
INSERT INTO worker VALUES('10007', 'Raphael', '', '2018-04-14'); --Hata,maas:INT bekliyor, biz bos string gonderdik
INSERT INTO worker VALUES('', 'April', 2000, '2018-04-14');  --id:CHAR empty kabul eder
INSERT INTO worker VALUES('', 'Ms.April', 2000, '2018-04-14');  --Hata,PK:unique yani ikinci '' empty gonderemeyiz
INSERT INTO worker VALUES('10002', 'Splinter', 12000, '2018-04-14');  --Hata,PK:unique, 10002 daha once yuklenmisti
INSERT INTO worker VALUES(null, 'Fred', 12000, '2018-04-14');  --Hata,PK:NOT NULL,PK null kabul etmez
INSERT INTO worker VALUES('10008', 'Barnie', 10000, '2018-04-14');  --başarılı
INSERT INTO worker VALUES('10009', 'Wilma', 11000, '2018-04-14');  --başarılı
INSERT INTO worker VALUES('10010', 'Betty' ,12000, '2018-04-14');  --başarılı
INSERT INTO address VALUES('10003','Ninja Sok', '40.Cad.', 'IST'); --başarılı
INSERT INTO address VALUES('10003','Kaya Sok', '50.Cad.', 'Ankara'); --başarılı, FK null, duplicate kabul eder
INSERT INTO address VALUES('10002','Taş Sok', '30.Cad.', 'Konya');  --başarılı
INSERT INTO address VALUES('10012','Taş Sok', '30.Cad.', 'Konya');  --Hata: PK de 10012 yok
INSERT INTO address VALUES(NULL,'Taş Sok', '23.Cad.', 'Konya'); --başarılı
INSERT INTO address VALUES(NULL,'Taş Sok', '23.Cad.', 'Konya');  --başarılı



SELECT isim from worker where maas>5000;


/*Senaryo: "students1" adinda bir tablo oluşturun.
students1 tablosu sütunları: 
id INTEGER, isim VARCHAR(50), veli_isim VARCHAR(50), yazili_notu INTEGER
Tablo uzerinde cesitli silme islemleri yapiniz*/

CREATE TABLE students1(id INTEGER, isim VARCHAR(50), veli_isim VARCHAR(50), yazili_notu INTEGER);

INSERT INTO students1 VALUES(122, 'Kerem Can', 'Fatma',75),
(123, 'Ali Can', 'Hasan',75),
(124, 'Veli Han', 'Ayse',85),
(125, 'Kemal Tan', 'Hasan',85),
(126, 'Ahmet Ran', 'Ayse',95),
(127, 'Mustafa Bak', 'Can',99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);

-- id=123 olan kaydi silelim

DELETE FROM students1 WHERE id=123;

--ismi Kemal Tan olan kaydı silelim.

DELETE FROM students1 WHERE isim='Kemal Tan';

--ismi Ahmet Ran veya Veli Han olan kayıtları silelim

DELETE FROM students1 WHERE isim='Ahmet Ran' or isim = 'Veli Han';
delete from students1 where isim in('Ahmet Ran','Veli Han');-- yukardakinin alternatifi

SELECT * FROM students1;

DELETE FROM students1; -- tablonun icinde tum verileri siler

/*Senaryo: "students2" ve "grades2" adlarinda iki tablo oluşturun.

students2 tablosu sütunları: 
id int, isim VARCHAR(50), veli_isim VARCHAR(50), yazili_notu int

grades2 tablosu sütunları:
talebe_id int, ders_adi varchar(30), yazili_notu int

Tablolari birbirine baglayarak, ON DELETE CASCADE uygulamasi yapiniz*/

CREATE TABLE students2(id int primary key, isim VARCHAR(50), veli_isim VARCHAR(50), yazili_notu int);
CREATE TABLE grades2(talebe_id int, ders_adi varchar(30), yazili_notu int,
	constraint notlar_fk foreign key (talebe_id) references students2(id)on delete cascade );


INSERT INTO students2 VALUES
(122, 'Kerem Can', 'Fatma',75),
(123, 'Ali Can', 'Hasan',75),
(124, 'Veli Han', 'Ayse',85),
(125, 'Kemal Tan', 'Hasan',85),
(126, 'Ahmet Ran', 'Ayse',95),
(127, 'Mustafa Bak', 'Can',99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO grades2 VALUES 
 ('123','kimya',75),
 ('124', 'fizik',65),
 ('125', 'tarih',90),
 ('126', 'Matematik',90),
 ('127', 'Matematik',90),
 (null, 'tarih',90);



SELECT * FROM students2;
SELECT * FROM grades2;

DELETE FROM grades2 where talebe_id=123; -- Basarili

DELETE FROM grades2 where talebe_id=126;

delete from students2 where id=126;



delete from students2;
delete from grades2;


drop table grades2;


DROP TABLE if exists grades2;

/*Senaryo: "customers" adinda bir tablo oluşturun.
customers tablosu sütunları: 
urun_id INTEGER, musteri_isim VARCHAR(50), urun_isim VARCHAR(50)
Tablo uzerinde IN kullanimi yapiniz*/

CREATE TABLE customers(urun_id INTEGER, musteri_isim VARCHAR(50), urun_isim VARCHAR(50));

INSERT INTO customers VALUES (10, 'Mark', 'Orange');
INSERT INTO customers VALUES (10, 'Mark', 'Orange');
INSERT INTO customers VALUES (20, 'John', 'Apple');
INSERT INTO customers VALUES (30, 'Amy', 'Palm');
INSERT INTO customers VALUES (20, 'Mark', 'Apple');
INSERT INTO customers VALUES (10, 'Adem', 'Orange');
INSERT INTO customers VALUES (40, 'John', 'Apricot');
INSERT INTO customers VALUES (20, 'Eddie', 'Apple');

SELECT * FROM customers;

--customers tablosundan ürün ismi 'Orange', 'Apple' veya 'Apricot' olan verileri listeleyiniz

SELECT * FROM customers WHERE urun_isim IN('Orange', 'Apple', 'Apricot');

SELECT * FROM customers WHERE urun_id NOT BETWEEN 10 and 20;



/*Senaryo: "brands" ve "employees3" adinda iki tablo oluşturun.*/

CREATE TABLE brands
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO brands VALUES(100, 'Vakko', 12000);
INSERT INTO brands VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO brands VALUES(102, 'Adidas', 10000);
INSERT INTO brands VALUES(103, 'LCWaikiki', 21000);

CREATE TABLE employees3 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO employees3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO employees3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO employees3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO employees3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO employees3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO employees3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO employees3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


SELECT*FROM brands;
SELECT*FROM employees3;

-- employees3 tablosunda max maas degerini bulunuz.

SELECT MAX (maas) FROM employees3;

--employees3 tablosunda min maaş değerini bulunuz.

SELECT MIN (maas) FROM employees3;

--employees3 tablosunda toplam maaş değerini bulunuz.

SELECT SUM (maas) FROM employees3;

--employees3 tablosunda ortalama maaş değerini bulunuz.

SELECT AVG (maas) FROM employees3;

SELECT ROUND (AVG(maas),2) FROM employees3;

--employees3 tablosundaki kayıt sayısını bulunuz.

SELECT COUNT (maas) FROM employees3;


SELECT COUNT(*) FROM employees3; --7 , bu sorgu, NULL değerleri de dahil olmak üzere tablodaki tüm satırların sayısını döndürür.
SELECT COUNT(id) FROM employees3;    --id sutununda null degerler varsa sayilmaz

--employees3 tablosunda maaşı 2500 olanların kayıt sayısını bulunuz.

SELECT COUNT(*) FROM employees3 WHERE maas = 2500; 










