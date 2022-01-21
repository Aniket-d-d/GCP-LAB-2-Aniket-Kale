SELECT visitId, visitStartTime, page.pageTitle, page.pagePath
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
CROSS JOIN UNNEST(hits)
