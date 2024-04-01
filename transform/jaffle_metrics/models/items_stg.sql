{{ config(materialized='view') }}

with items_staging as (

select
  id as item_id,
  order_id,
  sku
from {{ source('my_jaffle', 'raw_items') }}

)

select *
from items_staging
