--Find the number of suppliers 
--from every region.

SELECT r_name, COUNT(DISTINCT s_suppkey)
FROM supplier, region, nation
WHERE s_nationkey = n_nationkey 
    AND n_regionkey = r_regionkey
GROUP BY r_name