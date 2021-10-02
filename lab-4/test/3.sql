--How many orders are posted 
--by customers in every country 
--in AMERICA?

SELECT n_name, COUNT(DISTINCT o_orderkey) 
FROM orders, customer, nation
WHERE o_custkey = c_custkey 
    AND c_nationkey = n_nationkey
    AND c_nationkey = 1 
UNION 
SELECT n_name, COUNT(DISTINCT o_orderkey) 
FROM orders, customer, nation
WHERE o_custkey = c_custkey 
    AND c_nationkey = n_nationkey
    AND c_nationkey = 2
UNION 
SELECT n_name, COUNT(DISTINCT o_orderkey) 
FROM orders, customer, nation
WHERE o_custkey = c_custkey 
    AND c_nationkey = n_nationkey
    AND c_nationkey = 3
UNION 
SELECT n_name, COUNT(DISTINCT o_orderkey) 
FROM orders, customer, nation
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey 
    AND c_nationkey = 17 
UNION 
SELECT n_name, COUNT(DISTINCT o_orderkey) 
FROM orders, customer, nation
WHERE o_custkey = c_custkey 
    AND c_nationkey = n_nationkey
    AND c_nationkey = 24
GROUP BY n_name
