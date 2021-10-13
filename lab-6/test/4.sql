-- Find how many suppliers from UNITED 
-- STATES supply more than 40 different parts.

SELECT COUNT(DISTINCT supp.s_suppkey)
FROM supplier supp
WHERE 40 < 
    (SELECT COUNT(DISTINCT p.p_partkey)
    FROM supplier s, partsupp ps, part p
    WHERE p.p_partkey = ps.ps_partkey
    AND ps.ps_suppkey = s.s_suppkey
    AND s.s_nationkey = 24
    AND supp.s_suppkey = s.s_suppkey)