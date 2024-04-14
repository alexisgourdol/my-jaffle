{{ config(materialized='view') }}

with source as (
    select * from {{ source('my_jaffle', 'raw_items') }}
),

renamed as (
    select
        id as item_id,
        order_id,
        sku as product_id
    from source
)

select *
from renamed
