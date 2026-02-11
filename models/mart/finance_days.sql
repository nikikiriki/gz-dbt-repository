with orders as
(
    select
    date_date,
    orders_id,
    revenue,
    purchase_cost,
    margin,
    operational_margin
    from {{ ref('int_orders_operational')}}
),
qty_per_order as
(
    select
    orders_id,
    SUM(quantity) AS total_quantity
      from {{ ref('stg_raw__sales') }}
  group by orders_id
)

select
  o.date_date,
  count(*) as nb_transactions,
  sum(o.revenue) as total_revenue,
  avg(o.revenue) as average_basket,
  sum(o.margin) as total_margin,
  sum(o.operational_margin) as operational_margin,
  sum(o.purchase_cost) as total_purchase_cost,
  sum(q.total_quantity) as total_quantity_sold
from orders o
left join qty_per_order q using (orders_id)
group by o.date_date
order by o.date_date
