{{ config(materialized='view') }}

with customer_staging as (

select
  id as customer_id,
  name as customer_name
from {{ source('my_jaffle', 'raw_customers') }}

)

select *
from customer_staging
