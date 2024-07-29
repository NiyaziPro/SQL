 --- Transaction ---

-- Transaction : DB'e en kucuk islem birimidir
--		BEGIN  :  transaction'i baslatir
--		COMMIT : transaction'i onaylar ve sonlandirir
-- 		SAVEPOINT : kayit noktasi olusturur
-- 		ROLLBACK  : degisikleri mevcut duruma geri dondurur, transaction'i sonlandirir

-- pgAdmin : Auto-Commit

CREATE TABLE hesaplar (hesap_no INT UNIQUE, isim VARCHAR(50), bakiye REAL); -- tablo olusturma tek bir transaction icinde olur

INSERT INTO hesaplar VALUES(123,'Barnie',10000.3),(124,'Fred',9000.5),(125,'Wilma',8000.5),(126,'Betty',7000.5);

DELETE FROM hesaplar WHERE hesap_no = 123;
DELETE FROM hesaplar WHERE hesap_no = 124;


UPDATE hesaplar SET bakiye = bakiye-1000 WHERE hesap_no = 126;
-- sistemde hata olustu
UPDATE hesaplar SET bakiye = bakiye+1000 WHERE hesap_no = 125;

----------------------------------------------------------------------------------------------

--Negatif Senaryo --

BEGIN;
CREATE TABLE hesaplar2 (hesap_no INT UNIQUE, isim VARCHAR(50), bakiye REAL);

COMMIT;

INSERT INTO hesaplar2 VALUES(123,'Barnie',10000.3),(124,'Fred',9000.5),(125,'Wilma',8000.5),(126,'Betty',7000.5);

BEGIN;

DELETE FROM hesaplar2 WHERE hesap_no = 123;
DELETE FROM hesaplar2 WHERE hesap_no = 124;

ROLLBACK;

BEGIN;

UPDATE hesaplar2 SET bakiye = bakiye-1000 WHERE hesap_no = 126;
-- sistemde hata olustu
UPDATE hesaplar2 SET bakiye = bakiye+1000 WHERE hesap_no = 125;

ROLLBACK;


SELECT * FROM hesaplar2;

-------------------------------------------------------------------------------------------------

-- Pozitif Senaryo -- ABORT

--try{
UPDATE hesaplar2 SET bakiye = bakiye-1000 WHERE hesap_no = 126;

UPDATE hesaplar2 SET bakiye = bakiye+1000 WHERE hesap_no = 125;

COMMIT;
--}catch(){ 
--sistemde hata olustu 
ROLLBACK; --}

-----------------------------------------------------------------------------------------------

BEGIN;
CREATE TABLE hesaplar3 (hesap_no INT UNIQUE, isim VARCHAR(50), bakiye REAL);

COMMIT;

INSERT INTO hesaplar3 VALUES(123,'Barnie',10000.3),(124,'Fred',9000.5),(125,'Wilma',8000.5),(126,'Betty',7000.5);

SAVEPOINT x;


DELETE FROM hesaplar3 WHERE hesap_no = 123;
DELETE FROM hesaplar3 WHERE hesap_no = 124;


UPDATE hesaplar3 SET bakiye = bakiye-1000 WHERE hesap_no = 126;
UPDATE hesaplar3 SET bakiye = bakiye+1000 WHERE hesap_no = 125;

ROLLBACK TO x; -- x noktasindan sonraki degisiklikler iptal olur
ROLLBACK ; -- en son haline doner , transactiondaki tum degisiklikler iptal olur


SELECT * FROM hesaplar3;










