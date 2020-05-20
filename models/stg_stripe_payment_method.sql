with payment_method as (

    select *
    from {{ source('stripe', 'payment_method') }}

), fields as (

    select 
      id as payment_method_id,
      created as created_at,
      customer_id,
      type
    from payment_method
    where not is_deleted

)

select *
from fields