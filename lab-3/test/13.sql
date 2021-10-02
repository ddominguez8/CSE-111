--Find the total account balance
--of all the customers from EUROPE
--in the MACHINERY market segment.

SELECT r_name, SUM(c_acctbal)
FROM orders, customer, region, nation
WHERE c_mktsegment = 'MACHINERY'
    AND c_custkey = o_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY r_name