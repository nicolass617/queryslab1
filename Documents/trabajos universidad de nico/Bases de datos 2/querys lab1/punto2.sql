SELECT DISTINCT pca."name"
FROM PRODUCTION.PRODUCTLISTPRICEHISTORY as p
INNER JOIN PRODUCTION.PRODUCT as pr
ON p.PRODUCTID = pr.PRODUCTID
INNER JOIN PRODUCTION.PRODUCTSUBCATEGORY as pc
ON pr.PRODUCTSUBCATEGORYID = pc.PRODUCTSUBCATEGORYID
INNER JOIN PRODUCTION.PRODUCTCATEGORY as pca
ON pca.PRODUCTCATEGORYID = pc.PRODUCTCATEGORYID
WHERE p.LISTPRICE = (SELECT MAX(LISTPRICE) FROM PRODUCTION.PRODUCTLISTPRICEHISTORY);


create index prodid
on production.product (productid);

create index proid
on production.productlistpricehistory (productid);

create index prosubid
on production.product (PRODUCTSUBCATEGORYID);

create index procatid
on production.productsubcategory (PRODUCTSUBCATEGORYID);

create index procategid
on production.productsubcategory (PRODUCTCATEGORYID);

create index prcatid
on PRODUCTION.PRODUCTCATEGORY (PRODUCTCATEGORYID);