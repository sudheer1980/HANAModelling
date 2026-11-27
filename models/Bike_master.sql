
{{config(materialized = 'view')}}
select * from {{ source('DEMO','CITI_BIKE_MASTER') }}

