{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

WITH source_data AS (

    SELECT
        CAST(order_id AS INT) AS order_id,
        CAST(customer_id AS INT) AS customer_id,
        CAST(order_date AS DATE) AS order_date,
        UPPER(TRIM(status)) AS order_status,
        CAST(updated_at AS DATE) AS updated_at,
        CURRENT_TIMESTAMP() AS load_time

    FROM {{ source('retail_dbt', 'orders_bronze') }}

    WHERE _rescued_data IS NULL

)

SELECT *
FROM source_data

{% if is_incremental() %}

WHERE updated_at >
(
    SELECT MAX(updated_at)
    FROM {{ this }}
)

{% endif %}