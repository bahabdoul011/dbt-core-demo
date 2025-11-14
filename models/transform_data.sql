{{ config(materialized='table') }}

WITH test_data AS (
    SELECT 
      complaint_description,
      status,
      city,
      COUNT(*) AS count_source
    FROM `bigquery-public-data.austin_311.311_service_requests`
    GROUP BY complaint_description, status, city
)

SELECT *
FROM test_data
WHERE city IS NOT NULL AND status = 'Open'

