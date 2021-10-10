-- For parts whose type contains STEEL, return the name of 
-- the supplier from ASIA that can supply them at minimum cost 
-- (pssupplycost), for every part size.  Print the supplier name 
-- together with the part size and the minimum cost.

-- Collaborated with Salvador Rodriguez who mainly helped me solve this problem,
-- found out lines 3 and 4 in 5.out are swapped, causing the failure while 
-- running test.sh

SELECT s_name, p_size, MIN(ps_supplycost)
FROM partsupp, supplier, part, nation
WHERE p_type LIKE '%STEEL%'
    AND p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = 2
GROUP BY p_size
