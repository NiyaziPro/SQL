CREATE TABLE cities (
    city_name VARCHAR(50),
    plate_code INTEGER,
    population INTEGER
);


INSERT INTO cities (city_name, plate_code, population) VALUES ('Istanbul', 34, 15460000);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Ankara', 6, 5503985);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Izmir', 35, 4320519);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Adana', 1, 2237943);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Antalya', 7, 2426356);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Bursa', 16, 2936803);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Gaziantep', 27, 2028465);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Konya', 42, 2232374);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Mersin', 33, 1788487);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Kayseri', 38, 1413654);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Eskisehir', 26, 871187);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Diyarbakir', 21, 1752900);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Samsun', 55, 1356073);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Trabzon', 61, 808974);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Erzurum', 25, 762321);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Hatay', 31, 1600730);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Malatya', 44, 798033);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Sakarya', 54, 1030285);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Denizli', 20, 1049171);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Tekirdag', 59, 1085370);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Kocaeli', 41, 1889736);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Balikesir', 10, 1223021);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Aydin', 9, 1105216);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Manisa', 45, 1434188);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Sivas', 58, 636056);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Mugla', 48, 983142);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Ordu', 52, 761400);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Kirsehir', 40, 242196);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Kutahya', 43, 579257);
INSERT INTO cities (city_name, plate_code, population) VALUES ('Zonguldak', 67, 596892);


SELECT COUNT(city_name) FROM cities 