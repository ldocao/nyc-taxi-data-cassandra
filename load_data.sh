#!/bin/bash

cqlsh -f $HOME/nyc-taxi-data-cassandra/create_tables.cql

data=`ls -1 $HOME/nyc-taxi-data/denormalized/`
N=`grep -c ^processor /proc/cpuinfo`
for f in $data
do
    ((i=i%N)); ((i++==0)) && wait
    echo "COPY trip.trip_information  FROM STDIN;";  gzip -dc $HOME/nyc-taxi-data/denormalized/$f | cqlsh &
done