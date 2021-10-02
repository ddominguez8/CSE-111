-- find # of customers that received
-- discount of at least 10% 
-- for one of the line items on their 
-- orders. count every customer exactly 
-- once even if they have multiple discounted 
-- line items

SELECT COUNT(DISTINCT c_custkey)
FROM orders, customer, lineitem
WHERE l_orderkey = o_orderkey 
    AND c_custkey = o_custkey
    AND l_discount >= '0.10'