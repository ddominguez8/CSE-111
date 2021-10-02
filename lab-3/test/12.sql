-- Find the number of orders having 
-- status F. Group these orders based
-- on the region of the customer 
-- who posted the order.  
-- Print the region name and the 
-- number of status F orders.

SELECT r_name, COUNT(DISTINCT o_orderkey) num_F
FROM orders, customer, region, nation
WHERE o_orderstatus = 'F'
    AND c_custkey = o_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY r_name