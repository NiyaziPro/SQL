 -- Day06 --

/*Senaryo 1: greengrocer tablosundaki tüm isimleri ve her bir isim için, toplam ürün miktarını görüntüleyiniz.*/

CREATE TABLE greengrocer
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO greengrocer VALUES( 'Ali', 'Elma', 5);
INSERT INTO greengrocer VALUES( 'Ayse', 'Armut', 3);
INSERT INTO greengrocer VALUES( 'Veli', 'Elma', 2);  
INSERT INTO greengrocer VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO greengrocer VALUES( 'Ali', 'Armut', 2);  
INSERT INTO greengrocer VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO greengrocer VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO greengrocer VALUES( 'Ali', 'Armut', 2);  
INSERT INTO greengrocer VALUES( 'Veli', 'Elma', 3);  
INSERT INTO greengrocer VALUES( 'Ayse', 'Uzum', 2);

SELECT isim,SUM(urun_miktar) toplam_kg--toplam_kg alias'tir
FROM greengrocer GROUP BY isim;


/*Senaryo 2: greengrocer tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
Toplam ürün miktarına göre azalan olarak sıralayınız.*/
SELECT isim,SUM(urun_miktar) toplam_kg--toplam_kg alias'tir
FROM greengrocer GROUP BY isim ORDER BY(toplam_kg) DESC;

/*Senaryo 3: Her bir ismin aldığı, her bir ürünün toplam miktarını, isme göre sıralı görüntüleyiniz.*/
SELECT isim,urun_adi,SUM(urun_miktar)FROM greengrocer GROUP BY isim,urun_adi ORDER BY isim;

/*Senaryo 4: ürün adina göre, her bir ürünü alan toplam kişi sayısını gösteriniz.*/
SELECT urun_adi,COUNT(DISTINCT isim) FROM greengrocer GROUP BY urun_adi;

/*Senaryo 5: Isme göre, alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz*/
SELECT isim,SUM(urun_miktar) toplam_kg, COUNT(DISTINCT urun_adi)cesit_sayisi FROM greengrocer GROUP BY isim;


CREATE TABLE personel (
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(678901245, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel;

/*Senaryo 1: Her bir şirketin MIN maas bilgisini, bu bilgi eğer 4000 den fazla ise görüntüleyiniz.*/

SELECT sirket, MIN(maas) FROM personel GROUP BY sirket HAVING MIN(maas)>4000;

/*Senaryo 2: Maaşı 4000 den fazla olan çalışanlarin sirketlerini bulduktan sonra, 
bu sinirin ustunde olan MIN maas bilgisini her sirket icin görüntüleyiniz.*/

SELECT sirket , MIN(maas) FROM personel WHERE maas > 4000 GROUP BY sirket;

/*Senaryo 3: Her bir ismin aldığı toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gösteren sorgu yaziniz.*/

SELECT isim , SUM(maas) toplam_maas FROM personel GROUP BY isim HAVING SUM(maas) >10000;

/*Senaryo 4: Eğer bir şehirde çalışan personel(id) sayısı 1’den çoksa, sehir 
ismini ve personel sayısını veren sorgu yazınız*/

SELECT sehir, COUNT(DISTINCT id) FROM personel GROUP BY sehir HAVING COUNT( DISTINCT id)>1;


-- UNION ---
CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20),
city varchar(50),
age int 
);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Abdullah Berk','abdullah@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','btl@mail.com',4000,'C#','Bursa',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayse Gul','ayse@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ali Seker','ali@mail.com',4000,'C#','Ankara',29);
CREATE TABLE contact_info(
address_id int,
street varchar(30),
number int, 
city varchar(30),
FOREIGN KEY(address_id) REFERENCES developers(id) 
);
INSERT INTO contact_info VALUES(1,'Kaya Sok.',5,'Bursa');
INSERT INTO contact_info VALUES(2,'Kaya Sok.',3,'Ankara');
INSERT INTO contact_info VALUES(3,'Can Sok.',10,'Bursa');
INSERT INTO contact_info VALUES(4,'Gül Sok.',12,'Ankara');
INSERT INTO contact_info VALUES(5,'Can Sok.',4,'Afyon');
INSERT INTO contact_info VALUES(6,'Taş Sok.',6,'Bolu');
INSERT INTO contact_info VALUES(7,'Dev Sok.',6,'Sivas');
INSERT INTO contact_info VALUES(8,'Dev Sok.',8,'Van');


/*Senaryo 1: Ankara'da yaşayan developer ve İstanbul'da yaşayan çalışanların(employees4) isimlerini birlikte tekrarsız gösteren sorguyu yaziniz*/

SELECT name FROM developers WHERE city = 'Ankara'
UNION
SELECT isim FROM employees4 WHERE sehir='Istanbul';


/*Senaryo 2: Yaşı 25’den büyük olan developer isimlerini ve yaşı 30'dan küçük developerların kullandığı 
prog. dillerini birlikte tekrarlı gösteren sorguyu yaziniz*/

SELECT name FROM developers WHERE age>25
UNION ALL
SELECT prog_lang FROM developers WHERE age<30;

