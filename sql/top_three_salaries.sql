--You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary. In case of duplicates, sort the results of department name in ascending order, then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.

with base_cte AS (
select e.employee_id, e.name, e.salary, e.manager_id, d.department_name
from employee e left join department d
ON e.department_id = d.department_id
),
rank_cte AS(
select *,
DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC) as r_nb
from base_cte
)

select department_name,name, salary from rank_cte
where r_nb <= 3
order by department_name, salary DESC, name