-- Find how many parts are supplied by exactly 
-- two suppliers from UNITED STATES.

SELECT COUNT(DISTINCT p_partkey)
FROM part
WHERE 2 = 
    (SELECT COUNT(DISTINCT s_suppkey)
    FROM partsupp ps, supplier s
    WHERE ps.ps_suppkey = s.s_suppkey
        AND s_nationkey = 24
        AND p_partkey = ps.ps_partkey)