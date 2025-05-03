{{
    config(
        materialized='table'
    )
}}
select 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice-o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.subcategory
from ANALYTICS.dbt_pkumark.raw_orders as o
left join ANALYTICS.dbt_pkumark.raw_customer as c
on o.customerid=c.customerid
left join ANALYTICS.dbt_pkumark.raw_product as p
on o.productid=p.productid