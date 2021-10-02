--Find the number of orders 
--posted by every customer from
--GERMANY in 1993
SELECT c_name, COUNT(DISTINCT o_orderkey)
FROM orders, customer
WHERE o_custkey = c_custkey
    AND c_nationkey = 7
    AND o_orderdate BETWEEN '1993-01-01' 
    AND '1993-12-31'
GROUP BY c_name