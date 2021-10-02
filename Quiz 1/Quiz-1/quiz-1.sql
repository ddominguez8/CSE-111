-- SQLite
.headers on


--1
--What makers produce color Printers cheaper than $120
SELECT DISTINCT Product.maker 
FROM Product, Printer 
WHERE color = 1 
    AND Product.type = 'printer'
INTERSECT
SELECT DISTINCT Product.maker 
FROM Product, Printer 
WHERE Printer.price < '120'
    AND Product.model = Printer.model;

--2
-- What makers produce PCs but do not produce
-- Laptops and printers? 
SELECT DISTINCT maker
From product
WHERE type = 'pc'
EXCEPT
SELECT * from (
    SELECT DISTINCT Product.maker from Product
    WHERE Product.type = 'laptop' INTERSECT 
    SELECT DISTINCT Product.maker from Product
    WHERE Product.type = 'printer');

--3
-- every maker that makes pcs and laptops
-- find combo of pc + laptop that has max price
-- print maker, pc model, laptop model and combo price

--attempt was made here
-- SELECT maker, PC.model as PC_Model,
--     Laptop.Model as Laptop_Model,
--     MAX(PC.price), MAX(Laptop.price),
--     MAX(PC.price) + MAX(Laptop.price)
-- FROM PC, Laptop, Product
--     WHERE (

-- SELECT * from (
--     SELECT DISTINCT Product.maker from Product
--     WHERE Product.type = 'laptop' INTERSECT 
--     SELECT DISTINCT Product.maker from Product
--     WHERE Product.type = 'pc')

--makers that do l&pc: e,a,b,
--max price combo of a:2500 +2114 = 4614
--max price combo of b:1049 +1429
--max price combo of e:959 +3673 = 4632

-- SELECT maker
-- From product
-- WHERE type = 'pc'
-- INTERSECT
-- SELECT maker
-- FROM product
-- WHERE type = 'laptop';

--4
--what laptop screens are offered in
--at least 2 diff models
SELECT screen, model, COUNT(*) total_screens
FROM Laptop
GROUP BY screen
HAVING total_screens > 1;


--5
--what laptops are more expensive than 
--all pcs? print model and price
SELECT DISTINCT Laptop.model, Laptop.price
FROM PC, Laptop
WHERE Laptop.price > (SELECT MAX(price)
    FROM PC);

--6
--what makers produce at least a pc
--or laptop model and at least 2 
--printer models?

-- attempts were made here

-- SELECT DISTINCT maker
-- FROM Product, Printer
-- WHERE Product.type = 'pc' 
--     OR Product.type = 'laptop'
-- GROUP BY Product.type
-- HAVING COUNT(distinct Printer.model) >= 2

-- SELECT DISTINCT maker
-- FROM Product, Printer
-- GROUP BY Product.type
-- HAVING COUNT(DISTINCT Printer.model) >= 2


-- SELECT DISTINCT maker, COUNT(*) num_printers
-- FROM Product
-- GROUP BY type
-- HAVING num_printers >= 2


