CREATE TABLE toptancilar
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203,'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');
CREATE TABLE malzemeler  --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT FK FOREIGN KEY (ted_vergino) REFERENCES toptancilar (vergi_no) on delete cascade
);
INSERT INTO malzemeler VALUES (201, 1001, 'Laptop', 'Asli Can');
INSERT INTO malzemeler VALUES (202, 1002, 'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES (202, 1003, 'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES (202, 1004, 'Laptop', 'Veli Tan');

--SORU-4: Malzemeler tablosundaki musteri_isim'i Asli Can olan kaydin malzeme_isim'ini,
    --toptancılar tablosunda irtibat_ismi 'Adem Coş' olan kaydin sirket_ismi ile güncelleyiniz.

SELECT sirket_ismi FROM toptancilar WHERE irtibat_ismi = 'Adem Coş' ;

UPDATE malzemeler SET malzeme_isim = (SELECT sirket_ismi FROM toptancilar WHERE irtibat_ismi = 'Adem Coş') WHERE musteri_isim = 'Asli Can'

SELECT * FROM malzemeler ;
SELECT * FROM toptancilar ;


