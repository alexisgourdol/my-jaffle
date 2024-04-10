with products as (

    select * from {{ ref('stg_products') }}

),

supplies as (
    select
        sku_id,
        sum(cost) as sku_cost
    from {{ ref('stg_supplies') }}
    group by all

),

final as (
    select
        s.sku_id,
        p.product_name,
        p.type,
        p.sku_price,
        s.sku_cost,
        (p.sku_price - s.sku_cost) as sku_gross_margin

    from products as p
    inner join supplies as s
        on p.sku_id = s.sku_id
    order by all
)

select *
from final
