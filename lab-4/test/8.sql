--Find the number of distinct 
--orders completed in 1995 
--by the suppliers in every nation. 
-- An order status of F stands 
--for complete. Print only those 
--nations for which the number of
-- orders is larger than 50

SELECT n_name, 
    COUNT(DISTINCT o_orderkey) 
FROM supplier, nation, orders, 
    lineitem
WHERE o_orderdate BETWEEN '1995-01-01' 
    AND '1995-12-31'
    AND o_orderstatus = 'F'
    AND o_orderkey = l_orderkey 
    AND l_suppkey = s_suppkey 
    AND s_nationkey = n_nationkey
GROUP BY n_name 
    HAVING COUNT(DISTINCT o_orderkey) > 50