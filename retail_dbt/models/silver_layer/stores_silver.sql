select 
cast(store_id as int) as store_id,
initcap(trim(store_name)) as store_name,
initcap(trim(city)) as city,
current_timestamp() as laod_date
from 
{{ source('retail_dbt', 'stores_bronze') }}