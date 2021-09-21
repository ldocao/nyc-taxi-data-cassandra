#!/bin/bash

cqlsh -f $HOME/nyc-taxi-data-cassandra/create_tables.cql

data=`ls -1 $HOME/nyc-taxi-data/denormalized/`
N=`grep -c ^processor /proc/cpuinfo`
for f in $data
do
    ((i=i%N)); ((i++==0)) && wait
    gunzip $HOME/nyc-taxi-data/denormalized/$f -c > $f.unzip #this is totally not a good filename but we will delete it anyway
    cat load_trip_information.sql | sed "s/{{ filename }}/$f.unzip/"  > load_trip_information_$f.sql
    cqlsh -f load_trip_information_$f.sql
    rm load_trip_information_$f.sql
    rm $f.unzip
done