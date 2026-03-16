--Output the results in descending order based on the count of the messages.

SELECT sender_id, count(message_id) as message_count
FROM messages
where sent_date >= '08/01/2022' and sent_date < '09/01/2022'
group by sender_id
ORDER BY message_count DESC
LIMIT 2