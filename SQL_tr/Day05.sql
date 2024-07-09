
-- DAY05 --

CREATE TABLE employees4 (
id INT UNIQUE,
isim VARCHAR(50),
sehir VARCHAR(50),
maas INT,
isyeri VARCHAR(20)
);
INSERT INTO employees4 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO employees4 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO employees4 VALUES(345678901, null, 'Ankara', 3000, 'Vakko');
INSERT INTO employees4 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO employees4 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO employees4 VALUES(678901234, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO employees4 VALUES(789012345, 'Fatma Yasa', null, 2500, 'Vakko');
INSERT INTO employees4 VALUES(890123456, null, 'Bursa', 2500, 'Vakko');
INSERT INTO employees4 VALUES(901234567, 'Ali Han', null, 2500, 'Vakko');


SELECT * FROM employees4;

/*Senaryo 1: employees4 adli bir tablo olusturunuz. id'si 123456789 olan çalışanın isyeri ismini 'Trendyol' olarak güncelleyiniz.*/

UPDATE employees4 SET isyeri = 'Trendyol'  WHERE id = 123456789;

/*Senaryo 2: id'si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve sehrini 'Bursa' olarak güncelleyiniz.*/

UPDATE employees4 SET isim = 'Veli Yilmaz' , sehir = 'Bursa' WHERE id = 567890123;


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


/*Senaryo 3: markalar tablosundaki marka_id değeri 102’ye eşit veya büyük olanların marka_id'sini 2 ile çarparak değiştirin.*/

UPDATE brands SET marka_id = marka_id * 2 WHERE marka_id >= 102 ;

SELECT * FROM brands ;


/*Senaryo 4: brands tablosundaki tüm markaların calisan_sayisi değerlerini marka_id ile toplayarak güncelleyiniz.*/

UPDATE brands SET calisan_sayisi = marka_id + calisan_sayisi;

/*Senaryo 5: employees4 tablosundan Ali Seker'in isyerini, 567890123 id'li çalışanın isyeri ismi ile güncelleyiniz.*/

UPDATE employees4 SET isyeri = (SELECT isyeri FROM employees4 WHERE id = 567890123) WHERE isim = 'Ali Seker';

/*Senaryo 6: employees4 tablosunda maasi 1500 olanların isyerini, markalar tablosunda marka_id=100 olan markanın ismi ile değiştiriniz.*/

UPDATE employees4 SET isyeri = (SELECT marka_isim FROM brands WHERE marka_id =100) WHERE maas =1500;


-- Ornek 1: employees4 tablosunda isim sutunu null olanlari listeleyiniz

SELECT * FROM employees4 WHERE isim IS NULL;

--Ornek 2: employees4 tablosunda isim sütunu null olmayanları listeleyiniz.

SELECT * FROM employees4 WHERE isim IS NOT NULL;

--Ornek 3: employees4 tablosunda isim sütunu null olanların isim değerini 'isimsiz' olarak güncelleyiniz.

UPDATE employees4 SET isim = 'isimsiz' WHERE isim  IS NULL;


/*Senaryo 1: person tablosundaki tüm kayıtları adrese göre (artan sirada) sıralayarak listeleyiniz.*/

CREATE TABLE person
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), 
adres varchar(50)
);
INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir'); 
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa'); 
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara');


SELECT * FROM person;

/*Senaryo 1: person tablosundaki tüm kayıtları adrese göre (artan sirada) sıralayarak listeleyiniz.*/

SELECT * FROM person ORDER BY adres;

/*Senaryo 2: person tablosundaki tüm kayıtları soyisime göre (azalan) sıralayarak listeleyiniz.*/

SELECT * FROM person ORDER BY  soyisim DESC;

/*Senaryo 3: person tablosundaki tüm kayıtları isme göre azalan, soyisme göre artan sekilde sıralayarak listeleyiniz.*/

SELECT * FROM person ORDER BY isim DESC , soyisim ASC;

/*Senaryo 4: person tablosunda isim ve soyisim değerlerini, soyisim kelime uzunluklarına göre sıralayarak listeleyiniz.*/

SELECT isim, soyisim FROM person ORDER BY LENGTH(soyisim);

/*Senaryo 5: person tablosunda, tüm isim ve soyisim değerlerini aralarında
bir boşluk ile aynı sutunda çağırarak, her bir isim ve soyisim değerinin toplam uzunluğuna göre sıralayınız.*/

SELECT CONCAT(isim,' ',soyisim) FROM person ORDER BY LENGTH (isim) + LENGTH(soyisim);

/*Senaryo 6 : employees4 tablosunda maasi ortalama maastan yuksek olan calisanlarin isim, sehir ve maaslarini maasa gore artan sekilde yazdirin*/

SELECT AVG(maas) FROM employees4;
SELECT isim , sehir , maas FROM employees4 WHERE maas >(SELECT AVG(maas) FROM employees4) ORDER BY maas;












