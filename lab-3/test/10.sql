-- total price o_totalprice of 
-- orders made by customers of 
-- region: america in 1996

SELECT SUM(o_totalprice)
FROM orders, customer
WHERE o_custkey = c_custkey 
    AND (c_nationkey = 1
    OR c_nationkey = 2
    OR c_nationkey = 3
    OR c_nationkey = 24
    OR c_nationkey = 17)
    AND o_orderdate LIKE '1996-__-__'