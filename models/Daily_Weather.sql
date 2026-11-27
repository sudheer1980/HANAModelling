{{ config(materialized='table') }}
WITH weather_daily AS (
    select 
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds 
    
     from {{ source('DEMO', 'WEATHER_NY') }}

),
daily_weather_agg as (
    select daily_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as humidity,
    round(avg(clouds),2) as clouds
    from weather_daily
    --where daily_weather >= '2016-12-01'
    group by daily_weather, weather

    qualify  row_number() over(partition by daily_weather order by count(weather) desc )  = 1
)


select * from daily_weather_agg