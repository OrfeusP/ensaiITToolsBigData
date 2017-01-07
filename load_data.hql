drop table if exists external_table;
drop table if exists gas_stations;

Create external table external_table(
   id INT,
   zipcode INT,
   pop STRING,
   latitude FLOAT,
   longtitude FLOAT,
   date_time STRING,
   gas_id INT,
   gas_name STRING,
   price BIGINT

)
row format delimited
fields terminated by '\073'
stored as textfile;

LOAD DATA INPATH '/user/admin/data/' OVERWRITE INTO TABLE external_table;

create table gas_stations
stored as PARQUETFILE
as select * from external_table;