--Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

select manufacturer,
count(drug) as drug_count,
SUM(cogs-total_sales) as total_loss
from pharmacy_sales
where cogs > total_sales
group by manufacturer
ORDER BY total_loss DESC