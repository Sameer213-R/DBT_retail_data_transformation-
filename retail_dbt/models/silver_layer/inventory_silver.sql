{{ 
   
      config(
        materialized='incremental',
        unique_key='product_id',
        incremental_strategy='merge'

        )
   
}}

with inventory_silver as (
select 
cast(store_id as int) as store_id,
cast(product_id as int) as product_id,
cast(stock as int) as stock,
current_timestamp() as load_date
from 
{{ source('retail_dbt', 'inventory_bronze') }}
)
select 
* 
from inventory_silver
{% if  is_incremental()%}
 where product_id not in (
    select product_id from 
    {{this}}
 )
{% endif %}