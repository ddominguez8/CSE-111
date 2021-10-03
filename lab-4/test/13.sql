--How many line  items  are  
--supplied  by  suppliers  in
--AFRICA for  orders  made  by  
--customers  in UNITED STATES

SELECT COUNT(DISTINCT l_comment) 
FROM supplier, nation, region, orders, customer, lineitem
WHERE l_suppkey = s_suppkey
    AND s_nationkey = n_nationkey 
    AND n_regionkey = 0
    AND l_orderkey = o_orderkey
    AND o_custkey = c_custkey 
    AND c_nationkey = 24