.output output/4.out
.eqp on
--.expert
select count(*) from lineitem where l_shipdate < l_commitdate;

-- no indexes reccommended.