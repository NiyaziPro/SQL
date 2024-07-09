CREATE TABLE sirketler(
sirket_id INT PRIMARY KEY,
sirket_ismi VARCHAR(50),
memur_sayisi INT
);
INSERT INTO sirketler(sirket_id,sirket_ismi,memur_sayisi)
VALUES(100,'Nokia',1000),
(101,'Iphone',900),
(102,'Samsung',1200),
(103,'xiaomi',1500);


-- Soru 1 : Samsungun memurlar sayisini en yuksek memurlar sayisi degerine esitleyin

UPDATE sirketler SET memur_sayisi = (SELECT MAX(memur_sayisi)FROM sirketler) WHERE sirket_ismi = 'Samsung';

SELECT * FROM sirketler;

-- Soru 2 : Nokia sirketinin memurlar sayisi değerini en düşük memurlar sayisi değerinin 1.5 katına esitleyin.

UPDATE sirketler SET memur_sayisi = ((SELECT MIN(memur_sayisi)FROM sirketler)*1.5)  WHERE sirket_ismi = 'Nokia';

-- Soru 3 : Iphonenin memurlar sayisini nokia ve xiaomi sirketlerinin memurlar sayisinin toplamına esıtleyın

UPDATE sirketler SET memur_sayisi = ((SELECT memur_sayisi FROM sirketler WHERE sirket_ismi = 'Nokia') + 
	(SELECT memur_sayisi FROM sirketler WHERE sirket_ismi = 'xiaomi'))WHERE sirket_ismi = 'Iphone';

UPDATE sirketler SET memur_sayisi = (SELECT SUM(memur_sayisi)FROM sirketler WHERE sirket_ismi IN('Nokia','xiaomi')) WHERE sirket_ismi = 'Iphone';

--soru 4 :Ortalama memurlar sayisi değerinden düşük olan memurlarin memur_sayisi değerlerini 400 artırın.

UPDATE sirketler SET memur_sayisi = memur_sayisi + 400  WHERE   memur_sayisi < (SELECT AVG(memur_sayisi)FROM sirketler);


-----------------------------------------------------------------------------



