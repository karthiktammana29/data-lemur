--Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

select page_id
from pages
where page_id not in(select distinct page_id from page_likes)
ORDER BY page_id