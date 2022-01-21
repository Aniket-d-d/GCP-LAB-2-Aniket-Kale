SELECT post_answers.owner_user_id as id_user, count(post_answers.owner_user_id) as count
FROM `bigquery-public-data.stackoverflow.posts_answers` post_answers
JOIN `bigquery-public-data.stackoverflow.users` users
ON users.id = post_answers.owner_user_id
JOIN `bigquery-public-data.stackoverflow.stackoverflow_posts` stackoverflow_posts
ON post_answers.id=stackoverflow_posts.accepted_answer_id
WHERE post_answers.creation_date BETWEEN "2010-01-01 00:00:00 UTC" AND "2010-12-31 23:59:59 UTC"
GROUP BY post_answers.owner_user_id
ORDER BY count DESC
LIMIT 10
