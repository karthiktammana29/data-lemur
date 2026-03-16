--Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.

SELECT
count(device_type) FILTER(WHERE device_type = 'laptop') as laptop_views,
count(device_type) FILTER(WHERE device_type in ('tablet','phone')) as mobile_views
FROM viewership