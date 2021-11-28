CREATE VIEW PriceRange(maker, type, minPrice, maxPrice)
AS
SELECT pr.maker, pr.type, MIN(pc.price), MAX(pc.price)
FROM PC pc, Product pr
WHERE pr.model = pc.model
GROUP BY pr.maker
UNION 
SELECT pr.maker, pr.type, MIN(l.price), MAX(l.price)
FROM Laptop l, Product pr
WHERE pr.model = l.model 
GROUP BY pr.maker
UNION 
SELECT pr.maker, pr.type, MIN(p.price), MAX(p.price)
FROM Printer p, Product pr
WHERE pr.model = p.model 
GROUP BY pr.maker;

SELECT * 
FROM PriceRange
ORDER BY maker, type ASC;

INSERT INTO PC(maker, model, speed, ram, hd, price) VALUES(? ? ? ? ? ?)

INSERT INTO Product(maker, model, type) VALUES (

UPDATE Printer 
SET price = ? 
WHERE model = ? 

DELETE FROM Laptop
WHERE model = ?