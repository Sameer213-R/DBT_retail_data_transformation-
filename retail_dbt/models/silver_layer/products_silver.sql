select 
cast(product_id as int) as product_id,
cast(product_name as string) as product_name,
cast(category_id as int) as category_id,
cast(price as decimal)  as price,
current_timestamp() as laod_date
from
{{ source('retail_dbt', 'products_bronze') }}


