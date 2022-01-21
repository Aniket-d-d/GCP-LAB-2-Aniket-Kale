SELECT name, COUNT(name) as most_popular_language_count
FROM`bigquery-public-data.github_repos.languages`, UNNEST(language)
GROUP BY name
ORDER BY most_popular_language_count DESC
LIMIT 1
