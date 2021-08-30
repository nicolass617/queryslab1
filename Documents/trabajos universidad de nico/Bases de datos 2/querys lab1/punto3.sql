select s.tipo, max(s.cantidad) from
(SELECT c.cardtype as tipo ,COUNT(c.cardtype) AS cantidad FROM SALES.creditcard AS c
inner join SALES.salesorderheader AS o ON c.creditcardid = o.creditcardid
group by c.cardtype) as s group by s.tipo limit 1;


create index credcardid
on sales.creditcard (creditcardid);

create index cardid
on sales.salesorderheader (creditcardid);

create index cardtype
on sales.creditcard (cardtype);