SELECT repo_name,old_path as file, author.date as date, LAG(commit) OVER (ORDER BY author.date ASC) AS previous_commit, commit , LEAD(commit) OVER (ORDER BY author.date ASC) AS next_commit
FROM `bigquery-public-data.github_repos.sample_commits`,
UNNEST(difference)
WHERE CONTAINS_SUBSTR(repo_name, '/linux') AND CONTAINS_SUBSTR(old_path, 'kernel') AND ENDS_WITH(old_path, '.c')
ORDER BY author.date ASC
