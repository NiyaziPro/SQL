 -- Day04 --

/*Senaryo: "brands" ve "employees3" adinda iki tablo oluşturun.*/

CREATE TABLE brands(
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

SELECT * FROM brands;
SELECT * FROM employees3;

--employees3 tablosunda max maaş değerini bulunuz.

SELECT MAX(maas) FROM employees3;  -- 7000

--employees3 tablosunda min maaş değerini bulunuz.

SELECT MIN(maas) FROM employees3; -- 1000

--employees3 tablosunda ortalama maaş değerini bulunuz.

SELECT AVG(maas) FROM employees3; -- 2714.2857142857142857

SELECT ROUND (AVG(maas),2) FROM employees3; -- 2714.29

--employees3 tablosundaki kayıt sayısını bulunuz.

SELECT COUNT(maas) FROM employees3; -- 7

--employees3 tablosunda toplam maaş değerini bulunuz.

SELECT SUM(maas) FROM employees3; --19000

--employees3 tablosunda maaşı 2500 olanların kayıt sayısını bulunuz.

SELECT COUNT(maas) FROM employees3 WHERE maas = 2500 ; --2


/*Senaryo: "workers" adinda bir tablo oluşturalim.
1-calisan_id sutun ismini id olarak degistirelim
2-calisan_isim sutun ismini isim olarak degistirelim
3-workers olan tablo ismini w olarak degistirelim*/

CREATE TABLE workers(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

--1-calisan_id sutun ismini id olarak degistirelim

SELECT calisan_id AS id FROM workers;

--2-calisan_isim sutun ismini isim olarak degistirelim

SELECT calisan_isim AS isim FROM workers;

--3-workers olan tablo ismini w olarak degistirelim

SELECT calisan_id AS id, calisan_isim isim, calisan_dogdugu_sehir dogum_yeri FROM workers AS w;

SELECT w FROM workers w;


/*Senaryo 1: marka_id si 100 olan firmada çalışanların bilgilerini listeleyiniz.*/

SELECT marka_isim FROM brands WHERE marka_id = 100;
SELECT * FROM employees3 WHERE isyeri = (SELECT marka_isim FROM brands WHERE marka_id = 100);

/*Senaryo 2: (INTERVIEW QUESTION) employees3 tablosunda max maaşı alan çalışanın tüm fieldlarını listeleyiniz.*/

SELECT * FROM employees3 WHERE maas = (SELECT MAX(maas) FROM employees3);


/*Senaryo 3: employees3 tablosunda max veya min maaşı alan çalışanların tüm fieldlarını gösteriniz.*/

SELECT * FROM employees3 WHERE maas = (SELECT MAX(maas) FROM employees3) OR maas = (SELECT MIN(maas) FROM employees3);


/*Senaryo 4: Ankara'da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.*/

SELECT marka_id , calisan_sayisi FROM brands WHERE  marka_isim IN (SELECT isyeri FROM employees3 WHERE sehir='Ankara');

/*Senaryo 5: marka_id'si 101’den büyük olan marka çalişanlarinin tüm bilgilerini listeleyiniz.*/

SELECT * FROM employees3 WHERE isyeri IN (SELECT marka_isim FROM brands WHERE marka_id>101);

/*Senaryo 6: Çalisan sayisi 15.000’den cok olan markalarin isimlerini, calisanlarin isimlerini ve maaşlarini listeleyiniz.*/

SELECT isyeri , isim , maas FROM employees3 WHERE isyeri IN(SELECT marka_isim FROM brands WHERE calisan_sayisi > 15000);


/* Senaryo 7 : Her markanin id'sini, ismini ve toplam kac sehirde bulundugunu listeleyen bir sorgu yaziniz.*/

SELECT marka_id , marka_isim, (SELECT COUNT(sehir)FROM employees3 WHERE isyeri = marka_isim) AS toplam_sehir FROM brands;


/*Senaryo 8: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minimum maasini listeleyen bir sorgu yaziniz */

SELECT marka_isim , calisan_sayisi , (SELECT MAX(maas)FROM employees3 WHERE isyeri = marka_isim)AS markaya_ait_Max_maas , 
	(SELECT MIN(maas)FROM employees3 WHERE isyeri = marka_isim)AS markaya_ait_Min_maas FROM brands;



CREATE TABLE march
(    
urun_id int,     
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO march VALUES (10, 'Mark', 'Honda');
INSERT INTO march VALUES (20, 'John', 'Toyota');
INSERT INTO march VALUES (30, 'Amy', 'Ford');
INSERT INTO march VALUES (20, 'Mark', 'Toyota');
INSERT INTO march VALUES (10, 'Adam', 'Honda');
INSERT INTO march VALUES (40, 'John', 'Hyundai');
INSERT INTO march VALUES (20, 'Eddie', 'Toyota');
CREATE TABLE april 
(    urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO april VALUES (10, 'Hasan', 'Honda');
INSERT INTO april VALUES (10, 'Kemal', 'Honda');
INSERT INTO april VALUES (20, 'Ayse', 'Toyota');
INSERT INTO april VALUES (50, 'Yasar', 'Volvo');
INSERT INTO april VALUES (20, 'Mine', 'Toyota');


SELECT * FROM march;
SELECT * FROM april;

/*Senaryo 1: "march" ve "april" adlarinda iki tablo oluşturunuz ve 
Mart ayında 'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.*/

SELECT * FROM april WHERE EXISTS (SELECT * FROM march WHERE urun_isim = 'Toyota');

/* Senaryo 2: Mart ayında 'Volvo' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.*/

SELECT * FROM april WHERE EXISTS (SELECT * FROM march WHERE urun_isim = 'Volvo');

/*Senaryo 3 : Mart ayinda satilan urunlerin urun_id ve musteri_isim'lerini
eger urun(urun_isim) Nisan ayinda da satilmissa, listeleyen bir sorgu yaziniz*/

SELECT urun_id , musteri_isim FROM march WHERE EXISTS (SELECT urun_isim FROM april WHERE april.urun_isim = march.urun_isim);

/*Senaryo 4 : Her iki ayda birden satilan urunlerin urun_isim'lerini, 
bu urunleri Nisan ayinda satin alan musteri_isim'lerine gore listeleyen bir sorgu yaziniz*/

SELECT urun_isim, musteri_isim FROM april WHERE EXISTS (SELECT urun_isim FROM march WHERE march.urun_isim = april.urun_isim);









