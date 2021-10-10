-- Count the number of distinct suppliers that supply 
-- parts whose type contains POLISHED and have size 
-- equal to any of 3, 23, 36, and 49.

SELECT COUNT(DISTINCT s_suppkey) 
FROM supplier, part, partsupp
WHERE (p_size = '3' 
    OR p_size = '23' 
    OR p_size = '36'
    OR p_size = '49')
    AND p_partkey = ps_partkey 
    AND ps_suppkey = s_suppkey 
    AND p_type LIKE '%POLISHED%'