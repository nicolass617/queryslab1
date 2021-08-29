select distinct c.cardtype, s.cantidad from sales.creditcard as c,
(SELECT COUNT(c.cardtype) AS cantidad FROM SALES.creditcard AS c
inner join SALES.salesorderheader AS o ON c.creditcardid = o.creditcardid
group by c.cardtype) as s
where s.cantidad = (select COUNT(c.cardtype) as p FROM SALES.creditcard AS c
					inner join SALES.salesorderheader AS o 
					ON c.creditcardid = o.creditcardid
				    group by c.cardtype
					order by c.cardtype desc limit 1)
group by s.cantidad, c.cardtype limit 1;


create index credcardid
on sales.creditcard (creditcardid);

create index cardid
on sales.salesorderheader (creditcardid);

create index cardtype
on sales.creditcard (cardtype);