--Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

SELECT drug, (total_sales - cogs) as total_profit FROM pharmacy_sales
ORDER BY total_profit DESC LIMIT 3