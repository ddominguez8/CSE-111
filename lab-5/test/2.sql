-- How many suppliers in every region have less balance in their account 
-- than the average account balance of their own region?

SELECT region.r_name, COUNT(DISTINCT s_suppkey)
FROM supplier, nation, region region
WHERE s_nationkey = n_nationkey
    AND n_regionkey = region.r_regionkey
    AND s_acctbal < (
        SELECT AVG(supp.s_acctbal)
        FROM supplier supp, nation nat, region reg
        WHERE supp.s_nationkey = nat.n_nationkey
            AND nat.n_regionkey = reg.r_regionkey
            AND region.r_regionkey = reg.r_regionkey
        )  
GROUP BY r_name;