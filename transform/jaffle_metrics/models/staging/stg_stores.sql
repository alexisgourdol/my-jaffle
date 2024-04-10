{{ config(materialized='view') }}

with source as (
    select * from {{ source('my_jaffle', 'raw_stores') }}
),

renamed as (
    select
        id as store_id,
        name as city,
        opened_at,
        tax_rate,
    from source
)

select *
from renamed
