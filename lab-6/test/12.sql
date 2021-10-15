-- Find the nation(s) having customers that
-- spend the smallest amount of money (ototalprice).

SELECT 
    (SELECT n_name
    FROM nation nat
    WHERE c_nationkey = nat.n_nationkey)
FROM customer
GROUP BY