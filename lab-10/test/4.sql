-- Create triggers that update the attribute o_orderpriority to HIGH 
-- every time a new line item tuple is added to or deleted from 
-- that order. Delete all the line items corresponding to orders 
-- from December 1995. Write a query that returns the number of 
-- HIGH priority orders in the fourth trimester of 1995.
-- Put all the SQL statements in file test/4.sql. 

CREATE TRIGGER t4a 
AFTER INSERT on lineitem
FOR EACH ROW 
BEGIN 
    UPDATE orders
    SET o_orderpriority = '2-HIGH'
    WHERE NEW.l_orderkey = o_orderkey;
END;

CREATE TRIGGER t4b
BEFORE DELETE on lineitem
FOR EACH ROW 
BEGIN 
    UPDATE orders
    SET o_orderpriority = '2-HIGH'
    WHERE OLD.l_orderkey = o_orderkey;
END;

-- DELETE FROM lineitem
-- WHERE l_comment IN 
-- (SELECT DISTINCT l_comment
-- FROM lineitem, orders
-- WHERE l_orderkey = o_orderkey
--     AND o_orderdate BETWEEN '1995-12-01' AND '1995-12-31');

SELECT COUNT(DISTINCT l_comment)
FROM lineitem, orders
WHERE l_orderkey = o_orderkey
    AND o_orderdate BETWEEN '1995-12-01' AND '1995-12-31';

    

SELECT COUNT(o_orderpriority) 
FROM orders 
WHERE (o_orderdate BETWEEN '1995-10-01' AND '1995-12-31')
    AND o_orderpriority = '2-HIGH';


-- DROP TRIGGER t4a;

-- DROP TRIGGER t4b;

-- select * from sqlite_master where type = 'trigger';