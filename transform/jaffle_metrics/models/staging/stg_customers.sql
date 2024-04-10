{{ config(materialized='view') }}

with source as (
    select * from {{ source('my_jaffle', 'raw_customers') }}
),

renamed as (
    select
        id as customer_id,
        name as customer_name
    from source
)

select *
from renamed
