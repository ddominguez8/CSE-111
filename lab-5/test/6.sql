-- Based on the available quantity of items, who is the manufacturer 
-- pmfgr of the most popular item(the more popular an item is,
-- the less available it is in psavailqty) from Supplier#000000010?

SELECT p_mfgr
FROM partsupp p2, part
    WHERE p2.ps_partkey = p_partkey
    AND p2.ps_suppkey = 10
    AND p2.ps_availqty = 
        (SELECT MIN(p.ps_availqty)
        FROM partsupp p
            WHERE p2.ps_suppkey = p.ps_suppkey)