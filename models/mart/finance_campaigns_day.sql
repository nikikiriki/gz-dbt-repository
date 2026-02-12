{{ config(materialized='view') }}

SELECT
  f.date_date AS date,
  f.operational_margin - c.ads_cost AS ads_margin,
  f.average_basket,
  f.operational_margin,
  c.ads_cost,
  c.ads_impression,
  c.ads_click,
  f.total_quantity_sold AS quantity,
  f.total_revenue       AS revenue,
  f.total_purchase_cost AS purchase_cost,
  f.total_margin        AS margin,
  f.total_shipping_fees AS shipping_fee,
  f.total_log_costs     AS log_cost,
  f.total_ship_costs    AS ship_cost
FROM {{ ref('finance_days') }} AS f
LEFT JOIN {{ ref('int_campaigns_day') }} AS c
  USING (date_date)
ORDER BY date DESC
