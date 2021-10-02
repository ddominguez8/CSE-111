-- find name of suppliers in 
-- america who have more than 
-- $5k acctbal 
-- print supplier name & acctbal

SELECT DISTINCT s_name, s_acctbal
FROM supplier, nation, region
WHERE (s_nationkey = 1
    OR s_nationkey = 2
    OR s_nationkey = 3
    OR s_nationkey = 17 
    OR s_nationkey = 24)
    AND s_acctbal > '5000.00'