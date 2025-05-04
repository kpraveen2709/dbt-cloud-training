with cte as ( 
    select * from {{ ref('raw_orders') }}
)

select orderid, sum(ordersellingprice) as total_sp
from cte group by orderid
having total_sp<0