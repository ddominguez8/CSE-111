-- Find # of line items that have
-- l_shipdate smaller than l_commitdate

SELECT count(*)
FROM lineitem
WHERE l_shipdate < l_commitdate