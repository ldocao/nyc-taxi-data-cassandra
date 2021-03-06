#!/bin/bash

cqlsh -f $HOME/nyc-taxi-data-cassandra/create_tables.cql

data=`ls -1 $HOME/nyc-taxi-data/denormalized/*.csv.gz`

for f in $data
do
    #load the trip_information table
    gunzip -c $f > $f.unzip #this is totally not a good filename but we will delete it anyway
    cassandra-loader -f $f.unzip -host 127.0.0.1 -schema "trip.trip_information(trip_id,vendor_id,pickup_datetime,dropoff_datetime,store_and_fwd_flag,rate_code_id,pickup_longitude,pickup_latitude,dropoff_longitude,dropoff_latitude,passenger_count,trip_distance,fare_amount,extra,mta_tax,tip_amount,tolls_amount,ehail_fee,improvement_surcharge,total_amount,payment_type,trip_type,precipitation,snow_depth,snowfall,max_temperature,min_temperature,average_wind_speed)" -dateFormat "yyy-MM-dd HH:mm:ss"
    rm $f.unzip
done

#load the other tables
cassandra-unloader -f stdout -host 127.0.0.1 -schema "trip.trip_information(pickup_datetime, trip_id)" -dateFormat yyyy | cassandra-loader -f stdin -host 127.0.0.1 -schema "trip.n_trips_by_year(year, trip_id)"