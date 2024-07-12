--SORU-5: malzeme_ismi Laptop olan kaydin musteri_isim'ini, sirket_ismi Apple'olan toptancinin 
--irtibat_isim'i ile güncelleyiniz.


create table arac ( 
id int,
marka varchar (30),
model varchar(30), 
fiyat int,
kilometre int, 
vites varchar(20)
);
insert into arac values (100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values (101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values (102, 'Honda', 'Civic', 400000, 15000, 'Manuel' );
insert into arac values (103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );  
insert into arac values (104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values (105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values (106, 'Bugatti', 'Veyron', 950008, 5000, 'Otomatik' );

--SORU-6: arac tablosundaki en yüksek fiyat'ı listele   


--Soru-7: arac tablosundaki araçların toplam fiyatını bulunuz

--Soru-8: arac tablosundaki fiyat ortalamalarını bulunuz

--Soru-9:arac tablosunda kaç tane araç olduğunu bulunuz





CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisin VARCHAR(50), 
meslek CHAR(9), 
maas int
);

INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000'); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', '17008'); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000'); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13008'); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000'); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', '10000' ); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', '14000');

select * from meslekler;
drop table meslekler;

--Soru-10: meslekler tablosunu isime göre sıralayınız


--Soru-11: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız


--Soru-12: meslekler tablosunda ismi Ali olanların maaşıni büyükten küçüğe doğru sıralayınız    


--Soru-13: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz


--Soru-14: meslekler tablosunda maaşı en yüksek 3 kişinin bilgilerini getiriniz



CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisin VARCHAR(50), 
meslek CHAR(9), 
maas int
);

INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000'); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', '17008'); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000'); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13008'); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000'); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', '10000' ); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', '14000');

select * from meslekler;
drop table meslekler;

--Soru-10: meslekler tablosunu isime göre sıralayınız


--Soru-11: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız


--Soru-12: meslekler tablosunda ismi Ali olanların maaşıni büyükten küçüğe doğru sıralayınız	


--Soru-13: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz


--Soru-14: meslekler tablosunda maaşı en yüksek 3 kişinin bilgilerini getiriniz