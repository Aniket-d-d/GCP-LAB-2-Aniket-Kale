# GCP-LAB-2-Aniket-Kale
WITH movie_detail AS(
SELECT year,Movie_Title,Production_Budget,RANK() OVER(PARTITION BY year order by Production_Budget DESC) AS rank
FROM (
SELECT
EXTRACT(YEAR FROM Release_Date) AS year,Movie_Title,Production_Budget
FROM `uc1_17.Movie`
WHERE Release_Date BETWEEN '2016-01-01' and '2020-12-31')
)
SELECT
year,Movie_Title,Production_Budget,rank
FROM movie_detail
WHERE rank <= 10
ORDER BY year DESC
