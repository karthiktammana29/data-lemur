--Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column.

select count(policy_holder_id) as policy_holder_count
FROM (
SELECT policy_holder_id,
count(case_id) AS cnt
FROM callers
group by policy_holder_id
HAVING count(case_id) >= 3
) t