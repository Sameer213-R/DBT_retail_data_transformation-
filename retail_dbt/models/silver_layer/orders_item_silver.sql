select 
cast(order_item_id as int) as order_item_id,
cast(order_id as int) as order_id,
cast(product_id as int) as product_id,
cast(quantity as int ) as quantity,
cast(unit_price as decimal) as unit_price,
quantity * unit_price as total_cost,
current_timestamp() as load_time
from 
{{ source('retail_dbt', 'order_items_bronze') }}