/*Senaryo 3: Java kullananların maaşı ile şehrini ve 
Vakko'da çalışanların maaşı ile şehrini tekrarsız gösteren sorguyu yaziniz*/

SELECT city, salary FROM developers WHERE prog_lang ='Java'
UNION
SELECT  sehir, maas FROM employees4 WHERE isyeri = 'Vakko';

/*Senaryo 4: id'si 8 olan developer'ın çalıştığı şehir ile maaşını ve iletişim adresindeki şehir ile kapı nosunu görüntüleyiniz.*/

SELECT city, salary FROM developers WHERE id = 8
	UNION
SELECT city, number FROM contact_info WHERE address_id = 8;


/****INTERSECT - intir sekt - kesisim - ortaklari getirir
  ***EXCEPT - ek sept- disinda, haric*/


/*Senaryo 1: Ankara'da yaşayan developer ve İstanbul'da yaşayan çalışanların(employees4) isimlerini birlikte tekrarsız gösteren sorguyu yaziniz*/


SELECT city FROM developers
INTERSECT
SELECT sehir FROM employees4;


/*Senaryo 2: developers tablosunda Java kullananların çalıştıkları şehirler ve employees4 tablosunda maaşı 1000 den fazla olanların sehirlerinden 
ortak olanlarını listeleyiniz.*/

SELECT city FROM developers WHERE prog_lang ='Java' 
INTERSECT
SELECT sehir FROM employees4 WHERE maas > 1000 ;


/*Senaryo 3: developers tablosundaki şehirleri,
employees4 tablosundaki sehirler hariç olarak listeleyiniz*/

SELECT city FROM developers
EXCEPT
SELECT sehir FROM employees4; 

/*Senaryo 4: employees4 tablosundaki şehirleri,
developers tablosundaki sehirler hariç olarak listeleyiniz*/

SELECT sehir FROM employees4
EXCEPT
SELECT city FROM developers; 


-- JOIN --

CREATE TABLE companies2 (
sirket_id int, 
sirket_isim varchar(20)
);
INSERT INTO companies2 VALUES(100, 'IBM');
INSERT INTO companies2 VALUES(101, 'GOOGLE');
INSERT INTO companies2 VALUES(102, 'MICROSOFT');
INSERT INTO companies2 VALUES(103, 'APPLE');
CREATE TABLE orders (
siparis_id int,
sirket_id int,
siparis_tarihi date
);
INSERT INTO orders VALUES(11, 101, '2023-02-17'); 
INSERT INTO orders VALUES(22, 102, '2023-02-18'); 
INSERT INTO orders VALUES(33, 103, '2023-01-19'); 
INSERT INTO orders VALUES(44, 104, '2023-01-20'); 
INSERT INTO orders VALUES(55, 105, '2022-12-21');

SELECT * FROM companies2;
SELECT * FROM orders;

/*Senaryo 1: Asagida bulunan iki tablodaki şirket id'si aynı olanların şirket id, şirket ismi, sipariş tarihini, sipariş id’sini  listeleyiniz.*/

SELECT companies2.sirket_id, sirket_isim , siparis_tarihi, siparis_id 
FROM companies2 INNER JOIN orders ON orders.sirket_id = companies2.sirket_id;

/*Senaryo 2: companies2 tablosundaki tüm kayıtların şirket id, şirket ismi,
sipariş tarihini, sipariş id’sini listeleyiniz.*/

SELECT companies2.sirket_id , sirket_isim , siparis_tarihi , siparis_id
FROM companies2 LEFT JOIN orders ON orders.sirket_id = companies2.sirket_id;


SELECT companies2.sirket_id , sirket_isim , siparis_tarihi , siparis_id
FROM orders RIGHT JOIN companies2 ON orders.sirket_id = companies2.sirket_id;

/*Senaryo 3: orders tablosundaki tüm kayıtların şirket id, şirket ismi,
sipariş tarihini, sipariş id'sini listeleyiniz.*/

SELECT orders.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM companies2 RIGHT JOIN orders ON companies2.sirket_id=orders.sirket_id ;

SELECT orders.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM orders LEFT JOIN companies2 ON companies2.sirket_id=orders.sirket_id ;

/*Senaryo 4: Her iki tablodaki tüm kayıtları listeleyiniz.*/

SELECT * FROM companies2 FULL JOIN orders ON companies2.sirket_id = orders.sirket_id;

SELECT * FROM orders FULL JOIN companies2 ON   orders.sirket_id = companies2.sirket_id;


-- SELF JOIN --

CREATE TABLE staff (
id int,
isim varchar(20),
title varchar(60),
yonetici_id int
);
INSERT INTO staff VALUES(1, 'Ali Can', 'SDET',    2);
INSERT INTO staff VALUES(2, 'Veli Cem', 'QA',     3);
INSERT INTO staff VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO staff VALUES(4, 'Fatma Can', 'CEO',   null);

/*Senaryo 5: Herbir personelin ismi ile birlikte yöneticisinin ismini de veren bir sorgu oluşturunuz.*/

SELECT p.isim , y.isim FROM staff AS p INNER JOIN staff AS y ON p.yonetici_id = y.id;




