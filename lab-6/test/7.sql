-- Find  how  many  suppliers  have  less  than 
-- 50  distinct  orders  from  customers  in GERMANY 
-- and FRANCE together.

SELECT COUNT(DISTINCT s.s_suppkey) 
FROM supplier s
WHERE 50 >
    (SELECT COUNT(DISTINCT o.o_orderkey)
    FROM orders o, customer c, lineitem l
    WHERE o.o_custkey = c.c_custkey
        AND (c.c_nationkey = 7 
            OR c.c_nationkey = 6)
        AND l.l_orderkey = o.o_orderkey
        AND l.l_suppkey = s.s_suppkey)