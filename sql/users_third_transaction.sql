--Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

select user_id,spend,transaction_date from(
select user_id, spend, transaction_date,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) as row_num
from transactions
)tr
where row_num = 3