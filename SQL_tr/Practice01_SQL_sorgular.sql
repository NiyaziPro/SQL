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


CREATE TABLE memurlar (
    memurlar_id Int PRIMARY Key,
    ad VARCHAR(100),
    sehir VARCHAR(50),
    sirket_ismi VARCHAR(100),
    calisma_performanslari VARCHAR(255)
);
INSERT INTO memurlar (memurlar_id,ad, sehir, sirket_ismi, calisma_performanslari)
VALUES
    (100,'Ali Yılmaz', 'Ankara', 'Samsung', 'Ortalama 67'),
    (101,'Ayşe Demir', 'İstanbul', 'Iphone', 'Ortalama 72'),
    (102,'Mehmet Kaya', 'İzmir', 'xiaomi', 'Ortalama 55'),
    (103,'Ali Can', 'Bursa' ,'Nokia', 'Ortalama 98'),
    (104,'Ahmet Kadir'  ,'Ankara',  'Nokia' ,'Ortalama 92.5'),
    (105,'Fatma Güzel'  ,'Giresun', 'Samsung'   ,'Ortalama 92.5'),
    (106,'Furkan Yılmaz', 'İzmir', 'xiaomi', 'Ortalama 99');

SELECT * FROM sirketler;
SELECT * FROM memurlar;

-- Soru 1 : memurlar sayisi 1200’den cok olan sirketlerin ve
--bu sirkette calisanlarin isimlerini ve calisma performanslarini listeleyin.

SELECT ad , calisma_performanslari FROM memurlar WHERE sirket_ismi IN (SELECT sirket_ismi FROM sirketler WHERE memur_sayisi >1200);

-- Soru 2 : Ortalama memurlar sayisi degerinden dusuk olan memurlarin memur_sayisi degerlerini 400 artitatak getirin.

SELECT (memur_sayisi+400) FROM sirketler WHERE memur_sayisi<(SELECT AVG(memur_sayisi)FROM sirketler);

-- Soru 3 : Ankara'da memurlari olan sirketlerin sirket id'lerini ve memurlar sayilarini listeleyiniz

SELECT sirket_id , memur_sayisi FROM sirketler WHERE sirket_ismi IN (SELECT sirket_ismi FROM memurlar WHERE sehir = 'Ankara');

-- Soru 4 : eger giresunda bir tane bile memur varsa tum sirketleri yazdirin

SELECT * FROM sirketler WHERE EXISTS (SELECT ad FROM memurlar WHERE sehir = 'Giresun');



