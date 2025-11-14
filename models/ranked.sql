/*
    This model ranks 311 service requests in Austin by street number within each county.
*/
{{ config(materialized='table') }}

with source_data as (
SELECT source, count(source) as count_source
FROM `bigquery-public-data.austin_311.311_service_requests`
GROUP BY source
)

select *
from source_data