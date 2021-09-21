COPY trip.trip_information (
    trip_id,
    vendor_id,
    pickup_datetime,
    dropoff_datetime,

    store_and_fwd_flag,
    rate_code_id,
    pickup_longitude,
    pickup_latitude,
    dropoff_longitude,
    dropoff_latitude,
    passenger_count,
    trip_distance,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    ehail_fee,
    improvement_surcharge,
    total_amount,
    payment_type,
    trip_type,

    precipitation,
    snow_depth,
    snowfall,
    max_temperature,
    min_temperature,
    average_wind_speed
)
FROM '{{ filename }}'
WITH DELIMITER = ',' AND HEADER = FALSE;
