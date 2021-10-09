-- 1. What makers produce Laptops cheaper than $2000 with a screen larger than 16?
SELECT maker
FROM Product P, Laptop L
WHERE price < 2000 
    AND screen > 16 
    AND L.model = P.model;

-- 2. What makers produce PCs but do not produce Laptops?
SELECT DISTINCT maker 
FROM Product 
WHERE maker NOT IN
    (SELECT maker 
    FROM Product
    WHERE type = 'laptop')
    AND type = 'pc'

-- 3. For every maker that sells both PCs and Printers, find the combination of 
-- PC and Printer that has maximum price.  Print the maker, the PC model, Printer model, 
-- and the combination price (PC price + Printer price)
-- Thanks to jackie who helped me out with this problem :D ! 
SELECT maker, PC.model as PC_Model, Printer.model as Printer_Model, MAX(PC.price + Printer.price) as Max_Combo
FROM Product, PC, Printer
WHERE maker IN
    (SELECT maker
    FROM Product
    WHERE Product.type = 'printer'
    AND Product.model = Printer.model)
AND maker IN
    (SELECT maker
    FROM Product
    WHERE Product.type = 'pc'
    AND Product.model = PC.model)
GROUP BY maker


-- 4. What Laptop hd sizes are offered in at least 2 different models?
SELECT hd
FROM Laptop 
GROUP BY hd 
    HAVING COUNT(DISTINCT model) >= 2

-- I found this in the Lecture files (with PC instead of Laptop) that does the same thing, cool!
SELECT DISTINCT L1.hd
FROM Laptop L1, Laptop L2 
WHERE L1.hd = L2.hd 
    AND L1.model < L2.model

-- 5. What PCs are less expensive than all the Laptops? 
-- Print the model and the price.
SELECT model, price
FROM PC
WHERE price < (SELECT MIN(price) FROM Laptop)
GROUP BY model

-- 6. What makers produce at least a Laptop model and at least 2 Printer models?
SELECT DISTINCT maker
FROM Product 
WHERE type = 'laptop'
INTERSECT
SELECT maker
FROM Product
WHERE type = 'printer'
GROUP BY maker
    HAVING COUNT(DISTINCT model) >= 2 