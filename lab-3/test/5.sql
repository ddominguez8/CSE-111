-- min, max and total acct bal among cust
-- in every market segment
-- collaborated with Salvador Rodriguez to display
-- market segment column

SELECT c_mktsegment, min(c_acctbal), max(c_acctbal), sum(c_acctbal)
FROM customer
GROUP BY c_mktsegment