with cte as (
    select t.*,
    w.* from {{ ref('Trip_Fact') }} t
    left join {{ ref('Daily_Weather') }} w
    on t.trip_date = w.daily_weather
 
)

select * from cte 