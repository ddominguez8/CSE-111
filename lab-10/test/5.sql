-- Create a trigger t5 that removes all the tuples from partsupp 
-- and lineitem corresponding to a part being deleted. Delete all 
-- the parts supplied by suppliers from UNITED STATES or CANADA. 
-- Write a query that returns the number of parts supplied by every 
-- supplier in AMERICA grouped by their country in increasing order. 
-- Put all the SQL statements in file test/5.sql. 

CREATE TRIGGER t5 
BEFORE DELETE on part 
FOR EACH ROW
BEGIN 
    DELETE FROM partsupp
    WHERE OLD.p_partkey = ps_partkey;

    DELETE FROM lineitem
    WHERE OLD.p_partkey = l_partkey;
END;

DELETE FROM part 
WHERE p_partkey IN 
(SELECT DISTINCT p1.p_partkey 
FROM part p1, partsupp ps1, supplier s1, nation n1
WHERE p1.p_partkey = ps1.ps_partkey
    AND ps1.ps_suppkey = s1.s_suppkey 
    AND s1.s_nationkey = n1.n_nationkey 
    AND n1.n_name = 'CANADA'
UNION 
SELECT DISTINCT p2.p_partkey
FROM part p2, partsupp ps2, supplier s2, nation n2
WHERE p2.p_partkey = ps2.ps_partkey
    AND ps2.ps_suppkey = s2.s_suppkey 
    AND s2.s_nationkey = n2.n_nationkey 
    AND n2.n_name = 'UNITED STATES');

SELECT n_name, COUNT(p_partkey) 
FROM part, supplier, partsupp, nation, region
WHERE p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey 
    AND s_nationkey = n_nationkey 
    AND n_regionkey = r_regionkey 
    AND r_name = 'AMERICA'
GROUP BY n_name
ORDER BY n_name ASC;

-- DROP TRIGGER t5;

-- select * from sqlite_master where type = 'trigger';