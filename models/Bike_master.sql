
{{config(materialized = 'view')}}
select * from {{ source('DEMO','CITI_BIKE_MASTER') }}
limit 1000
