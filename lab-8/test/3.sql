.output output/3.out
.eqp on
-- .expert
select l_receiptdate, l_returnflag, l_extendedprice, l_tax
from lineitem
where l_returnflag = 'R' and l_receiptdate = '1993-08-22';

--CREATE INDEX lineitem_idx_l_returnflag_l_receiptdate ON lineitem(l_returnflag, l_receiptdate);