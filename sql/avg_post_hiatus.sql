-- Output the user and number of the days between each user's first and last post.

select user_id, (last_post::date - first_post::date) as days_between
from (
SELECT user_id, MIN(post_date) as first_post, MAX(post_date) as last_post, count(post_id) as post_cnt
FROM posts
where post_date >= '01-01-2021' and post_date < '01-01-2022'
group by user_id
HAVING count(post_id) >= 2
) t