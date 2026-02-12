SELECT 
date_date,
paid_source,
campaign_key,
camPGN_name AS campaign_name,
CAST(ads_cost as float64) AS ads_cost,
impression,
click
FROM {{ source('raw', 'criteo') }}