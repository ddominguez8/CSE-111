-- Find the total price paid 
-- on orders
-- by every customer from FRANCE 
-- in 1995.
-- Print the customer name and the
-- total price

SELECT c_name, SUM(o_totalprice)
FROM customer, orders
WHERE c_custkey = o_custkey
    AND c_nationkey = 6
    AND o_orderdate BETWEEN '1995-01-01' 
    AND '1995-12-31'
GROUP BY c_name