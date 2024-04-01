{{ config(materialized='view') }}

with source as (
    select * from {{ source('my_jaffle', 'raw_supplies') }}
),

renamed as (
    select
        id as supplies_id,
        name as supplies_name,
        cost,
        perishable,
        sku
    from source
)

select *
from renamed
