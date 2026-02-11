select
  om.*,
  om.orders_id,
  om.date_date,
  om.margin + s.shipping_fee - s.logCost - s.ship_cost as operational_margin
from {{ ref('int_margin_orders') }} om
left join {{ ref('stg_raw__ship') }} s
using (orders_id)