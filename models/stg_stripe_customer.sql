with customer as (

    select *
    from {{ source('stripe', 'customer') }}

), fields as (

    select 
      id as customer_id,
      account_balance,
      created as created_at,
      currency,
      default_card_id,
      delinquent as is_deliguent,
      description,
      email,
      shipping_address_city,
      shipping_address_country,
      shipping_address_line_1,
      shipping_address_line_2,
      shipping_address_postal_code,
      shipping_address_state,
      shipping_carrier,
      shipping_name,
      shipping_phone,
      shipping_tracking_number
    from customer
    where not is_deleted

)

select *
from fields