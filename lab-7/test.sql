-- Just testing a bunch of SQL statements before implementing, don't mind this. 
SELECT s_suppkey, n_name
FROM supplier, nation
WHERE s_nationkey = n_nationkey

SELECT n_name 
FROM nation, lineitem
WHERE 