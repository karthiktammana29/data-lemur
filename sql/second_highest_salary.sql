--Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries. Your manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.

select salary as second_highest_salary from(
SELECT *,
DENSE_RANK() OVER(ORDER BY salary DESC) as r_nb
FROM employee
)v
where r_nb = 2
LIMIT 1