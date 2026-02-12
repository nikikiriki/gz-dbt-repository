SELECT * FROM {{ ref('stg_raw_adwords') }}
UNION ALL
SELECT * FROM {{ ref('stg_raw_bing') }}
UNION ALL
SELECT * FROM {{ ref('stg_raw_criteo') }}
UNION ALL
SELECT * FROM {{ ref('stg_raw_facebook') }}
 