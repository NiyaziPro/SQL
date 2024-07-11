
-- Day07 --  

-- LIKE Condition --

SELECT * FROM developers ;

SELECT * FROM developers WHERE name = 'Ayse Gul' ;
	
SELECT * FROM developers WHERE name LIKE 'A%' ; -- Buyuk kucuk harf duyarli

SELECT * FROM developers WHERE name iLIKE 'a%' ; -- ignore case

--Ismi T ile başlayıp n harfi ile biten dev isimlerini ve maaşlarını yazdiran QUERY yazin

SELECT name , salary FROM developers WHERE name LIKE 'T%n' ;

--Ismi soyismi içinde 'an' olan dev isimlerini ve soyisimlerini ve maaşlarını yazdiran QUERY yazin

SELECT name , salary FROM developers WHERE name LIKE '%an%' ;

--Ismi içinde e ve a olan developerlarin tüm bilgilerini yazdiran QUERY yazin

SELECT * FROM developers WHERE name LIKE '%e%a%' ;

SELECT * FROM developers WHERE name LIKE '%e%a%' OR name LIKE '%a%e%';


-- underscore(_)=sadece 1 karakteri temsil eder.

--Isminin ikinci harfi u olan developerlarin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM developers WHERE name LIKE '_u%' ;

--Kullandığı prog. dili 4 harfli ve üçüncü harfi v olan developerlarin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM developers WHERE prog_lang LIKE '__v_';

--Kullandığı prog. dili en az 5 harfli ve ilk harfi J olan developerlarin tum bilgilerini yazdiran QUERY yazin.

SELECT * FROM developers WHERE prog_lang LIKE 'J%____%';

--isminin 2. harfi e,4. harfi y olan developerlarin tum bilgilerini yazdiran QUERY yazin.

SELECT * FROM developers WHERE name LIKE '_e_y%';

--ismi boşluk içeren developerlarin tum bilgilerini yazdiran QUERY yazin.

SELECT * FROM developers WHERE name LIKE '% %';


--Regular Expressions (Regex) Duzenli Ifadeler

--   (~) tilda sembolu- yaklasik , (~~) operatörü, LIKE operatörüne eşdeğerdir. Tırnak işareti kullanımı, metinsel veriler için gereklidir. 


CREATE TABLE words
(
 word_id int UNIQUE,
 word varchar(50) NOT NULL,
 number_of_letters int
);
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'Hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selim', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'hAt', 3);
INSERT INTO words VALUES (1010, 'yaf', 5);
INSERT INTO words VALUES (1011, 'ahata', 3);

SELECT * FROM words ;

--h harfinden sonra a veya i harfini sonra ise t harfini içeren kelimelerin tum bilgilerini yazdiran QUERY yaziniz.

SELECT * FROM words WHERE word ~ 'h[ai]t'; 

SELECT * FROM words WHERE word ~* 'h[ai]t'; 

--h harfinden sonra, a ile k arasindaki harflerden birini, sonra da t harfini içeren kelimelerin tum bilgilerini yazdiran QUERY yaziniz.

SELECT * FROM words WHERE word ~* 'h[a-k]t' ;

-- Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM words WHERE word ~* '[mi]'; 


-- ^:kelimenin başlangıcını gösterir
-- $:kelimenin sonunu gösterir
--a ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM words WHERE  word ~*'^a';



-- STRING Manipulation -- 

CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar(50),
age int,	
city varchar(20),
course_name varchar(20),
salary real	
);

INSERT INTO teachers VALUES(111,'AhmeT  ','  Han',35,'Istanbul','SpringMVC',5000);
INSERT INTO teachers VALUES(112,'Mehmet','Ran ',33,'Van','HTML',4000);
INSERT INTO teachers VALUES(113,' Bilal','Fan ',34,'Bursa','SQL',3000);
INSERT INTO teachers VALUES(114,'Celal',' San',30,'Bursa','Java',3000);
INSERT INTO teachers VALUES(115,'Deniz',' Can',30,'Istanbul','SQL',3500);
INSERT INTO teachers VALUES(116,'ekreM','Demir',36,'Istanbul','Java',4000.5);
INSERT INTO teachers VALUES(117,'Fatma','Celik',38,'Van','SpringBOOT',5550);
INSERT INTO teachers VALUES(118,'Hakan','Cetin',44,'Izmir','Java',3999.5);
INSERT INTO teachers VALUES(119,'mert','Cetin',32,'Izmir','HTML',2999.5);
INSERT INTO teachers VALUES(120,'Nilay','Cetin',32,'Izmir','CSS',2999.5);
INSERT INTO teachers VALUES(121,'Selma','Celik',40,'Ankara','SpringBOOT',5550);
INSERT INTO teachers VALUES(122,'fatiH','Can',32,'Ankara','HTML',2550.22);
INSERT INTO teachers VALUES(123,'Nihat','Keskin',32,'Izmir','CSS',3000.5);
INSERT INTO teachers VALUES(124,'Hasan','Temel',37,'Istanbul','S.Security',3000.5);

