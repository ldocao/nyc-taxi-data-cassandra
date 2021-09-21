-- you should set in cassandra.yaml, and restart : enable_user_defined_functions: true

CREATE KEYSPACE IF NOT EXISTS trip
   WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};
   
USE trip;


CREATE OR REPLACE FUNCTION EXTRACT_YEAR (input TEXT) --I wish I could pass timestamp directly, but doesn't work for an unknow reason, so we need to cast to text first
     RETURNS NULL ON NULL INPUT RETURNS TEXT
     LANGUAGE java AS 'return input.substring(0,4);';