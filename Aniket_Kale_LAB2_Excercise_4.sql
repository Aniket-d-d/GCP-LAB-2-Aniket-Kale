SELECT country,ARRAY_AGG(STRUCT(operatingSystem ,browser,rank)LIMIT 3) as country_rank
   FROM( SELECT geoNetwork.country as country,
   device.operatingSystem as operatingSystem,device.browser as browser,
   ROW_NUMBER()  OVER (PARTITION By geoNetwork.country ORDER BY (count(device.browser)*count(device.operatingSystem)) DESC) AS rank
   FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
   WHERE device.isMobile = true 
   group by country,operatingSystem,browser
)
WHERE NOT CONTAINS_SUBSTR(country, "(not set)")
GROUP BY country
ORDER BY country
