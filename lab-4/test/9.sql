--How many different order clerks 
--did the suppliers in UNITED STATES
--work with?

SELECT COUNT(DISTINCT o_clerk)
FROM nation, supplier, orders, lineitem
WHERE o_orderkey = l_orderkey 
    AND l_suppkey = s_suppkey
    AND s_nationkey = 24