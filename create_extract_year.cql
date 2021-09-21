USE trip;


CREATE OR REPLACE FUNCTION YEAR (input TIMESTAMP)
     RETURNS NULL ON NULL INPUT RETURNS TEXT
     LANGUAGE java AS 'return input.toString().substring(0,4);';