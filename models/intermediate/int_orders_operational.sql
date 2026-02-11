select
  om.orders_id,
  om.date_date,
  om.revenue,
  om.purchase_cost,
  s.shipping_fee,
  s.logCost AS log_cost,
  s.ship_cost,
  om.margin + s.shipping_fee - s.logCost - s.ship_cost as operational_margin
from {{ ref('int_margin_orders') }} om
left join {{ ref('stg_raw__ship') }} s
using (orders_id)