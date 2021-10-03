--How many unique parts produced
-- by every supplier in CANADA are 
--ordered at every priority? 
--Print the supplier name, the 
--order priority, and the number
-- of parts.

-- thanks to Salvador Rodriguez, I was stuck on  
-- displaying s_name by the multiple o_orderpriorities, 
-- I thought GROUP BY worked as GROUP BY column_1 AND column_2, 
-- but I was wrong.


SELECT s_name, o_orderpriority, COUNT(DISTINCT l_partkey)
FROM part, partsupp, supplier, orders, lineitem
WHERE p_partkey = ps_partkey 
    AND ps_suppkey = s_suppkey
    AND s_nationkey = 3
    AND l_suppkey = s_suppkey 
    AND l_orderkey = o_orderkey 
GROUP BY s_name, o_orderpriority