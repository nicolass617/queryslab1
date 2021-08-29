SELECT p."name", SUM(s.UNITPRICE * s.ORDERQTY) as cant
FROM SALES.SALESORDERDETAIL as s
INNER JOIN PRODUCTION.PRODUCT as p
ON s.PRODUCTID = p.PRODUCTID
INNER JOIN SALES.SALESORDERHEADER as sh
ON s.SALESORDERID = sh.SALESORDERID
inner JOIN 	(SELECT MAX(ORDERDATE) as ORDERDATE FROM SALES.SALESORDERHEADER) LASTDATE
on sh.ORDERDATE = LASTDATE.ORDERDATE
group by p."name"
order by cant desc limit 1;


create index productid
on sales.salesorderdetail (productid);

create index salesordid
on sales.salesorderheader (salesorderid);

create index prodid
on production.product (productid);