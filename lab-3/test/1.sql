-- Tables are accessible via tpch.sqlite > expanding
-- so that we can see table values
-- addr, phone and acctbal of spec customer

SELECT c_address, c_phone, c_acctbal
FROM customer
WHERE c_name = 'Customer#000000010'