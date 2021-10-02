-- print line items w return flag set to R
-- on receipt date 8/22/1993 
-- print receipt date, return flag, extended price,
-- and tax for every line item

SELECT l_receiptdate, l_returnflag, l_extendedprice, l_tax
FROM lineitem
WHERE l_returnflag = 'R' AND l_receiptdate = '1993-08-22'