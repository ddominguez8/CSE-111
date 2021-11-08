-- Just testing a bunch of SQL statements before implementing, don't mind this. 
SELECT s_suppkey, n_name
FROM supplier, nation
WHERE s_nationkey = n_nationkey

-- Computes the number of warehouses and the total capacity 
-- for the warehouses in every nation. The
-- result is sorted in decreasing order of the number of warehouses 
-- and of the capacity, then alphabetical order of the nation name.
SELECT COUNT(DISTINCT w_warehousekey) as wkey_count, SUM(w_capacity) as tot_cap, n_name
FROM nation, warehouse
WHERE w_nationkey = n_nationkey
GROUP BY n_name
ORDER BY wkey_count DESC, n_name ASC