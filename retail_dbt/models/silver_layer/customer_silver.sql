select 
cast(customer_id as int) as customer_id,
initcap(customer_name) as customer_name,
email,
initcap(city) as city,
cast(created_at as date) as created_at,
current_timestamp() as laod_time
from 
{{ source('retail_dbt', 'customers_bronze') }} 

{# group by 
customer_id
having count_customer_id > 1 #}
{# retail_store_catlog.bronze.customers_bronze #}

