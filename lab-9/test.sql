-- Create a view V1(c custkey, c name, c address, 
-- c phone, c acctbal, c mktsegment, c comment, c nation,
-- c region) that appends the country and 
-- region name to every customer. Rewrite Q1 from 
-- Lab 4 with view V1
CREATE VIEW V1 (c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, c_nation, c_region)
AS 
SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name, r_name
FROM customer, nation, region
WHERE c_nationkey = n_nationkey 
    AND n_regionkey = r_regionkey;
DROP VIEW V1;