-- For every order priority, count the number of parts
-- ordered in 1997 and received later (lreceiptdate) 
-- than the commit date (lcommitdate)

-- collaboration with Salvador Rodriguez, who helped me solve why I was getting
-- an unnecessary amount in the count. turns out if you include unnecessary 
-- tables in the from clause you might have different results. e.g. 

-- THIS QUERY WILL NOT WORK BC OF EXTRA 'part' TABLE. 

-- SELECT o_orderpriority, COUNT(o_orderpriority)
-- FROM orders, lineitem, part
-- WHERE o_orderdate BETWEEN '1997-01-01' AND '1997-12-31'
--     AND l_orderkey = o_orderkey
--     AND l_receiptdate > l_commitdate
-- GROUP BY o_orderpriority

SELECT o_orderpriority, COUNT(o_orderpriority)
FROM orders, lineitem
WHERE o_orderdate BETWEEN '1997-01-01' AND '1997-12-31'
    AND l_orderkey = o_orderkey
    AND l_receiptdate > l_commitdate
GROUP BY o_orderpriority