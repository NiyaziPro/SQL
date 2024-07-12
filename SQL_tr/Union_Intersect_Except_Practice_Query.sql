create table musteriler(
id int primary key,
isim varchar(50),
sehir varchar(50),
yas int 
);

insert into musteriler values(100, 'Ahmet Umit', 'Istanbul', 54);
insert into musteriler values(101, 'R.Nuri Guntekin', 'Antalya', 18);
insert into musteriler values(102, 'S.Faik Abasiyanik', 'Bursa', 14);
insert into musteriler values(103, 'Yasar Kemal', 'Istanbul', 26);
insert into musteriler values(104, 'Halide E. Adivar', 'Izmir', 35);
insert into musteriler values(105, 'Nazan Bekiroğlu', 'Izmir', 42);
insert into musteriler values(106, 'Peyami Safa', 'Antalya', 33);
insert into musteriler values(107, 'Sabahattin Ali', 'Istanbul', 41);
insert into musteriler values(108, 'Oguz Atay', 'Istanbul', 28);
insert into musteriler values(109, 'Orhan Pamuk', 'Ankara', 30);
insert into musteriler values(110, 'Elif Safak', 'Bursa',27);
insert into musteriler values(111, 'Kemal Tahir', 'Izmir', 29);



create table siparisler(
id int,
musteri_id int,
urun_adi varchar(50),
tutar int);



insert into siparisler values(3002, 101,'roman', 230);
insert into siparisler values(3004, 102,'tukenmez kalem', 80);
insert into siparisler values(3006, 109,'sirt cantasi', 440);
insert into siparisler values(3008, 103,'kursun kalem', 75);
insert into siparisler values(3009, 105,'cizgili defter', 250);
insert into siparisler values(3010, 108,'kol cantasi', 300);
insert into siparisler values(3011, 106,'masal kitabi', 175);
insert into siparisler values(3013, 107,'kareli defter', 145);
insert into siparisler values(3001, 111,'matematik kitabi',500);
insert into siparisler values(3003, 130,'cizgisiz defter', 145);


--SORU1: musteriler tablosunda sehir'i Istanbul olan veriler ya da yasi
--30dan buyuk olan verilerin isimlerini listeleyiniz

SELECT isim FROM musteriler WHERE sehir = 'Istanbul' OR yas >30 ;

SELECT isim FROM musteriler WHERE sehir = 'Istanbul'
UNION
SELECT isim FROM musteriler WHERE yas>30;

--SORU2: musteriler tablosunda id degeri 105ten kucuk olan verilerin isimlerini
--ve yası 20 ile 30 arasında olan verilerin sehirlerini listeleyiniz

SELECT isim FROM musteriler WHERE id<105
UNION
SELECT sehir FROM musteriler WHERE yas BETWEEN 20 AND 30 ;

--SORU3: siparisler tablosundaki k ile baslayan urunlerin urun adi ve musteri_idleri ile
--musteriler tablosundaki ismi O ile baslayan verilerin isim ve id lerini listeleyiniz

SELECT urun_adi , musteri_id FROM siparisler WHERE urun_adi ILIKE 'K%'
UNION
SELECT isim, id FROM musteriler WHERE isim ILIKE 'O%'


SELECT urun_adi , musteri_id FROM siparisler WHERE urun_adi ~* '^[K]'
UNION
SELECT isim, id FROM musteriler WHERE isim ~* '^[O]';

--SORU4: musteriler tablosundaki verilerden yası en buyuk 3. ve 6. verilerin tum bilgilerini listeleyin

(SELECT * FROM musteriler ORDER BY yas DESC OFFSET 2 LIMIT 1)
UNION
(SELECT * FROM musteriler ORDER BY yas DESC OFFSET 5 LIMIT 1);

--SORU5: musteriler tablosundan yası 30dan kucuk 
--olan verilerin id ve sehirleri ile
--siparisler tablosundan tutarı 250den buyuk 
--olan verilerin id ve urun_adi'larini listeleyiniz

SELECT id ,sehir AS sehir_urun_adi FROM musteriler WHERE yas<30
UNION ALL
SELECT id, urun_adi FROM siparisler WHERE tutar>250;

--SORU6: musteriler tablosundaki sehir ismi I ile baslayan verilerin isimlerini ve
--yas degeri 30dan cok olan verilerin isimlerini tekrarlı olacak sekilde listeleyiniz

SELECT isim FROM musteriler WHERE sehir ILIKE 'I%'
UNION ALL
SELECT isim FROM musteriler WHERE yas>30;

--SORU7: musteriler tablosundaki sehir'i Izmır olan verilerin id leri ile
--siparisler tablosundaki urun_adi cizgili defter olan verilerin musteri_idlerinin
--kesişimini(ortak olanları) bulunuz

SELECT id FROM musteriler WHERE sehir = 'Izmir'
INTERSECT
SELECT musteri_id FROM siparisler WHERE urun_adi = 'cizgili defter';

--SORU8: musteriler tablosundan sehri Istanbul veya Ankara olan verilerin idlerinin
--siparisler tablosundaki id'si 3010dan buyuk olan verilerin
--musteri_idlerinden farklı olanları listeleyiniz

SELECT id FROM musteriler WHERE sehir = 'Istanbul' OR sehir = 'Ankara' -- IN('Istanbul', 'Ankara')
EXCEPT
SELECT musteri_id FROM siparisler WHERE id>3010;

--except operatoru ilk sorgudan ikinci sorgunun sonucu cıkarir a/b fark kumesini verir

SELECT musteri_id FROM siparisler WHERE id>3010
EXCEPT
SELECT id FROM musteriler WHERE sehir IN('Istanbul', 'Ankara');



