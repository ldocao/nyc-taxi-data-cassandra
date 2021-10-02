# nyc-taxi-data-cassandra
We load only denormalized data since join is not supported by cassandra


Using COPY to bulk load is *not* recommended: 
https://cassandra.apache.org/doc/latest/cassandra/operating/bulk_loading.html
https://stackoverflow.com/questions/26909408/export-cassandra-query-result-to-a-csv-file