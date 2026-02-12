with sales_margin as (

    select
        orders_id,
        date_date,
        revenue,
        purchase_cost,
        margin
    from {{ ref('int_sales_margin') }}

),

orders_margin as (

    select
        date_date,
        orders_id,

        sum(revenue) as revenue,
        sum(purchase_cost) as purchase_cost,
        sum(margin) as margin

    from sales_margin
    group by 1, 2

)

select * from orders_margin
