-- Creating Database
create database Yulu ;
-- using Database
use Yulu ;
-- create table
create table station (
station_id int not null ,
station_name varchar(150) not null ,
latitude float4 not null,
longitude float4 not null,
dock_count int not null,
city varchar(32) not null,
installation_date varchar(32) not null
);

select * from station;

create table cross_j (
SELECT a.station_name station_a, 
b.station_name station_b, a.latitude station_a_lat, b.latitude station_b_lat,a.longitude station_a_long,b.longitude station_b_long 
FROM station AS a CROSS JOIN station AS b where a.station_name!=b.station_name
);

SELECT station_a,station_b,2 * 3961 * asin(sqrt(power((sin(radians((station_b_lat - station_a_lat) / 2))), 2) + cos(radians(station_a_lat)) * cos(radians(station_b_lat)) * power((sin(radians((station_b_long - station_a_long) / 2))), 2))) as distance
from cross_j order by distance asc;