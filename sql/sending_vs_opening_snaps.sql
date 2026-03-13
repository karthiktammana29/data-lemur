--Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

WITH base_cte AS(
SELECT ab.age_bucket,
SUM(a.time_spent) FILTER (WHERE a.activity_type = 'send') as total_send_time,
SUM(a.time_spent) FILTER (WHERE a.activity_type = 'open') as total_open_time
FROM
activities a left join age_breakdown ab
ON a.user_id = ab.user_id
where a.activity_type in ('send','open')
group by ab.age_bucket
)


select age_bucket,
ROUND((total_send_time/(total_send_time + total_open_time)) * 100.0, 2) as send_perc,
ROUND((total_open_time/(total_send_time + total_open_time))*100.0,2) as open_perc
from base_cte