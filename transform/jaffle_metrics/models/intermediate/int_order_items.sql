with items as (
    select * from {{ ref('stg_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

products_gm as (

    select * from {{ ref('int_products_gm') }}

),

final as (
    select
        i.order_id,
        i.item_id,
        i.product_id,
        o.customer_id,
        o.ordered_at,
        o.store_id,
        o.subtotal,
        o.tax_paid,
        o.order_total,
        pgm.product_name,
        pgm.type,
        pgm.product_price,
        pgm.product_cost,
        pgm.product_gross_margin
    from items as i
    inner join orders as o
        on i.order_id = o.order_id
    inner join products_gm as pgm
        on i.product_id = pgm.product_id
)

select *
from final
