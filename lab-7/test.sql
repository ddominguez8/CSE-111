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

-- computes the suppliers that have a warehouse in a given nation taken as 
-- input parameter. 
-- The nation where warehouses are located is read from the input 
-- file input/3.in. Q3 prints the name of the supplier, the nation
-- of the supplier, and the name of the warehouse—sorted in alphabetical
-- order by supplier name. 
SELECT s_name, n_name, w_name
FROM supplier, nation, warehouse
WHERE n_name = 'JAPAN'
AND n_nationkey = s_nationkey
AND s_nationkey = w_nationkey
AND w_suppkey = s_suppkey
GROUP BY s_name
ORDER BY w_name ASC

-- finds the warehouses from a given region that have 
-- capacity larger than a given threshold. The
-- region name and the minimum capacity are parameters stored 
-- in the file input/4.in. Q4 prints the
-- warehouse name and its capacity in decreasing order of the capacity. 
SELECT w_name, w_capacity
FROM warehouse, region
WHERE w_capacity > 2000
AND r_name = 'ASIA'
AND w_nationkey IN (
    SELECT n_nationkey 
    FROM region r, nation n
    WHERE r.r_name = 'ASIA'
    AND r.r_regionkey = n.n_regionkey)
ORDER BY w_capacity DESC