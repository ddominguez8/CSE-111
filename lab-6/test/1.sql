-- Find the total quantity (lquantity) of
-- line items shipped per month (lshipdate) in 1995. 
-- Hint:check function strftimeto extract the 
-- month/year from a date.
SELECT strftime('%m', l_shipdate) as month, SUM(l_quantity)
FROM lineitem
WHERE l_shipdate BETWEEN '1995-01-01' AND '1995-12-31'
GROUP BY month