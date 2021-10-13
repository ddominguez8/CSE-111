-- Find  how  many  distinct  customers  
-- have  at  least  one  order  supplied  
-- exclusively  by  suppliers  from AMERICA.

-- ima figure this out later

-- SELECT COUNT(DISTINCT c_custkey) 
-- FROM customer
-- WHERE 1 < 
--     (SELECT COUNT(DISTINCT o_orderkey)
--     FROM orders, supplier, lineitem
--     WHERE o_orderkey = l_orderkey 
--         AND l_suppkey = s_suppkey 
--         AND s_nationkey = 24
--         AND s_nationkey NOT BETWEEN 1 AND 23)