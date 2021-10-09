-- For  the  line  items  ordered  in October 1996 (o_orderdate),  find  the 
-- smallest  discount  that  is  larger than the average discount among all
-- the orders.

SELECT MIN(l_discount)
FROM orders, lineitem
WHERE o_orderdate BETWEEN  '1996-10-01' AND '1996-10-31' 
    AND o_orderkey = l_orderkey
    AND l_discount >
    (SELECT AVG(l_discount) 
    FROM lineitem l, orders o
    WHERE o.o_orderdate BETWEEN  '1996-10-01' AND '1996-10-31')

