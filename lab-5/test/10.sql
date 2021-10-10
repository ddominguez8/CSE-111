-- How many customers from every region have never
-- placed an order and have less than the average account balance?

SELECT reg.r_name, COUNT(DISTINCT c_custkey) 
FROM customer, nation, region reg
WHERE c_nationkey = n_nationkey 
    AND n_regionkey = reg.r_regionkey 
    AND c_custkey NOT IN 
        (SELECT o.o_custkey 
        FROM orders o)
    AND c_acctbal < 
        (SELECT AVG(c.c_acctbal)
        FROM customer c)
GROUP BY r_name