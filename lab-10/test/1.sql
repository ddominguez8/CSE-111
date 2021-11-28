-- Create a trigger t1 that for every new order entry automatically fills the o_orderdate attribute with the date 2021-12-01. 
-- Insert into orders all the orders from December 1996, paying close attention on how the o_orderkey attribute is set. 
-- Write a query that returns the number of orders from 2021. Put all three SQL queries in 1.sql 
-- David Dominguez

CREATE TRIGGER new_order BEFORE INSERT 
ON orders 
BEGIN 
	UPDATE orders 
	SET NEW.o_orderdate = '2021-12-01'
END
