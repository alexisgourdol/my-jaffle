with products as (

    select * from {{ ref('stg_products') }}

),

supplies as (
    select
        product_id,
        sum(cost) as product_cost
    from {{ ref('stg_supplies') }}
    group by all

),

final as (
    select
        s.product_id,
        p.product_name,
        p.type,
        p.product_price,
        s.product_cost,
        (p.product_price - s.product_cost) as sku_gross_margin

    from products as p
    inner join supplies as s
        on p.product_id = s.product_id
    order by all
)

select *
from final
