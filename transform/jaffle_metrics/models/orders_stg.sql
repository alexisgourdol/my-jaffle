{{ config(materialized='view') }}

with source as (
    select * from {{ source('my_jaffle', 'raw_orders') }}
),

renamed as (
    select
      id as order_id,
      customer as customer,
      ordered_at,
      store_id,
      subtotal,
      tax_paid,
      order_total
    from source
)

select *
from renamed