SELECT * FROM teachers ;

1——————————————————————————————
--teachers tablosundaki tüm kayıtların
--firstname değerlerini büyük harfe,
-- lastname değerlerini küçük harfe çevirerek,
--uzunlukları ile birlikte listeleyiniz.

SELECT UPPER(firstname)AS f_name ,LENGTH(firstname), LOWER(lastname) AS l_name,  LENGTH(lastname) FROM teachers ;

2——————————————————————————————
--teachers tablosunda firstname ve lastname değerlerindeki
--başlangıç ve sondaki boşlukları kaldırınız.

UPDATE teachers SET firstname = TRIM(firstname), lastname = TRIM(lastname);

3——————————————————————————————
--teachers tablosunda tüm kayıtların firstname değerlerini
-- ilk harfini büyük diğerleri küçük harfe çevirerek görüntüleyiniz.

SELECT INITCAP(firstname) FROM teachers ;

4——————————————————————————————
--teachers tablosunda firstname değerlerinde 'Celal' kelimesini 'Cemal' ile değiştiririniz.

UPDATE teachers SET firstname = REPLACE(firstname,'Celal','Cemal');


--LIMIT / OFFSET - FETCH NEXT n ROW ONLY

--Senaryo 1: developers tablosundan ekleme sırasına göre ilk 3 kaydı getiriniz.

SELECT * FROM developers LIMIT 3;

SELECT * FROM developers FETCH NEXT 3 ROW ONLY ;

/*Senaryo 2: developers tablosundan ekleme sırasına göre ilk 2 kayıttan sonraki ilk 3 kaydı getiriniz.*/
SELECT * FROM developers OFFSET 2  LIMIT 3;

/*Senaryo 3: developers tablosundan maaşı en düşük ilk 3 kaydı getiriniz.*/

SELECT * FROM developers ORDER BY salary LIMIT 3;

/*Senaryo 4: developers tablosundan maaşı en yüksek 2. developerın tüm bilgilerini getiriniz.*/

SELECT * FROM developers ORDER BY salary DESC OFFSET 1 LIMIT 1;


-- ALTER TABLE - DDL --

/*Senaryo 1: employees4 tablosuna yas (int) seklinde yeni sutun ekleyiniz.*/

ALTER TABLE employees4 ADD COLUMN yas INTEGER;


SELECT * FROM employees5 ;

/*Senaryo 2: employees4 tablosuna remote (boolean) seklinde yeni sutun ekleyiniz.
varsayılan olarak remote değeri TRUE olsun*/

ALTER TABLE employees4 ADD COLUMN remote BOOLEAN DEFAULT TRUE;

/*Senaryo 3: employees4 tablosunda remote sutununu siliniz.*/

ALTER TABLE employees4 DROP COLUMN remote;

ALTER TABLE employees4 DROP COLUMN yas;

/*Senaryo 4: employees4 tablosundaki maas sutununun data tipini  real olarak güncelleyiniz.*/


ALTER TABLE employees4 ALTER COLUMN maas TYPE REAL;

/*Senaryo 5: employees4 tablosundaki maas sutununun ismini gelir olarak güncelleyiniz.*/

ALTER TABLE employees4 RENAME COLUMN maas TO gelir ; 

/*Senaryo 6: employees4 tablosunun ismini employees5 olarak güncelleyiniz.*/

ALTER TABLE employees4 RENAME TO employees5 ;

/*Senaryo 7: employees5 tablosunda id sütununun data tipini varchar(20) olarak güncelleyiniz.*/

ALTER TABLE employees5 ALTER COLUMN id TYPE VARCHAR(20) ; 

/*Senaryo 8: employees5 tablosunda id sütununun data tipini int olarak güncelleyiniz.*/

ALTER TABLE employees5 ALTER COLUMN id TYPE INTEGER USING id::INTEGER ;

/*Senaryo 9: employees5 tablosunda isim sütununa NOT NULL constrainti ekleyiniz.*/

ALTER TABLE employees5 ALTER COLUMN isim SET NOT NULL ;





























