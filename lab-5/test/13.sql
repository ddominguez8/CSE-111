-- Count the number of orders made in the fourth quarter
-- of 1997 in which at least one line item was received 
-- by  a  customer  earlier  than  its  commit  date.  
-- List  the  count  of  such  orders  for  every  order priority.

-- works, but super slow. must learn to optimize more for next lab

SELECT o_orderpriority, COUNT(DISTINCT o_orderkey)
FROM orders
WHERE o_orderdate BETWEEN '1997-10-01' AND '1997-12-31'
    AND o_orderkey IN 
    (SELECT DISTINCT l_orderkey
    FROM lineitem
    WHERE l_receiptdate < l_commitdate)
GROUP BY o_orderpriority