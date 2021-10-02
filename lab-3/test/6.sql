-- nations of customers who made orders 
-- between 9/10-9/12 1996, 
-- print every nation once and in 
-- alphabetical order
-- Salvador Rodriguez help me solve 9-10, previously was 
-- trying to brute force the dates manually, 
-- which would also work, but for some reason it did 
-- not.

SELECT n_name
FROM orders, customer, nation
WHERE o_orderdate >= '1996-09-10'
AND o_orderdate <= '1996-09-12'
AND o_custkey = c_custkey 
AND c_nationkey = n_nationkey
GROUP by n_name;