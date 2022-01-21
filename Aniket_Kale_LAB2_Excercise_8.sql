SELECT sample_commits.committer.name, COUNT(sample_commits.committer.name) as commit_count
FROM `bigquery-public-data.github_repos.languages` languages JOIN `bigquery-public-data.github_repos.sample_commits` sample_commits
ON languages.repo_name = sample_commits.repo_name
WHERE sample_commits.committer.date BETWEEN "2016-01-01 00:00:00 UTC" AND "2016-12-31 23:59:59 UTC"
GROUP BY sample_commits.committer.name
ORDER BY commit_count DESC
LIMIT 10
