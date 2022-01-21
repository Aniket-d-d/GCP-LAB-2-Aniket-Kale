SELECT users.id as id_user, count(users.id) as count
FROM `bigquery-public-data.stackoverflow.posts_answers` post_answers
JOIN `bigquery-public-data.stackoverflow.users` users
ON users.id = post_answers.owner_user_id
WHERE post_answers.creation_date BETWEEN "2010-01-01 00:00:00 UTC" AND "2010-12-31 23:59:59 UTC"
GROUP BY users.id
ORDER BY count DESC
LIMIT 10
