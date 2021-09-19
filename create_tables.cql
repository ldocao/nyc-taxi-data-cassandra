CREATE KEYSPACE trip
   WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

USE trip;

CREATE TABLE trip_information (
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR(1),
    rate_code_id INT,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    passenger_count INT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    ehail_fee FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    payment_type TEXT,
    trip_type INT,

    precipitation rain FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature max_temp INT,
    min_temperature min_temp INT,
    average_wind_speed win FLOAT,
    PRIMARY KEY (id)
);


CREATE TABLE n_trips_by_year (
    year INT,
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR(1),
    rate_code_id INT,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    passenger_count INT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    ehail_fee FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    payment_type TEXT,
    trip_type INT,

    precipitation rain FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed win FLOAT,
    PRIMARY KEY (year, trip_id)
);

CREATE TABLE n_trips_by_vendor (
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR(1),
    rate_code_id INT,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    passenger_count INT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    ehail_fee FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    payment_type TEXT,
    trip_type INT,

    precipitation rain FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed win FLOAT,
    PRIMARY KEY (vendor_id, trip_id)
);


CREATE TABLE n_trips_by_max_temperature (
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR(1),
    rate_code_id INT,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    passenger_count INT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    ehail_fee FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    payment_type TEXT,
    trip_type INT,

    precipitation rain FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed win FLOAT,
    PRIMARY KEY (max_temperature, trip_id)
);