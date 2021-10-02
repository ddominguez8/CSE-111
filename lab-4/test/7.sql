--How many  orders  do  customers 
-- in every  nation  in AMERICA 
--have  in  every  status?  
--Print the nation name, the order
-- status, and the count
SELECT n_name, o_orderstatus, 
    COUNT(DISTINCT o_orderkey)
FROM customer, orders, nation
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = 1
GROUP BY n_name, o_orderstatus