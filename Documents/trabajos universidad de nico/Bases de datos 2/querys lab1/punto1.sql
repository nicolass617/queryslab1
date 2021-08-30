SELECT product.productid, SUM(detail.orderqty) as counting, 
SUM(detail.orderqty * detail.unitprice) as qty_sales, product.name 
FROM sales.salesorderdetail as detail 
inner join production.product as product 
on product.productid = detail.productid 
INNER JOIN sales.salesorderheader as orderheader 
ON orderheader.salesorderid = detail.salesorderid 
WHERE EXTRACT(MONTH FROM orderheader.orderdate) = 
EXTRACT(MONTH FROM (SELECT MAX(orderdate) FROM sales.salesorderheader))
AND EXTRACT(YEAR FROM orderheader.orderdate) = 
EXTRACT(YEAR FROM (SELECT MAX(orderdate) FROM sales.salesorderheader))
GROUP BY product.productid ORDER BY counting DESC LIMIT 1;

create index productid
on sales.salesorderdetail (productid);

create index salesordid
on sales.salesorderheader (salesorderid);

create index prodid
on production.product (productid);