-- max acct bal of suppliers
-- from nations with more than 
-- 5 suppliers. print the nation
-- name, # of suppliers from 
-- nation, and max acct bal

SELECT n_name, COUNT(*), MAX(s_acctbal)
FROM supplier, nation
WHERE s_nationkey = n_nationkey
GROUP BY s_nationkey
HAVING COUNT(*) > 5
ORDER BY n_name;

-- scrapped this query, started fresh
-- SELECT MAX(s_acctbal) as Max_Balance, 
--     n_name as Nation, COUNT(*)
-- FROM supplier, nation 
-- WHERE s_nationkey = n_nationkey 
--     AND COUNT(*) >= 5 
-- GROUP BY s_nationkey;

-- I see my issue. I needed to work more with 
-- 'group by' and grasp it better to 
-- count the groups out, then retrieve the 
-- max bal.
-- better understanding of group by that helped me: 
-- https://www.sqlitetutorial.net/sqlite-count-function/

