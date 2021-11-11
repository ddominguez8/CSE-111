.output output/9.out
.eqp on
-- .expert
select n_name, count(*) as cnt, max(s_acctbal)
from supplier, nation 
where s_nationkey = n_nationkey
group by n_name
having cnt > 5;

-- CREATE INDEX nation_idx_n_name ON nation(n_name);