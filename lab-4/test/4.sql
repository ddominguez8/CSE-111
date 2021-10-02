--How many parts with size
--below 20 does every supplier
--from CANADA offer? Print
--the name of the supplier 
--and the number of parts.

SELECT s_name, COUNT(DISTINCT p_partkey)
FROM part, partsupp, supplier
WHERE p_size < '20'
    AND p_partkey = ps_partkey 
    AND ps_suppkey = s_suppkey
    AND s_nationkey = 3
GROUP BY s_name
