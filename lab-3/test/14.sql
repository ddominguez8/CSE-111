--Find how many 1-URGENT 
--priority orders have been posted 
--by customers from BRAZIL between 
--1994 and 1997, combined.


SELECT COUNT(DISTINCT o_orderkey)
FROM orders, customer
WHERE o_orderpriority = '1-URGENT' 
AND o_custkey = c_custkey
AND c_nationkey = 2
AND o_orderdate BETWEEN '1994-01-01' 
AND '1997-12-31'