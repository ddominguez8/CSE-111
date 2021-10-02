-- David Dominguez Lab 2
-- parts of code was received from lecture slides and by Professor Florin
-- help was received from Salvador Rodriguez regarding +1 rather than +2, 
-- this was because of the lack of headers in these .tbl files

.mode "csv"
.separator "|"
.headers off 

.import '|tail -n +1 data/customer.tbl' customer
.import '|tail -n +1 data/lineitem.tbl' lineitem
.import '|tail -n +1 data/nation.tbl' nation
.import '|tail -n +1 data/orders.tbl' orders
.import '|tail -n +1 data/part.tbl' part
.import '|tail -n +1 data/partsupp.tbl' partsupp
.import '|tail -n +1 data/region.tbl' region
.import '|tail -n +1 data/supplier.tbl' supplier
