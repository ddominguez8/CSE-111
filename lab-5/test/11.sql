--  Find  the  lowest  value  line  item(s) 
-- (lextendedprice*(1-ldiscount))  shipped after October 2,1996.  
-- Print the name of the part corresponding to these line item(s).

-- followed the similar structure of what i did to #9

SELECT p_name  
FROM lineitem, part
WHERE l_shipdate > '1996-10-02'
    AND l_partkey = p_partkey
GROUP BY p_name
ORDER BY MIN(l_extendedprice*(1-l_discount)) ASC
LIMIT 1