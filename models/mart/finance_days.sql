select
    date_date
    from{{ ref('int_orders_operational')}}
    group by date_date
