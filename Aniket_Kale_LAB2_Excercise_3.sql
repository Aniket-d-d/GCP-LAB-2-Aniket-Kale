SELECT date, page.pagePath, COUNT(page.pagePath) as counter
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
CROSS JOIN UNNEST(hits)
GROUP BY date, page.pagePath
