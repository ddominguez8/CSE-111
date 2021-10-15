--  Find the nation(s) with the smallest number of customers.

SELECT 
    (SELECT n_name
    FROM nation nat
    WHERE c_nationkey = nat.n_nationkey)
FROM customer
GROUP BY c_nationkey 
HAVING COUNT(*) = 
    (SELECT MIN(customers) 
    FROM (
        SELECT cus.c_nationkey, COUNT(*) customers
        FROM customer cus
        GROUP BY cus.c_nationkey
        )
    )