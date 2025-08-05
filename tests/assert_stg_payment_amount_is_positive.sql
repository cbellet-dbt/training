with payments as (
    select * from {{ source('stripe', 'payment') }}
)
select order_id, sum(amount) as amount
from payments
group by order_id
having total_amount < 0