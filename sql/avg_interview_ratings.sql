--The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.

SELECT EXTRACT(MONTH from submit_date) as mth, product_id as product, ROUND(AVG(stars),2) as avg_stars
FROM reviews
group by mth, product