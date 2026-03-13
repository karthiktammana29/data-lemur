--Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

select manufacturer,
CONCAT('$',ROUND(sum(total_sales)/1000000.0,0),' million') as sales_mil
from pharmacy_sales
group by manufacturer
ORDER BY sum(total_sales) DESC, manufacturer;