SELECT "1----------";
.headers on
CREATE TABLE Classes (
    class char(30) not null,
    type char(5) not null,
    country char(10) not null,
    numGuns integer not null,
    bore integer not null,
    displacement integer not null
);

CREATE TABLE Ships (
    name char(30) not null,
    class char(30) not null,
    launched integer not null
);

CREATE TABLE Battles (
    name char(30) not null,
    date date not null
);

CREATE TABLE Outcomes (
    ship char(30) not null,
    battle char(30) not null,
    result char(10) not null
);
;
.headers off

SELECT "2----------";
.headers on

INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Bismark', 'bb', 'Germany', 8, 15, 42000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Iowa', 'bb', 'USA', 9, 16, 46000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Kongo', 'bc', 'Japan', 8, 14, 32000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('North Carolina', 'bb', 'USA', 9, 16, 37000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Renown', 'bc', 'Britain', 6, 15, 32000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Revenge', 'bb', 'Britain', 8, 15, 29000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Tennessee', 'bb', 'USA', 12, 14, 32000);
INSERT INTO Classes(class, type, country, numGuns, bore, displacement) VALUES('Yamato', 'bb', 'Japan', 9, 18, 65000);

INSERT INTO Ships(name, class, launched) VALUES('California', 'Tennessee', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Haruna', 'Kongo', 1915);
INSERT INTO Ships(name, class, launched) VALUES('Hici', 'Kongo', 1915);
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

INSERT INTO Battles(name, date) VALUES('Denmark Strait', '1941-05-24');
INSERT INTO Battles(name, date) VALUES('Guadalcanal', '1942-11-15');
INSERT INTO Battles(name, date) VALUES('North Cape', '1943-12-26');
INSERT INTO Battles(name, date) VALUES('Surigao Strait', '1944-10-25');

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
.headers off

SELECT "3----------";
.headers on
-- still pending exec tree
SELECT c.country, COUNT(DISTINCT s.name)
FROM Ships s, Classes c
WHERE launched >= 1930
    AND launched <= 1940
    AND s.class = c.class
GROUP BY c.country
;
.headers off

SELECT "4----------";
.headers on
UPDATE Outcomes 
SET result = 'damaged' 
WHERE ship IN 
    (SELECT name 
    FROM Ships
    WHERE launched <= 1920)
    AND battle = 'Denmark Strait'
;
.headers off

SELECT "5----------";
.headers on
-- pending exec tree
SELECT c.country, COUNT(DISTINCT o.ship)
FROM Outcomes o, Classes c, Ships s
WHERE o.result = 'damaged' 
    AND o.ship = s.name 
    AND s.class = c.class 
GROUP BY c.country
;
.headers off

SELECT "6----------";
.headers on
--put your code here
;
.headers off

SELECT "7----------";
.headers on
--put your code here
;
.headers off

SELECT "8----------";
.headers on
--put your code here
;
.headers off

SELECT "9----------";
.headers on
--put your code here
;
.headers off

SELECT "10---------";
.headers on
--put your code here
;
.headers off

SELECT "11---------";
.headers on
--put your code here
;
.headers off

SELECT "12---------";
.headers on
--put your code here
;
.headers off

SELECT "13---------";
.headers on
--put your code here
;
.headers off

SELECT "14---------";
.headers on
--put your code here
;
.headers off

SELECT "15---------";
.headers on
--put your code here
;
.headers off

SELECT "16---------";
.headers on
--put your code here
;
.headers off

SELECT "17---------";
.headers on
--put your code here
;
.headers off
