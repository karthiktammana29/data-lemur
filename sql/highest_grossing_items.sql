--Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

with base_cte AS (
SELECT category, product,
SUM(spend) as total_spend
FROM product_spend
where transaction_date >= '01/01/2022' and transaction_date <= '12/31/20233'
group by category,product

),
mid_cte AS(
select *,
ROW_NUMBER() OVER(partition by category order by total_spend DESC) as r_nb
from base_cte)

select category,product,total_spend from mid_cte
where r_nb in ('1','2')