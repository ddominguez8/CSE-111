-- How many customers and suppliers are in every country from AFRICA?

SELECT n_name, COUNT(DISTINCT c_custkey), COUNT(DISTINCT s_suppkey)
FROM nation, customer, supplier, region
WHERE c_nationkey = n_nationkey 
    AND n_regionkey = 0
    AND s_nationkey = n_nationkey 
    AND n_regionkey = 0
GROUP BY n_name