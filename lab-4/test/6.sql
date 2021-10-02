--How many unique parts produced
-- by every supplier in CANADA are 
--ordered at every priority? 
--Print the supplier name, the 
--order priority, and the number
-- of parts.

--come back to it later

-- SELECT s_name, o_orderpriority, (DISTINCT l_partkey)
-- FROM part, partsupp, supplier, orders, lineitem
-- WHERE p_partkey = ps_partkey 
--     AND ps_suppkey = s_suppkey
--     AND s_nationkey = 3
--     AND s_suppkey = l_suppkey  