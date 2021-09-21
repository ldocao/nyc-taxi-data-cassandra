#!/bin/bash

cqlsh -f $HOME/nyc-taxi-data-cassandra/create_tables.cql

data=`ls -1 $HOME/nyc-taxi-data/denormalized/*.csv.gz`
N=`grep -c ^processor /proc/cpuinfo`

for f in $data
do
    ((i=i%N)); ((i++==0)) && wait
    gunzip -c $f > $f.unzip #this is totally not a good filename but we will delete it anyway
    cat $HOME/nyc-taxi-data-cassandra/load_trip_information.cql | sed -e "s%{{ filename }}%$f.unzip%"  > $f.cql
    cqlsh -f $f.cql
    rm $f.cql
    rm $f.unzip
done

cqlsh -f load_n_trips_by_year.cql
rm temp_n_trips_by_year.csv
cqlsh -f load_n_trips_by_vendor.cql
rm temp_n_trips_by_vendor.csv
cqlsh -f load_n_trips_by_max_temperature.cql
rm temp_n_trips_by_max_temperature.csv