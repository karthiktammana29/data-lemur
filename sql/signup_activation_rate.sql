--Write a query to find the activation rate. Round the percentage to 2 decimal places.

select ROUND(COUNT(CASE WHEN t.signup_action = 'Confirmed' THEN 1 END)* 1.0
/ COUNT(DISTINCT e.email_id),2) as activation_rate
from emails e left join texts t
ON e.email_id = t.email_id