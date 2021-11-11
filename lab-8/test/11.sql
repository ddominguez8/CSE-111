.output output/11.out
.eqp on
-- .expert
select count(distinct o_custkey)
from lineitem, orders
where l_orderkey = o_orderkey and l_discount >= 0.1;

-- CREATE INDEX lineitem_idx_l_discount ON lineitem(l_discount);
-- CREATE INDEX orders_idx_o_orderkey ON orders(o_orderkey);