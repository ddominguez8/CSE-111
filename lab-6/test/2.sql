-- Find the number of customers who had at
-- least three orders in November 1995 (oorderdate).

SELECT COUNT(DISTINCT c_custkey)
FROM customer, orders
WHERE c_custkey = o_custkey
    AND 3 <= 
    (SELECT COUNT(DISTINCT o.o_orderkey)
    FROM orders o
    WHERE o.o_orderdate LIKE '1995-11-%'
        AND o.o_custkey = c_custkey)