-- how many line items with receipt 
-- date in 1993 did customer # 000000010 
-- order 
-- print the # corresponding to 
-- every month

SELECT substr(l_receiptdate,1,7), 
    COUNT(*)
FROM orders, lineitem
WHERE o_custkey = '10'
    AND o_orderkey = l_orderkey
GROUP BY substr(l_receiptdate, 1,7)