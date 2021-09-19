CREATE KEYSPACE IF NOT EXISTS trip
   WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

USE trip;


DROP TABLE IF EXISTS trip_information;
DROP TABLE IF EXISTS n_trips_by_year;
DROP TABLE IF EXISTS n_trips_by_vendor;
DROP TABLE IF EXISTS n_trips_by_max_temperature;


CREATE TABLE IF NOT EXISTS trip_information (
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR,
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

    precipitation FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed FLOAT,
    PRIMARY KEY (trip_id)
);


CREATE TABLE IF NOT EXISTS n_trips_by_year (
    year INT,
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR,
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

    precipitation FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed FLOAT,
    PRIMARY KEY (year, trip_id)
);

CREATE TABLE IF NOT EXISTS n_trips_by_vendor (
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR,
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

    precipitation FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed FLOAT,
    PRIMARY KEY (vendor_id, trip_id)
);


CREATE TABLE IF NOT EXISTS n_trips_by_max_temperature (
    trip_id INT,
    vendor_id TEXT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,

    store_and_fwd_flag VARCHAR,
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

    precipitation FLOAT,
    snow_depth FLOAT,
    snowfall FLOAT,
    max_temperature INT,
    min_temperature INT,
    average_wind_speed FLOAT,
    PRIMARY KEY (max_temperature, trip_id)
);