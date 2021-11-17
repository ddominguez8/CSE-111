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

SELECT c_nation, COUNT(*)
FROM V1, orders
WHERE c_custkey = o_custkey
AND c_region = 'AMERICA'
GROUP BY c_nation

CREATE VIEW V2 (s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, s_nation, s_region)
AS
SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name, r_name
FROM supplier, nation, region 
WHERE s_nationkey = n_nationkey 
    AND n_regionkey = r_regionkey;

SELECT s_region, count(*)
FROM V2
GROUP BY s_region

SELECT s_name, COUNT(ps_partkey)
FROM V2, part, partsupp
WHERE p_partkey = ps_partkey
AND ps_suppkey = s_suppkey
AND s_nation = 'CANADA'
AND p_size < 20
GROUP BY s_name;

SELECT c_name, COUNT(*)
FROM V1, V5
WHERE c_nation = 'GERMANY'
AND o_custkey = c_custkey
AND o_orderyear like '1993'
GROUP BY c_name;

-- v2 is supplier nation region
SELECT s_region, s_name, MAX(s_acctbal)
FROM V2 
GROUP BY s_region

SELECT s_nation, MAX(s_acctbal) as mb
FROM V2
GROUP BY s_nation
HAVING mb > 9000;

-- v1 is customer nation region v2 is supplier nation region
SELECT COUNT(*)
FROM orders, lineitem, V1, V2
WHERE o_orderkey = l_orderkey
AND o_custkey = c_custkey 
AND l_suppkey = s_suppkey 
AND s_region = 'AFRICA' 
AND c_nation = 'UNITED STATES'

SELECT s_region, c_region, MAX(o_totalprice)
FROM lineitem, V1, V2, orders
WHERE l_suppkey = s_suppkey 
AND l_orderkey = o_orderkey 
AND o_custkey = c_custkey 
GROUP BY s_region, c_region;

CREATE VIEW V5 (o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderyear, o_orderpriority, o_clerk,
o_shippriority, o_comment)
AS 
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, strftime('%Y', o_orderdate) o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders

SELECT s_name, o_orderpriority, COUNT(DISTINCT ps_partkey)
FROM V5, supplier, partsupp, lineitem, nation
WHERE l_orderkey = o_orderkey
AND l_partkey = ps_partkey
AND l_suppkey = ps_suppkey 
AND ps_suppkey = s_suppkey
AND s_nationkey = n_nationkey
AND n_name = 'CANADA'
GROUP BY s_name, o_orderpriority
-- v1 is customer nation region v5 is order
SELECT c_nation, o_orderstatus, COUNT(*)
FROM V1, V5
WHERE o_custkey = c_custkey 
AND c_region = 'AMERICA'
GROUP BY c_nation, o_orderstatus

--v2 is supplier nation region v5 is order
SELECT s_nation, COUNT(DISTINCT l_orderkey) as co
FROM V2, V5, lineitem
WHERE o_orderkey = l_orderkey
AND l_suppkey = s_suppkey
AND o_orderstatus = 'F'
AND o_orderyear = '1995'
GROUP BY s_nation 
HAVING co > 50

SELECT COUNT(DISTINCT o_clerk)
FROM V2, V5, lineitem
WHERE o_orderkey = l_orderkey
AND l_suppkey = s_suppkey
AND s_nation = 'UNITED STATES'

CREATE VIEW V10 (p_type, min_discount, max_discount) 
AS
SELECT p_type, MIN(l_discount), MAX(l_discount)
FROM part, lineitem
WHERE p_partkey = l_partkey 
GROUP BY p_type

CREATE VIEW V151 (c_custkey, c_name, c_nationkey, c_acctbal)
AS 
SELECT c_custkey, c_name, c_nationkey, c_acctbal 
FROM customer
WHERE c_acctbal > 0

CREATE VIEW V152 (s_suppkey, s_name, s_nationkey, s_acctbal)
AS
SELECT s_suppkey, s_name, s_nationkey, s_acctbal 
FROM supplier
WHERE s_acctbal < 0

SELECT COUNT(DISTINCT l_orderkey)
FROM lineitem, V151, V152, orders
WHERE l_suppkey = s_suppkey 
AND l_orderkey = o_orderkey
AND o_custkey = c_custkey 

DROP VIEW V1;
DROP VIEW V2;
DROP VIEW V5;
DROP VIEW V10;
DROP VIEW V151;
DROP VIEW V152;