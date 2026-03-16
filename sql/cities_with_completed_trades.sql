--Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order.

SELECT u.city, count(t.user_id) as total_orders
FROM trades t
left join
users u
on t.user_id = u.user_id
where t.status = 'Completed'
group by u.city
ORDER BY total_orders DESC
LIMIT 3