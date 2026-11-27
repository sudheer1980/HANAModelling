{{ config(materialized='table') }}
with bike as (
    select distinct
     start_station_id as station_ID,
     start_station_name as station_name,
     start_lat,
     start_lng
    from {{ source('DEMO', 'CITI_BIKE_MASTER') }}
    where ride_id <> 'ride_id'
    
)

select * from bike