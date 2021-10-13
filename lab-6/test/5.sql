-- Find how many suppliers supply the most 
-- expensive part (pretailprice).

SELECT COUNT(s_suppkey)
FROM supplier, part, partsupp
WHERE p_retailprice = 
    (SELECT MAX(p.p_retailprice)
    FROM part p)
    AND p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey