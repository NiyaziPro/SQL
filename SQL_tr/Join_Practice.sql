--- SQL Practice ---

--Soru: inner join kullanarak employee_name ve manager_name leri gösteriniz

SELECT employees_table.name , manager_table.name FROM employees AS employees_table 
INNER JOIN employees AS manager_table ON manager_table.employee_id = employees_table.manager_id ;


drop table ogrenciler;
create table ogrenciler(
ogr_no int PRIMARY key, 
ogr_isim VARCHAR(30),
sinif int,
ders_id int)

insert into ogrenciler values(12,'Enes Erdem', 10, 1);
insert into ogrenciler values(33,'Melek Maden', 9, 3);
insert into ogrenciler values(54,'Burcu Deniz', 10, 8);
insert into ogrenciler values(18,'Polat Yildirim', 11, 2);
insert into ogrenciler values(42,'Defne Gumus', 12, 1);
insert into ogrenciler values(23,'Serpil Ates', 11, 4);
insert into ogrenciler values(45,'Mehmet Gunes', 9, 7);
insert into ogrenciler values(32,'Demet Bulut', 12, 6);
insert into ogrenciler values(68,'Fikret Yavuz', 10, 9);

create table ogretmenler(
ogrt_id int PRIMARY key,
ogrt_isim VARCHAR(30),
ders_id int
)

insert into ogretmenler values(101,'Adem Alan',6);
insert into ogretmenler values(102,'Filiz Denge',2);
insert into ogretmenler values(103,'Gulsen Basar',3);
insert into ogretmenler values(104,'Osman Kok',4);
insert into ogretmenler values(105,'Mustafa Altin',8);
insert into ogretmenler values(106,'Mine Mutlu',1);
insert into ogretmenler values(107,'Hale Haktan',5);

create table dersler(
ders_id int PRIMARY key,
ders_isim VARCHAR(30),
ders_saati INT)


insert into dersler values(1, 'Matemateik', 8);
insert into dersler values(2, 'Fizik', 6);
insert into dersler values(3, 'Kimya', 6);
insert into dersler values(4, 'Biyoloji', 4);
insert into dersler values(5, 'Edebiyat', 4);
insert into dersler values(6, 'Cografya', 2);
insert into dersler values(7, 'Tarih', 2);


--SORU1: tum dersleri ve varsa bu dersleri alan ogrencilerın isimlerini listeleyiniz
--LEFT JOIN
-- esas tablomuz nedir : dersler

SELECT ders_isim , ogr_isim FROM dersler LEFT JOIN ogrenciler ON ogrenciler.ders_id = dersler.ders_id;

--SORU2: tum ogrencileri ve varsa bu ogrencilerin aldıkları dersleri listeleyiniz
--LEFT JOIN
--esas tablomuz nedir : ogrenciler
SELECT ogr_isim , ders_isim FROM ogrenciler LEFT JOIN dersler ON dersler.ders_id = ogrenciler.ders_id ;

--SORU3: tum ogretmenleri ve varsa bu ogretmenlerin derslerini listeleyiniz
--LEFT JOIN
SELECT ogrt_isim , ders_isim FROM ogretmenler LEFT JOIN dersler ON dersler.ders_id = ogretmenler.ders_id;
--RIGHT JOIN
SELECT ogrt_isim , ders_isim FROM dersler RIGHT JOIN ogretmenler ON ogretmenler.ders_id = dersler.ders_id;

--SORU4: tum dersleri ve varsa bu derslerin ogretmenlerini listeleyiniz

SELECT ders_isim , ogrt_isim FROM dersler LEFT JOIN ogretmenler ON ogretmenler.ders_id = dersler.ders_id ;

--SORU5: tum ogretmenleri ve varsa  bu ogretmenlerin verdiği dersi alan ogrencilerin isimlerini listeleyiniz

SELECT ogrt_isim , ogr_isim FROM ogretmenler LEFT JOIN ogrenciler ON ogrenciler.ders_id = ogretmenler.ders_id;

SELECT ogrt_isim , ogr_isim FROM ogrenciler RIGHT JOIN ogretmenler ON ogretmenler.ders_id = ogrenciler.ders_id ;

--SORU6: ogrenciler tablosundaki ogrencilerden sadece
--dersler tablosundaki derslerden herhangi birini
--alan ogrenci isimlerini listeleyiniz

SELECT ogr_isim,  FROM ogrenciler INNER JOIN dersler ON dersler.ders_id = ogrenciler.ders_id ;

SELECT ogr_isim, ders_isim FROM ogrenciler INNER JOIN dersler ON dersler.ders_id = ogrenciler.ders_id ;

--SORU7: tum dersleri ve tum ogrenci isimlerini listeleyiniz

SELECT ders_isim , ogr_isim FROM dersler FULL JOIN ogrenciler ON ogrenciler.ders_id = dersler.ders_id;









