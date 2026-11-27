{{config(materialized='table')}}
with trips_fact as (
    select 
        RIDE_ID,
        BIKE_TYPE,
        date(to_timestamp(START_DATE)) as Trip_date,
        start_station_id as station_id,
        end_station_id as end_station,
        ((to_timestamp(END_DATE)) - (to_timestamp(START_DATE))) as ST_END_DIFF,
        timestampdiff(second,to_timestamp(START_DATE),to_timestamp(END_DATE))  AS TRIP_DURATION

    from {{ source('DEMO', 'CITI_BIKE_MASTER') }}
    where ride_id <> 'ride_id'

    
)

select * from trips_Fact