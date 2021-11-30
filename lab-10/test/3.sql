-- Create a trigger t3 that resets the comment to Positive balance 
-- if the balance goes back positive from negative. Write a SQL 
-- statement that sets the balance to 100 for all the customers in UNITED
-- STATES. Write a query that returns the number of customers with 
-- negative balance from AMERICA. Put all the SQL statements in 
-- file test/3.sql. 

CREATE TRIGGER t3 
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    UPDATE customer
    SET c_comment = 'Positive balance'
    WHERE (OLD.c_acctbal < 0 AND NEW.c_acctbal > 0)
        AND c_custkey = NEW.c_custkey;
END;

UPDATE customer
SET c_acctbal = 100 
WHERE c_custkey IN 
(SELECT c_custkey 
FROM customer, nation 
WHERE c_nationkey = n_nationkey 
    AND n_name = 'UNITED STATES');

SELECT COUNT(DISTINCT c_custkey)
FROM customer, nation, region
WHERE c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey 
    AND r_name = 'AMERICA'
    AND c_acctbal < 0;

-- DROP TRIGGER t3;

-- select * from sqlite_master where type = 'trigger';