{{ config(materialized='view') }}

with source as (
    select * from {{ source('my_jaffle', 'raw_products') }}
),

renamed as (
    select
        sku as sku_id,
        name as product_name,
        type,
        price,
        description
    from source
)

select *
from renamed
