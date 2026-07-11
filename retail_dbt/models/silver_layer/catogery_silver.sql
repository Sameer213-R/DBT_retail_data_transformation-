select 
cast(category_id as int) as category_id,
initcap(trim(category_name)) as category_name,
current_timestamp() as load_time 
from 
{{ source('retail_dbt', 'categories_bronze') }}
