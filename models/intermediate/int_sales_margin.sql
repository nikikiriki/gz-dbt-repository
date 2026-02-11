with sales as (

    select
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity
    from {{ ref('stg_raw__sales') }}

),

product as (

    select
        products_id,
        purchase_price
    from {{ ref('stg_raw__product') }}

),

joined as (

    select
        s.date_date,
        s.orders_id,
        s.products_id,
        s.revenue,
        s.quantity,
        p.purchase_price,
        s.quantity * p.purchase_price as purchase_cost,
        s.revenue - (s.quantity * p.purchase_price) as margin

    from sales s
    left join product p using (products_id)

)

select * from joined
