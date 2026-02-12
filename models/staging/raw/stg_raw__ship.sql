with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        safe_cast(ship_cost as float64) AS ship_cost

    from source

)

select * from renamed