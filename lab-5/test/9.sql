-- Print the name of the parts supplied by suppliers from
-- UNITED STATES that have total value in the top 1% total
-- values across all the supplied parts.  The total value is 
-- pssupplycost*psavailqty.  Hint:Use the LIMIT keyword.
-- note: group by and order by are so confusing to work with

SELECT p_name 
FROM supplier, partsupp, part
WHERE p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey
    AND s_nationkey = 24
GROUP BY p_name
ORDER BY MAX(ps_supplycost*ps_availqty) DESC
LIMIT 5