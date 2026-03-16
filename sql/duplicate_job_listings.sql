--Write a query to retrieve the count of companies that have posted duplicate job listings.

select count(distinct company_id) as duplicate_companies
from (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY title, description) as r_nb
FROM job_listings
ORDER BY company_id,r_nb
)t
where r_nb > 1