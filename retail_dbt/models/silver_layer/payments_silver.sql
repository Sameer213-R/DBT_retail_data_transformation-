{{ config(
    materialized='incremental',
    unique_key='payment_id',
    incremental_strategy='merge'
) }}
with payment_data as (
select
cast(payment_id as int) as payment_id,
cast(order_id as int) as order_id,
upper(trim(payment_method)) as payment_method,
upper(trim(payment_status)) as payment_status,
current_timestamp() as load_time 

FROM
{{ source('retail_dbt', 'payments_bronze') }}
)
SELECT *
FROM payment_data

{% if is_incremental() %}

WHERE payment_id NOT IN (

    SELECT payment_id
    FROM {{ this }}

)

{% endif %}

