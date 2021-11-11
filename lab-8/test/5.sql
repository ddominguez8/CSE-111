.output output/5.out
.eqp on
--.expert
select c_mktsegment, min(c_acctbal) as min, max(c_acctbal) as max, sum(c_acctbal) as total
from customer
group by c_mktsegment;

--CREATE INDEX customer_idx_c_mktsegment ON customer(c_mktsegment);