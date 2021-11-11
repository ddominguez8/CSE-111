.output output/10.out
.eqp on
-- .expert
select sum(o_totalprice)
from orders, customer, nation, region
where o_custkey=c_custkey and
    c_nationkey=n_nationkey and
    r_regionkey=n_regionkey and
    r_name='AMERICA' and
    o_orderdate>='1996-01-01' and o_orderdate<='1996-12-31';

-- CREATE INDEX orders_idx_o_orderkey ON orders(o_orderkey);
-- CREATE INDEX orders_idx_o_custkey_o_orderdate ON orders(o_custkey, o_orderdate);
-- CREATE INDEX customer_idx_c_nationkey_c_custkey ON customer(c_nationkey, c_custkey);