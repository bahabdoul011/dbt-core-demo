
-- models/names_ranked.sql
WITH ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY name ORDER BY year) AS rn
  FROM `bigquery-public-data.usa_names.usa_1910_current`
)
SELECT *
FROM ranked
WHERE year = 2000
  AND state = 'CA'
