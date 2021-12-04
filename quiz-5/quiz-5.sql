PRAGMA foreign_keys = on;

SELECT "1----------";
.headers on
CREATE TABLE Classes (
    class CHAR(50) PRIMARY KEY,
    type CHAR(5),
    country CHAR(50) NOT NULL,
    numGuns INTEGER,
    bore INTEGER,
    displacement INTEGER,
    CHECK (type IN ('bb', 'bc'))
);
CREATE TABLE Ships (
    name CHAR(50) PRIMARY KEY,
    class CHAR(50) REFERENCES Classes(class) ON DELETE SET NULL,
    launched INTEGER
);
CREATE TABLE Battles (
    name CHAR(50) PRIMARY KEY,
    date DATE
);
CREATE TABLE Outcomes (
    ship CHAR(50) REFERENCES Ships(name) ON DELETE CASCADE ON UPDATE CASCADE,
    battle CHAR(50) REFERENCES Battles(name) ON DELETE CASCADE ON UPDATE CASCADE,
    result CHAR(10),
    CHECK (result IN ('ok','sunk','damaged'))
);
;
.headers off

SELECT "2----------";
.headers on
-- Classes Table 
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Bismark', 'bb', 'Germany', 8, 15, 42000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Iowa', 'bb', 'USA', 9, 16, 46000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Kongo', 'bc', 'Japan', 8, 14, 32000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('North Carolina', 'bb', 'USA', 9, 16, 37000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Renown', 'bc', 'Britain', 6, 15, 32000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Revenge', 'bb', 'Britain', 8, 15, 29000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Tennessee', 'bb', 'USA', 12, 14, 32000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Yamato', 'bb', 'Japan', 9, 18, 65000);

-- Ships Table
INSERT INTO Ships(name, class, launched) VALUES('California', 'Tennessee', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Haruna', 'Kongo', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Hiei', 'Kongo', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Iowa', 'Iowa', 1933);
INSERT INTO Ships(name, class, launched) VALUES('Kirishima', 'Kongo', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Kongo', 'Kongo', 1913);
INSERT INTO Ships(name, class, launched) VALUES('Missouri', 'Iowa', 1935);
INSERT INTO Ships(name, class, launched) VALUES('Musashi', 'Yamato', 1942);
INSERT INTO Ships(name, class, launched) VALUES('New Jersey', 'Iowa', 1936);
INSERT INTO Ships(name, class, launched) VALUES('North Carolina', 'North Carolina', 1941);
INSERT INTO Ships(name, class, launched) VALUES('Ramilies', 'Revenge', 1917);
INSERT INTO Ships(name, class, launched) VALUES('Renown', 'Renown', 1916);
INSERT INTO Ships(name, class, launched) VALUES('Repulse', 'Renown', 1916);
INSERT INTO Ships(name, class, launched) VALUES('Resolution', 'Revenge', 1916);
INSERT INTO Ships(name, class, launched) VALUES('Revenge', 'Revenge', 1916);
INSERT INTO Ships(name, class, launched) VALUES('Royal Oak', 'Revenge', 1916);
INSERT INTO Ships(name, class, launched) VALUES('Royal Sovereign', 'Revenge', 1916);
INSERT INTO Ships(name, class, launched) VALUES('Tennessee', 'Tennessee', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Washington', 'North Carolina', 1941);
INSERT INTO Ships(name, class, launched) VALUES('Wisconsin', 'Iowa', 1940);
INSERT INTO Ships(name, class, launched) VALUES('Yamato', 'Yamato', 1941);

-- Battles Table
INSERT INTO Battles(name, date) VALUES('Denmark Strait', '1941-05-24');
INSERT INTO Battles(name, date) VALUES('Guadalcanal', '1942-11-15');
INSERT INTO Battles(name, date) VALUES('North Cape', '1943-12-26');
INSERT INTO Battles(name, date) VALUES('Surigao Strait', '1944-10-25');

-- Outcomes Table
INSERT INTO Outcomes(ship, battle, result) VALUES('California', 'Surigao Strait', 'ok');
INSERT INTO Outcomes(ship, battle, result) VALUES('Kirishima', 'Guadalcanal', 'sunk');
INSERT INTO Outcomes(ship, battle, result) VALUES('Resolution', 'Denmark Strait', 'ok');
INSERT INTO Outcomes(ship, battle, result) VALUES('Wisconsin', 'Guadalcanal', 'damaged');
INSERT INTO Outcomes(ship, battle, result) VALUES('Tennessee', 'Surigao Strait', 'ok');
INSERT INTO Outcomes(ship, battle, result) VALUES('Washington', 'Guadalcanal', 'ok');
INSERT INTO Outcomes(ship, battle, result) VALUES('New Jersey', 'Surigato Strait', 'ok');
INSERT INTO Outcomes(ship, battle, result) VALUES('Yamato', 'Surigao Strait', 'sunk');
INSERT INTO Outcomes(ship, battle, result) VALUES('Wisconsin', 'Surigao Strait', 'damaged');
;

select * from Classes;
select * from Ships;
select * from Battles;
select * from Outcomes;
.headers off

SELECT "3----------";
.headers on
DELETE FROM Classes 
WHERE (displacement < 30000 OR numGuns < 8);
;

select * from Classes;
select * from Ships;
.headers off

SELECT "4----------";
.headers on
DELETE FROM Battles 
WHERE name = 'Guadalcanal';
;

select * from Battles;
select * from Outcomes;
.headers off

SELECT "5----------";
.headers on
UPDATE Battles
SET name = 'Strait of Surigao'
WHERE name = 'Surigao Strait';
;

select * from Battles;
select * from Outcomes;
.headers off

SELECT "6----------";
.headers on
DELETE FROM Ships
WHERE class IS NULL;
;

select * from Ships;
select * from Outcomes;
.headers off
